  

Here's the breakdown of each file's purpose, key tasks, and dependencies, organized by directory:

**File:** `src/services/image_processing_service.py`

- **Purpose:** Provides centralized image processing functionality decoupled from UI logic.
- **Key Tasks:** Manages batch processing, format management, and error tracking.
- **Used By:** `src/ui/main_window.py`
- **Dependencies:**
    - `pathlib.Path`
    - `logging`
    - `src.models.image_processor.ImageProcessor`
    - `src.core.config.Config`
    - `src.utils.logging.get_logger`

**File:** `src/ui/main_window.py`

- **Purpose:** Main application window for the LogoCraft application.
- **Key Tasks:** Initializes the GUI, handles user input, and orchestrates image processing.
- **Used By:** N/A (Main entry point)
- **Dependencies:**
    - `PySide6.QtWidgets`
    - `PySide6.QtCore`
    - `PySide6.QtGui`
    - `pathlib.Path`
    - `src.services.image_processing_service.ImageProcessingService`
    - `src.core.config.Config`
    - `src.utils.logging.get_logger`

**File:** `src/ui/widgets.py`

- **Purpose:** Defines reusable widgets for the LogoCraft application.
- **Key Tasks:** Implements `DropArea` for image drag-and-drop, `PreviewArea` for displaying image previews, and `FormatSelector` for selecting output formats.
- **Used By:** `src/ui/main_window.py`
- **Dependencies:**
    - `PySide6.QtWidgets`
    - `PySide6.QtCore`
    - `PySide6.QtGui`
    - `PIL.ImageQt`
    - `PIL.Image`
    - `pathlib.Path`
    - `typing.Set`
    - `src.core.config.Config`

**File:** `.clinerules`

- **Purpose:** Project intelligence for Cline.
- **Key Tasks:** Encouraging Memory Bank Requests.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `config.json`

- **Purpose:** Configuration settings for the application.
- **Key Tasks:** Contains output formats, processing parameters, and validation rules.
- **Used By:** `src/core/config.py`
- **Dependencies:** N/A

**File:** `requirements.txt`

- **Purpose:** Lists the Python packages required to run the project.
- **Key Tasks:** Specifies project dependencies.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `theme_config.json`

- **Purpose:** Configuration settings for the application theme.
- **Key Tasks:** Contains theme colors, fonts, and styles.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `assets/icons/HungerRush_Icon.ico`

- **Purpose:** Application icon.
- **Key Tasks:** Provides a visual representation of the application.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `deployment/build.py`

- **Purpose:** Build script for the application.
- **Key Tasks:** Packages the application for distribution.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `deployment/LogoCraft.spec`

- **Purpose:** PyInstaller specification file for building the application.
- **Key Tasks:** Defines the build process and dependencies.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `deployment/setup.py`

- **Purpose:** Setup script for the application.
- **Key Tasks:** Installs the application and its dependencies.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `docs/activeContext.md`

- **Purpose:** Tracks current state.
- **Key Tasks:** Tracks current state.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `docs/systemPatterns.md`

- **Purpose:** Documents system architecture.
- **Key Tasks:** Documents system architecture.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `docs/techContext.md`

- **Purpose:** Documents technical context.
- **Key Tasks:** Documents technical context.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `src/__init__.py`

- **Purpose:** Initializes the `src` package.
- **Key Tasks:** N/A
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `src/main.py`

- **Purpose:** Main entry point for the LogoCraft application.
- **Key Tasks:** Initializes the GUI and handles any exceptions.
- **Used By:** N/A
- **Dependencies:**
    - `sys`
    - `PySide6.QtWidgets.QApplication`
    - `src.gui.main_window.MainWindow`
    - `src.core.config.Config`
    - `src.utils.logging.get_logger`
    - `src.core.error_handler.format_error`
    - `src.core.error_handler.ImageProcessingError`

**File:** `src/core/__init__.py`

- **Purpose:** Initializes the `src.core` package.
- **Key Tasks:** N/A
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `src/core/config.py`

- **Purpose:** Defines the `Config` class, a singleton that manages the application's configuration settings.
- **Key Tasks:** Loads configuration from `config.json`, provides global settings.
- **Used By:** `src/main.py`, `src/services/image_processing_service.py`, `src/core/error_handler.py`, `src/ui/widgets.py`
- **Dependencies:**
    - `json`
    - `pathlib.Path`
    - `typing.Dict`
    - `typing.Any`
    - `typing.Optional`
    - `src.core.error_handler.ConfigurationError`
    - `src.utils.logging.get_logger`

**File:** `src/core/error_handler.py`

- **Purpose:** Defines custom exception classes for handling errors.
- **Key Tasks:** Provides error formatting and logging.
- **Used By:** `src/main.py`, `src/core/config.py`
- **Dependencies:**
    - `logging`

**File:** `src/core/format.py`

- **Purpose:** Defines constants and a `NamedTuple` for format configuration.
- **Key Tasks:** Provides image format specifications.
- **Used By:** N/A
- **Dependencies:**
    - `typing.NamedTuple`
    - `typing.Dict`
    - `typing.Tuple`

**File:** `src/models/__init__.py`

- **Purpose:** Initializes the `src.models` package.
- **Key Tasks:** N/A
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `src/models/base.py`

- **Purpose:** Defines base model functionality.
- **Key Tasks:** N/A
- **Used By:** `src/models/image_processor.py`, `src/models/push_processor.py`
- **Dependencies:** N/A

**File:** `src/models/image_processor.py`

