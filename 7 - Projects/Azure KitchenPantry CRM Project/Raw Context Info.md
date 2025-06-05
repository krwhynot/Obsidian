<goal>

You’re a Senior Software Engineer with extensive experience designing large-scale web and mobile applications. Help me brainstorm the overall structure of my new project, thinking through:

- WHAT I'm building a CRM to replace an Excel system.

- WHO it’s for 4-8 sales team members.  

- WHY Current Excel system Pain points: -when enter bulk data they copy and paste removing any format -hard to use on the ipad which is the primary device when using spreadsheet -hard to make custom reports for principals/brands on status of the week -Hard to make additional row to add more data. 

- HOW I need to plan the development phases covering organization management, contact tracking, interaction logging, sales pipeline, and reporting - plus handle bulk import from existing Excel data 

</goal>

<format>

Return only this Markdown structure—no extra preamble or sign-off.

## MVP Flow

A clear, step-by-step description of the core minimum-viable process:

1. Step 1  

2. Step 2  

3. …

---


## Launch Features (MVP)

### Feature Name

2–3-sentence summary of what this feature does

* Core requirement 1  

* Core requirement 2  

* …

#### Tech Involved

* Tech or service 1  

* Tech or service 2  

#### Main Requirements

* Requirement 1  

* Requirement 2  

---

## Future Features (Post-MVP)

### Feature Name

* Core requirement 1  

* Core requirement 2  

* …

#### Tech Involved
  
* Tech or service 1  

* Tech or service 2  

#### Main Requirements

* Requirement 1  

* Requirement 2  

---

## System Diagram

A clean, color-coded SVG architecture diagram showing all MVP components and their relationships.
---


## Questions & Clarifications

* Question 1  

* Question 2  

* …

---

## Architecture Consideration Questions

* Consideration 1  

* Consideration 2  

* …

</format>

 <warnings-or-guidance>

- Focus on functional feature goals, not detailed UI/UX.  
- If anything is ambiguous, ask for clarification.  
- Recommend trade-offs & scaling considerations (infra, microservices, 3rd-party APIs, etc.).  
- Include hosting/CI-CD/monitoring thoughts where relevant.

</warnings-or-guidance>

<context>
This document provides a comprehensive overview of the KitchenPantry CRM (Customer Relationship Management) system, detailing its purpose, architecture, and the strategic patterns employed in its design. Our goal is to create a clear, accessible guide that helps stakeholders understand the system's core principles, components, and design philosophy.

## Product Context

### Product Overview
KitchenPantry is a specialized Customer Relationship Management system tailored specifically for the food service industry. It aims to streamline relationship management between sales teams, organizations, contacts, and distributors in the food service ecosystem.

### Business Requirements
1. **Relationship Tracking**
   - Comprehensive management of customer interactions
   - Detailed tracking of organizational and contact information
   - Opportunity pipeline management

2. **Sales Efficiency**
   - Centralized data repository
   - Simplified interaction logging
   - Priority-based organization management

3. **Decision Support**
   - Detailed reporting and analytics
   - Performance tracking for sales teams
   - Opportunity progression insights

### Key Stakeholders
- **Primary Users**
  - Sales Representatives
  - Account Managers
  - Sales Managers

- **Supporting Stakeholders**
  - IT Department

### Core Use Cases
1. **Organization Management**
   - Create and update organizational profiles
   - Track distributor relationships
   - Assign priority levels
   - Manage contact information

2. **Interaction Tracking**
   - Log customer interactions
   - Schedule follow-ups
   - Document communication details
   - Update opportunity status

3. **Opportunity Management**
   - Create new sales opportunities
   - Track opportunity progression
   - Analyze win/loss ratios
   - Generate performance reports

<audience-notes>

WHAT - The end goal is to create a streamlined, user-friendly system that helps the sales team maintain better relationships with customers, track opportunities more effectively, and close more sales through organized follow-up and relationship management.

- WHO it’s for 4-8 sales team members.  
  
- WHY Current Excel system Pain points: -when enter bulk data they copy and paste removing any format -hard to use on the ipad which is the primary device when using spreadsheet -hard to make custom reports for principals/brands on status of the week -Hard to make additional row to add more data. 
  
- HOW I need to plan the development phases covering organization management, contact tracking, interaction logging, sales pipeline, and reporting - plus handle bulk import from existing Excel data  

</audience-notes>

<mvp-flow>

Let me walk you through the user experience of the CRM system as if I were giving you a tour:

Dashboard (Home Page) When you first log in, you'll land on your personalized dashboard. Here you'll see:

