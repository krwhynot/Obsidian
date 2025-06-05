
Tag: [[Python]] 
# Audio Processing and Silence Detection - Project Planning

## 1. Project Overview
- **Project Name**: Audio Processing and Silence Detection
- **Date**: August 31, 2024
- **Description**: This project aims to develop a script for processing audio files, converting MP3 to WAV format, and detecting silence periods within the audio. It also includes logging functionality for detailed analysis.

## 2. Problem Statement
- The project addresses the need for automated audio file processing and silence detection, which is crucial for analyzing large volumes of audio data efficiently.
- This solution is important for applications in telephony, content analysis, and audio quality assessment, where identifying silence periods can provide valuable insights.

## 3. Objectives
- Develop a script to convert MP3 files to WAV format
- Implement a reliable silence detection algorithm
- Create a comprehensive logging system for analysis and debugging
- Process multiple audio files in batch
- Identify and use API to search for audio files
- Create A GUI to search for audio files to process

## 4. Requirements
- **Functional Requirements**:
  - MP3 to WAV conversion
  - Silence detection using relative threshold
  - Detailed logging of process and results
  - Batch processing of multiple files
- **Non-Functional Requirements**:
  - Performance optimization for processing large audio files
  - Scalability to handle varying numbers of audio files
  - Maintainable and well-documented code

## 5. Stakeholders
- Phone call auditors
- Any Researchers working with the audio data

## 6. Tools and Technologies
- **Languages/Frameworks**:
  - Python
 - [[DirectML for PyTorch]]
 - [[Pydub Audio Library]]
 - [[Python Concurrent Futures]]
  
- **Tools**:
  - VSCode
  - Git for version control

## 7. Project Structure

- Project Diagram:
![[Diagram]]


1. Main components:
   - config.py: Configuration settings (e.g., LONG_SILENCE_THRESHOLD)
   - utils.py: Utility functions (e.g., calculate_duration())
   - data_structures.py: CallData class for encapsulating call information
   - main.py: Main processing logic

2. CallData class:
   - Initializes with call info dictionary
   - Stores call details (e.g., store info, agent name, call times)
   - Method get_info_html() formats call info as HTML

3. Main processing function (process_calls):
   - Iterates through call data
   - Creates CallData object for each call
   - Processes audio file (implementation not shown)
   - Checks for long silences
   - Prints formatted HTML info for each call
   - Tracks total long silences and affected calls

4. Call information displayed:
   - Date and time
   - Store and agent details
   - Customer information
   - Call type and status
   - Call duration and timing

5. Key functionalities:
   - Audio file processing (details not provided)
   - Long silence detection
   - Call data aggregation and formatting

6. Modular structure benefits:
   - Improved organization
   - Easier maintenance
   - Clear separation of responsibilities

## 8. Milestones
- Milestone 1: Implement MP3 to WAV conversion - Completed
- Milestone 2: Develop silence detection algorithm - Completed
- Milestone 3: Integrate logging system - Completed
- Milestone 4: Implement batch processing - Completed
- Milestone 5: Optimize and refine code - In Progress

## 9. Implementation Plan
1. Set up project structure and environment
2. Implement MP3 to WAV conversion function
3. Develop silence detection algorithm
4. Integrate logging system
5. Implement batch processing functionality
6. Test and debug the entire system
7. Optimize code for performance and readability

## 10. Challenges and Risks
- Challenge 1: Handling varying audio quality and formats - Mitigation: Implement robust error handling and file checks
- Challenge 2: Optimizing performance for large files - Mitigation: Explore more efficient algorithms and consider parallel processing

## 11. Research and References
- pydub documentation
- Research papers on audio signal processing and silence detection algorithms

## 12. Notes and Ideas
- Consider implementing visualization of silence periods
- Explore possibilities for speaker diarization in the future

## 13. Next Steps
- Refactor code for better modularity
- Implement suggested improvements (e.g., using constants, enhancing exception handling)
- Develop unit tests for core functionalities
- Consider adding a command-line interface for easier parameter adjustment



 ## First Version
