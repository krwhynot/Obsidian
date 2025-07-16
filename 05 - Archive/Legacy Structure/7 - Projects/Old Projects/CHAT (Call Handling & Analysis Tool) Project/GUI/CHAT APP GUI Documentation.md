# CHAT APP GUI Documentation

## Overview
The CHAT application provides a graphical user interface for processing and analyzing phone call recordings. The GUI is built using PyQt6 and follows a modular design pattern for easy maintenance and extensibility.

![[Code_eazELTZ0S8.png]]

## Main Window Components

### 1. Input Controls Section
**Location:** Top of window
**Purpose:** File and individual OrderID input

#### Components:
- **File Selection**
  - Text field showing selected file path
  - Browse button to open file dialog
  - Supports .txt files containing OrderIDs (one per line)
  
- **Single OrderID Input**
  - Text field for individual OrderID entry
  - "Add to Queue" button
  - Validates and adds single OrderIDs to processing queue

### 2. Control Buttons
**Location:** Below input controls
**Purpose:** Process control and queue management

#### Buttons:
- **Start**
  - Begins processing the queue
  - Disabled during processing
  
- **Pause**
  - Temporarily halts processing
  - Enabled only during active processing
  
- **Resume**
  - Continues processing from last state
  - Enabled only when processing is paused
  
- **Cancel**
  - Stops all processing
  - Returns to initial state
  - Enabled during processing
  
- **Clear Queue**
  - Removes all items from queue
  - Enabled when processing is inactive

### 3. Processing Status Section
**Location:** Middle of window
**Purpose:** Real-time processing information

#### Status Labels:
- Current OrderID being processed
- Completion count (x/total)
- Progress percentage
- Download status
- Transcription status
- Error count
- Estimated Time to Completion (ETA)

#### Progress Bar:
- Visual representation of overall progress
- Shows completed/total ratio

### 4. Processing Queue Table
**Location:** Below status section
**Purpose:** Detailed view of all OrderIDs and their status

#### Columns:
1. **OrderID**
   - Unique identifier for each call
   - Non-editable

2. **Status**
   - Possible values:
     * Pending
     * Downloading
     * Transcribing
     * Completed
     * Failed

3. **Added At**
   - Timestamp when OrderID was added to queue
   - Format: YYYY-MM-DD HH:MM:SS

4. **Processing Time**
   - Duration of processing in seconds
   - Only shown for completed items

5. **Error**
   - Error message if processing failed
   - Empty for successful processing

### 5. Processing Log
**Location:** Bottom of window
**Purpose:** Detailed activity log and error reporting

#### Features:
- Timestamped entries
- Color-coded messages (red for errors)
- Auto-scrolling
- Read-only display

## Data Persistence
- Queue state saved in SQLite database
- Enables process resumption after application restart
- Maintains processing history

## Status Updates and Monitoring

### Real-time Updates:
- Processing status changes
- Progress calculations
- Error tracking
- ETA calculations

### ETA Calculation Method:
1. Tracks last 20 processed items
2. Calculates rolling average processing time
3. Updates every second
4. Formula: `remaining_items * avg_processing_time`

## Error Handling

### User Input Validation:
- File format verification
- OrderID format checking
- Duplicate OrderID detection

### Processing Errors:
- API communication failures
- File download issues
- Transcription errors
- Database errors

## Key Methods

### Queue Management:
```python
def add_to_queue(self, order_id: str):
    """Adds single OrderID to processing queue"""

def clear_queue(self):
    """Removes all items from queue"""

def load_order_ids(self, filename: str):
    """Loads OrderIDs from text file"""
```

### Process Control:
```python
def start_processing(self):
    """Initiates processing of queue"""

def pause_processing(self):
    """Temporarily halts processing"""

def resume_processing(self):
    """Resumes paused processing"""

def cancel_processing(self):
    """Cancels all processing"""
```

### Status Updates:
```python
def update_status(self):
    """Updates overall processing status"""

def update_order_status(self, order_id: str, status: str):
    """Updates status of individual OrderID"""

def update_eta(self):
    """Updates estimated completion time"""
```

## Event Handling

### Signal Connections:
```python
# Button signals
self.start_button.clicked.connect(self.start_processing)
self.pause_button.clicked.connect(self.pause_processing)
self.resume_button.clicked.connect(self.resume_processing)
self.cancel_button.clicked.connect(self.cancel_processing)
self.clear_button.clicked.connect(self.clear_queue)

# Processor signals
self.processor.status_update.connect(self.update_order_status)
self.processor.log_update.connect(self.log_message)
```

## State Management

### Button States:
| State          | Start | Pause | Resume | Cancel | Clear |
|----------------|-------|-------|--------|--------|-------|
| Initial        | ✓     | ✗     | ✗      | ✗      | ✓     |
| Processing     | ✗     | ✓     | ✗      | ✓      | ✗     |
| Paused         | ✗     | ✗     | ✓      | ✓      | ✗     |
| Completed      | ✓     | ✗     | ✗      | ✗      | ✓     |

### Processing States:
- PENDING
- DOWNLOADING
- TRANSCRIBING
- COMPLETED
- FAILED

## Style Guidelines
- Window minimum size: 1200x800 pixels
- Proportional layout scaling
- Consistent padding and margins
- Clear visual hierarchy
- Status-based color coding

## Dependencies
- PyQt6
- Python 3.7+
- SQLite3
- Queue module

## Performance Considerations
- Asynchronous processing
- Queue-based operation
- Efficient status updates
- Memory management for large queues
- Database optimization

