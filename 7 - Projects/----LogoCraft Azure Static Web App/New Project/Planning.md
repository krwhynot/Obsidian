
**Goal:** A web application that helps users convert logo images into multiple standard formats required for different applications. When processing is complete, all the converted images are bundled into a downloadable zip file, eliminating the need for users to manually resize images in photo editing software.

**USER FLOW:** 
1. Users upload their logo through a simple web interface
2. Select which output formats they need from a list
3. App automatically processes the image to the correct dimensions for each format

**FRONTEND:** 
-GUI:
		GUI has a clean, modern layout organized around a clear three-step workflow process. At the top of the interface, there's a header with the application title and a short description, followed by a visual step indicator showing the user's current position in the workflow (Upload → Configure → Download).

The main content area is divided into several panels arranged horizontally rather than stacked vertically:

On the left side is the Upload panel where users can drag-and-drop an image or click to browse their files. Once an image is uploaded, it displays a preview with information about the file dimensions.

The right side contains two main panels:
- The Export Options panel lets users select which output formats they want to generate using checkboxes organized into tabs (Installer Images and Online Images)
- The Generate panel includes a button to start processing and shows a progress bar during conversion

At the bottom of the screen, a status bar provides feedback about the current operation or system state. The entire interface is responsive, adapting to different screen sizes by reorganizing panels into a more vertical layout on smaller screens. The visual design uses a consistent color scheme with clearly defined panels, active state highlighting, and a hierarchy that guides users through the process.		


**BACKEND:**
The backend of LogoCraft Web uses Node.js for the image processing functionality. Specifically, it uses the Sharp library, which is a high-performance Node.js image processing library. Sharp is particularly well-suited for this application because it can efficiently handle various image transformations like resizing, format conversion, and color manipulation.

The Azure Functions that power the backend are written in JavaScript (Node.js), with two main functions:

1. GetSasToken - Handles authentication with Azure Blob Storage
2. ProcessImage - Performs the actual image processing using Sharp

The image processing includes operations like:

- Resizing images to specific dimensions
- Converting between formats (PNG, BMP)
- Creating monochrome BMP files for thermal printing
- Optimizing image quality and compression

The Sharp library was chosen because it's significantly faster than other Node.js image processing libraries and has good support for the formats needed in this application.

*AZURE Resources:*
	-Resource Group
	-App Service
	-Storage Account
	-Managed Identity 

1. **Frontend (GUI):** You need a place to host your web interface for uploading, configuring, and downloading.    
    - **Azure App Service:** This is a fully managed platform as a service (PaaS) designed for hosting web applications. It supports various web stacks, including Node.js, which is the language you're using for your backend [Source material query]. App Service allows you to run web apps without worrying about managing the underlying infrastructure. It also offers scalability to handle demand and can host static content. The provided materials frequently describe creating and deploying Node.js apps to App Service.
    - 
2. **Backend (Image Processing):** Your project uses Azure Functions for the image conversion logic 
    - **Azure Functions:** This service provides managed functions suitable for event-driven applications and background jobs. Using Azure Functions eliminates infrastructure management and offers automatic scaling. It supports multiple languages, including Node.js (JavaScript), which is specified for your backend [Source material query]. The compute decision tree also suggests Azure Functions for code-based, non-containerized microservices and event-driven workloads. Payment for Azure Functions is usage-based, depending on factors like execution duration.
    - 
3. **Storage (Images and ZIPs):** You need to store uploaded logos, processed images, and the final downloadable ZIP file.    
    - **Azure Blob Storage:** This is an object storage solution optimized for storing massive amounts of unstructured data. It's specifically mentioned as a location for static content like images. Blob Storage is well-suited for storing binary data like images and ZIP files.
    - 
4. **Authentication (Accessing Storage):** Your backend needs to authenticate with Azure Blob Storage     
    - **Managed Identities:** A safer way for your web app or functions to access Azure services like Azure Storage is by using managed identities. Managed identities from Microsoft Entra ID allow App Service or Functions to access resources through role-based access control without storing credentials in code. The `DefaultAzureCredential` class can be used with managed identities to authenticate with services like Azure Storage.

In summary, based on the details you provided and the source materials, a combination of **Azure App Service** for the frontend, **Azure Functions** for the backend processing, and **Azure Blob Storage** for file storage, secured using **Managed Identities**, appears to be an ideal set of resources for your project.


![[Pasted image 20250507081216.png]]



1. User to Frontend Authentication
User / Browser
Frontend (App Service)
Authentication: Standard HTTPS/SSL connection. No specific
authentication implemented yet, but could be enhanced with Azure AD
B2C or other identity solutions if required.
2. Frontend to Function App Authentication
Frontend (App Service)
Backend (Function App)
Authentication: HTTP triggers in Function App are configured for
anonymous access. URL rewriting in App Service proxies API requests.
CORS configuration in Function App restricts which origins can call it.
3. Function App to Blob Storage Authentication
Backend (Function App)
Azure Blob Storage
Authentication: Function App uses Managed Identity with RBAC (Role-
Based Access Control). The Function App's managed identity is granted
the "Storage Blob Data Contributor" role on the Storage Account.
4. Frontend to Blob Storage Direct Access (for uploads/downloads)
Frontend (App Service)
Azure Blob Storage
Authentication: SAS Tokens (Shared Access Signatures) are generated by
the GetSasToken function and passed to the frontend. These tokens
provide time-limited, scoped access for specific operations (read/write)
on specific containers and blobs.