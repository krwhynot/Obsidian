Below is a full walkthrough of the **Power Automate flow** to automate your "CC Creds" checking and requesting process, including exact steps, connector cards, and the use of dynamic content. This flow uses GPT to dynamically extract event details and process email requests.

---

### **Power Automate Flow: Automating CC Creds Requests**

#### **1. Trigger: Recurrence**

- **Card Title:** Recurrence
- **Frequency:** Daily
- **Start Time:** Specify a time for the flow to run (e.g., 6:00 AM).
- **Interval:** 1 (Daily).

---

#### **2. Action: Get Calendar Events**

- **Card Title:** Get events (V4)
- **Connector:** Office 365 Outlook
- **Fields:**
    - **Calendar:** Select your calendar.
    - **Start Time:** Use the following expression to get the start of the current day:
        
        ```
        utcNow()
        ```
        
    - **End Time:** Use the following expression to get the end of the current day:
        
        ```
        addDays(utcNow(), 1)
        ```
        

---

#### **3. Action: Apply to Each**

- **Card Title:** Apply to Each
- **Fields:**
    - **Input:** Dynamic content: `value` from "Get events (V4)."
    - Inside this loop, you will add the following actions.

---

#### **4. Action: HTML to Text**

- **Card Title:** Html to text
- **Connector:** Office 365 Outlook
- **Fields:**
    - **Input:** Dynamic content: `Body` from "Get events (V4)."

---

#### **5. Action: ChatGPT (GPT Action)**

- **Card Title:** ChatGPT
- **Connector:** Azure OpenAI (or other GPT service integrated with Power Automate).
- **Fields:**
    - **Model:** Select your GPT model (e.g., GPT-3.5-turbo).
    - **Prompt:**
        
        ```
        Extract the following details from the provided text:
        - Account Name
        - Account Number
        - Go Live Date/Time
        - Firewall Password
        - Installer Name
        - Installation Address
        
        Input Text:
        [{{Output from Html to text}}]
        ```
        
    - **Temperature:** 0 (to ensure deterministic responses).

---

#### **6. Action: Parse JSON**

- **Card Title:** Parse JSON
- **Connector:** Data Operations
- **Fields:**
    - **Content:** Dynamic content: `Response` from ChatGPT action.
    - **Schema:**
        
        ```json
        {
          "type": "object",
          "properties": {
            "Account Name": { "type": "string" },
            "Account Number": { "type": "string" },
            "Go Live Date/Time": { "type": "string" },
            "Firewall Password": { "type": "string" },
            "Installer Name": { "type": "string" },
            "Installation Address": { "type": "string" }
          }
        }
        ```
        

---

#### **7. Action: Search for Emails**

- **Card Title:** Search for emails (V2)
- **Connector:** Office 365 Outlook
- **Fields:**
    - **Folder:** "Sent Items"
    - **Search Query:**
        
        ```
        subject:'Cred Request' AND body:'{{Account Name}}' AND body:'{{Account Number}}'
        ```
        

---

#### **8. Action: Condition**

- **Card Title:** Condition
- **Fields:**
    - **If "Search for emails (V2)" > `Has Attachments`:**
        - **Yes:** Do nothing (skip to next event).
        - **No:** Proceed to send email.

---

#### **9. Action: Send an Email**

- **Card Title:** Send an email (V2)
- **Connector:** Office 365 Outlook
- **Fields:**
    - **To:** `kyle.ramsy@hungerrush.com`
    - **Cc:** `paymentservices@hungerrush.com, installationmanagement@hungerrush.com`
    - **Subject:**
        
        ```
        Cred Request - {{Account Name}} - {{Account Number}}
        ```
        
    - **Body:**
        
        ```
        Can I get the CC Creds for {{Account Name – Account Number}}?
        ```
        

---

### **Dynamic Content Mapping**

|**Dynamic Content Source**|**Field Used**|**Purpose**|
|---|---|---|
|`value` from "Get events"|Input for "Apply to Each"|Iterates through each calendar event.|
|`Body` from "Get events"|Input for "Html to Text"|Converts HTML to plain text for GPT parsing.|
|`Response` from ChatGPT|Input for "Parse JSON"|Extracts event details.|
|Parsed JSON `Account Name`|Dynamic content in email Subject/Body|Specifies account details for "Cred Request".|
|Parsed JSON `Account Number`|Dynamic content in email Subject/Body|Specifies account details for "Cred Request".|

---

### **Additional Notes**

- **Error Handling:** Add a "Run After" condition for failures on actions like "Search for Emails" or "Send an Email" to log errors.
- **Performance:** Ensure the GPT action is scoped properly to avoid hitting API limits if running frequently.

This flow efficiently handles all key requirements and integrates GPT for dynamic, flexible parsing of the event content. Let me know if you need additional details or help setting this up!