- **Purpose:** Defines image processing logic for the application.
- **Key Tasks:** Handles transformations, optimizations, and saving processed images.
- **Used By:** `src/services/image_processing_service.py`, `tests/test_image_processor.py`
- **Dependencies:**
    - `PIL.Image`
    - `PIL.ExifTags`
    - `PIL.ImageFilter`
    - `pathlib.Path`
    - `typing.Tuple`
    - `typing.Union`
    - `typing.List`
    - `typing.Dict`
    - `typing.TypedDict`
    - `src.core.error_handler.ImageProcessingError`
    - `src.core.config.Config`
    - `src.utils.logging.get_logger`

**File:** `src/models/push_processor.py`

- **Purpose:** Defines image processing logic for creating Android push notification icons.
- **Key Tasks:** Handles transformations, optimizations, and saving processed images.
- **Used By:** N/A
- **Dependencies:**
    - `pathlib.Path`
    - `cv2`
    - `numpy`
    - `PIL.Image`
    - `PIL.ExifTags`
    - `PIL.ImageFilter`
    - `typing.Tuple`
    - `typing.Union`
    - `typing.List`
    - `typing.Dict`
    - `typing.TypedDict`
    - `src.core.error_handler.ImageProcessingError`
    - `src.core.config.Config`
    - `src.utils.logging.get_logger`

**File:** `src/services/__init__.py`

- **Purpose:** Initializes the `src.services` package.
- **Key Tasks:** N/A
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `src/theme/manager.py`

- **Purpose:** Manages the application theme.
- **Key Tasks:** Applies theme styling to widgets.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `src/ui/__init__.py`

- **Purpose:** Initializes the `src.ui` package.
- **Key Tasks:** N/A
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `src/utils/__init__.py`

- **Purpose:** Initializes the `src.utils` package.
- **Key Tasks:** N/A
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `src/utils/file_utils.py`

- **Purpose:** Provides utility functions for file handling.
- **Key Tasks:** Creates directories, validates paths, lists image files.
- **Used By:** N/A
- **Dependencies:**
    - `os`
    - `pathlib.Path`
    - `typing.List`
    - `typing.Set`
    - `typing.Union`
    - `logging`

**File:** `src/utils/image_utils.py`

- **Purpose:** Provides utility functions for image processing.
- **Key Tasks:** Validates images, resizes images, converts image formats.
- **Used By:** N/A
- **Dependencies:**
    - `PIL.Image`
    - `typing.Tuple`
    - `typing.Union`
    - `pathlib.Path`
    - `logging`

**File:** `src/utils/logging.py`

- **Purpose:** Provides centralized logging configuration.
- **Key Tasks:** Configures logging for the application.
- **Used By:** `src/main.py`, `src/core/config.py`, `src/core/error_handler.py`, `src/services/image_processing_service.py`, `src/models/image_processor.py`, `src/models/push_processor.py`, `src/ui/main_window.py`
- **Dependencies:**
    - `logging`
    - `logging.handlers`
    - `sys`
    - `time`
    - `datetime`
    - `pathlib.Path`
    - `typing.Optional`
    - `functools.lru_cache`

**File:** `tests/__init__.py`

- **Purpose:** Initializes the `tests` package.
- **Key Tasks:** N/A
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `tests/conftest.py`

- **Purpose:** Defines test fixtures and configuration for pytest.
- **Key Tasks:** Provides reusable test components.
- **Used By:** N/A
- **Dependencies:**
    - `pytest`

**File:** `tests/process_test_images.py`

- **Purpose:** Processes test images.
- **Key Tasks:** Processes test images.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `tests/test_gui.py`

- **Purpose:** Tests the GUI.
- **Key Tasks:** Tests the GUI.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `tests/test_image_processor.py`

- **Purpose:** Tests the image processor.
- **Key Tasks:** Tests the image processor.
- **Used By:** N/A
- **Dependencies:**
    - `pytest`
    - `PIL.Image`
    - `src.models.image_processor.ImageProcessor`

**File:** `tests/test_integration.py`

- **Purpose:** Integration tests.
- **Key Tasks:** Integration tests.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `tests/test_push_icon.py`

- **Purpose:** Tests the push icon processor.
- **Key Tasks:** Tests the push icon processor.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `tests/verify_output.py`

- **Purpose:** Verifies the output.
- **Key Tasks:** Verifies the output.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `tests/assets/test_images/Logo.png`

- **Purpose:** Test image.
- **Key Tasks:** Test image.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `tests/assets/test_images/logo2.png`

- **Purpose:** Test image.
- **Key Tasks:** Test image.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `tests/assets/test_images/Logo3.png`

- **Purpose:** Test image.
- **Key Tasks:** Test image.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `tests/assets/test_images/logo4.png`

- **Purpose:** Test image.
- **Key Tasks:** Test image.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `tests/assets/test_images/logo5.png`

- **Purpose:** Test image.
- **Key Tasks:** Test image.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `tests/assets/test_images/Logo6.png`

- **Purpose:** Test image.
- **Key Tasks:** Test image.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `tests/assets/test_images/Logo7.png`

- **Purpose:** Test image.
- **Key Tasks:** Test image.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `tests/assets/test_images/Logo8.png`

- **Purpose:** Test image.
- **Key Tasks:** Test image.
- **Used By:** N/A
- **Dependencies:** N/A

**File:** `tests/assets/test_images/Media.jfif`

- **Purpose:** Test image.
- **Key Tasks:** Test image.
- **Used By:** N/A
- **Dependencies:** N/A