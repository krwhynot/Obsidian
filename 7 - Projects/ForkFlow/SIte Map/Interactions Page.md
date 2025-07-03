Interactions Page This is where you'll spend time after every customer touchpoint. The page features:

- A form to add new interactions (calls, emails, meetings)
- Calendar view of past and scheduled interactions
- Filters to view interactions by organization or contact
- Quick templates for common interaction types

When adding a new interaction, you'll:

1. Select the interaction type
2. Choose the organization and contact
3. Add notes about the conversation
4. Set any follow-up tasks
5. Update the opportunity status if needed

 
PRIORITY (Formula)
DATE
INTERACTION  (Dropdown)
Organizations 
ACCT.    MANAGER(Dropdown)
OPPORTUNITY NAME/ Comes from Opportunity Page
CONTACT  (Dropdown)
PRINCIPAL
NOTES

Interaction can

#### **Interaction**

- `id` (Primary Key)    
- `organizationId` (Foreign Key → Organization)    
- `contactId` (Foreign Key → Contact)    
- `opportunityId` (Foreign Key → Opportunity)    
- `typeId` (Foreign Key → Setting)    
- `subject`    
- `notes` (text)    
- `scheduledDate` (datetime)    
- `completedDate` (datetime)    
- `isCompleted` (boolean)    
- `createdAt` (datetime)    
- `updatedAt` (datetime)    
- `createdBy`    
