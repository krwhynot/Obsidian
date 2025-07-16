You are an expert CRM UI/UX designer with deep expertise in product management interfaces and enterprise application design. Your task is to design and produce a **working HTML demo** of a comprehensive CRM Products page with an "Add New Product" feature that incorporates the most effective characteristics of top-rated CRM systems while maintaining visual consistency with the Mission Control dashboard color scheme[6][15][18].

## DESIGN REQUIREMENTS

### Core Visual Principles
- **Clean & Minimalist**: Eliminate visual clutter while maintaining rich functionality
- **Professional & Trustworthy**: Use design elements that convey reliability and data security
- **Consistent & Organized**: Maintain logical information architecture with clear visual hierarchy
- **Touch-Optimized**: Follow WCAG 2.1 AA standards with 48px minimum touch targets

### Mission Control Dashboard Color Palette Consistency
Use this established color scheme in your HTML demo:
- **Primary Blue**: #1C79D7 (Bright Navy Blue) - for primary actions, navigation, and trust-building elements
- **Light Blue**: #78BCF6 (Very Light Azure) - for secondary elements, highlights, and interactive states
- **Dark Blue**: #245C94 (Lapis Lazuli) - for headers, emphasis, and important data points
- **Neutral Blue**: #809AAF (Weldon Blue) - for supporting text and secondary information
- **Accent Green**: #BDCFA2 (Light Moss Green) - for positive actions, success states, and confirmations
- **Background**: #F1F1F1 (Light Grey) - for main background areas and content separation
- **Text**: #202020 (Dark Grey) - for primary text content and readability

### Typography & Hierarchy
- **Font**: Clean sans-serif (Inter, Roboto, or system fonts)
- **Sizes**: 32px (page titles), 24px (section headers), 18px (product names), 16px (body), 14px (labels), 12px (metadata)
- **Weight**: 400 (body text), 500 (emphasis), 600 (product names and headings)
- **Line Height**: 1.5 for body text, 1.2 for headings, 1.4 for product information

## PRODUCTS PAGE DESIGN SPECIFICATIONS

### Layout Pattern: Grid + List View Toggle with Categories
Design using the modern product management pattern with these components

#### Primary Layout - Product Grid View
- **Product Cards**: Visual grid displaying product images, names, prices, SKU, and status
- **Category Sidebar**: Hierarchical category tree for product organization
- **Search & Filter Bar**: Global search with advanced filtering options (category, price range, status)
- **View Toggle**: Switch between grid and list views for different user preferences
- **Add Product Button**: Prominent floating action button for product creation

#### Secondary Features - Product Management
- **Quick Actions**: Inline edit, duplicate, delete, and bulk operations
- **Product Statistics**: Count and metrics for active, inactive, and featured products
- **Category Management**: Create, edit, and organize product categories
- **Import/Export Tools**: Bulk product management and data transfer capabilities

### Product Card Components Implementation
- **Product Image**: High-quality product photos with fallback placeholders
- **Product Information**: Name, SKU, price, category, and stock status
- **Status Indicators**: Visual badges for active, inactive, featured, and out-of-stock products
- **Quick Actions**: Edit, duplicate, delete, and view details buttons
- **Hover Effects**: Smooth transitions revealing additional actions and information

### Modern Product Catalog Features
- **Smart Categorization**: Automatic product organization and tagging
- **Real-time Search**: Instant product filtering as users type
- **Visual Product Comparison**: Side-by-side product feature comparison
- **Inventory Integration**: Live stock levels and low-stock alerts

## ADD NEW PRODUCT FORM SPECIFICATIONS

### Form Design Pattern: Progressive Multi-Step Modal
Create a comprehensive modal form following modern CRM best practices
#### Step 1: Basic Product Information
- **Product Name** (required, text input with smart suggestions)
- **Product Category** (searchable dropdown with "Create New Category" option)
- **Product Type** (dropdown: Physical, Digital, Service)
- **SKU/Product Code** (text input with auto-generation option)
#### Step 2: Pricing & Inventory
- **Base Price** (currency input with formatting and tax options)
- **Cost Price** (currency input for profit margin calculations)
- **Stock Quantity** (number input with unlimited stock option)
- **Stock Status** (dropdown: In Stock, Out of Stock, Limited, Discontinued)

#### Step 3: Product Details & Media
- **Product Description** (rich text editor for detailed descriptions)
- **Product Images** (drag-and-drop upload with multiple image support)
- **Product Variants** (size, color, material options with separate pricing)
- **Tags & Keywords** (multi-select for search optimization and categorization)

#### Step 4: Sales & Marketing
- **Featured Product** (checkbox for homepage/catalog prominence)
- **Sales Channels** (multi-select: Website, Retail, Wholesale, B2B)
- **Product Status** (Active, Draft, Scheduled, Archived)
- **Launch Date** (date picker for scheduled product releases)

### Modern Product Form Best Practices Implementation
- **Single Column Layout**: Vertical form structure for optimal completion rates
- **Smart Field Grouping**: Logical sections with visual separation using subtle borders
- **Intelligent Defaults**: Pre-populate fields based on category and user patterns
- **Real-time Validation**: Inline feedback with helpful error messages and success indicators
- **Auto-save**: Save draft data every 2 seconds to prevent data loss
- **Progressive Enhancement**: Show relevant fields based on product type selection

