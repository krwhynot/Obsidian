# Logocraft App Images - User Guide

## 1. Introduction

### 1.1 Purpose

**Logocraft App Images** is a Python-based application designed to help developers, designers, and marketing professionals quickly generate multiple-sized images from a single input. The tool ensures that the images are resized while maintaining their aspect ratio, preventing any distortion or squishing. It also provides background conversion for icons and allows users to easily manage multiple images at once through a drag-and-drop interface.

### 1.2 Features

- **Multiple Output Formats**: Automatically generates various sizes of images for different app requirements, such as app icons, splash screens, and notification icons.
- **Aspect Ratio Preservation**: Resizes images while preserving the original aspect ratio, preventing any image distortion.
- **Background Conversion for Icons**: Automatically converts icon backgrounds to white for consistency across platforms.
- **Drag-and-Drop Interface**: Users can easily drag and drop their input images into the tool for quick processing.
- **Progress Tracking**: Displays simple percentage completion as images are being processed.
- **Error Handling**: Handles errors gracefully and provides user-friendly error messages.
- **Batch Processing**: Supports the processing of multiple images simultaneously.

## 2. Installation

### 2.1 System Requirements

- **Python version**: 3.7 or higher
- **Operating system**: Windows, macOS, or Linux
- **Hardware requirements**: Minimum 2 GB RAM, 1 GB disk space for installation

### 2.2 Installation Steps

To install **Logocraft App Images**, use the following command in your terminal or command prompt:

```powershell
# Installation command
pip install logocraft-app-images
```

## 3. Using the Tool

### 3.1 Starting the Application

Once the installation is complete, you can launch the application by running the following command in your terminal or command prompt:

```powershell
# Launch command
python -m logocraft_app_images
```

Alternatively, on Windows, you can double-click the **logocraft_app_images.exe** file to open the GUI.

### 3.2 Input Requirements

- **Supported File Formats**: PNG is the supported format for input images.
- **Size Restrictions**: The input image should be at least **1024 x 1024 pixels** to ensure quality when resized to smaller dimensions.
- **File Naming Conventions**: It’s recommended to use descriptive filenames for input images (e.g., `app_logo.png`), but any valid PNG filename will work.

### 3.3 Generating Images

1. **Drag and Drop**: Simply drag and drop your input image into the tool’s window.
2. **Select Output Directory**: Choose a folder where the resized images will be saved.
3. **Select Formats**: The tool will automatically generate the required image formats (e.g., app icons, splash screens, etc.).
4. **Start Processing**: Click the "Generate Images" button to begin the image processing. The tool will display a progress bar with percentage completion.
5. **Save Output**: Once processing is complete, the tool will save the resized images in the specified directory.

### 3.4 Output Formats

|Format|Dimensions|Usage|
|---|---|---|
|**APPICON.PNG**|1024 x 1024 px|Application icon|
|**DEFAULT.PNG**|1242 x 1902 px|Splash screen|
|**DEFAULT_LG.PNG**|1242 x 2208 px|Large splash screen|
|**DEFAULT_XL.PNG**|1242 x 2688 px|Extra large splash screen|
|**FEATURE_GRAPHIC.PNG**|1024 x 500 px|Feature graphic|
|**LOGO.PNG**|1024 x 1024 px or 1024 x 500 px|High-resolution logo|
|**Push.png**|96 x 96 px|Push notification icon|

**Note**: All icon formats will automatically have a **white background** applied, regardless of the original background color of the image.

## 4. Troubleshooting

### 4.1 Common Issues

- **Input File Not Recognized**: Make sure the file you’re using is in PNG format and has a minimum size of 1024 x 1024 px.
- **Output Directory Not Found**: Ensure you specify a valid directory for saving the generated images.
- **Processing Takes Too Long**: If the tool is taking longer than expected, try reducing the size of your input image. Larger images will require more time for processing.

### 4.2 Error Messages

- **Error: Invalid File Format**: The input file is not in PNG format. Please provide a PNG file.
- **Error: Output Directory Missing**: The directory where you want to save images doesn’t exist. Please choose a valid directory.
- **Error: Image Resize Failed**: This may happen if the input image is too small or corrupted. Please check the image and try again.

**Support Contact Information**:  
For further assistance, contact support at [[support@logocraft.com](mailto:support@logocraft.com)].

## 5. Best Practices

- **Optimize Input Images**: Always start with high-resolution images (1024 x 1024 px or higher) to ensure the best quality when generating different sizes.
- **Naming Conventions**: Use descriptive names for your input files to keep things organized (e.g., `app_logo.png`, `splash_screen.png`).
- **Backup Files**: It’s a good idea to keep a backup of the original input image before running the tool, as the resized images will overwrite existing files in the output directory.
- **Batch Processing**: If processing multiple images, ensure that all images meet the input size requirements for the best results.

---

### Next Steps:

6. **GUI Design**: I’ll create a simple drag-and-drop interface for the user to load images easily. Would you like to use a specific framework for the GUI (e.g., Tkinter, PyQt)?
7. **Error Handling**: I’ll implement detailed error handling with user-friendly messages to ensure the app works smoothly.
8. **Batch Processing**: I’ll implement batch processing so the tool can handle multiple images at once.
9. **Progress Bar**: I will integrate a progress bar to show percentage completion while processing the images.

Feel free to ask if you need any changes or additions to the plan!