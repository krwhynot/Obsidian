You are an expert CRM UI/UX designer with deep expertise in opportunity management interfaces and enterprise application design. Your task is to design and produce a **working HTML demo** of a comprehensive CRM Opportunities page with an "Add New Opportunity" feature that incorporates the most effective characteristics of top-rated CRM systems while maintaining visual consistency with the Mission Control dashboard color scheme[6][7][10].

## DESIGN REQUIREMENTS

### Core Visual Principles
- **Clean & Minimalist**: Eliminate visual clutter while maintaining rich functionality[6][18][35]
- **Professional & Trustworthy**: Use design elements that convey reliability and data security[6][18][30]
- **Consistent & Organized**: Maintain logical information architecture with clear visual hierarchy[18][33][35]
- **Touch-Optimized**: Follow WCAG 2.1 AA standards with 48px minimum touch targets[33][35]

### Mission Control Dashboard Color Palette Consistency
Use this established color scheme in your HTML demo:
- **Primary Blue**: #1C79D7 (Bright Navy Blue) - for primary actions, navigation, and trust-building elements[47][50][53]
- **Light Blue**: #78BCF6 (Very Light Azure) - for secondary elements, highlights, and interactive states
- **Dark Blue**: #245C94 (Lapis Lazuli) - for headers, emphasis, and important data points
- **Neutral Blue**: #809AAF (Weldon Blue) - for supporting text and secondary information
- **Accent Green**: #BDCFA2 (Light Moss Green) - for positive actions, success states, and confirmations
- **Background**: #F1F1F1 (Light Grey) - for main background areas and content separation
- **Text**: #202020 (Dark Grey) - for primary text content and readability

### Typography & Hierarchy
- **Font**: Clean sans-serif (Inter, Roboto, or system fonts)
- **Sizes**: 32px (page titles), 24px (section headers), 18px (opportunity names), 16px (body), 14px (labels), 12px (metadata)
- **Weight**: 400 (body text), 500 (emphasis), 600 (opportunity names and headings)
- **Line Height**: 1.5 for body text, 1.2 for headings, 1.4 for opportunity information

## OPPORTUNITIES PAGE DESIGN SPECIFICATIONS

### Layout Pattern: Kanban Pipeline with List View Toggle
Design using the modern opportunity management pattern with these components[10][46][49]:

#### Primary Layout - Kanban Pipeline View
- **Pipeline Columns**: "Lead", "Qualified", "Proposal", "Negotiation", "Closed Won", "Closed Lost"[28][45][51]
- **Opportunity Cards**: Drag-and-drop cards showing opportunity name, company, amount, probability, close date[46][49][52]
- **Column Headers**: Display stage name, total opportunities count, and total value sum[46][53]
- **Add Opportunity Button**: Floating action button to create new opportunities[37]

#### Secondary Layout - List View Toggle
- **Searchable Table**: Traditional list view with sortable columns[10][13]
- **Quick Filters**: "All", "My Opportunities", "Hot Prospects", "Closing This Month"[13][28]
- **Bulk Actions**: Multi-select for mass operations (assign, update stage, export)[13]

### Opportunity Card Components Implementation
- **Card Header**: Opportunity name and company with probability indicator[19][34][37]
- **Card Body**: Deal amount, expected close date, assigned sales rep[19][37][43]
- **Card Footer**: Priority badge, last activity date, quick actions (edit, view details)[19][28]
- **Visual Indicators**: Color-coded probability bars, urgency icons, stage progression[34][46]

### Pipeline Features
- **Drag & Drop**: Smooth card movement between pipeline stages[46][49][52]
- **Real-time Updates**: Visual feedback during card movements[46][49]
- **Stage Analytics**: Value totals and opportunity counts per stage[46][53]
- **Filtering Options**: By sales rep, date range, deal size, probability[13][28]

## ADD NEW OPPORTUNITY FORM SPECIFICATIONS