This script processes MP3 files to transcribe audio using the Whisper model, detects and highlights silences longer than 5 seconds after a specific phrase, and summarizes these occurrences across all files.
```python 
import os

import warnings

import whisper

from pydub import AudioSegment

from pydub.silence import detect_silence

from colorama import Fore, Style, init

  

# Initialize colorama

init(autoreset=True)

  

# Suppress specific warnings

warnings.filterwarnings("ignore", category=UserWarning, message="FP16 is not supported on CPU; using FP32 instead")

warnings.filterwarnings("ignore", category=FutureWarning, message=".*weights_only=False.*")

  

# Load Whisper model using the recommended method

model = whisper.load_model("base")  # Correctly loads the "base" model

  

# Directory containing MP3 files

directory_path = r"C:\Users\revadmin\Desktop\Coding\misc"  # Update with your local path

  

# Phrase to search for in the transcription

target_phrase = "this call may be monitored or recorded for quality control purposes."

  

# Initialize variables for counting and tracking calls

total_long_silences_after_target = 0

calls_with_long_silences = []

  

# Loop through all files in the directory

for filename in os.listdir(directory_path):

    if filename.endswith(".mp3"):

        # Construct full file path

        audio_file_path = os.path.join(directory_path, filename)

  

        # Load the audio using PyDub

        audio = AudioSegment.from_mp3(audio_file_path)

  

        # Analyze the average volume of the audio

        average_dbfs = audio.dBFS

  

        # Test different silence detection thresholds and lengths

        silence_thresh = average_dbfs - 14  # Dynamic threshold based on average volume

        min_silence_len = 1000  # Minimum length of silence in milliseconds

  

        # Detect silence ranges in the audio file

        silence_ranges = detect_silence(audio, min_silence_len=min_silence_len, silence_thresh=silence_thresh)

  

        # Convert silence ranges to seconds for easier readability

        silence_ranges_seconds = [(start / 1000, end / 1000, (end - start) / 1000) for start, end in silence_ranges]

  

        # Transcribe the audio using Whisper

        result = model.transcribe(audio_file_path)

        transcription = result['text']

        segments = result['segments']

  

        # Prepare Transcription Output

        print(f"\n### Transcription for {filename}:\n")

        print(f"_{transcription}_\n")

  

        # Prepare Combined Segments Output with Silence

        print(f"### Combined Segments with Silence Durations Included for {filename}:\n")

  

        combined_segments = []

        current_index = 0

        call_silences_after_target = 0  # Count silences over 5 seconds after target phrase for this file

        target_phrase_end_time = None

  

        # Iterate through each segment and match with silence

        for segment in segments:

            # Add the text of the current speech segment

            combined_segments.append(f'"{segment["text"].strip()}"')

  

            # Check if the target phrase is in the current segment

            if target_phrase in segment["text"].lower():

                target_phrase_end_time = segment["end"]  # Record the end time of the target phrase

  

            # Check for any silence that falls within the time of this segment

            while (current_index < len(silence_ranges_seconds) and

                   segment["end"] > silence_ranges_seconds[current_index][0]):

                silence_start, silence_end, silence_duration = silence_ranges_seconds[current_index]

  

                # Ensure the silence is between this segment's start and end

                if silence_start >= segment["start"]:

                    # Highlight silences longer than 5 seconds in red

                    if silence_duration > 5:

                        combined_segments.append(f"{Fore.RED}**Silence ({silence_start:.3f} - {silence_end:.3f}, {silence_duration:.3f} seconds)**{Style.RESET_ALL}")

  

                        # Check if this silence is right after the target phrase

                        if target_phrase_end_time and silence_start > target_phrase_end_time:

                            call_silences_after_target += 1

                            target_phrase_end_time = None  # Reset to avoid multiple counts

  

                    else:

                        combined_segments.append(f"**Silence ({silence_start:.3f} - {silence_end:.3f}, {silence_duration:.3f} seconds)**")

  

                current_index += 1

  

        # If this call has silences over 5 seconds after the target phrase, add it to the list

        if call_silences_after_target > 0:

            total_long_silences_after_target += 1

            calls_with_long_silences.append((filename, call_silences_after_target))

  

        # Output combined segments

        for i, segment in enumerate(combined_segments, start=1):

            print(f"{i}. {segment}")

  

# Print the total count of calls with silences over 5 seconds after the target phrase

print(f"\nTotal number of calls with silences over 5 seconds after the target phrase: {total_long_silences_after_target}\n")

  

# List all calls that had silences over 5 seconds after the target phrase

if calls_with_long_silences:

    print("Calls with silences over 5 seconds after the target phrase:\n")

    for call, count in calls_with_long_silences:

        print(f"- {call}: {count} silence(s) over 5 seconds")
```

**Script Outcome:** 
Combined Segments with Silence Durations Included for SS018_20240825_211041_M21N3Q.mp3:

1. "Thank you for choosing Simple Simon's Pizza. You can order with me and skip the wait. Would you like to get started?"
2. **Silence (6.438 - 11.955, 5.517 seconds)**
3. "Hello!"
4. "Awesome. This call may be monitored or recorded for quality control purposes."
5. **Silence (16.797 - 20.227, 3.430 seconds)**
6. "Hello!"
7. **Silence (20.572 - 26.007, 5.435 seconds)**
8. "Will this be for picking up?"