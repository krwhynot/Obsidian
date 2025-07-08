You are an expert CRM UI/UX designer with deep expertise in organization management interfaces and enterprise application design. Your task is to design and produce a **working HTML demo** of a comprehensive CRM Organization page with an "Add New Organization" feature that incorporates the most effective characteristics of top-rated CRM systems while maintaining visual consistency with the existing CRM Mission Control Dashboard color scheme

## DESIGN REQUIREMENTS

### Core Visual Principles
- **Clean & Minimalist**: Eliminate visual clutter while maintaining rich functionality
- **Professional & Trustworthy**: Use design elements that convey reliability and data security
- **Consistent & Organized**: Maintain logical information architecture with clear visual hierarchy
- **Touch-Optimized**: Follow WCAG 2.1 AA standards with 48px minimum touch targets

### Mission Control Dashboard Color Palette Consistency
Based on modern CRM dashboard design patterns, use this established color scheme:
- **Primary Blue**: #1C79D7 (Bright Navy Blue) - for primary actions, navigation, and trust-building elements
- **Light Blue**: #78BCF6 (Very Light Azure) - for secondary elements, highlights, and interactive states
- **Dark Blue**: #245C94 (Lapis Lazuli) - for headers, emphasis, and important data points
- **Neutral Blue**: #809AAF (Weldon Blue) - for supporting text and secondary information
- **Accent Green**: #BDCFA2 (Light Moss Green) - for positive actions, success states, and confirmations
- **Background**: #F1F1F1 (Light Grey) - for main background areas and content separation
- **Text**: #202020 (Dark Grey) - for primary text content and readability

### Typography & Hierarchy
- **Font**: Clean sans-serif (Inter, Roboto, or system fonts)
- **Sizes**: 32px (page titles), 24px (section headers), 18px (card titles), 16px (body), 14px (labels)
- **Weight**: 400 (body), 500 (emphasis), 600 (headings)
- **Line Height**: 1.5 for body text, 1.2 for headings

## ORGANIZATION PAGE DESIGN SPECIFICATIONS

### Layout Pattern: Sidebar + Master-Detail View
Design using the proven master-detail pattern with these components:

#### Left Panel - Organization List (35% width)
- **Searchable organization list** with real-time filtering
- **Card-based layout** with organization avatars and key metrics
- **Quick filter chips**: "All", "Active", "Prospects", "Customers"
- **Alphabetical navigation** (A-Z quick jump)
- **"Add New Organization"** floating action button with primary blue background

#### Right Panel - Organization Details (65% width)
- **Tabbed interface**: "Overview", "Contacts", "Activities", "Opportunities"
- **Organization header** with company logo, name, and status
- **Key metrics cards**: Revenue, Deal Count, Last Activity
- **Activity timeline** with interaction history

### Organization List Components Implementation
- **Search Bar**: Global search with autocomplete suggestions
- **Filter Controls**: Industry, Size, Location, Status dropdown filters
- **Organization Cards**: Include company logo, name, industry, revenue, contact count
- **List Actions**: Bulk selection, export, delete options
- **Pagination**: Show 50 organizations per page with "Load More" option
### Organization Detail Components
- **Header Section**: Company name, logo, status badge, primary contact
- **Quick Actions**: Edit, Delete, Add Contact, Create Deal buttons
- **Information Grid**: Address, phone, website, industry, employee count
- **Recent Activity**: Timeline of calls, emails, meetings, notes
- **Contact List**: Associated contacts with roles and last contact date
- **Opportunity Pipeline**: Visual pipeline of deals in progress

## ADD NEW ORGANIZATION FORM SPECIFICATIONS

### Form Design Pattern: Progressive Modal
Create a multi-step modal form following modern CRM best practices:

#### Step 1: Basic Information
- **Company Name** (required, text input, auto-suggestion from database)
- **Industry** (dropdown with common industries)
- **Company Size** (dropdown: 1-10, 11-50, 51-200, 201-1000)
- **Website** (URL input with validation)

#### Step 2: Contact Details
- **Primary Contact Name** (text input)
- **Email** (email input with validation)
- **Phone** (phone input with formatting)
- **Address** (address fields with map integration)

#### Step 3: Business Details
- **Annual Revenue** (currency input with formatting)
- **Description** (textarea for company notes)
- **Tags** (multi-select for categorization)
- **Lead Source** (dropdown: Website, Referral, Cold Call, Trade Show, etc.)

### Modern Form Design Best Practices Implementation
- **Single Column Layout**: Vertical form structure for optimal completion
- **Field Grouping**: Logical sections with clear visual separation
- **Smart Defaults**: Pre-populate fields when possible
- **Real-time Validation**: Inline feedback with helpful error messages
- **Progress Indicator**: Step counter and progress bar
- **Touch-Friendly Inputs**: 48px height inputs with 16px font

