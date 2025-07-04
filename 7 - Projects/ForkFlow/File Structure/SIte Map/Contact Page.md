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
- Direct link to create new interactions

**Contacts Info:**
- Priority/ same as Organization Priority Letter from the Organization Page
- First and Last Name
- Organization/ (Dropdown)/ full list comes from the Organization Page
- Position / (Dropdown)/ List comes from Settings Page
- Email
- Phone # 
- ACCT. MANAGER / (Dropdown)/ one from Employee List
- Linkedin
- Street 
- City 
- State
- Zip
- Notes / Text Field



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