### Form Design Pattern: Progressive Modal with Smart Defaults
Create a multi-step modal form following modern CRM best practices[27][30][35]:

#### Step 1: Basic Opportunity Information
- **Opportunity Name** (required, text input with smart suggestions)[31][37][43]
- **Company/Organization** (searchable dropdown with "Create New Company" option)[31][37]
- **Contact Person** (linked to existing contacts or quick-add)[31][37]
- **Deal Amount** (currency input with formatting)[31][37][43]

#### Step 2: Sales Process Details
- **Sales Stage** (dropdown with pipeline stages: Lead, Qualified, Proposal, Negotiation)[28][37][43]
- **Probability** (percentage slider with stage-based defaults)[34][37][43]
- **Expected Close Date** (date picker with calendar widget)[34][37][43]
- **Lead Source** (dropdown: Website, Referral, Trade Show, Cold Call, etc.)[28][37]

#### Step 3: Assignment & Categorization
- **Assigned Sales Rep** (user dropdown with current user as default)[37][43]
- **Priority Level** (High, Medium, Low with color indicators)[28][34]
- **Product/Service** (multi-select for opportunity categorization)[37][40]
- **Notes** (textarea for initial opportunity context)[31][37]

### Modern Opportunity Form Best Practices Implementation
- **Single Column Layout**: Vertical form structure for optimal completion rates[21][24][35]
- **Smart Field Grouping**: Logical sections with visual separation using cards[30][35]
- **Intelligent Defaults**: Pre-populate fields based on company data and user context[30][35]
- **Real-time Validation**: Inline feedback with helpful error messages and success indicators[27][30][35]
- **Duplicate Prevention**: Smart duplicate detection with merge suggestions[39]
- **Progressive Enhancement**: Show additional fields based on selections (stage-specific fields)[35][40]

### AI-Powered Enhancements
- **Smart Amount Prediction**: Suggest deal amounts based on similar opportunities[16][39]
- **Company Enrichment**: Auto-populate company details from database[25][39]
- **Probability Calculation**: Automatic probability scoring based on stage and company data[16][34]
- **Activity Suggestions**: Recommend next actions based on opportunity stage[16][28]

## HTML DEMO DELIVERABLE

Produce a **single self-contained HTML file** (with embedded CSS and minimal vanilla JavaScript) that demonstrates:

### 1. **Opportunity Pipeline Interface**
- Kanban-style pipeline with 6 stage columns (Lead → Closed Won/Lost)[46][49][52]
- Drag-and-drop opportunity cards between stages with smooth animations[46][49]
- Column summaries showing opportunity count and total value[46][53]
- Toggle between Kanban and List views[10][13]

### 2. **Add New Opportunity Modal**
- Progressive disclosure form with 3 steps and progress indicator[30][35]
- Real-time form validation with helpful error messages[27][30][35]
- Smart duplicate detection warnings[39]
- Touch-optimized inputs with 48px minimum height[33][35]

### 3. **Interactive Features**
- **Functional drag-and-drop** between pipeline stages with visual feedback[46][49][52]
- **Working search and filter** functionality for opportunities[13][28]
- **Modal form with step-by-step progression** and validation[30][35]
- **Stage analytics** showing real-time totals and counts[47][53]

### 4. **Sample Data Integration**
- **15-20 realistic opportunity records** across different pipeline stages[37][45]
- **Company associations** with varied deal amounts and probabilities[31][34]
- **Sales rep assignments** and activity timestamps[34][37]
- **Diverse opportunity types** representing different business scenarios[28][45]

### 5. **Responsive Design**
- **Mobile-first responsive layout** with collapsible pipeline columns[33][35]
- **Touch-friendly drag interactions** on mobile devices[33][35]
- **Optimized card sizes** for different screen resolutions[33]
- **Accessible navigation** with keyboard support[33][35]

## IMPLEMENTATION NOTES

