Contacts Page This page helps you manage all your individual relationships. You'll see:

- A searchable list of all contacts
- Their organizations and positions
- Contact methods (phone, email, LinkedIn)
- Last interaction date
- Priority level

Clicking a contact opens their detailed profile showing:

- Full contact information
- Organization affiliation
- Interaction history
- Notes about preferences or important details
- Direct links to create new interactions




#### **Contact**

- `id` (Primary Key)    
- `organizationId` (Foreign Key → Organization)    
- `firstName`    
- `lastName`    
- `email`    
- `phone`    
- `roleId` (Foreign Key → Setting)    
- `influenceLevelId` (Foreign Key → Setting)    
- `decisionRoleId` (Foreign Key → Setting)    
- `linkedInUrl`    
- `isPrimary` (boolean)    
- `notes` (text)    
- `createdAt` (datetime)    
- `updatedAt` (datetime)    
- `createdBy`    