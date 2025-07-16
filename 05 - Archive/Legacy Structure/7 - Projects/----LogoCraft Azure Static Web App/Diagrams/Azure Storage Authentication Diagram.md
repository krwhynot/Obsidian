```
INDUSTRY STANDARD APPROACH (RECOMMENDED)
----------------------------------------
┌─────────────────┐     1. Request SAS      ┌───────────────┐
│                 │ ──────────────────────> │               │
│   React App     │                         │  GetSasToken  │
│                 │ <────────────────────── │   Function    │
└─────────────────┘     2. Return SAS URL   └───────────────┘
        │                                           │
        │                                           │ 3. Use Connection String
        │                                           ▼
        │                               ┌───────────────────────┐
        │                               │                       │
        │ 4. PUT request with SAS token │   BlobServiceClient   │
        └──────────────────────────────>│   + ContainerClient   │
                                        │                       │
                                        └───────────────────────┘

KEY INDUSTRY STANDARDS:
- Uses AzureWebJobsStorage connection string (Microsoft recommended)
- Leverages higher-level client libraries for abstraction
- Sets appropriate token expiration (typically 1 hour or less)
- Uses granular permissions rather than full access
```