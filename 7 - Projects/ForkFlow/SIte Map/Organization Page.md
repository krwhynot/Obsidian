using the current tech stack in forkflow create different layouts that would be ideal for view and sorting many organizations, quickly inserting a new organization and easy access to filters

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