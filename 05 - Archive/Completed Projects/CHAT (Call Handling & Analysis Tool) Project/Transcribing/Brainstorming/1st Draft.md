I'll create a set of Python files that will determine system specs and select the appropriate transcription methods. These files will be written to the specified directory.

## 1. First, let's create `system_specs.py`

```python
"""
Detect system specifications to determine optimal transcription methods.
"""
import os
import platform
import psutil
import subprocess
import logging
import json

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[logging.StreamHandler(), logging.FileHandler("specs_detection.log")]
)
logger = logging.getLogger(__name__)

def get_cpu_info():
    """Get detailed CPU information"""
    cpu_info = {
        "processor_name": "Unknown",
        "cores": psutil.cpu_count(logical=False) or 1,
        "threads": psutil.cpu_count(logical=True) or 1,
        "base_speed_mhz": 0,
        "supports_avx": False,
        "supports_avx2": False
    }
    
    try:
        if platform.system() == "Windows":
            # Use wmic on Windows
            cpu_name = subprocess.check_output(
                "wmic cpu get Name /format:list", 
                shell=True
            ).decode().strip().split("=")[1]
            cpu_info["processor_name"] = cpu_name
            
            # Try to get speed
            try:
                speed = subprocess.check_output(
                    "wmic cpu get MaxClockSpeed /format:list", 
                    shell=True
                ).decode().strip().split("=")[1]
                cpu_info["base_speed_mhz"] = int(speed)
            except:
                pass
                
            # Check for AVX support on Windows
            try:
                output = subprocess.check_output("wmic path Win32_Processor get Name", shell=True).decode()
                cpu_info["supports_avx"] = "AVX" in output
                cpu_info["supports_avx2"] = "AVX2" in output
            except:
                pass
        else:
            # Linux and macOS logic would go here
            pass
    except Exception as e:
        logger.warning(f"Error getting detailed CPU info: {str(e)}")
    
    return cpu_info

def get_memory_info():
    """Get system memory information"""
    memory_info = {
        "total_ram_gb": round(psutil.virtual_memory().total / (1024**3), 1),
        "memory_speed": 0,
        "memory_configuration": "Unknown"
    }
    
    return memory_info

def get_gpu_info():
    """Get GPU information"""
    gpu_info = {
        "graphics_card": "Unknown",
        "video_memory_mb": 0,
        "supports_cuda": False
    }
    
    try:
        if platform.system() == "Windows":
            # Try to get GPU info on Windows
            try:
                output = subprocess.check_output(
                    "wmic path win32_VideoController get Name,AdapterRAM /format:list", 
                    shell=True
                ).decode()
                
                for line in output.splitlines():
                    if line.startswith("Name="):
                        gpu_info["graphics_card"] = line.split("=")[1].strip()
                    elif line.startswith("AdapterRAM="):
                        try:
                            ram = int(line.split("=")[1].strip())
                            gpu_info["video_memory_mb"] = ram // (1024**2)
                        except:
                            pass
            except:
                pass
            
            # Check for CUDA support
            gpu_info["supports_cuda"] = "nvidia" in gpu_info["graphics_card"].lower()
    except Exception as e:
        logger.warning(f"Error getting GPU info: {str(e)}")
    
    return gpu_info

def get_system_specs():
    """Get complete system specifications"""
    cpu_info = get_cpu_info()
    memory_info = get_memory_info()
    gpu_info = get_gpu_info()
    
    # Add other system information
    system_info = {
        "platform": platform.system(),
        "platform_version": platform.version(),
        "python_version": platform.python_version(),
        "cpu_usage_percent": psutil.cpu_percent(interval=1),
        "memory_usage_percent": psutil.virtual_memory().percent,
        "disk_usage_percent": psutil.disk_usage("/").percent
    }
    
    # Combine all information
    specs = {
        "cpu": cpu_info,
        "memory": memory_info,
        "gpu": gpu_info,
        "system": system_info
    }
    
    return specs

def categorize_system(specs):
    """Categorize the system as high, medium, or low spec"""
    # Default to medium
    category = "medium"
    
    # CPU Evaluation
    cpu_cores = specs["cpu"]["cores"]
    
    # Memory Evaluation
    total_ram_gb = specs["memory"]["total_ram_gb"]
    
    # GPU Evaluation
    has_cuda = specs["gpu"]["supports_cuda"]
    
    # Determine category based on CPU and RAM
    if (cpu_cores >= 4 and total_ram_gb >= 8) or has_cuda:
        category = "high"
    elif (cpu_cores <= 2 and total_ram_gb <= 2) or total_ram_gb <= 1:
        category = "low"
    
    return category

def get_specs_with_category():
    """Get system specs and category, returning both"""
    specs = get_system_specs()
    category = categorize_system(specs)
    return specs, category

if __name__ == "__main__":
    specs = get_system_specs()
    category = categorize_system(specs)
    
    print(f"System Category: {category}")
    print(f"CPU: {specs['cpu']['processor_name']} ({specs['cpu']['cores']} cores, {specs['cpu']['threads']} threads)")
    print(f"RAM: {specs['memory']['total_ram_gb']} GB")
    print(f"GPU: {specs['gpu']['graphics_card']} ({specs['gpu']['video_memory_mb']} MB)")
    
    # Write specs to file
    with open("system_specs.json", "w") as f:
        json.dump({"specs": specs, "category": category}, f, indent=2)
```