## HTML DEMO DELIVERABLE

Produce a **single self-contained HTML file** (with embedded CSS and minimal vanilla JavaScript) that demonstrates:

### 1. **Organization Management Interface**
- Master-detail layout with organization list and detail pane
- Search functionality with real-time filtering
- Organization cards with avatars, names, industries, and key metrics
- Tabbed detail view with organization information and activity timeline

### 2. **Add New Organization Modal**
- Progressive disclosure form with 3 steps
- Real-time form validation with helpful error messages
- Smart duplicate detection warnings
- Touch-optimized inputs with 48px minimum height

### 3. **Interactive Features**
- **Functional search bar** with live filtering of organization list
- **Working tab navigation** in organization detail view
- **Modal form with step-by-step progression**
- **Hover states and visual feedback** for all interactive elements

### 4. **Sample Data Integration**
- **10-15 realistic organization records** with varied information
- **Organization avatars** (using placeholder services or company initials)
- **Recent activity entries** with different interaction types
- **Industry associations and revenue ranges**

### 5. **Responsive Design**
- **Mobile-first responsive layout** with breakpoints
- **Touch-friendly interactions** on mobile devices
- **Collapsible navigation** for smaller screens
- **Optimized typography and spacing** across device sizes

## IMPLEMENTATION NOTES

### Technical Requirements
- **HTML5 Semantic Structure**: Use proper heading hierarchy, semantic elements, and ARIA labels
- **Embedded CSS**: Include all styles within `<style>` tags in the HTML head
- **Vanilla JavaScript**: Minimal JavaScript for interactions (search, tabs, modal, form validation)
- **No External Dependencies**: Self-contained file that works offline
- **Cross-Browser Compatibility**: Works in all modern browsers

### Interactive Functionality
- **Search Implementation**: Filter organizations by name, industry, location, or status
- **Tab Switching**: Smooth transitions between organization detail tabs
- **Modal Management**: Open/close add organization form with backdrop interaction
- **Form Validation**: Real-time validation with visual feedback
- **Organization Selection**: Click organization cards to view details in right pane

### Visual Design Elements
- **Modern Card Design**: Clean organization cards with subtle shadows and hover effects
- **Professional Icons**: Use Unicode symbols or CSS-created icons for actions
- **Consistent Color Scheme**: Implement Mission Control dashboard colors throughout
- **Typography Hierarchy**: Clear visual hierarchy with proper font sizing
- **Loading States**: Visual feedback for form submissions and data updates

## MODERN CRM FEATURES INTEGRATION

### AI-Powered Enhancements
- **Smart Form Filling**: Auto-complete organization data from company name
- **Duplicate Prevention**: AI-powered duplicate detection and merging
- **Data Enrichment**: Automatic population of company details from external sources
- **Activity Suggestions**: AI recommendations for next actions

### Advanced Functionality
- **Bulk Operations**: Multi-select with batch edit capabilities
- **Advanced Filters**: Save custom filter views for different user roles
- **Export Options**: CSV, Excel, PDF export with custom field selection
- **Integration Hooks**: Connect with email, calendar, and communication tools

## SUCCESS CRITERIA

### Functional Requirements
- **Complete Organization Management**: View, search, and add organizations functionality
- **Responsive Layout**: Works seamlessly across desktop, tablet, and mobile
- **Form Validation**: Prevents invalid data entry with helpful error messages
- **Professional Appearance**: Matches quality of commercial CRM interfaces

### User Experience Goals
- **Intuitive Navigation**: Users can operate without instructions
- **Fast Performance**: Smooth interactions and instant visual feedback
- **Professional Feel**: Interface conveys trust and reliability
- **Touch-Friendly**: All elements easily accessible on touch devices

### Code Quality Standards
- **Clean HTML Structure**: Well-organized, semantic markup
- **Efficient CSS**: Organized stylesheets with consistent naming conventions
- **Minimal JavaScript**: Only essential functionality, well-commented
- **Developer-Ready**: Code structure suitable for further development

## DELIVERABLE OUTPUT

Return the complete HTML demo file followed by a brief implementation guide summarizing:
- **Key Design Choices**: Color scheme implementation and layout decisions
- **Interactive Features**: How search, tabs, and form validation work
- **Responsive Behavior**: Breakpoint strategy and mobile optimizations
- **Extension Options**: How to add features or integrate with backend systems

The HTML demo should feel like a professional CRM organization management interface that stakeholders can immediately interact with to evaluate the proposed design and functionality, incorporating the latest 2025 CRM best practices for data management, user experience, and enterprise-grade interface design.