### Technical Requirements
- **HTML5 Semantic Structure**: Use proper heading hierarchy, semantic elements, and ARIA labels[33][35]
- **Embedded CSS**: Include all styles within `<style>` tags in the HTML head[21][24]
- **Vanilla JavaScript**: Minimal JavaScript for interactions (drag-drop, search, modal, form validation)[30][35]
- **No External Dependencies**: Self-contained file that works offline[21][24]
- **Cross-Browser Compatibility**: Works in all modern browsers[21][24]

### Interactive Functionality
- **Drag-Drop Implementation**: Smooth card movement with visual drop zones and feedback[46][49][52]
- **Search Implementation**: Filter opportunities by name, company, amount, or sales rep[13][28]
- **Modal Management**: Open/close add opportunity form with backdrop interaction[30][35]
- **Form Validation**: Real-time validation with visual feedback and error handling[27][30][35]
- **Stage Updates**: Automatic stage changes when cards are moved[46][49]

### Visual Design Elements
- **Modern Card Design**: Clean opportunity cards with subtle shadows and hover effects[22][38]
- **Professional Icons**: Use Unicode symbols or CSS-created icons for actions and indicators[33][35]
- **Consistent Color Scheme**: Implement Mission Control dashboard colors throughout[47][50]
- **Typography Hierarchy**: Clear visual hierarchy with proper font sizing[33][35]
- **Loading States**: Visual feedback for form submissions and data updates[35]

## MODERN CRM OPPORTUNITY FEATURES INTEGRATION

### Advanced Pipeline Management
- **Stage-Based Automation**: Visual indicators for opportunities requiring attention
- **Probability Management**: Color-coded probability indicators and progression tracking
- **Activity Tracking**: Timeline of opportunity interactions and next action suggestions
- **Forecasting Integration**: Revenue projections based on stage probabilities

### Sales Performance Analytics
- **Pipeline Health Metrics**: Visual indicators for stage velocity and conversion rates
- **Individual Performance**: Rep-specific opportunity tracking and assignment
- **Revenue Forecasting**: Dynamic calculations based on probability and close dates
- **Activity Correlation**: Link opportunity progression to sales activities

### Workflow Optimization
- **Smart Stage Progression**: Guided workflow with stage-specific requirements
- **Automated Task Creation**: Trigger follow-up tasks based on stage changes
- **Notification System**: Alert system for overdue opportunities and required actions
- **Integration Hooks**: Preparation for email, calendar, and communication tool integration

## SUCCESS CRITERIA

### Functional Requirements
- **Complete Opportunity Management**: View, search, create, and move opportunities through stages
- **Responsive Layout**: Works seamlessly across desktop, tablet, and mobile
- **Form Validation**: Prevents invalid data entry with helpful error messages
- **Professional Appearance**: Matches quality of commercial CRM interfaces

### User Experience Goals
- **Intuitive Pipeline Navigation**: Users can operate the kanban board without instructions
- **Fast Performance**: Smooth drag-drop interactions and instant visual feedback
- **Professional Feel**: Interface conveys trust and reliability for business use
- **Touch-Friendly**: All elements easily accessible on touch devices

### Code Quality Standards
- **Clean HTML Structure**: Well-organized, semantic markup with proper accessibility
- **Efficient CSS**: Organized stylesheets with consistent naming conventions
- **Minimal JavaScript**: Only essential functionality, well-commented and modular
- **Developer-Ready**: Code structure suitable for further development and integration

## DELIVERABLE OUTPUT

Return the complete HTML demo file followed by a brief implementation guide summarizing:
- **Key Design Choices**: Color scheme implementation and pipeline layout decisions
- **Interactive Features**: How drag-drop, search, and form validation work
- **Responsive Behavior**: Breakpoint strategy and mobile optimizations
- **Extension Options**: How to add features or integrate with backend systems

The HTML demo should feel like a professional CRM opportunity management interface that stakeholders can immediately interact with to evaluate the proposed design and functionality, incorporating the latest 2025 CRM best practices for opportunity management, sales pipeline visualization, and enterprise-grade interface design.
