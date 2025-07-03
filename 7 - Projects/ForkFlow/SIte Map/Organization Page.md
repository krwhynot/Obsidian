using the current tech stack in forkflow create different layouts that would be ideal for view and sorting many organizations, quickly inserting a new organization and easy access to filters
-
**Organizations Page** Think of this as your main hub for company management. When you click into Organizations, you'll see a data grid showing all organizations you're managing. You can:

- Sort by priority (A-D)
- Filter by segment (Fine Dining, Healthcare, etc.)
- Search by organization name
- View which distributors they're using

When you click on an organization, you'll see their detailed profile page showing:

**Business Info Section:**
ORG DATA FIELDS
(All dropdowns are dynamic and new options can be added from the settings page)
- Organization Name
- PRIORITY-FOCUS/ (Dropdown)/ (A-D) A-highest 
- SEGMENT/ (Dropdown)/ Allowed to choose many
- DISTRIBUTOR/ (Dropdown)/ Allowed to choose many
- PRIMARY ACCT. MANAGER / (Dropdown)/ one from Employee List
- SECONDARY ACCT. MANAGER / (Dropdown)/ one from Employee List(cant be same as Primary)
- Principal Checkbox
- Website
- Business Phone # 
- Address
	- Street
	- City
	- State
	- Zip Code
- Notes /text field

 **Contact Section:**
- A list of all contacts within that organization(data will come from Contacts page)

**Interaction Section:**
- Recent interactions history(data from Interaction page)

**Opportunity Section:**
- Current opportunities status (data from Opportunities Page)


The "Add New Organization" button is prominently displayed for quick data entry.




#### **Organization**

- `id` (Primary Key)    
- `name`    
- `priorityId` (Foreign Key → Setting)    
- `segmentId` (Foreign Key → Setting)    
- `distributorId` (Foreign Key → Setting)    
- `accountManager`    
- `address`    
- `city`    
- `state`    
- `zipCode`    
- `phone`    
- `website`    
- `notes` (text)    
- `createdAt` (datetime)    
- `updatedAt` (datetime)    
- `createdBy`


Organization Creation Implementation Added

  1. Multi-Step Form Architecture

  - CompanyCreate component with TypeScript interfaces
  - 3-step progressive form (Basic Info → Contact Details → Business Details)
  - Form state management and validation patterns

  2. Advanced Validation System

  - Real-time validation with immediate feedback
  - Custom business-specific validation rules
  - Duplicate organization detection
  - Email confirmation matching

  3. Mobile-First Creation Experience

  - Floating Action Button (FAB) for mobile quick-add
  - Full-screen modal dialogs for mobile
  - Touch-optimized inputs (44px+ targets)
  - Voice input support for description fields

  4. Auto-Save & Form Recovery

  - 30-second auto-save to localStorage
  - Form recovery after network interruptions
  - Visual save status indicators
  - Draft restoration functionality

  5. Comprehensive Testing Strategies

  - Unit tests for form validation logic
  - Mobile-specific FAB and dialog tests
  - Auto-save and form recovery tests
  - Accessibility compliance testing
  - E2E user journey validation