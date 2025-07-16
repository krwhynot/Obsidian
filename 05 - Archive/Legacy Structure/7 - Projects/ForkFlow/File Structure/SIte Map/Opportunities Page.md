
- PRIORITY-FOCUS/ Priority/ same as Organization Priority Letter from the Organization Page
- Organization/ (Dropdown)/ full list comes from the Organization Page
- OPPORTUNITY NAME
- Start Date
- STATUS  (Dropdown) List comes from Settings Page
- STAGE  (Dropdown) List comes from Settings Page
- EXP. SOLD
- PROBABILITY
- PRINCIPAL (Dropdown) List comes from Organization Page with organization that have principal checkbox checked 
- PRODUCT (Dropdown)List comes from Product Page
- CASES  Per Week
- VOLUME
- DEAL OWNER  (Dropdown) List of Account Manager
- Interactions history 
- Notes



#### **Opportunity**

- `id` (Primary Key)    
- `organizationId` (Foreign Key → Organization)    
- `contactId` (Foreign Key → Contact)    
- `productId` (Foreign Key → Product)    
- `stageId` (Foreign Key → Setting)    
- `status`    
- `probability` (int)    
- `estimatedValue` (decimal)    
- `expectedCloseDate` (datetime)    
- `notes` (text)    
- `createdAt` (datetime)    
- `updatedAt` (datetime)    
- `createdBy`    