### AI-Powered Enhancements
- **Smart Product Suggestions**: Auto-complete product names based on category and market data
- **Price Optimization**: Suggest competitive pricing based on similar products
- **SEO Optimization**: Auto-generate product descriptions and tags for better search visibility
- **Inventory Forecasting**: Predict stock needs based on historical sales data

## HTML DEMO DELIVERABLE

Produce a **single self-contained HTML file** (with embedded CSS and minimal vanilla JavaScript) that demonstrates:

### 1. **Product Catalog Interface**
- Grid layout with product cards showing images, names, prices, and status
- Category sidebar with hierarchical organization and filtering
- Search and filter functionality with real-time results
- Toggle between grid and list views with smooth transitions

### 2. **Add New Product Modal**
- Progressive disclosure form with 4 steps and progress indicator
- Real-time form validation with helpful error messages
- Image upload interface with drag-and-drop functionality
- Touch-optimized inputs with 48px minimum height

### 3. **Interactive Features**
- **Functional product search** with category and status filtering
- **Working modal form** with step-by-step progression and validation
- **Category management** with add, edit, and organize capabilities
- **Product quick actions** with edit, duplicate, and delete options

### 4. **Sample Data Integration**
- **20-25 realistic product records** representing diverse business scenarios
- **Multiple product categories** with varied pricing and inventory levels
- **Product images** (using placeholder services or stock photos)
- **Realistic product data** including SKUs, descriptions, and status indicators

### 5. **Responsive Design**
- **Mobile-first responsive layout** with touch-friendly product cards
- **Collapsible category sidebar** for smaller screens
- **Optimized modal forms** for mobile product creation
- **Accessible navigation** with keyboard support and screen reader compatibility

## IMPLEMENTATION NOTES

### Technical Requirements
- **HTML5 Semantic Structure**: Use proper heading hierarchy, semantic elements, and ARIA labels
- **Embedded CSS**: Include all styles within `<style>` tags in the HTML head
- **Vanilla JavaScript**: Minimal JavaScript for interactions (search, modal, form validation, grid toggle)
- **No External Dependencies**: Self-contained file that works offline
- **Cross-Browser Compatibility**: Works in all modern browsers

### Interactive Functionality
- **Product Search**: Filter products by name, category, SKU, or status
- **View Toggle**: Switch between grid and list layouts with animation
- **Modal Management**: Open/close add product form with backdrop interaction
- **Form Validation**: Real-time validation with visual feedback and error handling
- **Category Management**: Add, edit, and organize product categories

### Visual Design Elements
- **Modern Card Design**: Clean product cards with images, shadows, and hover effects
- **Professional Icons**: Use Unicode symbols or CSS-created icons for actions and categories
- **Consistent Color Scheme**: Implement Mission Control dashboard colors throughout
- **Typography Hierarchy**: Clear visual hierarchy with proper font sizing
- **Loading States**: Visual feedback for search operations and form submissions

## MODERN CRM PRODUCT FEATURES INTEGRATION

### Advanced Product Management
- **Smart Product Organization**: Automatic categorization and intelligent product grouping
- **Price Management**: Dynamic pricing with cost analysis and profit margin calculations
- **Product Lifecycle**: Track products from concept to discontinuation with status workflows

### Sales Integration
- **Deal Association**: Link products to opportunities and sales transactions
- **Customer Insights**: Analyze product preferences and buying patterns

### E-commerce Integration
- **Multi-Channel Management**: Synchronize products across website, retail, and B2B channels
- **SEO Optimization**: Optimize product data for search engines and marketplaces
- **Variant Management**: Handle product options like size, color, and configuration
- **Digital Asset Management**: Organize product images, videos, and documentation

## SUCCESS CRITERIA

### Functional Requirements
- **Complete Product Management**: View, search, create, edit, and organize products functionality
- **Responsive Layout**: Works seamlessly across desktop, tablet, and mobile
- **Form Validation**: Prevents invalid data entry with helpful error messages
- **Professional Appearance**: Matches quality of commercial CRM interfaces

### User Experience Goals
- **Intuitive Product Navigation**: Users can operate the interface without instructions
- **Fast Performance**: Smooth search and filtering with instant visual feedback
- **Professional Feel**: Interface conveys trust and reliability for business use
- **Touch-Friendly**: All elements easily accessible on touch devices

### Code Quality Standards
- **Clean HTML Structure**: Well-organized, semantic markup with proper accessibility
- **Efficient CSS**: Organized stylesheets with consistent naming conventions
- **Minimal JavaScript**: Only essential functionality, well-commented and modular
- **Developer-Ready**: Code structure suitable for further development and integration

## DELIVERABLE OUTPUT

Return the complete HTML demo file followed by a brief implementation guide summarizing:
- **Key Design Choices**: Color scheme implementation and layout decisions
- **Interactive Features**: How search, filtering, and form validation work
- **Responsive Behavior**: Breakpoint strategy and mobile optimizations
- **Extension Options**: How to add features or integrate with backend systems

The HTML demo should feel like a professional CRM product management interface that stakeholders can immediately interact with to evaluate the proposed design and functionality, incorporating the latest 2025 CRM best practices for product catalog management, inventory tracking, and enterprise-grade interface design.
