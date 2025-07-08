You are an expert CRM UI/UX designer with deep expertise in contact management interfaces and enterprise application design. Your task is to design and produce a **working HTML demo** of a comprehensive CRM Contact page with an "Add New Contact" feature that incorporates the most effective characteristics of top-rated CRM systems while maintaining visual consistency with the Mission Control dashboard color scheme.

## DESIGN REQUIREMENTS

### Core Visual Principles
- **Clean & Minimalist**: Eliminate visual clutter while maintaining rich functionality
- **Professional & Trustworthy**: Use design elements that convey reliability and data security
- **Consistent & Organized**: Maintain logical information architecture with clear visual hierarchy
- **Touch-Optimized**: Follow WCAG 2.1 AA standards with 48px minimum touch targets
### Mission Control Dashboard Color Palette Consistency
Use this established color scheme in your HTML demo:
- **Primary Blue**: #1C79D7 (Bright Navy Blue) - for primary actions, navigation, and trust-building elements[42][44][47]
- **Light Blue**: #78BCF6 (Very Light Azure) - for secondary elements, highlights, and interactive states  
- **Dark Blue**: #245C94 (Lapis Lazuli) - for headers, emphasis, and important data points
- **Neutral Blue**: #809AAF (Weldon Blue) - for supporting text and secondary information
- **Accent Green**: #BDCFA2 (Light Moss Green) - for positive actions, success states, and confirmations
- **Background**: #F1F1F1 (Light Grey) - for main background areas and content separation
- **Text**: #202020 (Dark Grey) - for primary text content and readability

### Typography & Hierarchy
- **Font**: Clean sans-serif (Inter, Roboto, or system fonts)
- **Sizes**: 32px (page titles), 24px (section headers), 18px (contact names), 16px (body), 14px (labels), 12px (metadata)
- **Weight**: 400 (body text), 500 (emphasis), 600 (contact names and headings)
- **Line Height**: 1.5 for body text, 1.2 for headings, 1.4 for contact information

## CONTACT PAGE DESIGN SPECIFICATIONS

### Layout Pattern: Master-Detail with Contact Cards
Design using the proven contact management pattern with these components:

#### Left Panel - Contact List (35% width)
- **Search & Filter Bar**: Global search with real-time filtering and advanced filter options
- **Contact Cards Layout**: Avatar-based card design showing essential contact information
- **Quick Filter Chips**: "All", "Favorites", "Recent", "Companies", "Individuals"
- **Alphabetical Navigation**: A-Z quick jump sidebar for rapid contact location
- **Add New Contact** floating action button with primary blue background

#### Right Panel - Contact Details (65% width)  
- **Contact Header**: Large avatar, name, job title, company, and contact status
- **Tabbed Interface**: "Overview", "Interactions", "Opportunities", "Documents", "Notes"
- **Quick Actions Bar**: Call, Email, Message, Schedule Meeting, Edit Contact
- **Contact Information Grid**: Phone, email, address, social profiles with copy-to-clipboard functionality
- **Recent Activity Timeline**: Chronological interaction history with type indicators

## ADD NEW CONTACT FORM SPECIFICATIONS  

### Form Design Pattern: Progressive Disclosure Modal
Create a multi-step modal form following modern CRM best practices:

#### Step 1: Basic Contact Information
- **Full Name** (required, text input with name parsing for first/last)
- **Email Address** (email input with validation and duplicate detection)
- **Phone Number** (phone input with international formatting)
- **Job Title** (text input with autocomplete suggestions)

#### Step 2: Company Association
- **Organization** (searchable dropdown with "Create New Organization" option)
- **Department** (text input with common suggestions)
- **Organization Relationship** (dropdown: Primary Contact, Secondary Contact, etc.)
- **Address** (auto-populated from Organization or manual entry)

#### Step 3: Additional Details & Preferences
- **Contact Source** (dropdown: Website, Referral, Trade Show, Cold Call, etc.)
- **Tags** (multi-select for categorization and segmentation)
- **Communication Preferences** (email, phone, message frequency)
- **Notes** (textarea for initial contact context)

## HTML DEMO DELIVERABLE

Produce a **single self-contained HTML file** (with embedded CSS and minimal vanilla JavaScript) that demonstrates:

### 1. **Contact Management Interface**
- Master-detail layout with contact list and detail pane
- Search functionality with real-time filtering
- Contact cards with avatars, names, organizations, and last interaction dates
- Tabbed detail view with contact information and interactions timeline

### 2. **Add New Contact Modal**
- Progressive disclosure form with 3 steps
- Real-time form validation with helpful error messages
- Smart duplicate detection warnings
- Touch-optimized inputs with 48px minimum height

### 3. **Interactive Features**
- Functional search bar with live filtering of contact list
- Working tab navigation in contact detail view
- Modal form with step-by-step progression
- Hover states and visual feedback for all interactive elements

### 4. **Sample Data Integration**
- 10-15 realistic contact records with varied information
- Contact avatars (using placeholder services or initials)
- Recent activity entries with different interaction types
- Company associations and job titles

### 5. **Responsive Design**
- Mobile-first responsive layout with breakpoints
- Touch-friendly interactions on mobile devices
- Collapsible navigation for smaller screens
- Optimized typography and spacing across device sizes

## IMPLEMENTATION NOTES

### Technical Requirements
- **HTML5 Semantic Structure**: Use proper heading hierarchy, semantic elements, and ARIA labels
- **Embedded CSS**: Include all styles within `<style>` tags in the HTML head
- **Vanilla JavaScript**: Minimal JavaScript for interactions (search, tabs, modal, form validation)
- **No External Dependencies**: Self-contained file that works offline
- **Cross-Browser Compatibility**: Works in all modern browsers
### Interactive Functionality
- **Search Implementation**: Filter contacts by name, company, email, or phone
- **Tab Switching**: Smooth transitions between contact detail tabs
- **Modal Management**: Open/close add contact form with backdrop interaction
- **Form Validation**: Real-time validation with visual feedback
- **Contact Selection**: Click contact cards to view details in right pane

### Visual Design Elements
- **Modern Card Design**: Clean contact cards with subtle shadows and hover effects
- **Professional Icons**: Use Unicode symbols or CSS-created icons for actions
- **Consistent Color Scheme**: Implement Mission Control dashboard colors throughout
- **Typography Hierarchy**: Clear visual hierarchy with proper font sizing
- **Loading States**: Visual feedback for form submissions and data updates

## SUCCESS CRITERIA

### Functional Requirements
- **Complete Contact Management**: View, search, and add contacts functionality
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

The HTML demo should feel like a professional CRM contact management interface that stakeholders can immediately interact with to evaluate the proposed design and functionality.


