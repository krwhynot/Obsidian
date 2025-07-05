# PantryCRM UI/UX Prototype Structure

## Overview
This document presents a comprehensive UI/UX prototype structure for PantryCRM, a food service industry CRM optimized for touch devices and iPad sales representatives, based on the established design system and architectural patterns.

---

## 1. Authentication & Onboarding

### Page Name: Sign-In Screen
**Visual Elements:**
- Centered authentication card with company branding
- Multi-provider authentication options (Google, GitHub, Credentials)
- Touch-optimized input fields (48px height, 16px font size)
- Primary action button (56px height for enhanced accessibility)
- Clean background with subtle food service industry imagery

**Navigation Behavior:**
- Direct navigation to main dashboard upon successful authentication
- Redirect to sign-in from any protected route when unauthenticated
- Session persistence with automatic logout after inactivity

**Style Choices Referenced:**
- Card component with 24px padding (p-6)
- Touch-target classes for all interactive elements
- Primary color scheme with high contrast ratios
- Responsive grid layout adapting to device size

---

## 2. Main Dashboard

### Page Name: CRM Dashboard Overview
**Visual Elements:**
- Header with navigation, user avatar, and notifications
- Grid layout with priority-based KPI cards
- Recent activity stream with interaction types (CALL, EMAIL, MEETING, VISIT)
- Quick action buttons for common tasks
- Tremor charts showing analytics (Area, Bar, Donut charts)
- Priority badge system (A-D levels with semantic colors)

**Navigation Behavior:**
- Sidebar navigation with FoodServiceNavigation component
- Breadcrumb navigation for deep page hierarchies
- Quick access to priority organizations and overdue follow-ups
- Modal overlays for quick data entry

**Style Choices Referenced:**
- Responsive grid system (1fr mobile, 2fr tablet, 3fr desktop)
- Priority color system (Green A, Yellow B, Orange C, Red D)
- Touch-optimized spacing (16px mobile, 24px tablet)
- Food service segment colors for industry categorization

---

## 3. Organization Management

### Page Name: Organizations List View
**Visual Elements:**
- Searchable data table with priority indicators
- Filter dropdown for segments (Fine Dining, Fast Food, Healthcare, etc.)
- Action buttons for create, edit, delete operations
- Priority badge visual hierarchy
- Quick view cards showing key organization metrics

**Navigation Behavior:**
- Drill-down to organization detail views
- Bulk selection and actions
- Sort by priority, last contact date, revenue potential
- Pagination with performance optimization (50 records max)

**Style Choices Referenced:**
- Table component with touch-friendly row heights
- Segment selector with food service industry colors
- Button size variants (default 48px, enhanced 56px)
- Consistent card layout with shadow-sm styling

### Page Name: Organization Detail View
**Visual Elements:**
- Header with organization name and priority level
- Tabbed interface for contacts, interactions, opportunities
- Contact cards with primary contact indicators
- Interaction timeline with outcome tracking
- Follow-up scheduling interface

**Navigation Behavior:**
- Tab-based content organization
- Quick add buttons for contacts and interactions
- Navigation to related contact details
- Back navigation with breadcrumb trail

**Style Choices Referenced:**
- Tab component with touch-optimized targets
- Form components with validation states
- Modal patterns for quick data entry
- Consistent spacing and typography scale

---

## 4. Contact Management

### Page Name: Contact List (Organization-scoped)
**Visual Elements:**
- Contact cards with photo, name, position
- Primary contact badges and indicators
- Communication preference icons
- Last interaction timestamps
- Quick communication buttons (call, email)

**Navigation Behavior:**
- Organization context maintained throughout navigation
- Filter by role, last contact date, interaction frequency
- Direct communication initiation from list view
- Swipe gestures for mobile quick actions

**Style Choices Referenced:**
- Avatar component with fallback states
- Touch-target enhancements for mobile interfaces
- Card layout with consistent padding
- Communication icons from Lucide React library

### Page Name: Contact Detail View
**Visual Elements:**
- Contact header with photo and primary information
- Interaction history timeline
- Related opportunities and contracts
- Communication log with outcome tracking
- Schedule follow-up interface

**Navigation Behavior:**
- Deep linking to specific contact records
- Cross-navigation to related organizations
- History view with infinite scroll
- Quick action overlay modals

**Style Choices Referenced:**
- Dialog components for overlays
- Form input components with touch optimization
- Date picker component for scheduling
- Progress indicators for interaction outcomes

---

## 5. Interaction Tracking

### Page Name: Activity Dashboard
**Visual Elements:**
- Activity stream with chronological interaction feed
- Filter controls by type, outcome, date range
- Quick interaction entry form
- Performance metrics and analytics
- Follow-up task management

**Navigation Behavior:**
- Real-time activity updates
- Filter and search functionality
- Navigation to related records (contacts, organizations)
- Bulk actions for follow-up management

**Style Choices Referenced:**
- Sheet components for slide-out panels
- Form components with responsive validation
- Badge components for interaction types and outcomes
- Tremor charts for analytics visualization

### Page Name: Quick Interaction Entry
**Visual Elements:**
- Modal form with interaction type selection
- Auto-complete fields for organization and contact
- Duration tracking and outcome selection
- Next action planning interface
- Touch-optimized form controls

**Navigation Behavior:**
- Modal overlay preserving context
- Auto-save functionality
- Navigation back to referring page
- Success notifications with action confirmations