## 2. Now let's create `transcription_methods.py`

```python
"""
Implementation of transcription methods optimized for different system specifications.
"""
import os
import logging
import time
import numpy as np
import librosa
import soundfile as sf
import tempfile
from typing import Dict, List, Any, Optional

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# ============= High-Spec Methods =============

def setup_faster_whisper_high(model_dir=None):
    """Setup Faster-Whisper with medium model for high-spec systems"""
    try:
        from faster_whisper import WhisperModel
        
        # Configure model for high-spec system
        model = WhisperModel(
            model_size="medium",
            device="cpu",
            compute_type="float16",
            download_root=model_dir,
            cpu_threads=6,
            num_workers=2
        )
        
        return model
    except Exception as e:
        logger.error(f"Error setting up Faster-Whisper for high-spec system: {str(e)}")
        return None

def setup_silero_vad_high():
    """Setup Silero VAD for high-spec systems"""
    try:
        import torch
        
        model, utils = torch.hub.load(
            repo_or_dir='snakers4/silero-vad',
            model='silero_vad',
            force_reload=False
        )
        
        (get_speech_timestamps, _, read_audio, 
         *_) = utils
        
        return {
            "model": model,
            "get_speech_timestamps": get_speech_timestamps,
            "read_audio": read_audio,
            "sampling_rate": 16000
        }
    except Exception as e:
        logger.error(f"Error setting up Silero VAD for high-spec system: {str(e)}")
        return None

def setup_spacy_nlp_high():
    """Setup spaCy for high-spec systems"""
    try:
        import spacy
        
        # Use the small model to balance performance and resource usage
        nlp = spacy.load("en_core_web_sm")
        
        return nlp
    except Exception as e:
        logger.error(f"Error setting up spaCy for high-spec system: {str(e)}")
        
        # Try to provide instructions for installing models
        if "Can't find model 'en_core_web_sm'" in str(e):
            logger.info("You need to download the spaCy model. Run: python -m spacy download en_core_web_sm")
        
        return None

# ============= Low-Spec Methods =============

def setup_faster_whisper_low(model_dir=None):
    """Setup Faster-Whisper with tiny model for low-spec systems"""
    try:
        from faster_whisper import WhisperModel
        
        # Configure model for low-spec system
        model = WhisperModel(
            model_size="tiny",
            device="cpu",
            compute_type="int8",
            download_root=model_dir,
            cpu_threads=1,
            num_workers=1
        )
        
        return model
    except Exception as e:
        logger.error(f"Error setting up Faster-Whisper for low-spec system: {str(e)}")
        return None

def setup_textblob_nlp_low():
    """Setup TextBlob for low-spec systems"""
    try:
        from textblob import TextBlob
        
        # Return the TextBlob class directly
        return TextBlob
    except Exception as e:
        logger.error(f"Error setting up TextBlob for low-spec system: {str(e)}")
        return None

# ============= Processing Functions =============

def process_in_chunks(audio_path, chunk_size_seconds=30):
    """Process long audio files in small chunks to manage memory"""
    # Get audio duration
    try:
        duration = librosa.get_duration(path=audio_path)
    except Exception:
        # Fallback method if librosa fails
        import wave
        with wave.open(audio_path, 'r') as f:
            frames = f.getnframes()
            rate = f.getframerate()
            duration = frames / float(rate)
    
    # Create temporary directory for chunks
    temp_dir = tempfile.mkdtemp()
    chunk_files = []
    
    try:
        # Load the audio in chunks and save to temporary files
        y, sr = librosa.load(audio_path, sr=16000, mono=True)
        
        # Calculate chunk size in samples
        chunk_size_samples = int(chunk_size_seconds * sr)
        
        # Split into chunks and save
        for i, start_sample in enumerate(range(0, len(y), chunk_size_samples)):
            end_sample = min(start_sample + chunk_size_samples, len(y))
            chunk = y[start_sample:end_sample]
            
            # Save chunk to temporary file
            chunk_path = os.path.join(temp_dir, f"chunk_{i}.wav")
            sf.write(chunk_path, chunk, sr)
            chunk_files.append({
                "path": chunk_path,
                "start_time": start_sample / sr,
                "end_time": end_sample / sr
            })
    except Exception as e:
        logger.error(f"Error processing audio in chunks: {str(e)}")
        # Clean up temp files
        for chunk in chunk_files:
            if os.path.exists(chunk["path"]):
                os.remove(chunk["path"])
        if os.path.exists(temp_dir):
            os.rmdir(temp_dir)
        return [], ""
    
    return chunk_files, temp_dir

def transcribe_audio_whisper(audio_path, whisper_model, is_low_spec=False):
    """Transcribe audio using Whisper"""
    if is_low_spec:
        # For low-spec system, use chunking
        chunk_files, temp_dir = process_in_chunks(audio_path, 
                                                 chunk_size_seconds=20 if is_low_spec else 60)
        
        if not chunk_files:
            return {"error": "Failed to process audio in chunks"}
        
        try:
            # Process each chunk
            all_segments = []
            
            for chunk in chunk_files:
                # Transcribe chunk
                segments, info = whisper_model.transcribe(
                    chunk["path"],
                    beam_size=1 if is_low_spec else 5,
                    word_timestamps=True,
                    vad_filter=True,
                    vad_parameters=dict(threshold=0.5)
                )
                
                # Adjust timestamps relative to the original audio
                segment_list = []
                for segment in segments:
                    adjusted_segment = {
                        "start": segment.start + chunk["start_time"],
                        "end": segment.end + chunk["start_time"],
                        "text": segment.text,
                        "words": []
                    }
                    
                    # Adjust word timestamps
                    for word in segment.words:
                        adjusted_word = {
                            "word": word.word,
                            "start": word.start + chunk["start_time"],
                            "end": word.end + chunk["start_time"],
                            "probability": word.probability
                        }
                        adjusted_segment["words"].append(adjusted_word)
                    
                    segment_list.append(adjusted_segment)
                
                all_segments.extend(segment_list)
            
            # Clean up temporary files
            for chunk in chunk_files:
                os.remove(chunk["path"])
            os.rmdir(temp_dir)
            
            # Sort segments by start time
            all_segments.sort(key=lambda x: x["start"])
            
            return {
                "segments": all_segments,
                "language": info.language,
                "language_probability": info.language_probability
            }
            
        except Exception as e:
            # Clean up temporary files
            for chunk in chunk_files:
                if os.path.exists(chunk["path"]):
                    os.remove(chunk["path"])
            if os.path.exists(temp_dir):
                os.rmdir(temp_dir)
            
            logger.error(f"Error transcribing audio in chunks: {str(e)}")
            return {"error": str(e)}
    else:
        # For higher-spec system, transcribe directly
        try:
            segments, info = whisper_model.transcribe(
                audio_path,
                beam_size=5,
                word_timestamps=True,
                vad_filter=True,
                vad_parameters=dict(
                    threshold=0.5,
                    min_speech_duration_ms=250,
                    max_speech_duration_s=30
                )
            )
            
            # Convert to serializable format
            segment_list = []
            for segment in segments:
                segment_dict = {
                    "start": segment.start,
                    "end": segment.end,
                    "text": segment.text,
                    "words": []
                }
                
                for word in segment.words:
                    word_dict = {
                        "word": word.word,
                        "start": word.start,
                        "end": word.end,
                        "probability": word.probability
                    }
                    segment_dict["words"].append(word_dict)
                
                segment_list.append(segment_dict)
            
            return {
                "segments": segment_list,
                "language": info.language,
                "language_probability": info.language_probability
            }
            
        except Exception as e:
            logger.error(f"Error transcribing audio: {str(e)}")
            return {"error": str(e)}

def detect_silence_silero(audio_path, vad):
    """Detect silence using Silero VAD"""
    try:
        # Read audio
        sampling_rate = vad["sampling_rate"]
        wav = vad["read_audio"](audio_path, sampling_rate=sampling_rate)
        
        # Get speech timestamps
        speech_timestamps = vad["get_speech_timestamps"](
            wav, vad["model"], 
            threshold=0.5,
            sampling_rate=sampling_rate,
            min_silence_duration_ms=500
        )
        
        # Get audio duration
        audio_duration = librosa.get_duration(path=audio_path)
        
        # Convert speech timestamps to silence timestamps
        silences = []
        current_time = 0.0
        
        for speech in speech_timestamps:
            speech_start = speech['start'] / sampling_rate
            speech_end = speech['end'] / sampling_rate
            
            # If there's silence before this speech segment
            if speech_start > current_time:
                silences.append({
                    "start": current_time,
                    "end": speech_start,
                    "duration": speech_start - current_time
                })
            
            current_time = speech_end
        
        # Add final silence if needed
        if current_time < audio_duration:
            silences.append({
                "start": current_time,
                "end": audio_duration,
                "duration": audio_duration - current_time
            })
        
        return silences
    except Exception as e:
        logger.error(f"Error detecting silence with Silero: {str(e)}")
        return []

def detect_silence_librosa(audio_path, threshold_db=-40, min_silence_duration=0.5):
    """Simplified silence detection using librosa"""
    try:
        # Load audio at reduced quality to save memory
        y, sr = librosa.load(audio_path, sr=8000, mono=True)
        
        # Calculate power in dB
        S = librosa.feature.rms(y=y, frame_length=1024, hop_length=512)
        S_db = librosa.amplitude_to_db(S, ref=np.max)
        
        # Find silence frames
        silence_frames = np.where(S_db < threshold_db)[1]
        
        # Group consecutive frames
        silence_regions = []
        if len(silence_frames) > 0:
            # Get frame boundaries
            frame_boundaries = np.concatenate([[0], 
                                            np.where(np.diff(silence_frames) > 1)[0] + 1,
                                            [len(silence_frames)]])
            
            # Convert frame groups to time regions
            hop_duration = 512 / sr
            for i in range(len(frame_boundaries) - 1):
                start_frame = silence_frames[frame_boundaries[i]]
                end_frame = silence_frames[frame_boundaries[i+1] - 1]
                
                start_time = start_frame * hop_duration
                end_time = end_frame * hop_duration
                duration = end_time - start_time
                
                # Only include if longer than minimum duration
                if duration >= min_silence_duration:
                    silence_regions.append({
                        "start": start_time,
                        "end": end_time,
                        "duration": duration
                    })
        
        return silence_regions
    except Exception as e:
        logger.error(f"Error detecting silence with librosa: {str(e)}")
        return []

def analyze_text_spacy(text, nlp):
    """Analyze text using spaCy"""
    try:
        doc = nlp(text)
        
        # Extract entities
        entities = [{"text": ent.text, "label": ent.label_} for ent in doc.ents]
        
        # Extract noun phrases
        noun_phrases = [chunk.text for chunk in doc.noun_chunks]
        
        # Extract keywords (simplified)
        keywords = []
        for token in doc:
            if token.is_stop or token.is_punct:
                continue
            if token.pos_ in ["NOUN", "PROPN", "ADJ"] and len(token.text) > 3:
                keywords.append(token.text)
        
        # Count keyword occurrences
        keyword_counts = {}
        for keyword in keywords:
            keyword = keyword.lower()
            if keyword not in keyword_counts:
                keyword_counts[keyword] = 0
            keyword_counts[keyword] += 1
        
        # Sort by frequency and get top keywords
        top_keywords = sorted(keyword_counts.items(), key=lambda x: x[1], reverse=True)[:10]
        
        return {
            "entities": entities,
            "noun_phrases": noun_phrases[:10],
            "keywords": [k[0] for k in top_keywords]
        }
    except Exception as e:
        logger.error(f"Error analyzing text with spaCy: {str(e)}")
        return {
            "entities": [],
            "noun_phrases": [],
            "keywords": []
        }

def analyze_text_textblob(text, TextBlob):
    """Analyze text using TextBlob"""
    try:
        blob = TextBlob(text)
        
        # Get sentiment
        sentiment = blob.sentiment
        
        # Extract noun phrases
        noun_phrases = list(blob.noun_phrases)
        
        # Extract keywords (simple approach)
        words = [word for word in blob.words if len(word) > 3]
        word_counts = {}
        for word in words:
            word = word.lower()
            if word not in word_counts:
                word_counts[word] = 0
            word_counts[word] += 1
        
        # Sort by frequency
        keywords = sorted(word_counts.items(), key=lambda x: x[1], reverse=True)[:10]
        
        return {
            "sentiment": {
                "polarity": sentiment.polarity,
                "subjectivity": sentiment.subjectivity
            },
            "noun_phrases": noun_phrases[:10],
            "keywords": [k[0] for k in keywords]
        }
    except Exception as e:
        logger.error(f"Error analyzing text with TextBlob: {str(e)}")
        return {
            "sentiment": {"polarity": 0, "subjectivity": 0},
            "noun_phrases": [],
            "keywords": []
        }
```

