
"""

Push Notification Icon Processor for Android.

  

This module handles the creation of Android notification icons following Material Design guidelines:

- 96x96 px for xxxhdpi

- White foreground with transparent background

- Simple, clear design without gradients

"""

  

from pathlib import Path

from PIL import Image

import numpy as np

import cv2

import logging

  

from src.core.error_handler import ImageProcessingError

from src.core.config import Config

from src.utils.image_utils import ImageUtils

  

logger = logging.getLogger(__name__)

  

class PushIconProcessor:

    """Processes images into Android push notification icons."""

  

    def __init__(self):

        self.config = Config()

        self.push_settings = self.config.get("output")["formats"]["PUSH"]

        self.TARGET_SIZE = tuple(self.push_settings["size"])  # (96, 96)

        self.INTERMEDIATE_SIZE = (192, 192)  # For better quality downscaling

        self.MIN_SIZE = (64, 64)  # Minimum input size

        self.processing_config = self.config.get("processing")

  

    def create_push_notification(self, input_path: Path, output_path: Path) -> bool:

        """

        Create a push notification icon from the input image.

  

        Args:

            input_path (Path): Path to the input image

            output_path (Path): Path where the processed icon should be saved

  

        Returns:

            bool: True if processing was successful

  

        Raises:

            ImageProcessingError: If image processing fails

            FileNotFoundError: If input file doesn't exist

        """

        # Verify input file exists

        if not input_path.exists():

            raise FileNotFoundError(f"Input file not found: {input_path}")

  

        # Open and validate input image

        with Image.open(input_path) as img:

            # Run validation using ImageUtils

            is_valid, message = ImageUtils.validate_image(img)

            if not is_valid:

                raise ImageProcessingError(message)

  

            # Convert to RGBA for consistency

            img = ImageUtils.convert_image_mode(img, "RGBA")

  

            # Check minimum size requirements

            if img.size[0] < self.MIN_SIZE[0] or img.size[1] < self.MIN_SIZE[1]:

                raise ImageProcessingError(

                    f"Input image dimensions too small. Minimum size is {self.MIN_SIZE[0]}x{self.MIN_SIZE[1]} px"

                )

  

            # Process the image

            processed_img = self._process_image(img)

  

            try:

                processed_img.save(

                    output_path,

                    "PNG",

                    optimize=self.processing_config["optimize"],

                    quality=self.processing_config["quality"]

                )

                logger.info(f"Successfully saved push icon to {output_path}")

                return True

            except Exception as e:

                logger.error(f"Failed to save push icon: {e}")

                raise ImageProcessingError(f"Failed to save push icon: {e}")

  

    def _analyze_contrast(self, gray_image):

        """Analyze image contrast using histogram analysis."""

        hist = cv2.calcHist([gray_image], [0], None, [256], [0, 256])

        non_zero_bins = hist[hist > 0]

        if len(non_zero_bins) > 0:

            spread = np.max(non_zero_bins) - np.min(non_zero_bins)

            contrast_level = spread / np.sum(hist)

            return contrast_level

        return 0.5

  

    def _analyze_text(self, gray_image):

        """Analyze text characteristics in the image."""

        filtered = cv2.bilateralFilter(gray_image, 9, 75, 75)

        edges = cv2.Canny(filtered, 50, 150)

        contours, _ = cv2.findContours(edges, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

  

        if len(contours) > 0:

            areas = [cv2.contourArea(cnt) for cnt in contours]

            avg_area = np.mean(areas)

            return {

                'has_fine_text': avg_area < 100,

                'text_density': len(contours) / (gray_image.shape[0] * gray_image.shape[1])

            }

        return {'has_fine_text': False, 'text_density': 0}

  

    def _process_image(self, img: Image.Image) -> Image.Image:

        """

        Process the image following Android icon guidelines.

  

        Args:

            img (Image.Image): Input PIL Image

  

        Returns:

            Image.Image: Processed PIL Image

        """

        # Step 1: Upscale to intermediate size for better processing

        img = ImageUtils.optimal_downscale(img, self.INTERMEDIATE_SIZE)

  

        # Get alpha channel before processing

        r, g, b, a = img.split()

  

        # Convert to numpy array for OpenCV processing

        img_array = np.array(img)

        alpha_array = np.array(a)

  

        # Convert RGB to grayscale

        gray = cv2.cvtColor(cv2.cvtColor(img_array, cv2.COLOR_RGBA2RGB), cv2.COLOR_RGB2GRAY)

  

        # Analyze image characteristics

        contrast_level = self._analyze_contrast(gray)

        text_info = self._analyze_text(gray)

  

        # Adjust parameters based on analysis

        if contrast_level > 0.5:  # High contrast

            blur_sigma = 0.5

            edge_low = 30

            edge_high = 100

            block_size = 7

        else:  # Lower contrast

            blur_sigma = 1.0

            edge_low = 20

            edge_high = 90

            block_size = 11

  

        # Apply Gaussian blur with dynamic sigma

        blurred = cv2.GaussianBlur(gray, (3, 3), blur_sigma)

  

        # Edge detection with dynamic thresholds

        edges = cv2.Canny(blurred, edge_low, edge_high)

  

        # Dilate edges with dynamic kernel size

        kernel_size = (1, 1) if text_info['has_fine_text'] else (2, 1)

        kernel = np.ones(kernel_size, np.uint8)

        dilated = cv2.dilate(edges, kernel, iterations=1)

  

        # Apply adaptive thresholding with dynamic block size

        thresh = cv2.adaptiveThreshold(

            blurred,

            255,

            cv2.ADAPTIVE_THRESH_GAUSSIAN_C,

            cv2.THRESH_BINARY,

            block_size,

            2

        )

  

        # Combine edges and threshold

        combined = cv2.bitwise_or(dilated, thresh)

  

        # Create output array with transparency

        result = np.zeros((*self.INTERMEDIATE_SIZE, 4), dtype=np.uint8)

  

        # Set white pixels with full opacity where we have content

        # Ensure background remains fully transparent

        mask = combined > 0

        result[mask] = [255, 255, 255, 255]  # White with full opacity

        result[~mask] = [0, 0, 0, 0]  # Fully transparent

  

        # Convert back to PIL and resize with high-quality downsampling

        result_img = Image.fromarray(result, mode='RGBA')

        final_img = ImageUtils.optimal_downscale(result_img, self.TARGET_SIZE)

  

        return final_img



# 1st 

from PySide6.QtWidgets import (

    QApplication, QWidget, QLabel, QLineEdit, QPushButton, QFileDialog,

    QVBoxLayout, QHBoxLayout, QGridLayout, QCheckBox, QFrame

)

from PySide6.QtGui import QFont, QDragEnterEvent, QDropEvent

from PySide6.QtCore import Qt

import os

  
  

class ImageProcessorGUI(QWidget):

    def __init__(self):

        super().__init__()

        self.setAcceptDrops(True)  # Enable drop events

        self.setWindowTitle("HungerRush Utility - Image Processor")

        self.setGeometry(200, 200, 500, 525)

        self.initUI()

  

    def dragEnterEvent(self, event: QDragEnterEvent):

        if event.mimeData().hasUrls():

            urls = event.mimeData().urls()

            if len(urls) == 1:  # Only accept one file at a time

                file_path = urls[0].toLocalFile()

                # Check if the file has a valid image extension

                valid_extensions = ['.png', '.jpg', '.jpeg']

                if any(file_path.lower().endswith(ext) for ext in valid_extensions):

                    event.accept()

                    return

        event.ignore()

  

    def dropEvent(self, event: QDropEvent):

        file_path = event.mimeData().urls()[0].toLocalFile()

        self.input_file_entry.setText(file_path)

        # Update drop zone text to show success

        self.drop_label.setText(f"File loaded: {os.path.basename(file_path)}")

        self.drop_label.setStyleSheet(f"color: #23A47C; font-weight: bold;")

        event.accept()

  

    def dragMoveEvent(self, event):

        if event.mimeData().hasUrls():

            event.accept()

        else:

            event.ignore()

  

    def initUI(self):

        # Color Scheme

        bg_color = "#1A2639"  # Dark Blue Background

        section_bg = "#25324B"  # Slightly lighter blue for sections

        input_bg = "#FFFFFF"  # White input fields

        border_color = "#354B67"  # Subtle contrast border

        header_text = "#23A47C"  # Teal Green for Section Headers

        text_color = "#FFFFFF"  # White text for readability

        border_radius = "8px"

  

        # Apply window background color

        self.setStyleSheet(f"background-color: {bg_color}; color: {text_color};")

  

        main_layout = QVBoxLayout(self)

        main_layout.setSpacing(10)

        main_layout.setContentsMargins(10, 10, 10, 10)

  

        # Create a reusable function for section frames

        def create_section(title):

            section_frame = QFrame()

            section_frame.setStyleSheet(

                f"border: none; background-color: {section_bg}; "

                f"border-radius: {border_radius}; padding: 10px;"

            )

            section_layout = QVBoxLayout(section_frame)

            section_layout.setSpacing(5)

            section_label = QLabel(title)

            section_label.setFont(QFont("Arial", 11, QFont.Bold))

            section_label.setStyleSheet(f"color: {header_text}; padding-bottom: 5px;")

            section_layout.addWidget(section_label)

            return section_frame, section_layout

  

        # Input Image Section

        image_section, image_layout = create_section("Input Image")

        self.input_file_entry = QLineEdit()

        self.input_file_entry.setPlaceholderText("Select input image file...")

        self.input_file_entry.setReadOnly(True)

        self.input_file_entry.setStyleSheet(

            f"background-color: {input_bg}; color: black; border: 1px solid {border_color}; "

            f"border-radius: {border_radius}; padding: 6px;"

        )

  

        browse_input_button = QPushButton("Browse")

        browse_input_button.setStyleSheet(

            f"background-color: {header_text}; color: white; border-radius: {border_radius}; padding: 6px;"

        )

  

        input_file_layout = QHBoxLayout()

        input_file_layout.addWidget(self.input_file_entry)

        input_file_layout.addWidget(browse_input_button)

        image_layout.addLayout(input_file_layout)

  

        # Drag and Drop Frame

        drop_frame = QFrame()

        drop_frame.setStyleSheet(

            f"border: 2px dashed {header_text}; background-color: {section_bg}; padding: 20px; border-radius: {border_radius};"

        )

        drop_layout = QVBoxLayout()

        self.drop_label = QLabel("Drop your image here\nor use the browse button above")

        self.drop_label.setAlignment(Qt.AlignCenter)

        self.drop_label.setStyleSheet(f"color: #B0B0FF; font-weight: bold;")

        drop_layout.addWidget(self.drop_label)

        drop_frame.setLayout(drop_layout)

        image_layout.addWidget(drop_frame)

  

        main_layout.addWidget(image_section)

  

        # Output Directory Section

        output_section, output_layout = create_section("Output Directory")

        self.output_dir_entry = QLineEdit()

        self.output_dir_entry.setPlaceholderText("Select output directory...")

        self.output_dir_entry.setReadOnly(True)

        self.output_dir_entry.setStyleSheet(

            f"background-color: {input_bg}; color: black; border: 1px solid {border_color}; "

            f"border-radius: {border_radius}; padding: 6px;"

        )

  

        browse_output_button = QPushButton("Browse")

        browse_output_button.setStyleSheet(browse_input_button.styleSheet())

        browse_output_button.clicked.connect(self.select_output_directory)

  

        output_file_layout = QHBoxLayout()

        output_file_layout.addWidget(self.output_dir_entry)

        output_file_layout.addWidget(browse_output_button)

        output_layout.addLayout(output_file_layout)

  

        main_layout.addWidget(output_section)

  

        # Output Options Section with condensed layout

        options_section, options_layout = create_section("Output Options")

  

        grid_layout = QGridLayout()

        grid_layout.setSpacing(5)  # Reduce spacing between items

        grid_layout.setContentsMargins(5, 5, 5, 5)  # Reduce margins

  

        options = [

            ("APPICON.PNG", "1024 × 1024 px"),

            ("DEFAULT.PNG", "1242 × 1902 px"),

            ("DEFAULT_LG.PNG", "1242 × 2208 px"),

            ("DEFAULT_XL.PNG", "1242 × 2688 px"),

            ("FEATURE_GRAPHIC.PNG", "1024 × 500 px"),

            ("LOGO.PNG", "1024 × 1024 px"),

            ("Push.png", "96 × 96 px"),

        ]

  

        self.checkboxes = []

        for i, (name, size) in enumerate(options):

            row_frame = QFrame()

            row_frame.setStyleSheet(

                f"QFrame {{ "

                f"    background-color: {section_bg}; "

                f"    border-radius: 4px; "  # Reduced border radius

                f"    padding: 2px; "  # Reduced padding

                f"}}"

            )

  

            row_layout = QHBoxLayout(row_frame)

            row_layout.setContentsMargins(5, 2, 5, 2)  # Reduced margins

            row_layout.setSpacing(5)  # Reduced spacing between elements

  

            checkbox = QCheckBox(name)

            checkbox.setChecked(True)

            checkbox.setStyleSheet(

                f"QCheckBox {{ "

                f"    color: {text_color}; "

                f"    padding: 1px; "  # Reduced padding

                f"    font-size: 11px; "  # Slightly smaller font

                f"}}"

            )

  

            size_label = QLabel(size)

            size_label.setStyleSheet(

                f"QLabel {{ "

                f"    color: lightgray; "

                f"    font-size: 10px; "

                f"}}"

            )

  

            row_layout.addWidget(checkbox)

            row_layout.addWidget(size_label)

            row_layout.addStretch()

  

            # Calculate row and column positions

            row = i // 2  # Two items per row

            col = i % 2   # Alternating between columns 0 and 1

            grid_layout.addWidget(row_frame, row, col)

            self.checkboxes.append(checkbox)

  

        options_layout.addLayout(grid_layout)

        main_layout.addWidget(options_section)

  

        # Process Button

        process_button = QPushButton("Process Images")

        process_button.setFont(QFont("Arial", 10, QFont.Bold))

        process_button.setStyleSheet(

            f"background-color: {header_text}; color: white; border-radius: {border_radius}; padding: 10px;"

        )

        process_button.clicked.connect(self.process_images)

  

        main_layout.addWidget(process_button, alignment=Qt.AlignCenter)

  

        def reset_drop_zone():

            self.drop_label.setText("Drop your image here\nor use the browse button above")

            self.drop_label.setStyleSheet(f"color: #B0B0FF; font-weight: bold;")

  

        def handle_file_selection():

            file_name, _ = QFileDialog.getOpenFileName(

                self,

                "Select Image File",

                "",

                "Images (*.png *.jpg *.jpeg)"

            )

            if file_name:

                self.input_file_entry.setText(file_name)

                self.drop_label.setText(f"File loaded: {os.path.basename(file_name)}")

                self.drop_label.setStyleSheet(f"color: #23A47C; font-weight: bold;")

  

        browse_input_button.clicked.connect(handle_file_selection)

        self.setLayout(main_layout)

  

    def select_output_directory(self):

        dir_name = QFileDialog.getExistingDirectory(self, "Select Output Directory")

        if dir_name:

            self.output_dir_entry.setText(dir_name)

  

    def process_images(self):

        print("Processing Images...")

  
  

if __name__ == "__main__":

    app = QApplication([])

    window = ImageProcessorGUI()

    window.show()

    app.exec()



# 2nd

from PySide6.QtWidgets import (
    QMainWindow, QWidget, QLabel, QLineEdit, QPushButton, QFileDialog,
    QVBoxLayout, QHBoxLayout, QFrame, QCheckBox, QGridLayout
)
from PySide6.QtCore import Qt
from PySide6.QtGui import QFont, QDragEnterEvent, QDropEvent
import os

from src.models.image_processor import ImageProcessor
from src.core.config import Config
from src.utils.logging import get_logger

logger = get_logger(__name__)

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("HungerRush Utility - Image Processor")
        self.setGeometry(200, 200, 500, 600)
        self.setAcceptDrops(True)

        self.processor = ImageProcessor()
        self.config = Config()
        self.current_file = None
        self.checkboxes = {}

        self.initUI()

    def initUI(self):
        """Initialize the GUI layout and components."""
        # Color Scheme
        bg_color = "#1A2639"
        section_bg = "#25324B"
        input_bg = "#FFFFFF"
        border_color = "#354B67"
        header_text = "#23A47C"
        text_color = "#FFFFFF"
        border_radius = "8px"

        self.setStyleSheet(f"background-color: {bg_color}; color: {text_color};")

        main_layout = QVBoxLayout()
        main_layout.setSpacing(10)
        main_layout.setContentsMargins(10, 10, 10, 10)

        def create_section(title):
            """Creates a styled section for input and output fields."""
            section_frame = QFrame()
            section_frame.setStyleSheet(
                f"border: none; background-color: {section_bg}; border-radius: {border_radius}; padding: 10px;"
            )
            section_layout = QVBoxLayout(section_frame)
            section_label = QLabel(title)
            section_label.setFont(QFont("Arial", 11, QFont.Bold))
            section_label.setStyleSheet(f"color: {header_text}; padding-bottom: 5px;")
            section_layout.addWidget(section_label)
            return section_frame, section_layout

        # Input Image Section
        image_section, image_layout = create_section("Input Image")
        self.input_file_entry = QLineEdit()
        self.input_file_entry.setPlaceholderText("Select input image file...")
        self.input_file_entry.setReadOnly(True)
        self.input_file_entry.setStyleSheet(
            f"background-color: {input_bg}; color: black; border: 1px solid {border_color}; "
            f"border-radius: {border_radius}; padding: 6px;"
        )

        browse_input_button = QPushButton("Browse")
        browse_input_button.setStyleSheet(
            f"background-color: {header_text}; color: white; border-radius: {border_radius}; padding: 6px;"
        )

        input_file_layout = QHBoxLayout()
        input_file_layout.addWidget(self.input_file_entry)
        input_file_layout.addWidget(browse_input_button)
        image_layout.addLayout(input_file_layout)

        self.drop_label = QLabel("Drop your image here\nor use the browse button above")
        self.drop_label.setAlignment(Qt.AlignCenter)
        self.drop_label.setStyleSheet("color: #B0B0FF; font-weight: bold;")

        drop_frame = QFrame()
        drop_frame.setStyleSheet(
            f"border: 2px dashed {header_text}; background-color: {section_bg}; padding: 20px; border-radius: {border_radius};"
        )
        drop_layout = QVBoxLayout()
        drop_layout.addWidget(self.drop_label)
        drop_frame.setLayout(drop_layout)
        image_layout.addWidget(drop_frame)

        main_layout.addWidget(image_section)

        # Output Directory Section
        output_section, output_layout = create_section("Output Directory")
        self.output_dir_entry = QLineEdit()
        self.output_dir_entry.setPlaceholderText("Select output directory...")
        self.output_dir_entry.setReadOnly(True)
        self.output_dir_entry.setStyleSheet(
            f"background-color: {input_bg}; color: black; border: 1px solid {border_color}; "
            f"border-radius: {border_radius}; padding: 6px;"
        )

        browse_output_button = QPushButton("Browse")
        browse_output_button.setStyleSheet(browse_input_button.styleSheet())
        browse_output_button.clicked.connect(self.select_output_directory)

        output_file_layout = QHBoxLayout()
        output_file_layout.addWidget(self.output_dir_entry)
        output_file_layout.addWidget(browse_output_button)
        output_layout.addLayout(output_file_layout)
        main_layout.addWidget(output_section)

        # Output Format Selection
        format_section, format_layout = create_section("Select Output Formats")
        format_grid = QGridLayout()

        formats = {
            "APPICON.PNG": "1024 × 1024 px",
            "DEFAULT.PNG": "1242 × 1902 px",
            "DEFAULT_LG.PNG": "1242 × 2208 px",
            "DEFAULT_XL.PNG": "1242 × 2688 px",
            "FEATURE_GRAPHIC.PNG": "1024 × 500 px",
            "LOGO.PNG": "1024 × 1024 px",
            "PUSH.PNG": "96 × 96 px"
        }

        for i, (name, size) in enumerate(formats.items()):
            checkbox = QCheckBox(f"{name} ({size})")
            checkbox.setChecked(True)
            checkbox.setStyleSheet(f"color: {text_color}; padding: 5px;")
            row, col = divmod(i, 2)  # Two columns per row
            format_grid.addWidget(checkbox, row, col)
            self.checkboxes[name] = checkbox

        format_layout.addLayout(format_grid)
        main_layout.addWidget(format_section)

        # Process Button
        self.process_btn = QPushButton("Process Images")
        self.process_btn.setFont(QFont("Arial", 10, QFont.Bold))
        self.process_btn.setStyleSheet(
            f"background-color: {header_text}; color: white; border-radius: {border_radius}; padding: 10px;"
        )
        self.process_btn.clicked.connect(self.process_images)

        main_layout.addWidget(self.process_btn, alignment=Qt.AlignCenter)

        # Status Label
        self.status_label = QLabel("")
        main_layout.addWidget(self.status_label)

        container = QWidget()
        container.setLayout(main_layout)
        self.setCentralWidget(container)

    def select_output_directory(self):
        """Opens file dialog to select output directory."""
        dir_name = QFileDialog.getExistingDirectory(self, "Select Output Directory")
        if dir_name:
            self.output_dir_entry.setText(dir_name)

    def process_images(self):
        """Placeholder function for processing images."""
        selected_formats = [name for name, checkbox in self.checkboxes.items() if checkbox.isChecked()]
        if not selected_formats:
            self.status_label.setText("No formats selected!")
            return

        self.status_label.setText(f"Processing images for: {', '.join(selected_formats)}")

    def dragEnterEvent(self, event: QDragEnterEvent):
        """Handles drag enter event."""
        if event.mimeData().hasUrls():
            event.accept()
        else:
            event.ignore()

    def dropEvent(self, event: QDropEvent):
        """Handles file drop event."""
        file_path = event.mimeData().urls()[0].toLocalFile()
        self.input_file_entry.setText(file_path)
        self.drop_label.setText(f"File loaded: {os.path.basename(file_path)}")
        self.drop_label.setStyleSheet("color: #23A47C; font-weight: bold;")
        event.accept()


if __name__ == "__main__":
    from PySide6.QtWidgets import QApplication
    import sys

    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec())