**Style Choices Referenced:**
- Modal component patterns with proper accessibility
- Form validation with real-time feedback
- Touch-friendly input sizing (48px height)
- Button variants with clear action hierarchy

---

## 6. Excel Migration System

### Page Name: Migration Dashboard
**Visual Elements:**
- Upload interface with drag-and-drop functionality
- Progress indicators for 5-phase migration process
- Field mapping interface with confidence scoring
- Validation results with error highlighting
- Rollback and recovery options

**Navigation Behavior:**
- Step-by-step wizard interface
- Progress preservation between sessions
- Error state handling with clear resolution paths
- Success states with data verification

**Style Choices Referenced:**
- Progress component with step indicators
- File upload patterns with visual feedback
- Alert components for validation messages
- Loading states with descriptive text

### Page Name: Field Mapping Interface
**Visual Elements:**
- Side-by-side source and target field displays
- Confidence scoring with visual indicators
- Mapping suggestions with auto-detection
- Preview data samples
- Validation warnings and errors

**Navigation Behavior:**
- Drag-and-drop field assignment
- Bulk mapping operations
- Preview and validation before execution
- Navigation between mapping sections

**Style Choices Referenced:**
- Table components for data display
- Drag-and-drop visual feedback
- Badge components for confidence scores
- Color-coded validation states

---

## 7. Settings & Configuration

### Page Name: User Preferences
**Visual Elements:**
- Settings cards organized by category
- Theme toggle (light/dark mode)
- Notification preferences
- Touch device optimization settings
- Language and region selection

**Navigation Behavior:**
- Immediate preview of preference changes
- Auto-save functionality
- Reset to defaults option
- Navigation between settings categories

**Style Choices Referenced:**
- Switch components for toggles
- Select components for dropdowns
- Card layout for settings organization
- Consistent form styling

### Page Name: System Settings (Admin)
**Visual Elements:**
- Food service industry configuration
- Priority system customization
- Security settings and access control
- Integration configurations
- System health monitoring

**Navigation Behavior:**
- Role-based access control
- Confirmation dialogs for critical changes
- Audit trail visibility
- Navigation with proper authorization checks

**Style Choices Referenced:**
- Alert components for critical settings
- Form components with enhanced validation
- Permission-based UI element visibility
- Admin-specific styling patterns

---

## Design Interaction Patterns

### Touch-First Navigation
- **Primary Navigation**: Sidebar with touch-optimized targets (48px minimum)
- **Secondary Navigation**: Tab interface within content areas
- **Breadcrumb Navigation**: Context preservation for deep navigation
- **Quick Actions**: Floating action buttons and contextual menus

### Responsive Layout Behavior
- **Mobile (< 640px)**: Single column layout, collapsible navigation
- **Tablet (640px-1024px)**: Two-column layout, sidebar navigation
- **Desktop (> 1024px)**: Three-column layout, persistent navigation
- **iPad Optimization**: Enhanced touch targets and gesture support

### Interaction Transitions
- **Page Transitions**: Smooth fade transitions between major sections
- **Modal Animations**: Slide-up from bottom for mobile, center for desktop
- **Loading States**: Skeleton screens and progress indicators
- **Success Feedback**: Toast notifications and inline confirmations

### Data Loading Patterns
- **Progressive Loading**: Priority content first, secondary content lazy-loaded
- **Optimistic Updates**: Immediate UI feedback with server confirmation
- **Error Recovery**: Retry mechanisms with clear user guidance
- **Offline Support**: Local storage for critical CRM functions

---

## Touch Target & Accessibility Standards

### WCAG 2.5.5 Level AAA Compliance
- **Minimum Touch Targets**: 44px x 44px for all interactive elements
- **Preferred Targets**: 48px x 48px for enhanced touch experience
- **Primary Actions**: 56px height for critical operations
- **Target Spacing**: Minimum 8px gap between touch targets

### Food Service Industry Adaptations
- **Priority System**: Visual hierarchy with A-D classification
- **Segment Colors**: Industry-specific color coding for context
- **Quick Actions**: Industry-relevant shortcuts and workflows
- **Mobile Optimization**: Field sales representative focused interface

### Performance Considerations
- **Azure SQL Optimization**: Query result limiting and connection pooling
- **Bundle Optimization**: Lazy loading and code splitting
- **Touch Response**: Immediate visual feedback for all interactions
- **Network Resilience**: Offline capability for critical functions

---

## Component Library Usage

### ShadCN/UI Foundation
- **Base Components**: Button, Input, Select, Card, Dialog, Table
- **Layout Components**: Sidebar, Header, Footer, ResponsiveLayout
- **Form Components**: DatePicker, Textarea, Checkbox, Switch
- **Feedback Components**: Toast, Alert, Progress, Loading

### Food Service Specialization
- **PriorityBadge**: A-D level visual indicators
- **SegmentSelector**: Industry category selection
- **DistributorField**: Food service specific form fields
- **InteractionEntry**: CRM activity quick capture

### Analytics Integration
- **Tremor Charts**: AreaChart, BarChart, DonutChart for KPIs
- **Performance Monitoring**: Real-time system health indicators
- **User Analytics**: Interaction tracking and usage patterns
- **Business Intelligence**: Sales pipeline and opportunity tracking

This prototype structure ensures consistent, accessible, and touch-friendly user experiences across the PantryCRM application while maintaining design system integrity and optimal performance for food service industry professionals.