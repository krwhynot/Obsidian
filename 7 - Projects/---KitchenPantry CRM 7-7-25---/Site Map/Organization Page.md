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


```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRM Organizations - ForkFlow</title>
    <style>
        /* CSS Variables - Mission Control Dashboard Color Palette */
        :root {
            --primary-blue: #1C79D7;
            --light-blue: #78BCF6;
            --dark-blue: #245C94;
            --neutral-blue: #809AAF;
            --accent-green: #BDCFA2;
            --background: #F1F1F1;
            --text-dark: #202020;
            --text-secondary: #666666;
            --white: #FFFFFF;
            --border-light: #E0E0E0;
            --shadow-sm: 0 2px 4px rgba(0, 0, 0, 0.05);
            --shadow-md: 0 4px 8px rgba(0, 0, 0, 0.1);
            --shadow-lg: 0 8px 16px rgba(0, 0, 0, 0.15);
            
            /* Touch targets */
            --touch-target: 48px;
            --spacing-xs: 4px;
            --spacing-sm: 8px;
            --spacing-md: 16px;
            --spacing-lg: 24px;
            --spacing-xl: 32px;
            
            /* Typography */
            --font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
        }
        
        /* Reset & Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: var(--font-family);
            font-size: 16px;
            line-height: 1.5;
            color: var(--text-dark);
            background-color: var(--background);
        }
        
        /* Layout Container */
        .app-container {
            display: flex;
            height: 100vh;
            overflow: hidden;
        }
        
        /* Header */
        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 64px;
            background-color: var(--dark-blue);
            color: var(--white);
            display: flex;
            align-items: center;
            padding: 0 var(--spacing-lg);
            z-index: 100;
            box-shadow: var(--shadow-md);
        }
        
        .header-title {
            font-size: 24px;
            font-weight: 600;
        }
        
        .header-nav {
            margin-left: auto;
            display: flex;
            gap: var(--spacing-lg);
        }
        
        .nav-link {
            color: var(--white);
            text-decoration: none;
            padding: var(--spacing-sm) var(--spacing-md);
            border-radius: 4px;
            transition: background-color 0.2s ease;
        }
        
        .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }
        
        .nav-link.active {
            background-color: var(--primary-blue);
        }
        
        /* Main Content Area */
        .main-content {
            display: flex;
            width: 100%;
            margin-top: 64px;
            height: calc(100vh - 64px);
        }
        
        /* Organization List Panel */
        .org-list-panel {
            width: 35%;
            background-color: var(--white);
            border-right: 1px solid var(--border-light);
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }
        
        /* Search & Filters */
        .search-section {
            padding: var(--spacing-lg);
            border-bottom: 1px solid var(--border-light);
        }
        
        .search-input {
            width: 100%;
            height: var(--touch-target);
            padding: 0 var(--spacing-md);
            border: 1px solid var(--border-light);
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.2s ease;
        }
        
        .search-input:focus {
            outline: none;
            border-color: var(--primary-blue);
        }
        
        .filter-chips {
            display: flex;
            gap: var(--spacing-sm);
            margin-top: var(--spacing-md);
            flex-wrap: wrap;
        }
        
        .filter-chip {
            padding: var(--spacing-xs) var(--spacing-md);
            background-color: var(--background);
            border: 1px solid var(--border-light);
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.2s ease;
            font-size: 14px;
        }
        
        .filter-chip:hover {
            background-color: var(--light-blue);
            border-color: var(--light-blue);
        }
        
        .filter-chip.active {
            background-color: var(--primary-blue);
            color: var(--white);
            border-color: var(--primary-blue);
        }
        
        /* Organization List */
        .org-list {
            flex: 1;
            overflow-y: auto;
            padding: var(--spacing-md);
        }
        
        .org-card {
            background-color: var(--white);
            border: 1px solid var(--border-light);
            border-radius: 8px;
            padding: var(--spacing-md);
            margin-bottom: var(--spacing-md);
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            gap: var(--spacing-md);
        }
        
        .org-card:hover {
            box-shadow: var(--shadow-md);
            transform: translateY(-2px);
        }
        
        .org-card.active {
            border-color: var(--primary-blue);
            box-shadow: 0 0 0 2px rgba(28, 121, 215, 0.2);
        }
        
        .org-avatar {
            width: 48px;
            height: 48px;
            background-color: var(--primary-blue);
            color: var(--white);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 18px;
            flex-shrink: 0;
        }
        
        .org-info {
            flex: 1;
            min-width: 0;
        }
        
        .org-name {
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 4px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .org-meta {
            font-size: 14px;
            color: var(--text-secondary);
            display: flex;
            gap: var(--spacing-md);
        }
        
        .org-industry {
            display: flex;
            align-items: center;
            gap: 4px;
        }
        
        .org-revenue {
            color: var(--dark-blue);
            font-weight: 500;
        }
        
        /* Organization Detail Panel */
        .org-detail-panel {
            flex: 1;
            background-color: var(--white);
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }
        
        /* Organization Header */
        .org-header {
            padding: var(--spacing-lg);
            border-bottom: 1px solid var(--border-light);
            background-color: var(--background);
        }
        
        .org-header-top {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: var(--spacing-md);
        }
        
        .org-header-info {
            display: flex;
            align-items: center;
            gap: var(--spacing-md);
        }
        
        .org-header-avatar {
            width: 64px;
            height: 64px;
            background-color: var(--primary-blue);
            color: var(--white);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 24px;
        }
        
        .org-header-details h1 {
            font-size: 24px;
            margin-bottom: 4px;
        }
        
        .org-header-meta {
            display: flex;
            gap: var(--spacing-md);
            color: var(--text-secondary);
        }
        
        .status-badge {
            padding: 4px 12px;
            background-color: var(--accent-green);
            color: var(--dark-blue);
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
        }
        
        /* Quick Actions */
        .quick-actions {
            display: flex;
            gap: var(--spacing-sm);
        }
        
        .btn {
            padding: var(--spacing-sm) var(--spacing-md);
            border-radius: 6px;
            border: 1px solid var(--border-light);
            background-color: var(--white);
            color: var(--text-dark);
            cursor: pointer;
            font-size: 14px;
            font-family: inherit;
            min-height: 40px;
            display: flex;
            align-items: center;
            gap: var(--spacing-sm);
            transition: all 0.2s ease;
        }
        
        .btn:hover {
            background-color: var(--background);
        }
        
        .btn-primary {
            background-color: var(--primary-blue);
            color: var(--white);
            border-color: var(--primary-blue);
        }
        
        .btn-primary:hover {
            background-color: var(--dark-blue);
        }
        
        /* Tabs */
        .tabs {
            display: flex;
            gap: var(--spacing-lg);
            padding: 0 var(--spacing-lg);
            border-bottom: 1px solid var(--border-light);
            background-color: var(--white);
        }
        
        .tab {
            padding: var(--spacing-md) var(--spacing-sm);
            color: var(--text-secondary);
            text-decoration: none;
            border-bottom: 3px solid transparent;
            transition: all 0.2s ease;
            cursor: pointer;
        }
        
        .tab:hover {
            color: var(--primary-blue);
        }
        
        .tab.active {
            color: var(--primary-blue);
            border-bottom-color: var(--primary-blue);
        }
        
        /* Tab Content */
        .tab-content {
            flex: 1;
            overflow-y: auto;
            padding: var(--spacing-lg);
        }
        
        .tab-pane {
            display: none;
        }
        
        .tab-pane.active {
            display: block;
        }
        
        /* Overview Tab */
        .metrics-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: var(--spacing-md);
            margin-bottom: var(--spacing-xl);
        }
        
        .metric-card {
            background-color: var(--background);
            padding: var(--spacing-lg);
            border-radius: 8px;
            text-align: center;
        }
        
        .metric-value {
            font-size: 32px;
            font-weight: 600;
            color: var(--dark-blue);
            margin-bottom: var(--spacing-xs);
        }
        
        .metric-label {
            font-size: 14px;
            color: var(--text-secondary);
        }
        
        /* Information Grid */
        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: var(--spacing-lg);
            margin-bottom: var(--spacing-xl);
        }
        
        .info-item {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-xs);
        }
        
        .info-label {
            font-size: 14px;
            color: var(--text-secondary);
        }
        
        .info-value {
            font-size: 16px;
            color: var(--text-dark);
        }
        
        /* Activity Timeline */
        .activity-timeline {
            margin-top: var(--spacing-xl);
        }
        
        .section-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: var(--spacing-md);
        }
        
        .timeline-item {
            display: flex;
            gap: var(--spacing-md);
            padding: var(--spacing-md) 0;
            border-bottom: 1px solid var(--border-light);
        }
        
        .timeline-icon {
            width: 40px;
            height: 40px;
            background-color: var(--light-blue);
            color: var(--dark-blue);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }
        
        .timeline-content {
            flex: 1;
        }
        
        .timeline-title {
            font-weight: 500;
            margin-bottom: 4px;
        }
        
        .timeline-meta {
            font-size: 14px;
            color: var(--text-secondary);
        }
        
        /* Add Organization Button */
        .add-org-btn {
            position: fixed;
            bottom: var(--spacing-lg);
            left: calc(35% - 80px);
            width: 56px;
            height: 56px;
            background-color: var(--primary-blue);
            color: var(--white);
            border: none;
            border-radius: 50%;
            font-size: 24px;
            cursor: pointer;
            box-shadow: var(--shadow-lg);
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s ease;
        }
        
        .add-org-btn:hover {
            background-color: var(--dark-blue);
            transform: scale(1.1);
        }
        
        /* Modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            align-items: center;
            justify-content: center;
        }
        
        .modal.active {
            display: flex;
        }
        
        .modal-content {
            background-color: var(--white);
            border-radius: 8px;
            width: 90%;
            max-width: 600px;
            max-height: 90vh;
            overflow-y: auto;
            box-shadow: var(--shadow-lg);
        }
        
        .modal-header {
            padding: var(--spacing-lg);
            border-bottom: 1px solid var(--border-light);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .modal-title {
            font-size: 24px;
            font-weight: 600;
        }
        
        .close-btn {
            width: 40px;
            height: 40px;
            border: none;
            background: none;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 4px;
            transition: background-color 0.2s ease;
        }
        
        .close-btn:hover {
            background-color: var(--background);
        }
        
        /* Form Steps */
        .step-indicator {
            display: flex;
            padding: var(--spacing-lg);
            border-bottom: 1px solid var(--border-light);
        }
        
        .step {
            flex: 1;
            text-align: center;
            position: relative;
        }
        
        .step-number {
            width: 32px;
            height: 32px;
            background-color: var(--border-light);
            color: var(--text-secondary);
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            margin-bottom: var(--spacing-xs);
        }
        
        .step.active .step-number {
            background-color: var(--primary-blue);
            color: var(--white);
        }
        
        .step.completed .step-number {
            background-color: var(--accent-green);
            color: var(--dark-blue);
        }
        
        .step-label {
            font-size: 14px;
            color: var(--text-secondary);
        }
        
        .step-line {
            position: absolute;
            top: 16px;
            left: 50%;
            width: 100%;
            height: 2px;
            background-color: var(--border-light);
            z-index: -1;
        }
        
        .step:last-child .step-line {
            display: none;
        }
        
        .step.completed .step-line {
            background-color: var(--accent-green);
        }
        
        /* Form Content */
        .form-content {
            padding: var(--spacing-lg);
        }
        
        .form-step {
            display: none;
        }
        
        .form-step.active {
            display: block;
        }
        
        .form-group {
            margin-bottom: var(--spacing-lg);
        }
        
        .form-label {
            display: block;
            margin-bottom: var(--spacing-xs);
            font-weight: 500;
            color: var(--text-dark);
        }
        
        .form-label.required::after {
            content: ' *';
            color: var(--primary-blue);
        }
        
        .form-input,
        .form-select,
        .form-textarea {
            width: 100%;
            height: var(--touch-target);
            padding: 0 var(--spacing-md);
            border: 1px solid var(--border-light);
            border-radius: 6px;
            font-size: 16px;
            font-family: inherit;
            transition: border-color 0.2s ease;
        }
        
        .form-textarea {
            min-height: 100px;
            padding: var(--spacing-md);
            resize: vertical;
        }
        
        .form-input:focus,
        .form-select:focus,
        .form-textarea:focus {
            outline: none;
            border-color: var(--primary-blue);
        }
        
        .form-error {
            color: #ef4444;
            font-size: 14px;
            margin-top: var(--spacing-xs);
        }
        
        .form-actions {
            display: flex;
            justify-content: space-between;
            padding: var(--spacing-lg);
            border-top: 1px solid var(--border-light);
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .main-content {
                flex-direction: column;
            }
            
            .org-list-panel {
                width: 100%;
                height: 50%;
                border-right: none;
                border-bottom: 1px solid var(--border-light);
            }
            
            .org-detail-panel {
                height: 50%;
            }
            
            .add-org-btn {
                left: auto;
                right: var(--spacing-lg);
            }
            
            .info-grid {
                grid-template-columns: 1fr;
            }
            
            .metrics-grid {
                grid-template-columns: 1fr;
            }
        }
        
        /* Loading State */
        .loading {
            text-align: center;
            padding: var(--spacing-xl);
            color: var(--text-secondary);
        }
        
        .loading-spinner {
            display: inline-block;
            width: 40px;
            height: 40px;
            border: 3px solid var(--border-light);
            border-radius: 50%;
            border-top-color: var(--primary-blue);
            animation: spin 1s linear infinite;
        }
        
        @keyframes spin {
            to { transform: rotate(360deg); }
        }
        
        /* Empty State */
        .empty-state {
            text-align: center;
            padding: var(--spacing-xl);
            color: var(--text-secondary);
        }
        
        .empty-icon {
            font-size: 48px;
            color: var(--border-light);
            margin-bottom: var(--spacing-md);
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <h1 class="header-title">ForkFlow CRM</h1>
        <nav class="header-nav">
            <a href="#" class="nav-link">Dashboard</a>
            <a href="#" class="nav-link active">Organizations</a>
            <a href="#" class="nav-link">Contacts</a>
            <a href="#" class="nav-link">Deals</a>
            <a href="#" class="nav-link">Reports</a>
        </nav>
    </header>
    
    <!-- Main Content -->
    <div class="main-content">
        <!-- Organization List Panel -->
        <div class="org-list-panel">
            <div class="search-section">
                <input type="search" class="search-input" placeholder="Search organizations..." id="searchInput" onkeyup="filterOrganizations()">
                <div class="filter-chips">
                    <span class="filter-chip active" onclick="setFilter('all')">All</span>
                    <span class="filter-chip" onclick="setFilter('active')">Active</span>
                    <span class="filter-chip" onclick="setFilter('prospect')">Prospects</span>
                    <span class="filter-chip" onclick="setFilter('customer')">Customers</span>
                </div>
            </div>
            
            <div class="org-list" id="orgList">
                <!-- Organization cards will be populated here -->
            </div>
        </div>
        
        <!-- Organization Detail Panel -->
        <div class="org-detail-panel">
            <div id="orgDetailContent">
                <!-- Organization details will be populated here -->
                <div class="empty-state">
                    <div class="empty-icon">📋</div>
                    <h3>Select an organization</h3>
                    <p>Choose an organization from the list to view details</p>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Add Organization Button -->
    <button class="add-org-btn" onclick="openAddOrgModal()">+</button>
    
    <!-- Add Organization Modal -->
    <div class="modal" id="addOrgModal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">Add New Organization</h2>
                <button class="close-btn" onclick="closeModal()">✕</button>
            </div>
            
            <!-- Step Indicator -->
            <div class="step-indicator">
                <div class="step active" id="step1">
                    <div class="step-number">1</div>
                    <div class="step-label">Basic Info</div>
                    <div class="step-line"></div>
                </div>
                <div class="step" id="step2">
                    <div class="step-number">2</div>
                    <div class="step-label">Contact Details</div>
                    <div class="step-line"></div>
                </div>
                <div class="step" id="step3">
                    <div class="step-number">3</div>
                    <div class="step-label">Business Details</div>
                </div>
            </div>
            
            <!-- Form Content -->
            <form id="addOrgForm" onsubmit="handleFormSubmit(event)">
                <div class="form-content">
                    <!-- Step 1: Basic Information -->
                    <div class="form-step active" id="formStep1">
                        <div class="form-group">
                            <label class="form-label required" for="companyName">Company Name</label>
                            <input type="text" class="form-input" id="companyName" required>
                            <div class="form-error" id="companyNameError"></div>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label" for="industry">Industry</label>
                            <select class="form-select" id="industry">
                                <option value="">Select Industry</option>
                                <option value="Restaurant">Restaurant</option>
                                <option value="Food Service">Food Service</option>
                                <option value="Hospitality">Hospitality</option>
                                <option value="Retail">Retail</option>
                                <option value="Healthcare">Healthcare</option>
                                <option value="Education">Education</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label" for="companySize">Company Size</label>
                            <select class="form-select" id="companySize">
                                <option value="">Select Size</option>
                                <option value="1-10">1-10 employees</option>
                                <option value="11-50">11-50 employees</option>
                                <option value="51-200">51-200 employees</option>
                                <option value="201-1000">201-1000 employees</option>
                                <option value="1000+">1000+ employees</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label" for="website">Website</label>
                            <input type="url" class="form-input" id="website" placeholder="https://example.com">
                        </div>
                    </div>
                    
                    <!-- Step 2: Contact Details -->
                    <div class="form-step" id="formStep2">
                        <div class="form-group">
                            <label class="form-label" for="contactName">Primary Contact Name</label>
                            <input type="text" class="form-input" id="contactName">
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label" for="email">Email</label>
                            <input type="email" class="form-input" id="email">
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label" for="phone">Phone</label>
                            <input type="tel" class="form-input" id="phone">
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label" for="address">Address</label>
                            <input type="text" class="form-input" id="address">
                        </div>
                    </div>
                    
                    <!-- Step 3: Business Details -->
                    <div class="form-step" id="formStep3">
                        <div class="form-group">
                            <label class="form-label" for="revenue">Annual Revenue</label>
                            <input type="text" class="form-input" id="revenue" placeholder="$0.00">
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label" for="leadSource">Lead Source</label>
                            <select class="form-select" id="leadSource">
                                <option value="">Select Source</option>
                                <option value="Website">Website</option>
                                <option value="Referral">Referral</option>
                                <option value="Cold Call">Cold Call</option>
                                <option value="Trade Show">Trade Show</option>
                                <option value="Social Media">Social Media</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label" for="description">Description</label>
                            <textarea class="form-textarea" id="description" rows="4"></textarea>
                        </div>
                    </div>
                </div>
                
                <!-- Form Actions -->
                <div class="form-actions">
                    <button type="button" class="btn" id="prevBtn" onclick="changeStep(-1)" style="display: none;">Previous</button>
                    <div style="margin-left: auto; display: flex; gap: 12px;">
                        <button type="button" class="btn" onclick="closeModal()">Cancel</button>
                        <button type="button" class="btn btn-primary" id="nextBtn" onclick="changeStep(1)">Next</button>
                        <button type="submit" class="btn btn-primary" id="submitBtn" style="display: none;">Save Organization</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    
    <script>
        // Sample organization data
        const organizations = [
            {
                id: 1,
                name: "The Rustic Table",
                industry: "Restaurant",
                status: "Customer",
                revenue: "$2.5M",
                contacts: 4,
                lastActivity: "2 hours ago",
                phone: "(555) 123-4567",
                email: "info@rustictable.com",
                website: "www.rustictable.com",
                address: "123 Main St, Seattle, WA 98101",
                employees: "51-200"
            },
            {
                id: 2,
                name: "Bella's Bistro",
                industry: "Fine Dining",
                status: "Active",
                revenue: "$1.8M",
                contacts: 3,
                lastActivity: "1 day ago",
                phone: "(555) 234-5678",
                email: "contact@bellasbistro.com",
                website: "www.bellasbistro.com",
                address: "456 Oak Ave, Portland, OR 97201",
                employees: "11-50"
            },
            {
                id: 3,
                name: "Green Garden Cafe",
                industry: "Food Service",
                status: "Prospect",
                revenue: "$850K",
                contacts: 2,
                lastActivity: "3 days ago",
                phone: "(555) 345-6789",
                email: "hello@greengarden.com",
                website: "www.greengardencafe.com",
                address: "789 Pine St, San Francisco, CA 94102",
                employees: "11-50"
            },
            {
                id: 4,
                name: "Coastal Seafood Supply",
                industry: "Food Service",
                status: "Customer",
                revenue: "$5.2M",
                contacts: 6,
                lastActivity: "1 hour ago",
                phone: "(555) 456-7890",
                email: "sales@coastalseafood.com",
                website: "www.coastalseafood.com",
                address: "321 Harbor Blvd, Los Angeles, CA 90001",
                employees: "201-1000"
            },
            {
                id: 5,
                name: "Mountain View Hospital",
                industry: "Healthcare",
                status: "Customer",
                revenue: "$12M",
                contacts: 8,
                lastActivity: "5 hours ago",
                phone: "(555) 567-8901",
                email: "procurement@mvhospital.org",
                website: "www.mvhospital.org",
                address: "555 Medical Center Dr, Denver, CO 80201",
                employees: "1000+"
            }
        ];
        
        let currentOrg = null;
        let currentStep = 1;
        let activeFilter = 'all';
        
        // Initialize organization list
        function initializeOrgList() {
            renderOrganizations();
            if (organizations.length > 0) {
                selectOrganization(organizations[0]);
            }
        }
        
        // Render organizations
        function renderOrganizations() {
            const orgList = document.getElementById('orgList');
            const filteredOrgs = filterOrganizationsByStatus();
            
            orgList.innerHTML = filteredOrgs.map(org => `
                <div class="org-card ${currentOrg && currentOrg.id === org.id ? 'active' : ''}" onclick="selectOrganization(${JSON.stringify(org).replace(/"/g, '&quot;')})">
                    <div class="org-avatar">${org.name.substring(0, 2).toUpperCase()}</div>
                    <div class="org-info">
                        <div class="org-name">${org.name}</div>
                        <div class="org-meta">
                            <span class="org-industry">
                                <span>🏢</span> ${org.industry}
                            </span>
                            <span class="org-revenue">${org.revenue}</span>
                        </div>
                    </div>
                </div>
            `).join('');
        }
        
        // Filter organizations by search
        function filterOrganizations() {
            const searchTerm = document.getElementById('searchInput').value.toLowerCase();
            const orgCards = document.querySelectorAll('.org-card');
            
            orgCards.forEach(card => {
                const orgName = card.querySelector('.org-name').textContent.toLowerCase();
                const orgIndustry = card.querySelector('.org-industry').textContent.toLowerCase();
                
                if (orgName.includes(searchTerm) || orgIndustry.includes(searchTerm)) {
                    card.style.display = 'flex';
                } else {
                    card.style.display = 'none';
                }
            });
        }
        
        // Filter organizations by status
        function filterOrganizationsByStatus() {
            if (activeFilter === 'all') return organizations;
            
            return organizations.filter(org => {
                if (activeFilter === 'active') return org.status === 'Active';
                if (activeFilter === 'prospect') return org.status === 'Prospect';
                if (activeFilter === 'customer') return org.status === 'Customer';
                return true;
            });
        }
        
        // Set filter
        function setFilter(filter) {
            activeFilter = filter;
            document.querySelectorAll('.filter-chip').forEach(chip => {
                chip.classList.remove('active');
            });
            event.target.classList.add('active');
            renderOrganizations();
        }
        
        // Select organization
        function selectOrganization(org) {
            currentOrg = org;
            renderOrganizations();
            renderOrgDetails();
        }
        
        // Render organization details
        function renderOrgDetails() {
            const detailContent = document.getElementById('orgDetailContent');
            
            if (!currentOrg) {
                detailContent.innerHTML = `
                    <div class="empty-state">
                        <div class="empty-icon">📋</div>
                        <h3>Select an organization</h3>
                        <p>Choose an organization from the list to view details</p>
                    </div>
                `;
                return;
            }
            
            detailContent.innerHTML = `
                <!-- Organization Header -->
                <div class="org-header">
                    <div class="org-header-top">
                        <div class="org-header-info">
                            <div class="org-header-avatar">${currentOrg.name.substring(0, 2).toUpperCase()}</div>
                            <div class="org-header-details">
                                <h1>${currentOrg.name}</h1>
                                <div class="org-header-meta">
                                    <span>${currentOrg.industry}</span>
                                    <span>•</span>
                                    <span>${currentOrg.employees} employees</span>
                                    <span>•</span>
                                    <span class="status-badge">${currentOrg.status}</span>
                                </div>
                            </div>
                        </div>
                        <div class="quick-actions">
                            <button class="btn">Edit</button>
                            <button class="btn">Delete</button>
                            <button class="btn btn-primary">Add Contact</button>
                        </div>
                    </div>
                </div>
                
                <!-- Tabs -->
                <div class="tabs">
                    <div class="tab active" onclick="switchTab('overview')">Overview</div>
                    <div class="tab" onclick="switchTab('contacts')">Contacts (${currentOrg.contacts})</div>
                    <div class="tab" onclick="switchTab('activities')">Activities</div>
                    <div class="tab" onclick="switchTab('opportunities')">Opportunities</div>
                </div>
                
                <!-- Tab Content -->
                <div class="tab-content">
                    <!-- Overview Tab -->
                    <div class="tab-pane active" id="overview-tab">
                        <div class="metrics-grid">
                            <div class="metric-card">
                                <div class="metric-value">${currentOrg.revenue}</div>
                                <div class="metric-label">Annual Revenue</div>
                            </div>
                            <div class="metric-card">
                                <div class="metric-value">${currentOrg.contacts}</div>
                                <div class="metric-label">Contacts</div>
                            </div>
                            <div class="metric-card">
                                <div class="metric-value">12</div>
                                <div class="metric-label">Open Deals</div>
                            </div>
                        </div>
                        
                        <h3 class="section-title">Company Information</h3>
                        <div class="info-grid">
                            <div class="info-item">
                                <div class="info-label">Phone</div>
                                <div class="info-value">${currentOrg.phone}</div>
                            </div>
                            <div class="info-item">
                                <div class="info-label">Email</div>
                                <div class="info-value">${currentOrg.email}</div>
                            </div>
                            <div class="info-item">
                                <div class="info-label">Website</div>
                                <div class="info-value">${currentOrg.website}</div>
                            </div>
                            <div class="info-item">
                                <div class="info-label">Address</div>
                                <div class="info-value">${currentOrg.address}</div>
                            </div>
                        </div>
                        
                        <div class="activity-timeline">
                            <h3 class="section-title">Recent Activity</h3>
                            <div class="timeline-item">
                                <div class="timeline-icon">📞</div>
                                <div class="timeline-content">
                                    <div class="timeline-title">Phone call with purchasing manager</div>
                                    <div class="timeline-meta">${currentOrg.lastActivity}</div>
                                </div>
                            </div>
                            <div class="timeline-item">
                                <div class="timeline-icon">✉️</div>
                                <div class="timeline-content">
                                    <div class="timeline-title">Sent product catalog</div>
                                    <div class="timeline-meta">2 days ago</div>
                                </div>
                            </div>
                            <div class="timeline-item">
                                <div class="timeline-icon">🤝</div>
                                <div class="timeline-content">
                                    <div class="timeline-title">In-person meeting scheduled</div>
                                    <div class="timeline-meta">Next Tuesday at 2:00 PM</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Contacts Tab -->
                    <div class="tab-pane" id="contacts-tab">
                        <div class="empty-state">
                            <div class="empty-icon">👥</div>
                            <h3>Contacts</h3>
                            <p>Contact management coming soon</p>
                        </div>
                    </div>
                    
                    <!-- Activities Tab -->
                    <div class="tab-pane" id="activities-tab">
                        <div class="empty-state">
                            <div class="empty-icon">📊</div>
                            <h3>Activities</h3>
                            <p>Activity tracking coming soon</p>
                        </div>
                    </div>
                    
                    <!-- Opportunities Tab -->
                    <div class="tab-pane" id="opportunities-tab">
                        <div class="empty-state">
                            <div class="empty-icon">💼</div>
                            <h3>Opportunities</h3>
                            <p>Deal pipeline coming soon</p>
                        </div>
                    </div>
                </div>
            `;
        }
        
        // Switch tabs
        function switchTab(tabName) {
            // Update tab active states
            document.querySelectorAll('.tab').forEach(tab => {
                tab.classList.remove('active');
            });
            event.target.classList.add('active');
            
            // Update tab pane visibility
            document.querySelectorAll('.tab-pane').forEach(pane => {
                pane.classList.remove('active');
            });
            document.getElementById(tabName + '-tab').classList.add('active');
        }
        
        // Modal functions
        function openAddOrgModal() {
            document.getElementById('addOrgModal').classList.add('active');
            currentStep = 1;
            updateFormStep();
        }
        
        function closeModal() {
            document.getElementById('addOrgModal').classList.remove('active');
            document.getElementById('addOrgForm').reset();
            currentStep = 1;
            updateFormStep();
        }
        
        // Form step navigation
        function changeStep(direction) {
            // Validate current step before proceeding
            if (direction > 0 && !validateCurrentStep()) {
                return;
            }
            
            currentStep += direction;
            if (currentStep < 1) currentStep = 1;
            if (currentStep > 3) currentStep = 3;
            
            updateFormStep();
        }
        
        function updateFormStep() {
            // Update step indicators
            for (let i = 1; i <= 3; i++) {
                const stepEl = document.getElementById('step' + i);
                stepEl.classList.remove('active', 'completed');
                
                if (i < currentStep) {
                    stepEl.classList.add('completed');
                } else if (i === currentStep) {
                    stepEl.classList.add('active');
                }
            }
            
            // Update form steps
            document.querySelectorAll('.form-step').forEach(step => {
                step.classList.remove('active');
            });
            document.getElementById('formStep' + currentStep).classList.add('active');
            
            // Update buttons
            document.getElementById('prevBtn').style.display = currentStep === 1 ? 'none' : 'block';
            document.getElementById('nextBtn').style.display = currentStep === 3 ? 'none' : 'block';
            document.getElementById('submitBtn').style.display = currentStep === 3 ? 'block' : 'none';
        }
        
        // Form validation
        function validateCurrentStep() {
            if (currentStep === 1) {
                const companyName = document.getElementById('companyName').value.trim();
                if (!companyName) {
                    document.getElementById('companyNameError').textContent = 'Company name is required';
                    return false;
                }
                document.getElementById('companyNameError').textContent = '';
            }
            
            return true;
        }
        
        // Handle form submission
        function handleFormSubmit(event) {
            event.preventDefault();
            
            if (!validateCurrentStep()) {
                return;
            }
            
            // Simulate form submission
            const formData = {
                companyName: document.getElementById('companyName').value,
                industry: document.getElementById('industry').value,
                companySize: document.getElementById('companySize').value,
                website: document.getElementById('website').value,
                contactName: document.getElementById('contactName').value,
                email: document.getElementById('email').value,
                phone: document.getElementById('phone').value,
                address: document.getElementById('address').value,
                revenue: document.getElementById('revenue').value,
                leadSource: document.getElementById('leadSource').value,
                description: document.getElementById('description').value
            };
            
            console.log('Form submitted:', formData);
            
            // Add to organizations list
            const newOrg = {
                id: organizations.length + 1,
                name: formData.companyName,
                industry: formData.industry || 'Not specified',
                status: 'Prospect',
                revenue: formData.revenue || 'N/A',
                contacts: 1,
                lastActivity: 'Just now',
                phone: formData.phone || 'N/A',
                email: formData.email || 'N/A',
                website: formData.website || 'N/A',
                address: formData.address || 'N/A',
                employees: formData.companySize || 'N/A'
            };
            
            organizations.unshift(newOrg);
            renderOrganizations();
            selectOrganization(newOrg);
            closeModal();
        }
        
        // Close modal on backdrop click
        window.onclick = function(event) {
            const modal = document.getElementById('addOrgModal');
            if (event.target === modal) {
                closeModal();
            }
        }
        
        // Initialize on load
        document.addEventListener('DOMContentLoaded', initializeOrgList);
    </script>
</body>
</html>

```