## 3. Let's create `method_selector.py`

```python
"""
Selects the optimal transcription methods based on system specifications.
"""
import os
import logging
import json
from typing import Dict, Any

logger = logging.getLogger(__name__)

def select_methods_by_category(category: str, model_dir: str = None) -> Dict[str, Any]:
    """
    Select optimal transcription methods based on system category.
    
    Args:
        category: System category ('high', 'medium', or 'low')
        model_dir: Directory to store models
        
    Returns:
        Dictionary of selected methods configuration
    """
    
    # Import here to avoid circular imports
    from transcription_methods import (
        setup_faster_whisper_high, setup_faster_whisper_low,
        setup_silero_vad_high, setup_spacy_nlp_high, 
        setup_textblob_nlp_low
    )
    
    methods = {}
    
    if category == "high":
        logger.info("Selecting methods for high-spec system")
        methods = {
            "transcription": {
                "engine": "faster_whisper_high",
                "instance": setup_faster_whisper_high(model_dir),
                "chunking": False,
                "chunk_size_seconds": 60
            },
            "silence_detection": {
                "engine": "silero_vad",
                "instance": setup_silero_vad_high()
            },
            "text_analysis": {
                "engine": "spacy",
                "instance": setup_spacy_nlp_high()
            }
        }
    elif category == "low":
        logger.info("Selecting methods for low-spec system")
        methods = {
            "transcription": {
                "engine": "faster_whisper_low",
                "instance": setup_faster_whisper_low(model_dir),
                "chunking": True,
                "chunk_size_seconds": 20
            },
            "silence_detection": {
                "engine": "librosa_basic",
                "instance": None  # No initialization needed
            },
            "text_analysis": {
                "engine": "textblob",
                "instance": setup_textblob_nlp_low()
            }
        }
    else:  # medium spec - use a mix of methods
        logger.info("Selecting methods for medium-spec system")
        # Try high-spec methods first for transcription
        whisper_instance = setup_faster_whisper_high(model_dir)
        
        # If they fail, fall back to low-spec methods
        if whisper_instance is None:
            whisper_instance = setup_faster_whisper_low(model_dir)
            chunking = True
            chunk_size = 30
        else:
            chunking = False
            chunk_size = 60
        
        # For text analysis, try spaCy first, fall back to TextBlob
        text_analysis_engine = "spacy"
        text_analysis_instance = setup_spacy_nlp_high()
        
        if text_analysis_instance is None:
            text_analysis_engine = "textblob"
            text_analysis_instance = setup_textblob_nlp_low()
        
        methods = {
            "transcription": {
                "engine": "faster_whisper_medium" if not chunking else "faster_whisper_low",
                "instance": whisper_instance,
                "chunking": chunking,
                "chunk_size_seconds": chunk_size
            },
            "silence_detection": {
                "engine": "librosa_basic",
                "instance": None
            },
            "text_analysis": {
                "engine": text_analysis_engine,
                "instance": text_analysis_instance
            }
        }
    
    # Validate methods
    validate_selected_methods(methods)
    
    return methods

def validate_selected_methods(methods: Dict[str, Any]) -> bool:
    """
    Validate that all required methods are available and working.
    
    Args:
        methods: Dictionary of selected methods
        
    Returns:
        True if all methods are valid, False otherwise
    """
    required_components = ["transcription", "silence_detection", "text_analysis"]
    
    for component in required_components:
        if component not in methods:
            logger.error(f"Missing required component: {component}")
            return False
        
        if methods[component]["engine"] != "librosa_basic" and methods[component]["instance"] is None:
            logger.warning(f"Component {component} has no instance. Using fallback.")
            
            # Use fallbacks for critical components
            if component == "transcription":
                # Import here to avoid circular imports
                from transcription_methods import setup_faster_whisper_low
                methods[component]["engine"] = "faster_whisper_low"
                methods[component]["instance"] = setup_faster_whisper_low()
                methods[component]["chunking"] = True
                methods[component]["chunk_size_seconds"] = 20
            elif component == "text_analysis":
                # Import here to avoid circular imports
                from transcription_methods import setup_textblob_nlp_low
                methods[component]["engine"] = "textblob"
                methods[component]["instance"] = setup_textblob_nlp_low()
    
    return True

def write_methods_to_file(methods: Dict[str, Any], filepath: str) -> None:
    """
    Write selected methods to a JSON file.
    
    Args:
        methods: Dictionary of selected methods
        filepath: Path to write the file
    """
    # Create a serializable version (remove instances)
    serializable_methods = {}
    
    for component, details in methods.items():
        serializable_methods[component] = {
            "engine": details["engine"]
        }
        
        # Include additional configuration where available
        if component == "transcription" and "chunking" in details:
            serializable_methods[component]["chunking"] = details["chunking"]
            serializable_methods[component]["chunk_size_seconds"] = details["chunk_size_seconds"]
    
    # Write to file
    os.makedirs(os.path.dirname(filepath), exist_ok=True)
    
    with open(filepath, "w") as f:
        json.dump(serializable_methods, f, indent=2)
```

