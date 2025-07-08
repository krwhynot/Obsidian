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
