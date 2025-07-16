# Simplified Azure Implementation for LogoCraft Web

Since this is your first Azure project, let's simplify the architecture to focus on essential services while maintaining core functionality. Here's how to modify LogoCraft Web for a basic but effective Azure implementation:

## Streamlined Architecture

### Frontend: Simple Static Web App

- **Use Azure Static Web Apps** instead of App Service
    - Perfect for hosting React applications
    - Includes free SSL certificates
    - Built-in GitHub integration for easy deployment
    - No need to configure complex scaling rules

### Backend: Focused Functions App

- **Start with a single Azure Function App**
    - Create one HTTP-triggered function to handle image processing
    - Skip complex function chaining for now
    - Deploy directly from VS Code with the Azure extension

### Storage: Basic Blob Container

- **Use Azure Blob Storage** with simplified structure:
    - One container for uploaded images
    - One container for processed results
    - Public read access for download links

## Step-by-Step Implementation

1. **Set up the resources**:
    
    ```powershell
    # Log into Azure
    Connect-AzAccount
    
    # Create a resource group
    New-AzResourceGroup -Name "LogoCraftRG" -Location "eastus"
    
    # Create storage account
    New-AzStorageAccount -ResourceGroupName "LogoCraftRG" -Name "logocraftstorage" -Location "eastus" -SkuName "Standard_LRS"
    ```
    
2. **Create blob containers**:
    
    ```powershell
    # Get storage context
    $storageAccount = Get-AzStorageAccount -ResourceGroupName "LogoCraftRG" -Name "logocraftstorage"
    $ctx = $storageAccount.Context
    
    # Create containers
    New-AzStorageContainer -Name "uploads" -Context $ctx -Permission Off
    New-AzStorageContainer -Name "downloads" -Context $ctx -Permission Blob
    ```
    
3. **Deploy the Function App**:
    
    - Use VS Code with Azure Functions extension
    - Create a Node.js function app with HTTP trigger
    - Connect to your storage account using connection strings
4. **Deploy the Static Web App**:
    
    - Connect your GitHub repo in Azure Portal
    - Azure builds and deploys automatically when you push changes

## Key Simplifications

1. **Authentication:**
    Deployment Token: b52ef9b49d3de2f36ffca3c56d8fac4a1322451fea692ff09ae95c2576a1fe3906-85981f56-1938-471a-a9c5-6afdf08c5976010092308b7d2e10
    
    - Start with SAS tokens instead of Managed Identity
    - Generate short-lived tokens in your function for secure uploads/downloads
2. **Image Processing:**
    
    - Process images directly in the function (no separate service)
    - Use the Sharp library within your function code
3. **Configuration:**
    
    - Store connection strings in Function App settings
    - Skip Key Vault initially - add it later when needed
4. **Development Workflow:**
    
    - Use VS Code for both frontend and function development
    - Focus on local testing before Azure deployment

## Code Changes

### Generate SAS Token (in your function):

```javascript
function generateSasToken(containerName, permissions) {
  const startDate = new Date();
  const expiryDate = new Date(startDate);
  expiryDate.setMinutes(startDate.getMinutes() + 30);
  
  const sharedAccessPolicy = {
    permissions: permissions,
    startsOn: startDate,
    expiresOn: expiryDate
  };
  
  return blobService.generateSharedAccessSignature(
    containerName, 
    '', 
    sharedAccessPolicy
  );
}
```

### Frontend Upload Change:

```javascript
// Replace complex Azure AD auth with simple SAS token
async function getUploadUrl() {
  const response = await fetch('/api/GetSasToken');
  const data = await response.json();
  
  return {
    url: data.sasUrl,
    token: data.sasToken
  };
}
```

## Next Steps After Basics Work

Once your basic implementation is working:

1. Add Azure Application Insights for monitoring
2. Implement Azure Key Vault for secure credential storage
3. Add Azure CDN for better performance
4. Explore CI/CD with GitHub Actions

Would you like me to elaborate on any specific part of this simplified architecture?