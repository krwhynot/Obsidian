# Detailed Implementation Guide: Transcription System with GUI and Database Integration

## Table of Contents
1. [Project Setup](#1-project-setup)
2. [Database Implementation](#2-database-implementation)
3. [GUI Components](#3-gui-components)
4. [Processing Integration](#4-processing-integration)
5. [Testing and Validation](#5-testing-and-validation)

## 1. Project Setup

### 1.1 Environment Setup
```bash
# Create and activate virtual environment
python -m venv transcription-env
source transcription-env/bin/activate  # Unix/MacOS
# or
transcription-env\Scripts\activate     # Windows

# Install required packages
pip install PyQt6
pip install aiosqlite
pip install qasync
pip install openai-whisper
pip install pyannote.audio
pip install torch torchvision torchaudio
pip install pydub
pip install jinja2
```

### 1.2 Project Structure
```plaintext
transcription_system/
├── src/
│   ├── __init__.py
│   ├── database/
│   │   ├── __init__.py
│   │   └── manager.py
│   ├── gui/
│   │   ├── __init__.py
│   │   ├── main_window.py
│   │   └── widgets.py
│   ├── processing/
│   │   ├── __init__.py
│   │   ├── transcriber.py
│   │   └── processor.py
│   └── utils/
│       ├── __init__.py
│       └── config.py
├── tests/
│   └── __init__.py
├── resources/
│   └── templates/
├── main.py
└── requirements.txt
```

## 2. Database Implementation

### 2.1 Create Database Schema
```python
# src/database/manager.py

async def create_tables(db_path: str):
    """Create database tables"""
    async with aiosqlite.connect(db_path) as db:
        # Jobs table
        await db.execute("""
            CREATE TABLE IF NOT EXISTS jobs (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                order_id TEXT UNIQUE NOT NULL,
                status TEXT NOT NULL,
                progress REAL DEFAULT 0,
                start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                completion_time TIMESTAMP,
                report_path TEXT,
                error_message TEXT
            )
        """)

        # Progress events table
        await db.execute("""
            CREATE TABLE IF NOT EXISTS progress_events (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                job_id INTEGER NOT NULL,
                timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                event_type TEXT NOT NULL,
                details TEXT,
                FOREIGN KEY (job_id) REFERENCES jobs (id)
            )
        """)

        await db.commit()
```

### 2.2 Implement Database Manager
```python
# src/database/manager.py

from dataclasses import dataclass
from datetime import datetime
from typing import Optional, List
import aiosqlite

@dataclass
class Job:
    id: int
    order_id: str
    status: str
    progress: float
    start_time: datetime
    completion_time: Optional[datetime]
    report_path: Optional[str]
    error_message: Optional[str]

class DatabaseManager:
    def __init__(self, db_path: str):
        self.db_path = db_path
        
    async def initialize(self):
        """Initialize database"""
        await create_tables(self.db_path)
    
    async def create_job(self, order_id: str) -> Job:
        async with aiosqlite.connect(self.db_path) as db:
            cursor = await db.execute("""
                INSERT INTO jobs (order_id, status)
                VALUES (?, 'initialized')
                RETURNING *
            """, (order_id,))
            row = await cursor.fetchone()
            await db.commit()
            return Job(*row)
    
    # Add other database methods...
```

## 3. GUI Components

### 3.1 Create Job Widget
```python
# src/gui/widgets.py

from PyQt6.QtWidgets import QFrame, QVBoxLayout, QLabel, QProgressBar
from PyQt6.QtCore import pyqtSignal

class JobWidget(QFrame):
    cancelled = pyqtSignal(str)  # Signal for job cancellation

    def __init__(self, job_id: str, parent=None):
        super().__init__(parent)
        self.job_id = job_id
        self._setup_ui()
    
    def _setup_ui(self):
        """Setup widget UI"""
        layout = QVBoxLayout(self)
        
        # Job ID label
        self.id_label = QLabel(f"Job: {self.job_id}")
        layout.addWidget(self.id_label)
        
        # Progress bar
        self.progress_bar = QProgressBar()
        self.progress_bar.setRange(0, 100)
        layout.addWidget(self.progress_bar)
        
        # Status label
        self.status_label = QLabel("Initializing...")
        layout.addWidget(self.status_label)
```

### 3.2 Implement Main Window
```python
# src/gui/main_window.py

from PyQt6.QtWidgets import QMainWindow, QVBoxLayout, QWidget
from PyQt6.QtCore import pyqtSlot
import qasync

class MainWindow(QMainWindow):
    def __init__(self, db_manager):
        super().__init__()
        self.db_manager = db_manager
        self.jobs = {}  # Store job widgets
        self._setup_ui()
    
    def _setup_ui(self):
        """Setup main window UI"""
        self.setWindowTitle("Transcription System")
        self.resize(800, 600)
        
        # Central widget
        central_widget = QWidget()
        self.setCentralWidget(central_widget)
        
        # Main layout
        self.main_layout = QVBoxLayout(central_widget)
```

## 4. Processing Integration

### 4.1 Create Processing Service
```python
# src/processing/processor.py

from PyQt6.QtCore import QThread, pyqtSignal
import whisper
from pyannote.audio import Pipeline

class TranscriptionProcessor(QThread):
    progress_updated = pyqtSignal(str, float, str)
    completed = pyqtSignal(str, dict)
    error_occurred = pyqtSignal(str, str)

    def __init__(self, config):
        super().__init__()
        self.config = config
        self._setup_models()
    
    def _setup_models(self):
        """Initialize models"""
        self.whisper_model = whisper.load_model("base")
        self.diarization = Pipeline.from_pretrained(
            "pyannote/speaker-diarization",
            use_auth_token=self.config.hf_token
        )
```

### 4.2 Implement Processing Logic
```python
# src/processing/processor.py

    async def process_file(self, job_id: str, file_path: str):
        """Process audio file"""
        try:
            # Update progress: Loading
            self.progress_updated.emit(job_id, 0.1, "Loading audio...")
            
            # Transcribe
            self.progress_updated.emit(job_id, 0.3, "Transcribing...")
            result = self.whisper_model.transcribe(file_path)
            
            # Diarization
            self.progress_updated.emit(job_id, 0.6, "Identifying speakers...")
            diarization = self.diarization(file_path)
            
            # Generate report
            self.progress_updated.emit(job_id, 0.9, "Generating report...")
            report = self._generate_report(result, diarization)
            
            # Complete
            self.completed.emit(job_id, {
                'report_path': report.path,
                'duration': result['duration']
            })
            
        except Exception as e:
            self.error_occurred.emit(job_id, str(e))
```

## 5. Testing and Validation

### 5.1 Create Test Cases
```python
# tests/test_processor.py

import pytest
import asyncio
from src.processing.processor import TranscriptionProcessor

@pytest.mark.asyncio
async def test_transcription():
    processor = TranscriptionProcessor(config)
    
    # Test with sample audio
    result = await processor.process_file(
        "TEST_001",
        "tests/data/sample.mp3"
    )
    
    assert result['status'] == 'success'
    assert 'report_path' in result
```

### 5.2 Integration Test
```python
# tests/test_integration.py

import pytest
from src.database.manager import DatabaseManager
from src.processing.processor import TranscriptionProcessor

@pytest.mark.asyncio
async def test_full_workflow():
    # Setup
    db = DatabaseManager(":memory:")
    await db.initialize()
    
    processor = TranscriptionProcessor(config)
    
    # Create job
    job = await db.create_job("TEST_002")
    
    # Process
    result = await processor.process_file(
        job.order_id,
        "tests/data/sample.mp3"
    )
    
    # Verify
    updated_job = await db.get_job(job.order_id)
    assert updated_job.status == 'completed'
    assert updated_job.report_path is not None
```

## 6. Running the Application

### 6.1 Main Entry Point
```python
# main.py

import sys
import asyncio
from PyQt6.QtWidgets import QApplication
import qasync
from src.database.manager import DatabaseManager
from src.gui.main_window import MainWindow

async def main():
    # Initialize database
    db_manager = DatabaseManager("transcription.db")
    await db_manager.initialize()
    
    # Create application
    app = QApplication(sys.argv)
    
    # Create and show main window
    window = MainWindow(db_manager)
    window.show()
    
    # Run event loop
    try:
        await qasync.QEventLoop(app).run_forever()
    except asyncio.CancelledError:
        pass

if __name__ == "__main__":
    asyncio.run(main())
```

## 7. Implementation Steps

1. Set up project structure and virtual environment
2. Install required dependencies
3. Implement database components
4. Create basic GUI structure
5. Add processing service
6. Integrate components
7. Add error handling
8. Test functionality
9. Optimize performance

## 8. Best Practices

1. Error Handling
```python
def handle_error(self, error: Exception, job_id: str):
    """Handle processing errors"""
    error_msg = str(error)
    logging.error(f"Error processing job {job_id}: {error_msg}")
    
    # Update database
    asyncio.create_task(
        self.db_manager.update_job_status(job_id, "failed", error_msg)
    )
    
    # Update UI
    self.update_job_widget(job_id, "failed", error_msg)
```

2. Resource Management
```python
def cleanup_resources(self):
    """Clean up temporary files and resources"""
    try:
        # Clear GPU memory
        torch.cuda.empty_cache()
        
        # Remove temporary files
        for temp_file in self.temp_files:
            if os.path.exists(temp_file):
                os.remove(temp_file)
    except Exception as e:
        logging.error(f"Cleanup error: {str(e)}")
```

3. Progress Updates
```python
def update_progress(self, job_id: str, progress: float, message: str):
    """Update progress in database and UI"""
    # Update database
    asyncio.create_task(
        self.db_manager.update_job_progress(job_id, progress, message)
    )
    
    # Update UI
    self.progress_updated.emit(job_id, progress, message)
```

## 9. Troubleshooting Guide

Common issues and solutions:

1. Database Errors:
```python
try:
    await db_manager.initialize()
except aiosqlite.Error as e:
    logging.error(f"Database initialization failed: {str(e)}")
    # Provide user feedback
    QMessageBox.critical(
        None,
        "Database Error",
        "Failed to initialize database. Check permissions and disk space."
    )
```

2. Processing Errors:
```python
try:
    result = await processor.process_file(job_id, file_path)
except Exception as e:
    logging.error(f"Processing error: {str(e)}")
    # Handle specific error types
    if isinstance(e, torch.cuda.OutOfMemoryError):
        # Switch to CPU processing
        processor.use_cpu()
        result = await processor.process_file(job_id, file_path)
```

3. GUI Responsiveness:
```python
def process_large_file(self, file_path: str):
    """Handle large file processing"""
    # Show progress dialog
    progress = QProgressDialog("Processing large file...", None, 0, 100)
    progress.setWindowModality(Qt.WindowModal)
    
    # Process in chunks
    chunk_size = 1024 * 1024  # 1MB chunks
    with open(file_path, 'rb') as f:
        while data := f.read(chunk_size):
            # Process chunk
            self.process_chunk(data)
            # Update progress
            progress.setValue(int(f.tell() / os.path.getsize(file_path) * 100))
```

