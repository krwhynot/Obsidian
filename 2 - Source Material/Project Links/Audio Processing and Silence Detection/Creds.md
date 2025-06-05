# Credentials Reference

## Telephony API

Tags: [[API]]

### Base URL
- API Base URL: https://telephony.ordrai.com
- API URL:   https://telephony.ordrai.com/calls?page=1&limit=30&callTimeFrom=2024-08-1300:00:00&callTimeTo=2024-08-15 23:59:00&restId=14808957492&order=desc&sort=storeDate

### Endpoint
- Calls Endpoint: `/calls`

### Authentication
- Type: Bearer Token
- Location: Stored in LastPass under 'Telephony API Bearer Token'
- Usage: Include in the Authorization header of each request
- Format: `Authorization: Bearer <token>`


### Parameters
- `page`: Page number for pagination
- `callTimeFrom`: Start date and time for call records (format: YYYY-MM-DD HH:MM:SS)
- `callTimeTo`: End date and time for call records (format: YYYY-MM-DD HH:MM:SS)
- `order`: Sorting order (e.g., 'desc' for descending)
- `sort`: Field to sort by (e.g., 'storeDate')
- `chainId`: Identifier for the chain (e.g., 52)
- `limit`: Number of records per page (e.g., 30)

### Example Usage
```python
import requests
from datetime import datetime, timedelta

# Retrieve API key securely (do not hardcode)
api_key = get_api_key_from_secure_storage()

# Base URL
base_url = "https://telephony.ordrai.com"

# Endpoint
endpoint = "/calls"

# Parameters
params = {
    "page": 1,
    "callTimeFrom": (datetime.now() - timedelta(days=2)).strftime("%Y-%m-%d %H:%M:%S"),
    "callTimeTo": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
    "order": "desc",
    "sort": "storeDate",
    "chainId": 52,
    "limit": 30
}

# Headers
headers = {
    "Authorization": f"Bearer {api_key}"  # Adjust based on actual auth method
}

# Make the request
response = requests.get(f"{base_url}{endpoint}", params=params, headers=headers)

# Process the response
if response.status_code == 200:
    data = response.json()
    # Process data...
else:
    print(f"Error: {response.status_code}")
    print(response.text)
```

### Security Notes
- Never hardcode the API key or any credentials in your scripts.
- Use environment variables or a secure secret management system to store and retrieve the API key.
- Ensure all requests to this API are made over HTTPS.
- Regularly rotate the API key according to security best practices.
- Limit access to this API key to only those who absolutely need it.

### Rate Limiting
- [Include any known rate limiting information here]

### Support Contact
- For issues with API access or permissions, contact: [support contact information]

Last Updated: [Current Date]

Remember to update this reference if any details of the API change.


## OpenAI API Key
- openai.api_key = "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"

## Cloud Storage
- Service: AWS S3
- Access Key ID: Stored in AWS Secrets Manager under `/audio-project/s3-access-key`
- Secret Access Key: Stored in AWS Secrets Manager under `/audio-project/s3-secret-key`
- Bucket Name: audio-processing-project-data

## Test Accounts
- Test User: test_user@example.com
- Test Password: Stored in LastPass under "Audio Project Test Account"

## How to Access Credentials
1. For LastPass entries: Contact the project lead for shared folder access
2. For environment variables: Refer to the `.env.example` file in the project root
3. For AWS Secrets Manager: Use AWS CLI or SDK with appropriate IAM permissions

## Security Reminders
- Never share credentials via email or instant messaging
- Rotate API keys and passwords every 90 days
- Report any suspected security breaches immediately to the security team

Last Updated: 2024-08-31