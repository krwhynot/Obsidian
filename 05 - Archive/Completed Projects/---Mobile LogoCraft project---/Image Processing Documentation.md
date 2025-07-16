# Image Processing Documentation

## Image Processing Application

### Version 1.0.0

#### Date: February 12, 2025

## 1. Overview

This document details the image processing workflow, including supported formats, processing techniques, and key functions. It serves as a reference for integrating the image processing capabilities of this project into other applications.

## 2. Supported Formats and Output Specifications

| Format              | Dimensions         | Description                                 |
| ------------------- | ------------------ | ------------------------------------------- |
| APPICON.PNG         | 1024 x 1024 px     | Application icon with optional transparency |
| DEFAULT.PNG         | 1242 x 1902 px     | Splash screen with maintained aspect ratio  |
| DEFAULT_LG.PNG      | 1242 x 2208 px     | Large splash screen                         |
| DEFAULT_XL.PNG      | 1242 x 2688 px     | Extra large splash screen                   |
| FEATURE_GRAPHIC.PNG | 1024 x 500 px      | Feature graphic with solid background       |
| LOGO.PNG            | 1024 x 1024        | High-resolution logo with transparency      |
| LOGO_Wide.PNG       | 1024 x 500 px      | High-resolution logo with transparency      |
| Push.png            | 96 x 96 px         | White icon on transparent background        |

## 3. Image Processing Workflow

### 3.1 Input Validation

Before processing an image, the application ensures:

- The file format is supported (`.png`, `.jpg`, `.jpeg`, `.gif`, `.bmp`, `.tiff`).
- The image dimensions meet the minimum requirement (1242x2688 px for larger outputs).
- The image file is not corrupted and can be opened successfully.

### 3.2 Processing Pipeline

1. **Load Image**: Convert to `RGBA` mode to preserve transparency.
2. **Determine Processing Type**:
    - **Aspect Ratio Resizing**: For formats that maintain proportions (`DEFAULT`, `DEFAULT_LG`, `DEFAULT_XL`).
    - **Fixed Dimension Resizing**: For formats requiring exact sizes (`APPICON`, `FEATURE_GRAPHIC`, `PUSH`).
    - **Resizing Method Selection**: Uses `LANCZOS` resampling for high-quality scaling.
3. **Apply Processing**:
    - `aspect_ratio_resize(image, max_size)`: Uses `thumbnail()` with `LANCZOS` resampling.
    - `fixed_dimension_resize(image, size)`: Uses `ImageOps.fit()` for exact cropping.
    - `convert_to_white_transparent(image)`: Converts non-transparent pixels to white while preserving alpha.
4. **Save Processed Image**: Output to the specified directory in `.png` format with optimal compression.

### 3.3 Error Handling

- **Invalid Format**: Displays an error message and prevents processing.
- **Insufficient Resolution**: Issues a warning but allows processing with reduced quality.
- **Output Directory Issues**: Ensures the selected output folder exists or creates it automatically.

## 4. Key Functions

### 4.1 Aspect Ratio Resizing

```python
def aspect_ratio_resize(image, max_size):
    """Preserve aspect ratio within maximum dimensions using LANCZOS resampling."""
    img_copy = image.copy()
    img_copy.thumbnail(max_size, Image.Resampling.LANCZOS)
    return img_copy
```

### 4.2 Fixed Dimension Resizing

```python
def fixed_dimension_resize(image, size):
    """Resize image to exact dimensions with center cropping using LANCZOS resampling."""
    return ImageOps.fit(image, size, method=Image.Resampling.LANCZOS, centering=(0.5, 0.5))
```

### 4.3 White Background Conversion

```python
def convert_to_white_transparent(image):
    """Convert image to white while preserving transparency."""
    if image.mode != 'RGBA':
        image = image.convert('RGBA')
    data = [(255, 255, 255, a) if a > 0 else (0, 0, 0, 0) for r, g, b, a in image.getdata()]
    white_image = Image.new('RGBA', image.size)
    white_image.putdata(data)
    return white_image
```

## 5. Image Processing Algorithms

### 5.1 Resizing Methods

- Use Pillow's LANCZOS resampling for highest quality
- Maintain aspect ratio using `thumbnail()` method
- Center crop using `ImageOps.fit()` for fixed dimensions
- Alpha channel preservation during processing

### 5.2 Color Conversion

- RGBA mode for transparent images
- RGB mode for solid background images
- White conversion algorithm for Push.png:
    - Preserve alpha channel
    - Convert all non-transparent pixels to white
    - Maintain transparency levels

### 5.3 File Format Support

- Input Formats:
    - PNG (preferred)
    - JPEG/JPG
    - GIF (first frame only)
    - BMP
    - TIFF
- Output Format:
    - PNG exclusively for all outputs
    - Compression level: 6 (balanced)

### 5.4 Output Specifications

#### 5.4.1 Quality Requirements

- No visible artifacts
- Sharp edges
- Clean transparency
- Consistent color reproduction

## 6. Integration Considerations

### 6.1 Adapting to Another GUI

To integrate these processing functions into another GUI:

- Ensure the GUI provides an **image selection method** (e.g., file picker or drag-and-drop).
- Implement **output format selection** for different image types.
- Modify the processing pipeline to use `ImageProcessor` methods.
- Ensure the output directory is handled correctly and allows user configuration.

### 6.2 Async Processing and Progress Tracking

If the other project’s GUI supports async processing:

```python
async def process_with_progress(callback):
    total_steps = len(output_formats)
    for i, (format_name, specs) in enumerate(output_formats.items(), 1):
        await callback(i / total_steps, f"Processing {format_name}...")
        process_image(format_name)
```

This keeps the UI responsive and provides real-time progress updates.

## 7. Conclusion

This document provides an overview of the image processing workflow and methods used in this project. By following these guidelines, the image processing capabilities can be successfully integrated into another project’s GUI.