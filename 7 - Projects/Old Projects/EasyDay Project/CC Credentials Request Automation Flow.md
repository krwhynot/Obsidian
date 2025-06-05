
Let me break down the flow with specific Power Automate action cards and their detailed configurations:

Here's the detailed breakdown of each action card:
# Streamlined Calendar Event Processing Flow

## 1. Trigger
- **When a new event is created (V3)**
  - Calendar Id: Primary Calendar
  - Advanced Options:
    - Subject Filter: contains 'INSTALLATION DATE SUBMITTAL FORM'

## 2. Initialize Variables
- **Initialize ProcessingLog (Object)**
  ```
  {
    "startTime": utcNow(),
    "accountNumber": "",
    "accountName": "",
    "status": "started",
    "errors": []
  }
  ```

## 3. Process Event
1. **Convert HTML Body to Text**
   - Input: triggerBody()?['body']
   - Set variable: cleanedText

2. **Extract Account Information**
   ```
   - Extract Account Number:
     Pattern: 6 digits starting with 0
     Store in: varAccountNumber

   - Extract Account Name:
     Look for pattern after "Account Name:" or before account number
     Store in: varAccountName
   ```

3. **Validation**
   - **Condition**: Check if email already sent
     ```
     Get emails (V3):
       Folder: Sent Items
       Filter: Subject contains 
         "Cred Request - @{variables('varAccountName')} - @{variables('varAccountNumber')}"
       Top: 1
     ```

4. **Send Email (If no previous email found)**
   ```
   To: kyle.ramsy@hungerrush.com
   CC: paymentservices@hungerrush.com; InstallationManagement@hungerrush.com
   Subject: Cred Request - @{variables('varAccountName')} - @{variables('varAccountNumber')}
   Body: Can I get the CC Creds for @{variables('varAccountName')} – @{variables('varAccountNumber')}
   Importance: Normal
   ```

## 4. Simple Error Handling
- **Configure run after** settings for each action:
  ```
  If failed:
    Send notification email to supervisor
    Include:
      - Event subject
      - Error message
      - Time of failure
  ```

## 5. Update Processing Log
- **Final Action**:
  ```
  Add row to Excel/SharePoint log:
    - Date/Time
    - Account Number
    - Account Name
    - Status (Success/Failed)
    - Error (if any)
  ```