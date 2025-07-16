# Installation Folder Creation Flow - Enhanced Parsing

## Flow Trigger
- When a new appointment is added to calendar
- Filter condition: Subject contains "INSTALLATION DATE SUBMITTAL FORM"

## Variables
Initialize variables:
- accountName (String)
- accountNumber (String)
- folderPath (String) = "C:\Users\kyle.ramsy\OneDrive - HungerRush\Documents - KylesWorkspace\Installations\Installations\"
- appointmentText (String)

## Flow Steps

### 1. Get Appointment Details
```
Get Calendar Event (V3)
    Calendar Id: Primary
    Event Id: triggerBody()?['id']
```

### 2. Extract and Clean Text
```
Set Variable - appointmentText
Value: replace(replace(body('Get_Calendar_Event')?['body'], '\r\n', ' '), '\t', ' ')
```

### 3. Multiple Pattern Matching
```
Compose - Account Patterns
Value: {
    "patterns": [
        {
            "namePattern": "Account Name:\\s*([^·\n]*)",
            "numberPattern": "Account Number:\\s*(\\d+)"
        },
        {
            "namePattern": "Account Name:\\s*([^,\n]*)",
            "numberPattern": "Account #\\s*(\\d+)"
        },
        {
            "namePattern": "Client Name:\\s*([^·\n]*)",
            "numberPattern": "Account Number:\\s*(\\d+)"
        }
    ]
}

Apply to Each - Pattern
    Input: outputs('Compose - Account Patterns')?['patterns']
    Actions:
        Condition - Check Pattern Match
            Condition: 
                empty(variables('accountName')) || empty(variables('accountNumber'))
            If True:
                Run JavaScript code:
                    // Extract using current pattern
                    const text = workflowContext.appointmentText;
                    const nameMatch = text.match(new RegExp(currentPattern.namePattern, 'i'));
                    const numberMatch = text.match(new RegExp(currentPattern.numberPattern, 'i'));
                    
                    if (nameMatch && numberMatch) {
                        return {
                            name: nameMatch[1].trim(),
                            number: numberMatch[1].trim()
                        };
                    }
                    return null;

                Condition - Check Results
                    If match found:
                        Set Variable - accountName
                        Set Variable - accountNumber
```

### 4. Validation
```
Condition - Check Required Info
    Condition: 
        and(
            not(empty(variables('accountName'))),
            not(empty(variables('accountNumber'))),
            length(variables('accountNumber')) > 0,
            length(variables('accountName')) > 0
        )
    If True:
        Create Folder
    If False:
        Create Approval Task
            Assign to: {your email}
            Title: "Manual Review Required - Installation Folder Creation"
            Details: "Could not automatically extract account information. Please review and provide:"
            Options:
                - Account Name
                - Account Number
```

### 5. Create Folder
```
Create Folder
    Folder Path: concat(variables('folderPath'), variables('accountName'), ' - ', variables('accountNumber'))
```

### 6. Logging and Monitoring
```
Create Item in SharePoint List - Parsing Log
    Title: formatDateTime(utcNow(), 'yyyy-MM-dd HH:mm')
    Fields:
        AppointmentID: {appointment id}
        ParsedAccountName: {accountName}
        ParsedAccountNumber: {accountNumber}
        MatchedPattern: {pattern index}
        RequiredManualReview: {yes/no}
        Status: {success/failure}
        ErrorDetails: {if any}
```

## Error Handling
Add parallel branch for specific error scenarios:
```
Switch
    Condition: @result('Create_Folder')?['error']?['code']
    Cases:
        "FolderAlreadyExists":
            Append timestamp to folder name
        "InvalidCharacters":
            Clean invalid characters from name
        "PermissionDenied":
            Notify admin and retry with elevated permissions
        Default:
            Log error and notify for manual intervention
```

## Monitoring Dashboard Elements
1. Pattern Match Success Rate
   - Which patterns are matching most often
   - Which appointments required manual review
2. Common Failure Points
   - Parse failures
   - Folder creation issues
3. Processing Time Metrics
4. Manual Intervention Frequency

## Flow Configuration JSON
```json
{
    "definition": {
        "$schema": "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#",
        "triggers": {
            "When_a_new_event_is_created": {
                "type": "OpenApiConnection",
                "inputs": {
                    "host": {
                        "connectionName": "office365",
                        "operationId": "OnNewEvent",
                        "apiId": "/providers/Microsoft.PowerApps/apis/shared_office365"
                    },
                    "parameters": {
                        "folderid": "Calendar",
                        "importance": "Any",
                        "includeAttachments": false,
                        "subjectFilter": "INSTALLATION DATE SUBMITTAL FORM"
                    }
                }
            }
        },
        "actions": {
            "Initialize_Variables": {
                "type": "InitializeVariable",
                "inputs": {
                    "variables": [
                        {
                            "name": "accountName",
                            "type": "string"
                        },
                        {
                            "name": "accountNumber",
                            "type": "string"
                        },
                        {
                            "name": "appointmentText",
                            "type": "string"
                        }
                    ]
                }
            }
            // ... (remaining implementation details)
        }
    }
}
```