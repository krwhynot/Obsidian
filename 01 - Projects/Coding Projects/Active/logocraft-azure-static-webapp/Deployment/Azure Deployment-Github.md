# Prepare for Azure Deployment - GitHub Secrets 
## Setting Up GitHub Secrets

You'll need two critical secrets in your GitHub repository:

1. **AZURE_CREDENTIALS**
    
    - This is used by the infrastructure deployment workflow to authenticate with Azure
    - Contains a JSON object with service principal credentials
    
    To create this secret:
    
    ```powershell
    # Login to Azure
    Connect-AzAccount
    
    # Create a service principal with Contributor role at subscription level
    $subscription = (Get-AzContext).Subscription.Id
    $sp = New-AzADServicePrincipal -DisplayName "LogoCraftWeb-Deployment" -Role "Contributor" -Scope "/subscriptions/$subscription"
    
    # Create the credentials JSON
    $credentials = @{
        clientId = $sp.AppId
        clientSecret = [System.Net.NetworkCredential]::new('', $sp.Secret).Password
        subscriptionId = $subscription
        tenantId = (Get-AzContext).Tenant.Id
    } | ConvertTo-Json
    
    # Output credentials to securely copy to GitHub
    Write-Output $credentials
    ```
    
    - Copy this JSON output to your GitHub repository:
        - Go to Settings > Secrets and variables > Actions
        - Click "New repository secret"
        - Name: AZURE_CREDENTIALS
        - Value: [Paste the JSON output]
2. **AZURE_STATIC_WEB_APPS_API_TOKEN**
    
    - This will be generated after the infrastructure is deployed
    - We'll add this in a later step

## Review Bicep Parameters

Now, let's review the parameters in `infrastructure/main.bicep`:

1. **Location**
    
    - Default: `resourceGroup().location`
    - Consider if you want to deploy to a specific region instead
2. **Name Prefix**
    
    - Default: 'logocraft'
    - This is used to generate unique resource names
    - Make sure this aligns with your naming preferences
3. **Static Web App SKU**
    
    - Default: 'Standard'
    - Appropriate for hosting apps with API functions
    - 'Free' tier has limitations for API functions
4. **Review the storage account configuration**
    
    - Confirm that `allowBlobPublicAccess` is set to `true` (required for the 'downloads' container)
    - Verify that `allowSharedKeyAccess` is set to `true` (needed for connection string authentication)

Do you understand all these preparation steps? Would you like me to clarify anything before we move on to actually deploying the infrastructure?s
