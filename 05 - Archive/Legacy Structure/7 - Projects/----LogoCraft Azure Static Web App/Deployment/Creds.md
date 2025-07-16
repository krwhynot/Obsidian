	GitHub Actions Deployment:
This will be the `clientSecret` in your AZURE_CREDENTIALS

| Value                                    | Secret ID                            |
| ---------------------------------------- | ------------------------------------ |
| .jX8Q~d3vEroGWZcMIzYZ.W4.VVSBrMwQAKsPbY2 | 21151edb-db98-4e17-8949-527cbcd99949 |

------
**## App registration**

![[Pasted image 20250518173024.png]]

| App(client) ID:  | 38256f72-71ef-4be9-bc15-2cec98f87c50 |     |
| ---------------- | ------------------------------------ | --- |
| Tenant ID:       | 1018280e-f485-43e4-911a-b1140fcd1f1f |     |
| Subscription ID: | df8fefaa-16a0-47da-ace7-6eab8b1919cf |     |
#### GITHUB Secrets JSON - "AZURE_CREDENTIALS"
```json
{
  "clientId": "38256f72-71ef-4be9-bc15-2cec98f87c50",
  "clientSecret": ".jX8Q~d3vEroGWZcMIzYZ.W4.VVSBrMwQAKsPbY2",
  "subscriptionId": "df8fefaa-16a0-47da-ace7-6eab8b1919cf",
  "tenantId": "1018280e-f485-43e4-911a-b1140fcd1f1f"
}
```


#### Static Web App- "AZURE_STATIC_WEB_APPS_API_TOKEN" 

| Deployment Token: | 2958ef80c5748a9cb6783d1c0eed45f4f203a61e2e89d68b9e23eb9c2987e59106-71d3b8d2-0d3c-4300-8e1c-e3d8c14064230103024060824610 |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------- |
|                   |                                                                                                                         |


# GitHub Secrets Needed for Your Static Web App

|Secret Name|Description|Where to Find|
|---|---|---|
|`AZURE_STATIC_WEB_APPS_API_TOKEN`|Deployment token|Azure Portal: Static Web App > Deployment Tokens > Copy Token|
|`AZURE_CLIENT_ID`|App registration ID|Azure Portal: Microsoft Entra ID > App Registrations > Select App > Application (client) ID|
|`AZURE_TENANT_ID`|Your Azure tenant ID|Azure Portal: Microsoft Entra ID > Properties > Tenant ID|
|`AZURE_SUBSCRIPTION_ID`|Your subscription ID|Azure Portal: Subscriptions > Select Subscription > Subscription ID|

Add these in GitHub:

1. Navigate to your repository
2. Go to Settings > Secrets and variables > Actions
3. Click "New repository secret" for each item
4. Enter the secret name and value

For OIDC-based authentication, you need the first three. For token-based deployment (simpler approach), you only need the first one.



AZURE_STORAGE_CONNECTION_STRING
DefaultEndpointsProtocol=https;AccountName=logocraftstxgal4dwldxvz6;AccountKey=ZIU7GKsCjnuKaML8G3qCZLh4i2sfUb5hmzDear0q/gpSpkis/+y5BR6ly9PIRGkC38gFKMLk1wSw+AStNXIrgg==;EndpointSuffix=core.windows.net