```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mission Control CRM - Contacts</title>
    <style>
        /* Mission Control Dashboard Color Palette */
        :root {
            --primary-blue: #1C79D7; /* Bright Navy Blue */
            --light-blue: #78BCF6; /* Very Light Azure */
            --dark-blue: #245C94; /* Lapis Lazuli */
            --neutral-blue: #809AAF; /* Weldon Blue */
            --accent-green: #BDCFA2; /* Light Moss Green */
            --background-light-grey: #F1F1F1;
            --text-dark-grey: #202020;
            --white: #FFFFFF;
            --border-grey: #E0E0E0;
            --shadow-light: rgba(0, 0, 0, 0.05);
            --shadow-medium: rgba(0, 0, 0, 0.1);
        }

        /* Base Styles */
        body {
            font-family: 'Inter', 'Roboto', 'Helvetica Neue', sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--background-light-grey);
            color: var(--text-dark-grey);
            line-height: 1.5;
            display: flex;
            min-height: 100vh;
            overflow: hidden; /* Prevent body scroll when modal is open */
        }

        /* Typography Hierarchy */
        h1 {
            font-size: 32px;
            font-weight: 600;
            color: var(--dark-blue);
            line-height: 1.2;
            margin-bottom: 20px;
        }

        h2 {
            font-size: 24px;
            font-weight: 600;
            color: var(--dark-blue);
            line-height: 1.2;
            margin-bottom: 15px;
        }

        h3 {
            font-size: 18px;
            font-weight: 600;
            color: var(--text-dark-grey);
            line-height: 1.4;
        }

        p {
            font-size: 16px;
            font-weight: 400;
            line-height: 1.5;
        }

        label {
            font-size: 14px;
            font-weight: 500;
            color: var(--neutral-blue);
            display: block;
            margin-bottom: 5px;
        }

        small {
            font-size: 12px;
            color: var(--neutral-blue);
        }

        /* General Elements */
        .container {
            display: flex;
            width: 100%;
            max-width: 1400px;
            margin: 20px auto;
            background-color: var(--white);
            border-radius: 8px;
            box-shadow: 0 4px 12px var(--shadow-medium);
            overflow: hidden;
            height: calc(100vh - 40px);
        }

        button,
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        select,
        textarea {
            padding: 12px 16px;
            border: 1px solid var(--border-grey);
            border-radius: 6px;
            font-size: 16px;
            font-family: inherit;
            box-sizing: border-box;
            min-height: 48px; /* WCAG 2.1 AA touch target */
            transition: all 0.2s ease;
        }

        button:hover,
        input:focus,
        select:focus,
        textarea:focus {
            border-color: var(--light-blue);
            box-shadow: 0 0 0 2px rgba(120, 188, 246, 0.2);
            outline: none;
        }

        button {
            cursor: pointer;
            background-color: var(--primary-blue);
            color: var(--white);
            font-weight: 500;
            border: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        button.secondary {
            background-color: var(--background-light-grey);
            color: var(--text-dark-grey);
            border: 1px solid var(--border-grey);
        }

        button.accent {
            background-color: var(--accent-green);
            color: var(--white);
        }

        button:hover {
            opacity: 0.9;
        }

        button:active {
            opacity: 0.8;
            transform: translateY(1px);
        }

        .icon {
            font-style: normal; /* For unicode icons */
            font-size: 18px;
        }

        /* Layout Pattern: Master-Detail */
        .left-panel {
            width: 35%;
            background-color: var(--white);
            border-right: 1px solid var(--border-grey);
            padding: 20px;
            overflow-y: auto;
            position: relative;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .right-panel {
            width: 65%;
            background-color: var(--background-light-grey);
            padding: 20px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        /* Left Panel - Contact List */
        .search-bar {
            position: sticky;
            top: 0;
            background-color: var(--white);
            padding-bottom: 15px;
            z-index: 10;
        }

        .search-bar input {
            width: 100%;
            padding-right: 40px; /* Space for search icon */
        }

        .quick-filter-chips {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-bottom: 15px;
        }

        .filter-chip {
            padding: 8px 16px;
            border-radius: 20px;
            background-color: var(--background-light-grey);
            color: var(--neutral-blue);
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.2s ease;
            min-height: 36px; /* Ensure touch target */
            display: flex;
            align-items: center;
        }

        .filter-chip:hover {
            background-color: var(--light-blue);
            color: var(--white);
        }

        .filter-chip.active {
            background-color: var(--primary-blue);
            color: var(--white);
        }

        .contact-list {
            flex-grow: 1; /* Allows list to fill remaining space */
        }

        .contact-card {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 15px;
            background-color: var(--white);
            border-radius: 8px;
            margin-bottom: 10px;
            box-shadow: 0 2px 5px var(--shadow-light);
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            border: 1px solid var(--border-grey);
            min-height: 70px; /* Ensure touch target */
        }

        .contact-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 10px var(--shadow-medium);
        }

        .contact-card.active {
            border-color: var(--primary-blue);
            box-shadow: 0 0 0 2px rgba(28, 121, 215, 0.2);
        }

        .contact-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: var(--light-blue);
            color: var(--dark-blue);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            font-weight: 500;
            flex-shrink: 0;
            overflow: hidden;
            border: 1px solid rgba(0,0,0,0.1);
        }
        .contact-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .contact-info {
            flex-grow: 1;
        }

        .contact-info h3 {
            margin: 0;
            font-size: 18px; /* Contact names */
            font-weight: 600;
            line-height: 1.4;
        }

        .contact-info p {
            margin: 2px 0 0;
            font-size: 14px; /* Labels */
            color: var(--neutral-blue);
            line-height: 1.4;
        }

        .contact-info small {
            display: block;
            margin-top: 5px;
            font-size: 12px; /* Metadata */
            color: var(--neutral-blue);
        }

        .alphabetical-nav {
            position: absolute;
            right: 0px;
            top: 20%;
            display: flex;
            flex-direction: column;
            gap: 2px;
            background-color: var(--white);
            padding: 5px 0;
            border-radius: 5px;
            box-shadow: 0 2px 5px var(--shadow-light);
            z-index: 5;
            display: none; /* Hidden by default on desktop, shown on mobile */
        }

        .alphabetical-nav span {
            font-size: 12px;
            font-weight: 500;
            color: var(--neutral-blue);
            padding: 4px 8px;
            cursor: pointer;
            transition: background-color 0.1s ease;
        }

        .alphabetical-nav span:hover {
            background-color: var(--light-blue);
            color: var(--white);
        }

        .add-contact-fab {
            position: sticky;
            bottom: 20px; /* Distance from bottom */
            left: calc(35% - 40px); /* Adjust to be within 35% panel, but floating */
            transform: translateX(-50%); /* Center horizontally */
            background-color: var(--primary-blue);
            color: var(--white);
            border-radius: 50%;
            width: 56px;
            height: 56px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            box-shadow: 0 4px 10px var(--shadow-medium);
            cursor: pointer;
            transition: transform 0.2s ease;
            z-index: 20;
            align-self: center; /* Center within flex column */
            margin-top: 20px;
            flex-shrink: 0; /* Don't shrink when content is long */
            right: 20px; /* For mobile positioning */
        }
        .add-contact-fab:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 15px var(--shadow-medium);
        }

        /* Right Panel - Contact Details */
        .contact-header {
            display: flex;
            align-items: center;
            gap: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--border-grey);
            background-color: var(--white);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px var(--shadow-light);
        }

        .contact-header .contact-avatar {
            width: 80px;
            height: 80px;
            font-size: 36px;
        }

        .contact-header-info h2 {
            margin: 0;
            font-size: 24px; /* Section headers */
            font-weight: 600;
            line-height: 1.2;
        }

        .contact-header-info p {
            margin: 5px 0 0;
            font-size: 16px; /* Body */
            color: var(--neutral-blue);
        }

        .contact-header-info .status {
            display: inline-block;
            background-color: var(--accent-green);
            color: var(--white);
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            margin-top: 8px;
            font-weight: 500;
        }

        .quick-actions-bar {
            display: flex;
            gap: 10px;
            margin-top: 20px;
            background-color: var(--white);
            padding: 15px 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px var(--shadow-light);
            flex-wrap: wrap; /* Allow wrapping on smaller screens */
        }

        .quick-actions-bar button {
            padding: 10px 15px;
            font-size: 14px;
            background-color: var(--light-blue);
            color: var(--dark-blue);
            border: none;
            border-radius: 6px;
            min-height: 40px; /* Ensure touch target */
        }
        .quick-actions-bar button:hover {
            background-color: var(--primary-blue);
            color: var(--white);
        }

        .tabbed-interface {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .tabs-nav {
            display: flex;
            border-bottom: 1px solid var(--border-grey);
            margin-bottom: 15px;
        }

        .tab-button {
            padding: 12px 20px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            color: var(--neutral-blue);
            border: none;
            background: none;
            border-bottom: 2px solid transparent;
            transition: all 0.2s ease;
            min-height: 48px; /* Touch target */
        }

        .tab-button:hover {
            color: var(--dark-blue);
        }

        .tab-button.active {
            color: var(--primary-blue);
            border-bottom-color: var(--primary-blue);
        }

        .tab-content {
            display: none;
            background-color: var(--white);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px var(--shadow-light);
        }

        .tab-content.active {
            display: block;
        }

        .contact-info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
        }

        .info-item {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .info-item .value {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 16px;
            font-weight: 500;
        }

        .info-item .value .copy-icon {
            cursor: pointer;
            color: var(--neutral-blue);
            transition: color 0.2s ease;
            font-size: 18px;
            padding: 5px; /* Increase click area */
            min-width: 32px;
            min-height: 32px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 4px;
        }
        .info-item .value .copy-icon:hover {
            color: var(--primary-blue);
            background-color: var(--background-light-grey);
        }

        .activity-timeline .activity-item {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            padding-left: 10px;
            border-left: 2px solid var(--border-grey);
            position: relative;
        }
        .activity-timeline .activity-item:last-child {
            margin-bottom: 0;
        }

        .activity-timeline .activity-icon {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: var(--light-blue);
            color: var(--dark-blue);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            flex-shrink: 0;
            position: absolute;
            left: -16px;
            top: 0;
            border: 2px solid var(--white);
        }
        .activity-timeline .activity-icon.email { background-color: #f7d794; color: #d68910; } /* Example: Warm color for emails */
        .activity-timeline .activity-icon.call { background-color: #94d7f7; color: #108ed6; } /* Example: Cool color for calls */
        .activity-timeline .activity-icon.meeting { background-color: #bfa2cf; color: #6a408a; } /* Example: Purple for meetings */
        .activity-timeline .activity-icon.note { background-color: var(--accent-green); color: var(--white); }

        .activity-timeline .activity-content {
            flex-grow: 1;
        }

        .activity-timeline .activity-content h3 {
            margin: 0 0 5px;
            font-size: 16px;
            font-weight: 500;
        }

        .activity-timeline .activity-content p {
            margin: 0;
            font-size: 14px;
            color: var(--text-dark-grey);
        }

        .activity-timeline .activity-content small {
            display: block;
            margin-top: 5px;
        }


        /* Add New Contact Modal */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.3s ease, visibility 0.3s ease;
        }

        .modal-overlay.active {
            opacity: 1;
            visibility: visible;
        }

        .modal-content {
            background-color: var(--white);
            border-radius: 8px;
            padding: 30px;
            width: 90%;
            max-width: 600px;
            box-shadow: 0 8px 20px var(--shadow-medium);
            transform: translateY(20px);
            transition: transform 0.3s ease;
            position: relative;
            max-height: 90vh; /* Limit height for scrollable content */
            display: flex;
            flex-direction: column;
        }

        .modal-overlay.active .modal-content {
            transform: translateY(0);
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 1px solid var(--border-grey);
            flex-shrink: 0;
        }

        .modal-header h2 {
            margin: 0;
            font-size: 24px;
            color: var(--dark-blue);
        }

        .modal-close-button {
            background: none;
            border: none;
            font-size: 28px;
            color: var(--neutral-blue);
            cursor: pointer;
            padding: 5px;
            line-height: 1;
            min-width: 48px;
            min-height: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
        }
        .modal-close-button:hover {
            background-color: var(--background-light-grey);
        }

        .modal-body {
            flex-grow: 1;
            overflow-y: auto; /* Allow content to scroll */
            padding-right: 10px; /* Space for scrollbar */
            margin-right: -10px; /* Compensate for padding */
        }

        .form-step {
            display: none;
        }

        .form-step.active {
            display: block;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
        }

        .form-group textarea {
            min-height: 100px;
            resize: vertical;
        }

        .form-group .error-message {
            color: #D32F2F; /* Red for errors */
            font-size: 14px;
            margin-top: 5px;
            display: none;
        }
        .form-group.has-error input,
        .form-group.has-error select,
        .form-group.has-error textarea {
            border-color: #D32F2F;
        }
        .form-group.has-error .error-message {
            display: block;
        }
        .duplicate-warning {
            background-color: #fff3cd; /* Light yellow */
            color: #856404; /* Dark yellow text */
            border: 1px solid #ffeeba;
            padding: 10px 15px;
            border-radius: 6px;
            margin-top: 10px;
            font-size: 14px;
            display: none;
        }
        .duplicate-warning.active {
            display: block;
        }


        .modal-footer {
            display: flex;
            justify-content: space-between;
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid var(--border-grey);
            flex-shrink: 0;
        }

        .modal-footer button {
            padding: 12px 25px;
            font-size: 16px;
        }
        .modal-footer button[type="submit"] {
            background-color: var(--accent-green);
        }

        .modal-progress {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 15px;
            flex-shrink: 0;
        }

        .progress-dot {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background-color: var(--neutral-blue);
            transition: background-color 0.3s ease;
        }

        .progress-dot.active {
            background-color: var(--primary-blue);
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .container {
                flex-direction: column;
                margin: 0;
                height: 100vh;
                border-radius: 0;
                box-shadow: none;
            }

            .left-panel,
            .right-panel {
                width: 100%;
                padding: 15px;
                border-right: none;
                border-bottom: 1px solid var(--border-grey);
                box-sizing: border-box; /* Include padding in width */
                min-height: auto;
            }

            .left-panel {
                height: 40vh; /* Adjust height for scrollable list */
                max-height: 40vh;
                overflow-y: auto;
            }

            .right-panel {
                height: 60vh; /* Adjust height for detail view */
                max-height: 60vh;
                overflow-y: auto;
                display: none; /* Hidden by default on mobile */
            }
            .right-panel.active {
                display: flex;
            }

            .contact-list-wrapper {
                flex-grow: 1; /* Allow list to take remaining space */
                overflow-y: auto;
            }

            .search-bar {
                position: sticky;
                top: 0;
                background-color: var(--white);
                padding-bottom: 10px;
                z-index: 10;
            }

            .quick-filter-chips {
                margin-bottom: 10px;
                overflow-x: auto;
                white-space: nowrap;
                -webkit-overflow-scrolling: touch;
            }
            .filter-chip {
                flex-shrink: 0; /* Prevent shrinking */
            }

            .alphabetical-nav {
                display: flex; /* Show on mobile */
                right: 10px;
                top: 100px; /* Adjust based on header height */
            }

            .add-contact-fab {
                position: fixed; /* Fixed position for mobile */
                bottom: 20px;
                right: 20px;
                left: auto;
                transform: none;
                z-index: 500;
            }

            .contact-header {
                flex-direction: column;
                align-items: flex-start;
                text-align: center;
                gap: 10px;
            }

            .contact-header .contact-avatar {
                margin: 0 auto 10px; /* Center avatar */
            }

            .contact-header-info {
                text-align: center;
                width: 100%;
            }

            .quick-actions-bar {
                justify-content: center;
            }

            .tabbed-interface {
                margin-top: 15px;
            }

            .tabs-nav {
                overflow-x: auto;
                white-space: nowrap;
                -webkit-overflow-scrolling: touch;
            }
            .tab-button {
                flex-shrink: 0;
            }

            .contact-info-grid {
                grid-template-columns: 1fr; /* Single column on mobile */
            }

            .modal-content {
                width: 95%;
                padding: 20px;
                max-height: 95vh;
            }

            .modal-header h2 {
                font-size: 20px;
            }

            .modal-footer {
                flex-direction: column-reverse;
                gap: 15px;
            }
            .modal-footer button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="left-panel" id="contactListPanel">
            <h1>Contacts</h1>

            <div class="search-bar">
                <input type="text" id="contactSearchInput" placeholder="Search contacts...">
                <div class="icon" style="position: absolute; right: 35px; top: 12px; color: var(--neutral-blue);">&#x1F50D;</div> </div>

            <div class="quick-filter-chips">
                <span class="filter-chip active" data-filter="all">All</span>
                <span class="filter-chip" data-filter="favorites">Favorites</span>
                <span class="filter-chip" data-filter="recent">Recent</span>
                <span class="filter-chip" data-filter="companies">Companies</span>
                <span class="filter-chip" data-filter="individuals">Individuals</span>
            </div>

            <div class="contact-list" id="contactList">
                </div>

            <div class="alphabetical-nav">
                </div>

            <button class="add-contact-fab" id="addNewContactFAB" title="Add New Contact">
                <span class="icon">&#x2795;</span> </button>
        </div>

        <div class="right-panel" id="contactDetailsPanel">
            <div id="noContactSelected" style="text-align: center; padding: 50px; color: var(--neutral-blue);">
                <p>Select a contact from the left panel to view details.</p>
            </div>
            <div id="contactDetailContent" style="display: none;">
                <div class="contact-header">
                    <div class="contact-avatar" id="detailAvatar"></div>
                    <div class="contact-header-info">
                        <h2 id="detailName"></h2>
                        <p id="detailJobTitleCompany"></p>
                        <span class="status" id="detailStatus"></span>
                    </div>
                </div>

                <div class="quick-actions-bar">
                    <button><span class="icon">&#x260E;</span> Call</button>
                    <button><span class="icon">&#x2709;</span> Email</button>
                    <button><span class="icon">&#x1F4AC;</span> Message</button>
                    <button><span class="icon">&#x1F4C5;</span> Schedule Meeting</button>
                    <button class="secondary"><span class="icon">&#x270E;</span> Edit Contact</button>
                </div>

                <div class="tabbed-interface">
                    <div class="tabs-nav">
                        <button class="tab-button active" data-tab="overview">Overview</button>
                        <button class="tab-button" data-tab="interactions">Interactions</button>
                        <button class="tab-button" data-tab="opportunities">Opportunities</button>
                        <button class="tab-button" data-tab="documents">Documents</button>
                        <button class="tab-button" data-tab="notes">Notes</button>
                    </div>

                    <div id="overviewTab" class="tab-content active">
                        <h3>Contact Information</h3>
                        <div class="contact-info-grid" id="contactInfoGrid">
                            <div class="info-item">
                                <label>Phone</label>
                                <div class="value" id="detailPhone">
                                    <span></span>
                                    <span class="icon copy-icon" data-copy-target="detailPhone">&#x2398;</span>
                                </div>
                            </div>
                            <div class="info-item">
                                <label>Email</label>
                                <div class="value" id="detailEmail">
                                    <span></span>
                                    <span class="icon copy-icon" data-copy-target="detailEmail">&#x2398;</span>
                                </div>
                            </div>
                            <div class="info-item">
                                <label>Address</label>
                                <div class="value" id="detailAddress">
                                    <span></span>
                                    <span class="icon copy-icon" data-copy-target="detailAddress">&#x2398;</span>
                                </div>
                            </div>
                            <div class="info-item">
                                <label>Website</label>
                                <div class="value" id="detailWebsite">
                                    <a href="#" target="_blank"></a>
                                    <span class="icon copy-icon" data-copy-target="detailWebsite">&#x2398;</span>
                                </div>
                            </div>
                            <div class="info-item">
                                <label>Source</label>
                                <div class="value" id="detailSource"><span></span></div>
                            </div>
                            <div class="info-item">
                                <label>Tags</label>
                                <div class="value" id="detailTags"></div>
                            </div>
                        </div>
                    </div>

                    <div id="interactionsTab" class="tab-content">
                        <h3>Recent Activity Timeline</h3>
                        <div class="activity-timeline" id="activityTimeline">
                            </div>
                    </div>

                    <div id="opportunitiesTab" class="tab-content">
                        <p>No opportunities found for this contact.</p>
                    </div>

                    <div id="documentsTab" class="tab-content">
                        <p>No documents associated with this contact.</p>
                    </div>

                    <div id="notesTab" class="tab-content">
                        <p>No notes for this contact yet.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal-overlay" id="addContactModal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 id="modalTitle">Add New Contact</h2>
                <button class="modal-close-button" id="closeModalButton">&times;</button>
            </div>
            <div class="modal-body">
                <form id="addContactForm">
                    <div class="form-step active" data-step="1">
                        <div class="form-group" id="fullNameGroup">
                            <label for="fullName">Full Name <span style="color: #D32F2F;">*</span></label>
                            <input type="text" id="fullName" name="fullName" placeholder="e.g., John Doe" required>
                            <div class="error-message">Full Name is required.</div>
                        </div>
                        <div class="form-group" id="emailGroup">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" name="email" placeholder="e.g., john.doe@example.com">
                            <div class="error-message">Invalid email format.</div>
                            <div class="duplicate-warning" id="emailDuplicateWarning">Warning: This email already exists in your contacts.</div>
                        </div>
                        <div class="form-group" id="phoneGroup">
                            <label for="phone">Phone Number</label>
                            <input type="tel" id="phone" name="phone" placeholder="e.g., +1 (555) 123-4567">
                            <div class="error-message">Invalid phone number format.</div>
                            <div class="duplicate-warning" id="phoneDuplicateWarning">Warning: This phone number already exists in your contacts.</div>
                        </div>
                        <div class="form-group">
                            <label for="jobTitle">Job Title</label>
                            <input type="text" id="jobTitle" name="jobTitle" placeholder="e.g., Senior Account Manager">
                        </div>
                    </div>

                    <div class="form-step" data-step="2">
                        <div class="form-group">
                            <label for="organization">Organization</label>
                            <select id="organization" name="organization">
                                <option value="">Select an Organization (Optional)</option>
                                <option value="Tech Solutions Inc.">Tech Solutions Inc.</option>
                                <option value="Global Innovations">Global Innovations</option>
                                <option value="New Organization">Create New Organization...</option>
                            </select>
                        </div>
                        <div class="form-group" id="newOrganizationGroup" style="display: none;">
                            <label for="newOrganizationName">New Organization Name <span style="color: #D32F2F;">*</span></label>
                            <input type="text" id="newOrganizationName" name="newOrganizationName" placeholder="e.g., Acme Corp">
                            <div class="error-message">New Organization Name is required.</div>
                        </div>
                        <div class="form-group">
                            <label for="department">Department</label>
                            <input type="text" id="department" name="department" placeholder="e.g., Sales, Marketing">
                        </div>
                        <div class="form-group">
                            <label for="relationship">Organization Relationship</label>
                            <select id="relationship" name="relationship">
                                <option value="Primary Contact">Primary Contact</option>
                                <option value="Secondary Contact">Secondary Contact</option>
                                <option value="Decision Maker">Decision Maker</option>
                                <option value="Influencer">Influencer</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <textarea id="address" name="address" placeholder="Auto-populated from organization or manual entry"></textarea>
                        </div>
                    </div>

                    <div class="form-step" data-step="3">
                        <div class="form-group">
                            <label for="contactSource">Contact Source</label>
                            <select id="contactSource" name="contactSource">
                                <option value="Website">Website</option>
                                <option value="Referral">Referral</option>
                                <option value="Trade Show">Trade Show</option>
                                <option value="Cold Call">Cold Call</option>
                                <option value="Social Media">Social Media</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="tags">Tags (comma-separated)</label>
                            <input type="text" id="tags" name="tags" placeholder="e.g., VIP, Lead, Investor">
                        </div>
                        <div class="form-group">
                            <label>Communication Preferences</label>
                            <div>
                                <input type="checkbox" id="prefEmail" name="commPref" value="Email" checked>
                                <label for="prefEmail" style="display: inline-block; margin-left: 5px;">Email</label>
                            </div>
                            <div>
                                <input type="checkbox" id="prefPhone" name="commPref" value="Phone" checked>
                                <label for="prefPhone" style="display: inline-block; margin-left: 5px;">Phone</label>
                            </div>
                            <div>
                                <input type="checkbox" id="prefMessage" name="commPref" value="Message">
                                <label for="prefMessage" style="display: inline-block; margin-left: 5px;">Message</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="notes">Notes</label>
                            <textarea id="notes" name="notes" placeholder="Initial contact context or important details"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="secondary" id="prevStepBtn" style="display: none;">Previous</button>
                <button type="button" id="nextStepBtn">Next</button>
                <button type="submit" class="accent" id="submitContactBtn" style="display: none;">Add Contact</button>
            </div>
            <div class="modal-progress">
                <span class="progress-dot active" data-step="1"></span>
                <span class="progress-dot" data-step="2"></span>
                <span class="progress-dot" data-step="3"></span>
            </div>
        </div>
    </div>

    <script>
        const contacts = [
            {
                id: 'c1',
                avatar: 'https://i.pravatar.cc/150?img=68',
                name: 'Alice Johnson',
                firstName: 'Alice',
                lastName: 'Johnson',
                jobTitle: 'Head of Sales',
                organization: 'Global Innovations',
                status: 'Active Client',
                lastInteraction: '2025-07-05',
                phone: '+1 (234) 567-8901',
                email: 'alice.j@globalinno.com',
                address: '123 Tech Park, Silicon Valley, CA 94025',
                website: 'https://globalinnovations.com',
                source: 'Trade Show',
                tags: ['VIP', 'Key Account'],
                activities: [
                    { type: 'call', title: 'Discussed Q3 Projections', date: '2025-07-05', time: '10:30 AM', notes: 'Positive outlook, interested in new product.' },
                    { type: 'email', title: 'Follow-up on product demo', date: '2025-06-28', time: '02:00 PM', notes: 'Sent detailed pricing info.' }
                ]
            },
            {
                id: 'c2',
                avatar: 'https://i.pravatar.cc/150?img=32',
                name: 'Bob Williams',
                firstName: 'Bob',
                lastName: 'Williams',
                jobTitle: 'Software Engineer',
                organization: 'Tech Solutions Inc.',
                status: 'Prospect',
                lastInteraction: '2025-07-01',
                phone: '+1 (987) 654-3210',
                email: 'bob.w@techsol.com',
                address: '456 Innovation Dr, Austin, TX 78701',
                website: 'https://techsolutionsinc.com',
                source: 'Website',
                tags: ['Developer', 'New Lead'],
                activities: [
                    { type: 'note', title: 'Initial lead qualification', date: '2025-07-01', time: '09:00 AM', notes: 'Responded to web inquiry, interested in API integration.' },
                    { type: 'email', title: 'Sent introductory email', date: '2025-06-25', time: '04:15 PM', notes: 'Provided link to developer documentation.' }
                ]
            },
            {
                id: 'c3',
                avatar: '', // No avatar, use initials
                name: 'Catherine Lee',
                firstName: 'Catherine',
                lastName: 'Lee',
                jobTitle: 'Marketing Manager',
                organization: 'Apex Marketing',
                status: 'Active Client',
                lastInteraction: '2025-06-20',
                phone: '+1 (555) 111-2222',
                email: 'catherine.l@apexmark.com',
                address: '789 Business Blvd, Seattle, WA 98101',
                website: 'https://apexmarketing.co',
                source: 'Referral',
                tags: ['Client', 'Marketing'],
                activities: [
                    { type: 'meeting', title: 'Monthly Strategy Review', date: '2025-06-20', time: '11:00 AM', notes: 'Discussed campaign performance and next steps.' }
                ]
            },
            {
                id: 'c4',
                avatar: 'https://i.pravatar.cc/150?img=50',
                name: 'David Chen',
                firstName: 'David',
                lastName: 'Chen',
                jobTitle: 'Financial Analyst',
                organization: 'Global Innovations',
                status: 'Lead',
                lastInteraction: '2025-07-03',
                phone: '+1 (777) 888-9999',
                email: 'david.c@globalinno.com',
                address: '123 Tech Park, Silicon Valley, CA 94025',
                website: 'https://globalinnovations.com',
                source: 'Cold Call',
                tags: ['Finance', 'Decision Maker'],
                activities: [
                    { type: 'call', title: 'Initial contact via cold call', date: '2025-07-03', time: '01:00 PM', notes: 'Expressed mild interest, sent brochure.' }
                ]
            },
            {
                id: 'c5',
                avatar: 'https://i.pravatar.cc/150?img=25',
                name: 'Emily White',
                firstName: 'Emily',
                lastName: 'White',
                jobTitle: 'HR Director',
                organization: 'Future Innovations Co.',
                status: 'Active Client',
                lastInteraction: '2025-07-06',
                phone: '+1 (333) 444-5555',
                email: 'emily.w@futureinno.com',
                address: '901 Corporate Ave, Boston, MA 02110',
                website: 'https://futureinnovations.com',
                source: 'Website',
                tags: ['HR', 'Client'],
                activities: [
                    { type: 'email', title: 'Provided HR system update', date: '2025-07-06', time: '09:00 AM', notes: 'Confirmed successful deployment of new module.' },
                    { type: 'note', title: 'Onboarding complete', date: '2025-06-15', time: '03:00 PM', notes: 'Initial setup of HR portal finished.' }
                ]
            },
            {
                id: 'c6',
                avatar: '',
                name: 'Frank Miller',
                firstName: 'Frank',
                lastName: 'Miller',
                jobTitle: 'Product Manager',
                organization: 'Tech Solutions Inc.',
                status: 'Prospect',
                lastInteraction: '2025-06-29',
                phone: '+1 (222) 333-4444',
                email: 'frank.m@techsol.com',
                address: '456 Innovation Dr, Austin, TX 78701',
                website: 'https://techsolutionsinc.com',
                source: 'Referral',
                tags: ['Product', 'Influencer'],
                activities: [
                    { type: 'email', title: 'Shared product roadmap', date: '2025-06-29', time: '11:00 AM', notes: 'Requested feedback on upcoming features.' }
                ]
            },
            {
                id: 'c7',
                avatar: 'https://i.pravatar.cc/150?img=12',
                name: 'Grace Kim',
                firstName: 'Grace',
                lastName: 'Kim',
                jobTitle: 'Account Executive',
                organization: 'SalesForce Inc.',
                status: 'Partner',
                lastInteraction: '2025-07-04',
                phone: '+1 (111) 222-3333',
                email: 'grace.k@salesforce.com',
                address: '1 Market St, San Francisco, CA 94105',
                website: 'https://salesforce.com',
                source: 'Partnership',
                tags: ['Partner', 'CRM'],
                activities: [
                    { type: 'meeting', title: 'Partner Sync-up Call', date: '2025-07-04', time: '09:00 AM', notes: 'Discussed joint marketing initiatives.' }
                ]
            },
            {
                id: 'c8',
                avatar: '',
                name: 'Henry Davis',
                firstName: 'Henry',
                lastName: 'Davis',
                jobTitle: 'CEO',
                organization: 'Startup X',
                status: 'New Lead',
                lastInteraction: '2025-07-07',
                phone: '+1 (444) 555-6666',
                email: 'henry.d@startupx.co',
                address: '88 Innovation Hub, Denver, CO 80202',
                website: 'https://startupx.co',
                source: 'Cold Call',
                tags: ['CEO', 'New Lead'],
                activities: [
                    { type: 'call', title: 'Initial cold outreach', date: '2025-07-07', time: '03:00 PM', notes: 'Left voicemail, sent follow-up email.' }
                ]
            },
            {
                id: 'c9',
                avatar: 'https://i.pravatar.cc/150?img=42',
                name: 'Ivy Brown',
                firstName: 'Ivy',
                lastName: 'Brown',
                jobTitle: 'UX Designer',
                organization: 'Design Labs',
                status: 'Influencer',
                lastInteraction: '2025-06-18',
                phone: '+1 (666) 777-8888',
                email: 'ivy.b@designlabs.com',
                address: '22 Design Studio, Portland, OR 97204',
                website: 'https://designlabs.com',
                source: 'Social Media',
                tags: ['Design', 'Influencer'],
                activities: [
                    { type: 'email', title: 'Shared UI/UX whitepaper', date: '2025-06-18', time: '10:00 AM', notes: 'Requested feedback on recent design trends.' }
                ]
            },
            {
                id: 'c10',
                avatar: 'https://i.pravatar.cc/150?img=19',
                name: 'Jack Green',
                firstName: 'Jack',
                lastName: 'Green',
                jobTitle: 'Sales Representative',
                organization: 'Global Innovations',
                status: 'Active Client',
                lastInteraction: '2025-07-02',
                phone: '+1 (777) 123-4567',
                email: 'jack.g@globalinno.com',
                address: '123 Tech Park, Silicon Valley, CA 94025',
                website: 'https://globalinnovations.com',
                source: 'Referral',
                tags: ['Client', 'Sales'],
                activities: [
                    { type: 'call', title: 'Checked in on Q3 targets', date: '2025-07-02', time: '09:30 AM', notes: 'Confirmed they are on track.' }
                ]
            }
        ];

        let currentActiveContactId = null;
        let currentModalStep = 1;

        const contactListDiv = document.getElementById('contactList');
        const contactSearchInput = document.getElementById('contactSearchInput');
        const filterChips = document.querySelectorAll('.filter-chip');
        const alphabeticalNav = document.querySelector('.alphabetical-nav');
        const contactDetailsPanel = document.getElementById('contactDetailsPanel');
        const noContactSelectedDiv = document.getElementById('noContactSelected');
        const contactDetailContent = document.getElementById('contactDetailContent');

        const detailAvatar = document.getElementById('detailAvatar');
        const detailName = document.getElementById('detailName');
        const detailJobTitleCompany = document.getElementById('detailJobTitleCompany');
        const detailStatus = document.getElementById('detailStatus');
        const detailPhone = document.getElementById('detailPhone').querySelector('span');
        const detailEmail = document.getElementById('detailEmail').querySelector('span');
        const detailAddress = document.getElementById('detailAddress').querySelector('span');
        const detailWebsite = document.getElementById('detailWebsite').querySelector('a');
        const detailSource = document.getElementById('detailSource').querySelector('span');
        const detailTags = document.getElementById('detailTags');
        const activityTimeline = document.getElementById('activityTimeline');

        const tabButtons = document.querySelectorAll('.tab-button');
        const tabContents = document.querySelectorAll('.tab-content');

        const addNewContactFAB = document.getElementById('addNewContactFAB');
        const addContactModal = document.getElementById('addContactModal');
        const closeModalButton = document.getElementById('closeModalButton');
        const addContactForm = document.getElementById('addContactForm');
        const formSteps = document.querySelectorAll('.form-step');
        const prevStepBtn = document.getElementById('prevStepBtn');
        const nextStepBtn = document.getElementById('nextStepBtn');
        const submitContactBtn = document.getElementById('submitContactBtn');
        const progressDots = document.querySelectorAll('.progress-dot');

        const fullNameInput = document.getElementById('fullName');
        const emailInput = document.getElementById('email');
        const phoneInput = document.getElementById('phone');
        const organizationSelect = document.getElementById('organization');
        const newOrganizationGroup = document.getElementById('newOrganizationGroup');
        const newOrganizationNameInput = document.getElementById('newOrganizationName');
        const emailDuplicateWarning = document.getElementById('emailDuplicateWarning');
        const phoneDuplicateWarning = document.getElementById('phoneDuplicateWarning');

        // Helper to format dates
        const formatDate = (dateString) => {
            const options = { year: 'numeric', month: 'short', day: 'numeric' };
            return new Date(dateString).toLocaleDateString('en-US', options);
        };

        // Get initials from name
        const getInitials = (name) => {
            if (!name) return '';
            const parts = name.split(' ');
            if (parts.length === 1) return parts[0].charAt(0).toUpperCase();
            return parts.map(part => part.charAt(0)).join('').toUpperCase();
        };

        // Render Contact List
        const renderContactList = (filteredContacts = contacts) => {
            contactListDiv.innerHTML = '';
            // Sort contacts alphabetically by last name, then first name
            const sortedContacts = [...filteredContacts].sort((a, b) => {
                const lastNameCompare = a.lastName.localeCompare(b.lastName);
                if (lastNameCompare === 0) {
                    return a.firstName.localeCompare(b.firstName);
                }
                return lastNameCompare;
            });

            sortedContacts.forEach(contact => {
                const card = document.createElement('div');
                card.classList.add('contact-card');
                if (currentActiveContactId === contact.id) {
                    card.classList.add('active');
                }
                card.dataset.id = contact.id;

                const avatarDiv = document.createElement('div');
                avatarDiv.classList.add('contact-avatar');
                if (contact.avatar) {
                    const img = document.createElement('img');
                    img.src = contact.avatar;
                    img.alt = contact.name;
                    avatarDiv.appendChild(img);
                } else {
                    avatarDiv.textContent = getInitials(contact.name);
                }

                const infoDiv = document.createElement('div');
                infoDiv.classList.add('contact-info');
                infoDiv.innerHTML = `
                    <h3>${contact.name}</h3>
                    <p>${contact.jobTitle || 'N/A'} ${contact.organization ? 'at ' + contact.organization : ''}</p>
                    <small>Last interaction: ${formatDate(contact.lastInteraction)}</small>
                `;

                card.appendChild(avatarDiv);
                card.appendChild(infoDiv);

                card.addEventListener('click', () => displayContactDetails(contact.id));
                contactListDiv.appendChild(card);
            });
        };

        // Render Alphabetical Navigation
        const renderAlphabeticalNav = () => {
            alphabeticalNav.innerHTML = '';
            const letters = Array.from(new Set(contacts.map(c => c.lastName.charAt(0).toUpperCase()))).sort();
            letters.forEach(letter => {
                const span = document.createElement('span');
                span.textContent = letter;
                span.dataset.letter = letter;
                span.addEventListener('click', () => {
                    const targetContactCard = document.querySelector(`.contact-card h3`)
                    if (targetContactCard) {
                        targetContactCard.scrollIntoView({ behavior: 'smooth', block: 'start' });
                    }
                });
                alphabeticalNav.appendChild(span);
            });
        };


        // Display Contact Details
        const displayContactDetails = (id) => {
            const contact = contacts.find(c => c.id === id);
            if (!contact) {
                noContactSelectedDiv.style.display = 'block';
                contactDetailContent.style.display = 'none';
                return;
            }

            // Update active state in contact list
            document.querySelectorAll('.contact-card').forEach(card => card.classList.remove('active'));
            document.querySelector(`.contact-card[data-id="${id}"]`).classList.add('active');
            currentActiveContactId = id;

            // Show right panel on mobile
            if (window.innerWidth <= 1024) {
                contactDetailsPanel.classList.add('active');
                contactListPanel.style.display = 'none';
            }

            // Populate header
            if (contact.avatar) {
                detailAvatar.innerHTML = `<img src="${contact.avatar}" alt="${contact.name}">`;
            } else {
                detailAvatar.innerHTML = '';
                detailAvatar.textContent = getInitials(contact.name);
            }

            detailName.textContent = contact.name;
            detailJobTitleCompany.textContent = `${contact.jobTitle || 'N/A'} ${contact.organization ? 'at ' + contact.organization : ''}`;
            detailStatus.textContent = contact.status;
            detailStatus.style.backgroundColor = contact.status === 'Active Client' ? 'var(--accent-green)' : 'var(--neutral-blue)'; // Simple status coloring

            // Populate Overview tab
            detailPhone.textContent = contact.phone || 'N/A';
            detailEmail.textContent = contact.email || 'N/A';
            detailAddress.textContent = contact.address || 'N/A';
            if (contact.website) {
                detailWebsite.textContent = contact.website.replace(/^(https?:\/\/)?(www\.)?/, '');
                detailWebsite.href = contact.website.startsWith('http') ? contact.website : `https://${contact.website}`;
            } else {
                detailWebsite.textContent = 'N/A';
                detailWebsite.href = '#';
            }
            detailSource.textContent = contact.source || 'N/A';
            detailTags.innerHTML = contact.tags && contact.tags.length > 0
                ? contact.tags.map(tag => `<span class="filter-chip" style="background-color: var(--light-blue); color: var(--dark-blue);">${tag}</span>`).join(' ')
                : 'N/A';

            // Populate Interactions tab
            activityTimeline.innerHTML = '';
            if (contact.activities && contact.activities.length > 0) {
                contact.activities.sort((a, b) => new Date(b.date) - new Date(a.date)).forEach(activity => {
                    const item = document.createElement('div');
                    item.classList.add('activity-item');
                    item.innerHTML = `
                        <div class="activity-icon ${activity.type}">
                            ${activity.type === 'call' ? '&#x260E;' :
                               activity.type === 'email' ? '&#x2709;' :
                               activity.type === 'meeting' ? '&#x1F4C5;' :
                               '&#x1F4DD;'}
                        </div>
                        <div class="activity-content">
                            <h3>${activity.title}</h3>
                            <p>${activity.notes || ''}</p>
                            <small>${formatDate(activity.date)} at ${activity.time || ''}</small>
                        </div>
                    `;
                    activityTimeline.appendChild(item);
                });
            } else {
                activityTimeline.innerHTML = '<p style="color: var(--neutral-blue);">No recent activity for this contact.</p>';
            }

            noContactSelectedDiv.style.display = 'none';
            contactDetailContent.style.display = 'block';

            // Reset tabs to Overview
            tabButtons.forEach(btn => btn.classList.remove('active'));
            tabContents.forEach(content => content.classList.remove('active'));
            document.querySelector('.tab-button[data-tab="overview"]').classList.add('active');
            document.getElementById('overviewTab').classList.add('active');
        };

        // Search and Filter functionality
        contactSearchInput.addEventListener('keyup', (e) => {
            const searchTerm = e.target.value.toLowerCase();
            const filtered = contacts.filter(contact =>
                contact.name.toLowerCase().includes(searchTerm) ||
                contact.organization.toLowerCase().includes(searchTerm) ||
                contact.email.toLowerCase().includes(searchTerm) ||
                contact.phone.replace(/\D/g, '').includes(searchTerm.replace(/\D/g, ''))
            );
            renderContactList(filtered);
        });

        filterChips.forEach(chip => {
            chip.addEventListener('click', (e) => {
                filterChips.forEach(c => c.classList.remove('active'));
                e.target.classList.add('active');
                const filterType = e.target.dataset.filter;
                let filteredContacts = contacts;
                if (filterType === 'favorites') {
                    // Placeholder for favorites logic
                    filteredContacts = contacts.slice(0, 3); // Just show first 3 as example
                } else if (filterType === 'recent') {
                    filteredContacts = [...contacts].sort((a,b) => new Date(b.lastInteraction) - new Date(a.lastInteraction)).slice(0,5);
                } else if (filterType === 'companies') {
                    filteredContacts = contacts.filter(c => c.organization);
                } else if (filterType === 'individuals') {
                    filteredContacts = contacts.filter(c => !c.organization || c.jobTitle === 'N/A'); // Simplified
                }
                renderContactList(filteredContacts);
            });
        });

        // Tab Navigation
        tabButtons.forEach(button => {
            button.addEventListener('click', () => {
                tabButtons.forEach(btn => btn.classList.remove('active'));
                tabContents.forEach(content => content.classList.remove('active'));

                button.classList.add('active');
                document.getElementById(`${button.dataset.tab}Tab`).classList.add('active');
            });
        });

        // Copy to clipboard
        document.querySelectorAll('.copy-icon').forEach(icon => {
            icon.addEventListener('click', (e) => {
                const targetId = e.target.dataset.copyTarget;
                const targetElement = document.getElementById(targetId);
                const textToCopy = targetElement.querySelector('span') ? targetElement.querySelector('span').textContent : targetElement.textContent;

                navigator.clipboard.writeText(textToCopy).then(() => {
                    e.target.textContent = '&#x2713;'; // Checkmark icon
                    setTimeout(() => {
                        e.target.textContent = '&#x2398;'; // Original copy icon
                    }, 1000);
                }).catch(err => {
                    console.error('Failed to copy: ', err);
                });
            });
        });

        // Add New Contact Modal Logic
        const showModal = () => {
            addContactModal.classList.add('active');
            document.body.style.overflow = 'hidden'; // Prevent background scroll
            currentModalStep = 1;
            updateModalStep();
            addContactForm.reset(); // Clear form on open
            hideAllErrors();
            emailDuplicateWarning.classList.remove('active');
            phoneDuplicateWarning.classList.remove('active');
            newOrganizationGroup.style.display = 'none';
            newOrganizationNameInput.removeAttribute('required');
        };

        const hideModal = () => {
            addContactModal.classList.remove('active');
            document.body.style.overflow = ''; // Restore background scroll
        };

        const updateModalStep = () => {
            formSteps.forEach(step => {
                step.classList.remove('active');
                if (parseInt(step.dataset.step) === currentModalStep) {
                    step.classList.add('active');
                }
            });

            progressDots.forEach(dot => dot.classList.remove('active'));
            document.querySelector(`.progress-dot[data-step="${currentModalStep}"]`).classList.add('active');

            prevStepBtn.style.display = currentModalStep === 1 ? 'none' : 'block';
            nextStepBtn.style.display = currentModalStep === formSteps.length ? 'none' : 'block';
            submitContactBtn.style.display = currentModalStep === formSteps.length ? 'block' : 'none';

            document.getElementById('modalTitle').textContent = `Add New Contact - Step ${currentModalStep} of ${formSteps.length}`;
        };

        const validateStep = (step) => {
            let isValid = true;
            const currentStepDiv = document.querySelector(`.form-step[data-step="${step}"]`);
            const requiredInputs = currentStepDiv.querySelectorAll('[required]');

            requiredInputs.forEach(input => {
                const formGroup = input.closest('.form-group');
                if (input.value.trim() === '') {
                    formGroup.classList.add('has-error');
                    isValid = false;
                } else {
                    formGroup.classList.remove('has-error');
                }
            });

            // Specific validations
            if (step === 1) {
                // Email validation
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (emailInput.value.trim() !== '' && !emailRegex.test(emailInput.value.trim())) {
                    emailInput.closest('.form-group').classList.add('has-error');
                    emailInput.closest('.form-group').querySelector('.error-message').textContent = 'Invalid email format.';
                    isValid = false;
                } else if (emailInput.value.trim() !== '') {
                    emailInput.closest('.form-group').classList.remove('has-error');
                }

                // Phone validation (basic)
                const phoneRegex = /^(\+\d{1,3}[- ]?)?\d{10}$|^\d{10}$|^(\(\d{3}\)[- ]?)?\d{3}[- ]?\d{4}$/; // Allows various formats
                if (phoneInput.value.trim() !== '' && !phoneRegex.test(phoneInput.value.trim().replace(/\s/g, '').replace(/[-()]/g, ''))) {
                    phoneInput.closest('.form-group').classList.add('has-error');
                    phoneInput.closest('.form-group').querySelector('.error-message').textContent = 'Invalid phone number format.';
                    isValid = false;
                } else if (phoneInput.value.trim() !== '') {
                    phoneInput.closest('.form-group').classList.remove('has-error');
                }

                // Duplicate detection
                emailDuplicateWarning.classList.remove('active');
                phoneDuplicateWarning.classList.remove('active');
                if (emailInput.value.trim() && contacts.some(c => c.email.toLowerCase() === emailInput.value.trim().toLowerCase())) {
                    emailDuplicateWarning.classList.add('active');
                }
                if (phoneInput.value.trim() && contacts.some(c => c.phone && c.phone.replace(/\D/g, '') === phoneInput.value.trim().replace(/\D/g, ''))) {
                    phoneDuplicateWarning.classList.add('active');
                }
            } else if (step === 2) {
                if (organizationSelect.value === 'New Organization') {
                    newOrganizationNameInput.setAttribute('required', 'required');
                    if (newOrganizationNameInput.value.trim() === '') {
                        newOrganizationGroup.classList.add('has-error');
                        isValid = false;
                    } else {
                        newOrganizationGroup.classList.remove('has-error');
                    }
                } else {
                    newOrganizationNameInput.removeAttribute('required');
                    newOrganizationGroup.classList.remove('has-error');
                }
            }

            return isValid;
        };

        const hideAllErrors = () => {
            document.querySelectorAll('.form-group.has-error').forEach(el => el.classList.remove('has-error'));
        };

        // Event Listeners for Modal
        addNewContactFAB.addEventListener('click', showModal);
        closeModalButton.addEventListener('click', hideModal);
        addContactModal.addEventListener('click', (e) => {
            if (e.target === addContactModal) {
                hideModal();
            }
        });

        prevStepBtn.addEventListener('click', () => {
            if (currentModalStep > 1) {
                currentModalStep--;
                updateModalStep();
                hideAllErrors(); // Clear errors when navigating back
            }
        });

        nextStepBtn.addEventListener('click', () => {
            if (validateStep(currentModalStep)) {
                if (currentModalStep < formSteps.length) {
                    currentModalStep++;
                    updateModalStep();
                }
            }
        });

        submitContactBtn.addEventListener('click', (e) => {
            e.preventDefault();
            if (validateStep(currentModalStep)) {
                const formData = new FormData(addContactForm);
                const newContact = {};
                for (let [key, value] of formData.entries()) {
                    newContact[key] = value;
                }

                // Basic name parsing
                const fullNameParts = newContact.fullName.split(' ');
                newContact.firstName = fullNameParts[0];
                newContact.lastName = fullNameParts.length > 1 ? fullNameParts[fullNameParts.length - 1] : '';

                // Handle tags
                newContact.tags = newContact.tags ? newContact.tags.split(',').map(tag => tag.trim()).filter(tag => tag !== '') : [];

                // Assign a new ID and default interaction date
                newContact.id = `c${contacts.length + 1}`;
                newContact.lastInteraction = new Date().toISOString().split('T')[0]; // Current date
                newContact.avatar = ''; // No avatar by default for new contacts
                newContact.status = 'New Lead'; // Default status for new contacts
                newContact.activities = [{ type: 'note', title: 'Contact Created', date: newContact.lastInteraction, time: new Date().toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit' }), notes: 'New contact added via form.' }];

                // If "Create New Organization" was selected, add it
                if (newContact.organization === 'New Organization' && newContact.newOrganizationName) {
                    newContact.organization = newContact.newOrganizationName;
                }
                delete newContact.newOrganizationName; // Clean up form data

                contacts.unshift(newContact); // Add to the beginning of the list
                renderContactList();
                displayContactDetails(newContact.id); // Show details of newly added contact
                hideModal();
                alert('Contact added successfully!');
            }
        });

        // Toggle visibility of New Organization Name input
        organizationSelect.addEventListener('change', () => {
            if (organizationSelect.value === 'New Organization') {
                newOrganizationGroup.style.display = 'block';
                newOrganizationNameInput.setAttribute('required', 'required');
            } else {
                newOrganizationGroup.style.display = 'none';
                newOrganizationNameInput.removeAttribute('required');
                newOrganizationGroup.classList.remove('has-error'); // Clear error if hidden
            }
        });

        // Initialize display
        renderContactList();
        renderAlphabeticalNav();
        displayContactDetails(contacts[0].id); // Display details of the first contact by default

        // Mobile responsiveness: Toggle left/right panels
        if (window.innerWidth <= 1024) {
            // Initially hide right panel on mobile if no specific contact ID is in URL/storage
            contactDetailsPanel.classList.remove('active');
            contactListPanel.style.display = 'flex'; // Ensure left panel is visible

            // Handle back button for mobile
            window.addEventListener('popstate', () => {
                if (window.location.hash === '#contacts') {
                    contactDetailsPanel.classList.remove('active');
                    contactListPanel.style.display = 'flex';
                }
            });

            // Update displayContactDetails to push history state for mobile
            const originalDisplayContactDetails = displayContactDetails;
            displayContactDetails = (id) => {
                originalDisplayContactDetails(id);
                if (window.innerWidth <= 1024) {
                    window.history.pushState({ panel: 'details', contactId: id }, '', '#details');
                }
            };

            // Add an implicit back button in the header of the right panel for mobile
            const detailHeader = document.querySelector('.contact-header');
            const backButton = document.createElement('button');
            backButton.innerHTML = '&larr; Back'; // Left arrow
            backButton.classList.add('secondary');
            backButton.style.marginRight = '15px';
            backButton.style.display = 'none'; // Hidden by default, shown on mobile
            backButton.style.padding = '8px 12px';
            backButton.style.fontSize = '14px';
            backButton.onclick = () => {
                contactDetailsPanel.classList.remove('active');
                contactListPanel.style.display = 'flex';
                window.history.pushState({ panel: 'list' }, '', '#contacts');
            };
            detailHeader.prepend(backButton);

            // Show/hide back button based on panel visibility
            const observer = new MutationObserver((mutationsList, observer) => {
                for(let mutation of mutationsList) {
                    if (mutation.attributeName === 'class') {
                        if (contactDetailsPanel.classList.contains('active')) {
                            backButton.style.display = 'inline-flex';
                            detailHeader.style.flexDirection = 'row'; // Align items in a row
                            detailHeader.style.alignItems = 'center';
                        } else {
                            backButton.style.display = 'none';
                            detailHeader.style.flexDirection = 'column'; // Restore column layout
                            detailHeader.style.alignItems = 'flex-start';
                        }
                    }
                }
            });
            observer.observe(contactDetailsPanel, { attributes: true });

            // Initial state for mobile
            window.history.replaceState({ panel: 'list' }, '', '#contacts');
        }
    </script>
</body>
</html>
```