- Your high-priority tasks for the week
- Recent interactions that need follow-up
- Upcoming meetings or scheduled interactions
- A quick view of your A-priority organizations
- Weekly goals and progress tracking

The dashboard has a clean navigation bar at the top with access to all main sections: Organizations, Contacts, Interactions, and Reports.

Organizations Page Think of this as your main hub for company management. When you click into Organizations, you'll see a data grid showing all organizations you're managing. You can:

- Sort by priority (A-D)
- Filter by segment (Fine Dining, Healthcare, etc.)
- Search by organization name
- View which distributors they're using

When you click on an organization, you'll see their detailed profile page showing:

- All basic information (address, phone, etc.)
- A list of all contacts within that organization
- Recent interactions history
- Current opportunities
- Notes and important updates

The "Add New Organization" button is prominently displayed for quick data entry.

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

Reports Page Here you can generate insights about your work:

- Weekly activity reports
- Pipeline status by organization
- Interaction frequency analysis
- Success rate tracking
- Custom date range reports

The page allows you to:

- Export reports to Excel
- Share reports with team members
- Set up automated report delivery
- Create custom report templates

Quick Add Menu From any page, you'll have access to a quick-add menu (+ button) to:

- Add new organization
- Add new contact
- Log new interaction
- Schedule follow-up
- Create new opportunity

Search Functionality The global search bar at the top allows you to quickly find:

- Organizations
- Contacts
- Previous interactions
- Notes
- Opportunities

Profile and Settings Your profile page lets you:

- Update your account information
- Set notification preferences
- Customize your dashboard layout
- Manage your task list
- Set personal goals and tracking

Think of this system as your digital sales assistant - everything is interconnected. When you update an interaction, it automatically appears on the organization's profile, the contact's history, and your reports. The system is designed to help you focus on building relationships while it handles the organization and tracking of all your customer data.
</mvp-flow>

<current-tech-choices>

Build on **NextCRM** (pdovhomilja) github project and modify or extend the codebase to meet the following needs:

1. Organization Management
The system will track food service businesses with detailed categorization including:
- Priority levels (A through D) to focus sales efforts effectively
- Specific market segments (Fine Dining, Fast Food, Healthcare, etc.)
- Distributor relationships (Sysco, USF, PFG, etc.)
- Geographic information for territory management
- Account manager assignments (primary and secondary)

2. Contact Relationship Tracking
The system will maintain detailed records of key decision-makers within each organization:
- Multiple contacts per organization with specific roles (Exec Chef, Buyer, Manager, etc.)
- Complete contact information including LinkedIn profiles
- Position-based categorization to understand decision-making hierarchy
- Direct connection to account managers for relationship maintenance

3. Interaction Documentation
The system will record and track all customer interactions:
- Meeting types (Email, Call, In Person, Demo/sampled, etc.)
- Date-based tracking with weekly priority updates
- Opportunity tracking tied to specific contacts and organizations
- Detailed notes for follow-up actions
- Principal involvement tracking

4. Sales Pipeline Management
The system will help track opportunities through various stages:
- Lead discovery
- Initial contact
- Sampling/Visits
- Follow-up
- Close or Loss (with reason tracking)
- Status tracking (Open, Closed, Lost, On Hold, etc.)

5. Product Line Management
The system will maintain updated information about:
- Principal/brands (Kaufholds, Frites Street, Better Balance, etc.)
- Specific products within each brand
- Product categories and variations
- Pricing and sampling information

6. Reporting Capabilities
The system will generate insights through:
- Weekly priority updates
- Account manager activity reports
- Pipeline status reports
- Interaction frequency analysis
- Success rate tracking by segment and distributor

7. Data Management
The system will provide:
- Easy data entry through web forms
- Bulk data import capability from Excel
- Dropdown list management for standardized categories
- Flexible note-taking capabilities
- Data export functionality for analysis
- Bulk data entry for Interactions & Opportunities entries

This CRM system is specifically designed  to:
- Track and prioritize customer relationships
- Manage distributor partnerships
- Document all customer interactions
- Monitor sales opportunities
- Maintain detailed product information
- Generate actionable reports

Hosting: Stay within a $50/month Azure hosting budget for 10 users.

<evaluation_criteria>
• Suitability of NextCRM architecture for extensions  
• Modularity and effort needed to implement each feature  
• Azure compatibility and AD B2C integration feasibility  
• Reporting flexibility (charts, Excel export, dashboard modules)  
• Estimated monthly Azure resource costs  
</evaluation_criteria>
  
</current-tech-choices>

</context>