## 4. Now let's create `processor.py`

```python
"""
Audio processing using selected methods.
"""
import os
import time
import json
import logging
from typing import Dict, Any

logger = logging.getLogger(__name__)

def process_audio(audio_path: str, methods: Dict[str, Any], output_dir: str = None) -> Dict[str, Any]:
    """
    Process audio file using selected methods.
    
    Args:
        audio_path: Path to audio file
        methods: Dictionary of selected methods
        output_dir: Directory to save output files
        
    Returns:
        Dictionary of processing results
    """
    # Import here to avoid circular imports
    from transcription_methods import (
        transcribe_audio_whisper, detect_silence_silero, detect_silence_librosa,
        analyze_text_spacy, analyze_text_textblob
    )
    
    # Check if audio file exists
    if not os.path.exists(audio_path):
        logger.error(f"Audio file not found: {audio_path}")
        return {"error": f"Audio file not found: {audio_path}"}
    
    # Create output directory if needed
    if output_dir and not os.path.exists(output_dir):
        os.makedirs(output_dir, exist_ok=True)
    
    results = {
        "audio_file": audio_path,
        "processing_time": {},
        "transcription": {},
        "silence_detection": {},
        "text_analysis": {}
    }
    
    # Step 1: Transcribe audio
    logger.info("Transcribing audio...")
    start_time = time.time()
    
    is_low_spec = methods["transcription"]["engine"] in ["faster_whisper_low"]
    results["transcription"] = transcribe_audio_whisper(
        audio_path, 
        methods["transcription"]["instance"],
        is_low_spec=is_low_spec
    )
    
    results["processing_time"]["transcription"] = time.time() - start_time
    logger.info(f"Transcription completed in {results['processing_time']['transcription']:.2f}s")
    
    # Check if transcription succeeded
    if "error" in results["transcription"]:
        logger.error(f"Transcription failed: {results['transcription']['error']}")
        return results
    
    # Step 2: Detect silence
    logger.info("Detecting silence...")
    start_time = time.time()
    
    if methods["silence_detection"]["engine"] == "silero_vad":
        results["silence_detection"]["periods"] = detect_silence_silero(
            audio_path, methods["silence_detection"]["instance"])
    else:  # librosa_basic
        results["silence_detection"]["periods"] = detect_silence_librosa(audio_path)
    
    results["processing_time"]["silence_detection"] = time.time() - start_time
    logger.info(f"Silence detection completed in {results['processing_time']['silence_detection']:.2f}s")
    
    # Step 3: Text analysis
    logger.info("Analyzing text...")
    start_time = time.time()
    
    # Extract full text from transcription
    if "segments" in results["transcription"]:
        full_text = " ".join([segment["text"] for segment in results["transcription"]["segments"]])
        
        if methods["text_analysis"]["engine"] == "spacy":
            results["text_analysis"] = analyze_text_spacy(
                full_text, methods["text_analysis"]["instance"])
        else:  # textblob
            results["text_analysis"] = analyze_text_textblob(
                full_text, methods["text_analysis"]["instance"])
    else:
        results["text_analysis"] = {"error": "No transcription segments available"}
    
    results["processing_time"]["text_analysis"] = time.time() - start_time
    logger.info(f"Text analysis completed in {results['processing_time']['text_analysis']:.2f}s")
    
    # Calculate total processing time
    results["processing_time"]["total"] = sum(results["processing_time"].values())
    
    # Save results if output directory is provided
    if output_dir:
        output_file = os.path.join(output_dir, os.path.basename(audio_path) + "_results.json")
        
        with open(output_file, "w") as f:
            json.dump(results, f, indent=2)
        
        logger.info(f"Results saved to {output_file}")
    
    return results
```

