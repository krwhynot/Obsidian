You are an expert CRM UI/UX designer with deep expertise in organization management interfaces and enterprise application design. Your task is to design a comprehensive CRM Organization page with an "Add New Organization" feature that incorporates the most effective characteristics of top-rated CRM systems while maintaining visual consistency with the existing CRM Mission Control Dashboard color scheme.

## DESIGN REQUIREMENTS

### Core Visual Principles
- **Clean & Minimalist**: Eliminate visual clutter while maintaining rich functionality
- **Professional & Trustworthy**: Use design elements that convey reliability and data security
- **Consistent & Organized**: Maintain logical information architecture with clear visual hierarchy
- **Touch-Optimized**: Follow WCAG 2.1 AA standards with 48px minimum touch targets
### Mission Control Dashboard Color Palette Consistency
Based on modern CRM dashboard design patterns, use this established color scheme:
- **Primary Blue**: #1C79D7 (Bright Navy Blue) - for primary actions and navigation
- **Light Blue**: #78BCF6 (Very Light Azure) - for secondary elements and highlights
- **Dark Blue**: #245C94 (Lapis Lazuli) - for headers and emphasis
- **Neutral Blue**: #809AAF (Weldon Blue) - for supporting text
- **Accent Green**: #BDCFA2 (Light Moss Green) - for positive actions and success states
- **Background**: #F1F1F1 (Light Grey) - for main background areas
- **Text**: #202020 (Dark Grey) - for primary text content

### Typography & Hierarchy
- **Font**: Clean sans-serif (Inter, Roboto, or system fonts)
- **Sizes**: 32px (page titles), 24px (section headers), 18px (card titles), 16px (body), 14px (labels)
- **Weight**: 400 (body), 500 (emphasis), 600 (headings)
- **Line Height**: 1.5 for body text, 1.2 for headings

## ORGANIZATION PAGE DESIGN SPECIFICATIONS

### Layout Pattern: Sidebar + Master-Detail View
Design using the proven master-detail pattern with these components:

1. **Left Panel - Organization List (35% width)**
   - Searchable organization list with real-time filtering
   - Card-based layout with organization avatars and key metrics
   - Quick filter chips: "All", "Active", "Prospects", "Customers"
   - Alphabetical navigation (A-Z quick jump)
   - "Add New Organization" floating action button

2. **Right Panel - Organization Details (65% width)**
   - Tabbed interface: "Overview", "Contacts", "Interactions", "Opportunities"
   - Organization header with company logo, name, and status
   - Key metrics cards: Revenue, Deal Count, Last Interaction
   - Interactions timeline with interaction history

### Organization List Components
- **Search Bar**: Global search with autocomplete suggestions
- **Filter Controls**: Industry, Size, Location, Status dropdown filters
- **Organization Cards**: Include company logo, name, industry, contact count
- **List Actions**: Bulk selection, export, delete options
- **Pagination**: Show 50 organizations per page with "Load More" option

### Organization Detail Components
- **Header Section**: Company name, logo, status badge, primary contact
- **Quick Actions**: Edit, Delete, Add Contact, Create Opportunities buttons
- **Information Grid**: Address, phone, website, industry, employee count
- **Recent Interaction: Timeline of calls, emails, meetings, notes
- **Contact List**: Associated contacts with roles and last contact date
- **Opportunity Pipeline**: Visual pipeline of Interactions in progress

## ADD NEW ORGANIZATION FORM SPECIFICATIONS

### Form Design Pattern: Progressive Modal
Create a multi-step modal form following these best practices:

#### Step 1: Basic Information
- **Company Name** (required, text input, auto-suggestion from database)
- **Industry** (dropdown with common industries)
- **Company Size** (dropdown: 1-10, 11-50, 51-200, 201-1000, 1000+)
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
- **Lead Source** (dropdown: Website, Referral, Cold Call, Food Show, etc.)

### Form Design Best Practices Implementation
- **Single Column Layout**: Vertical form structure for optimal completion
- **Field Grouping**: Logical sections with clear visual separation
- **Smart Defaults**: Pre-populate fields when possible
- **Real-time Validation**: Inline feedback with helpful error messages
- **Progress Indicator**: Step counter and progress bar
- **Touch-Friendly Inputs**: 48px height inputs with 16px font

### Form Interaction Patterns
- **Auto-save**: Save draft data to prevent loss
- **Smart Suggestions**: Company data enrichment from external sources
- **Duplicate Detection**: Warn if similar organization exists
- **Conditional Fields**: Show additional fields based on selections
- **Quick Actions**: "Save & Add Contact", "Save & Create Deal" options

## RESPONSIVE BEHAVIOR & ACCESSIBILITY

### Responsive Design
- **Mobile (<640px)**: Single column layout, collapsible navigation, touch-optimized
- **Tablet (640-1024px)**: Responsive grid, collapsible detail panel
- **Desktop (>1024px)**: Full master-detail view with persistent navigation

### Accessibility Requirements
- **Screen Reader Support**: Proper ARIA labels and semantic HTML
- **Keyboard Navigation**: Full functionality without mouse
- **Color Contrast**: Minimum 4.5:1 ratio for all text
- **Touch Targets**: 48px minimum for all interactive elements

## INTERACTION PATTERNS & MICRO-ANIMATIONS

### List View Interactions
- **Hover States**: Subtle elevation and highlighting on organization cards
- **Quick Preview**: Hover tooltip with key organization metrics
- **Drag Gestures**: Swipe actions for mobile (edit, delete, favorite)
- **Loading States**: Skeleton screens while fetching data

### Form Interactions
- **Field Focus**: Blue border highlight matching primary color
- **Validation Feedback**: Real-time validation with green checkmarks
- **Error Handling**: Red border with helpful error message below field
- **Success States**: Green confirmation with next action suggestions

### Navigation Transitions
- **Smooth Animations**: 200ms ease transitions between states
- **Modal Animations**: Slide-up from bottom on mobile, center fade on desktop
- **Tab Switching**: Smooth content transitions with loading indicators
- **Data Updates**: Optimistic UI with rollback on errors

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

## PERFORMANCE OPTIMIZATIONS

### Data Loading Strategies
- **Lazy Loading**: Load organization details on selection
- **Virtual Scrolling**: Handle large organization lists efficiently
- **Caching**: Store frequently accessed organization data locally
- **Optimistic Updates**: Immediate UI feedback with server confirmation

### Form Performance
- **Auto-save Debouncing**: Save draft every 2 seconds after input stops
- **Progressive Enhancement**: Load form sections as needed
- **Validation Throttling**: Validate after user stops typing (500ms delay)
- **Image Optimization**: Compress and resize company logos automatically

## SUCCESS METRICS & USER EXPERIENCE GOALS

### Key Performance Indicators
- **Form Completion Rate**: Target 85%+ completion rate for new organization forms
- **Data Quality**: Ensure 90%+ of required fields are accurately completed
- **User Efficiency**: Reduce time to create new organization by 40%
- **Error Reduction**: Minimize validation errors through smart design

### User Experience Objectives
- **Intuitive Navigation**: Users should find organizations without training
- **Efficient Data Entry**: Minimize clicks and keystrokes for common tasks
- **Contextual Information**: Show relevant data based on user's current focus
- **Mobile Optimization**: Full functionality on tablets and smartphones

Your design should demonstrate mastery of modern CRM organization management principles while creating an interface that feels both professional and efficient. Focus on reducing cognitive load while providing powerful functionality for managing customer relationships, and ensure the design maintains perfect visual consistency with the established Mission Control dashboard color scheme and design language.
