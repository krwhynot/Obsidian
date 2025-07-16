import cv2

import numpy as np

from PIL import Image

import logging

from pathlib import Path

from typing import Union

  

from src.core.error_handler import ImageProcessingError

from src.models.image_processing import ImageProcessor, RESAMPLING_METHOD

  

logger = logging.getLogger(__name__)

  

class PushIconProcessor(ImageProcessor):

    """Handles push notification icon processing with a coloring book effect."""

  

    def __init__(self):

        super().__init__()

  

    def _create_coloring_book_effect(self, img: Image.Image) -> Image.Image:

        """Apply a coloring book effect using edge detection and adaptive thresholding."""

        # Convert PIL Image to OpenCV format

        img_np = np.array(img)

        img_cv = cv2.cvtColor(img_np, cv2.COLOR_RGBA2BGR)

  

        # Convert to grayscale

        gray = cv2.cvtColor(img_cv, cv2.COLOR_BGR2GRAY)

  

        # Apply Gaussian Blur with smaller kernel for finer detail

        blurred = cv2.GaussianBlur(gray, (3, 3), 0)

  

        # Enhance edges using Canny edge detection

        edges = cv2.Canny(blurred, 50, 150)

  

        # Dilate edges slightly to connect any gaps

        kernel = np.ones((2,2), np.uint8)

        dilated_edges = cv2.dilate(edges, kernel, iterations=1)

  

        # Apply adaptive thresholding with smaller block size

        binary = cv2.adaptiveThreshold(

            blurred,

            255,

            cv2.ADAPTIVE_THRESH_GAUSSIAN_C,

            cv2.THRESH_BINARY,

            7,   # Smaller block size for finer details

            4    # Higher C value for stronger edges

        )

  

        # Combine edge detection methods

        combined = cv2.bitwise_or(255 - binary, dilated_edges)

  

        # Thin the lines using erosion

        kernel = np.ones((2,2), np.uint8)

        thinned = cv2.erode(combined, kernel, iterations=1)

  

        # Create full alpha channel

        alpha = np.ones_like(thinned) * 255

  

        # Create RGBA image

        result = np.zeros((thinned.shape[0], thinned.shape[1], 4), dtype=np.uint8)

        # Set white background

        result[..., 0] = 255  # R channel

        result[..., 1] = 255  # G channel

        result[..., 2] = 255  # B channel

        # Set black lines (where thinned is non-zero)

        result[thinned > 0] = [0, 0, 0, 255]  # Black color with full opacity

        result[..., 3] = alpha  # Alpha channel

  

        # Convert back to PIL Image

        outline = Image.fromarray(result, 'RGBA')

        return outline

  

    def create_push_notification(

        self,

        input_path: Union[str, Path],

        output_path: Union[str, Path] = Path("Push.png")

    ) -> bool:

        """Generate a push notification icon with a coloring book effect."""

        input_path = Path(input_path).resolve()

        output_path = Path(output_path).resolve()

  

        if not input_path.exists():

            raise FileNotFoundError(f"File not found: {input_path}")

  

        logger.debug(f"Creating push notification icon: {input_path} -> {output_path}")

  

        try:

            # Ensure output directory exists

            output_path.parent.mkdir(parents=True, exist_ok=True)

  

            with Image.open(input_path) as img:

                self.validate_image(img)

                # Convert to RGBA and fix orientation

                img = self.fix_orientation(img.convert("RGBA"))

                # Process at a larger size for better edge detection

                img = self.resize_image(img, 192, 192)

                # Apply coloring book effect

                icon = self._create_coloring_book_effect(img)

                # Final resize to target size

                icon = icon.resize((96, 96), RESAMPLING_METHOD)

                # Save with optimization

                icon.save(

                    output_path,

                    "PNG",

                    optimize=True,

                    quality=self.DEFAULT_QUALITY

                )

                logger.info(f"Successfully saved push notification icon to {output_path}")

                return True

  

        except Exception as e:

            logger.error(f"Error creating push notification from {input_path}: {e}", exc_info=True)

            raise ImageProcessingError(f"Error creating push notification from {input_path}: {e}")