# Azure Bicep Deployment Troubleshooting Summary for LogoCraft Web

We successfully configured Azure infrastructure using Bicep templates for the LogoCraft Web application. Below is a summary of the issues we encountered and the solutions we implemented.

## Architecture Overview

The LogoCraft Web application consists of two main components deployed across two resource groups:

1. **LogoCraft-Web-RG**: Contains the web frontend and shared resources:
    
    - Web App (App Service)
    - Storage Account for images (input & output)
    - Key Vault
    - Application Insights
2. **LogoCraft-Func-RG**: Contains the serverless backend:
    
    - Function App with HTTP trigger functions
    - App Service Plan (Consumption)
    - Function-specific Storage Account

## Key Issues and Solutions

### 1. Flex Consumption Plan Not Available

**Issue:** We initially tried to use the newer Flex Consumption plan (FC1 SKU) for the Function App, but received an error:

```
The pricing tier 'FlexConsumption' is not allowed in this resource group.
```

**Solution:**

- Reverted to the standard Y1 Consumption plan, which is more widely available
- Updated the sku and tier properties in function.bicep:
    
    ```bicep
    sku: {  name: 'Y1'  // Changed from 'FC1'  tier: 'Dynamic'  // Changed from 'FlexConsumption'}
    ```
    

### 2. WEBSITE_CONTENTAZUREFILECONNECTIONSTRING Configuration

**Issue:** We hit multiple issues with the Function App's storage configuration:

1. First error: `Required parameter WEBSITE_CONTENTAZUREFILECONNECTIONSTRING is missing`
2. Then: `The parameter WEBSITE_CONTENTAZUREFILECONNECTIONSTRING has an invalid value`

**Solution:**

- Created a dedicated storage account in the Function App resource group
- Ensured `allowSharedKeyAccess` was set to `true` in the storage account properties
- Constructed a proper connection string with an account key (managed identity not supported for this setting)
- Used a variable to store the connection string for cleaner code:
    
    ```bicep
    var functionStorageConnectionString = 'DefaultEndpointsProtocol=https;AccountName=${functionStorageAccount.name};EndpointSuffix=${environment().suffixes.storage};AccountKey=${functionStorageAccount.listKeys().keys[0].value}'
    ```
    

### 3. Storage Account Naming Constraints

**Issue:** Storage account name validation warning:

```
The provided value can have a length as large as 25 and may be too long to assign to a target with a configured maximum length of 24.
```

**Solution:**

- Created a carefully constructed storage account name:
    
    ```bicep
    name: '${take(replace(toLower(namePrefix), '-', ''), 5)}st${take(uniqueString(resourceGroup().id), 16)}'
    ```
    
- This ensures:
    - Name is always 23 characters (under the 24-character limit)
    - Follows storage account naming rules (lowercase, alphanumeric)
    - Maintains uniqueness with the uniqueString function

### 4. Circular Reference in Function App Configuration

**Issue:** Error when trying to reference the Function App within its own declaration:

```
This expression is referencing its own declaration, which is not allowed.
```

**Solution:**

- Created a separate variable for the content share name that doesn't reference the Function App
- Used this pre-computed variable in the Function App configuration:
    
    ```bicep
    var contentShareName = toLower('content${uniqueString(resourceGroup().id)}')
    ```
    

### 5. Role-Based Access Control for Managed Identity

We configured both the Web App and Function App with System-assigned Managed Identities, allowing them to securely authenticate with other Azure services:

- **Application Storage Access**: The Function App uses managed identity to access the main storage account for application data (input/output images)
- **Key Vault Access**: The Web App has a role assignment to access Key Vault secrets
- **Function Internal Storage**: We used a traditional connection string for the Function App's internal storage due to Consumption plan requirements

## Best Practices Implemented

1. **Security:**
    
    - HTTPS-only communication
    - FTP access disabled
    - Public blob access disabled
    - Managed identities for service-to-service authentication
2. **Modularity:**
    
    - Separate Bicep files for each resource group
    - Parameters for shared values across deployments
3. **Dynamic Naming:**
    
    - Used parameter-based naming conventions
    - Employed uniqueString function for global uniqueness
    - Added safety checks like string manipulation and length constraints

## Deployment Process

The deployment process uses a PowerShell script (deploy.ps1) that:

1. Creates both resource groups if they don't exist
2. Deploys main.bicep to LogoCraft-Web-RG
3. Passes output values as parameters to function.bicep
4. Deploys function.bicep to LogoCraft-Func-RG
5. Sets up appropriate RBAC role assignments

## Next Steps

With the infrastructure successfully deployed, the remaining steps are:

1. Deploy the Function App code
2. Deploy the Web App (React) code
3. Test the end-to-end functionality

This deployment demonstrates the power of Infrastructure as Code with Azure Bicep while highlighting important considerations for multi-component cloud applications, particularly around managed identities, storage configurations, and the specific requirements of Azure Functions on Consumption plans.