## 5. Finally, let's create `main.py`

```python
"""
Main entry point for determining system specs and processing audio.
"""
import os
import sys
import logging
import argparse
import time
import json

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.StreamHandler(),
        logging.FileHandler("processing.log")
    ]
)

logger = logging.getLogger(__name__)

def setup_environment():
    """Setup environment for processing"""
    # Add directory to Python path
    script_dir = os.path.dirname(os.path.abspath(__file__))
    if script_dir not in sys.path:
        sys.path.append(script_dir)
    
    # Set up paths
    paths = {
        "models": os.path.join(script_dir, "models"),
        "output": os.path.join(script_dir, "output"),
        "specs": os.path.join(script_dir, "specs")
    }
    
    # Create directories if they don't exist
    for dir_path in paths.values():
        os.makedirs(dir_path, exist_ok=True)
    
    return paths

def get_system_category():
    """Get system category by analyzing specs"""
    from system_specs import get_specs_with_category
    
    logger.info("Analyzing system specifications...")
    specs, category = get_specs_with_category()
    
    # Save the specs to a file
    specs_file = os.path.join("specs", "system_specs.json")
    os.makedirs(os.path.dirname(specs_file), exist_ok=True)
    
    with open(specs_file, "w") as f:
        json.dump({"specs": specs, "category": category}, f, indent=2)
    
    logger.info(f"System identified as: {category} spec")
    logger.info(f"CPU: {specs['cpu']['processor_name']} ({specs['cpu']['cores']} cores, {specs['cpu']['threads']} threads)")
    logger.info(f"RAM: {specs['memory']['total_ram_gb']} GB")
    
    return category, specs

def select_methods(category, paths):
    """Select appropriate methods based on system category"""
    from method_selector import select_methods_by_category, write_methods_to_file
    
    logger.info(f"Selecting optimal methods for {category} spec system...")
    methods = select_methods_by_category(category, model_dir=paths["models"])
    
    # Save the methods to a file
    methods_file = os.path.join("specs", "selected_methods.json")
    write_methods_to_file(methods, methods_file)
    
    return methods

def process_audio_file(audio_path, methods, output_dir):
    """Process audio file with selected methods"""
    from processor import process_audio
    
    logger.info(f"Processing audio file: {audio_path}")
    results = process_audio(audio_path, methods, output_dir)
    
    if "error" in results:
        logger.error(f"Processing failed: {results['error']}")
        return False
    
    # Print summary of results
    logger.info("Processing completed successfully:")
    logger.info(f"Total processing time: {results['processing_time']['total']:.2f}s")
    
    if "segments" in results["transcription"]:
        num_segments = len(results["transcription"]["segments"])
        logger.info(f"Transcribed {num_segments} segments")
    
    if "periods" in results["silence_detection"]:
        num_silences = len(results["silence_detection"]["periods"])
        logger.info(f"Detected {num_silences} silence periods")
    
    if "keywords" in results["text_analysis"]:
        keywords = results["text_analysis"]["keywords"]
        if keywords:
            logger.info(f"Top keywords: {', '.join(keywords[:5])}")
    
    logger.info(f"Results saved to {output_dir}")
    
    return True

def main():
    """Main entry point"""
    # Parse command line arguments
    parser = argparse.ArgumentParser(description="Determine system specs and process audio")
    parser.add_argument("--audio", type=str, default=r"R:\Projects\Python\CHAT_APP\temp\E8zqcj.mp3",
                      help="Path to audio file to process")
    parser.add_argument("--output", type=str, default=None,
                      help="Output directory (default: created in script directory)")
    parser.add_argument("--force-category", type=str, choices=["high", "medium", "low"],
                      help="Force a specific system category (for testing)")
    
    args = parser.parse_args()
    
    # Setup environment
    paths = setup_environment()
    
    # Use provided output directory or default
    output_dir = args.output or paths["output"]
    
    # Check if audio file exists
    if not os.path.exists(args.audio):
        logger.error(f"Audio file not found: {args.audio}")
        return 1
    
    # Determine system category (or use forced category)
    if args.force_category:
        category = args.force_category
        logger.info(f"Forcing system category to: {category}")
    else:
        category, specs = get_system_category()
    
    # Select methods
    methods = select_methods(category, paths)
    
    # Process audio file
    success = process_audio_file(args.audio, methods, output_dir)
    
    if success:
        logger.info("Processing completed successfully")
        return 0
    else:
        logger.error("Processing failed")
        return 1

if __name__ == "__main__":
    sys.exit(main())
```

## 6. Let's create a simple `requirements.txt` file

```
faster-whisper
librosa
numpy
spacy
textblob
psutil
soundfile
torch
```

These files provide a complete solution for:

1. Detecting system specifications
2. Selecting appropriate transcription methods based on those specs
3. Processing audio files using the selected methods
4. Saving results to JSON files

The code automatically adapts to the available system resources, using more advanced methods on high-spec systems and lighter methods on low-spec systems. All files will be written to the R:\Projects\Python\CHAT_APP\test_processing directory as requested.

To run the processor, you would:

1. Install the requirements with `pip install -r requirements.txt`
2. Install spaCy English model with `python -m spacy download en_core_web_sm`
3. Run the processor with `python main.py`

The script will:

1. Detect your system specifications
2. Select the appropriate methods
3. Process the audio file at R:\Projects\Python\CHAT_APP\temp\E8zqcj.mp3
4. Save the results to an output directory