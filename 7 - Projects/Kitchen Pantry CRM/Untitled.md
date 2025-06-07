# Kitchen Pantry CRM - Product Requirements Document

## Overview

Kitchen Pantry CRM is a specialized Customer Relationship Management system designed specifically for the food service industry, built to replace a family company's Excel-based sales tracking system. The system serves 4 sales representatives who manage relationships with restaurants, healthcare facilities, and institutional food service operations across multiple market segments.

Built on the NextCRM open-source foundation, this CRM addresses the unique challenges of food service sales including multi-brand principal management, complex distributor relationships, and industry-specific contact roles. The system operates under strict budget constraints ($18/month Azure hosting) while delivering enterprise-level functionality optimized for multi-device usage, particularly touch-enabled interfaces.

The primary business value lies in transforming manual Excel workflows into automated, real-time sales management with 50% faster data entry, 80% faster report generation, and sub-second search capabilities across hundreds of restaurant accounts.

## Core Features

### Organization Management System

The organization management system serves as the foundation for all customer relationship activities, specifically tailored for food service businesses. Organizations represent restaurants, healthcare facilities, catering companies, and institutional food service operations, each classified with industry-specific attributes that drive sales strategy and reporting.

**Priority Level Classification**: Each organization receives an A-D priority rating that determines sales attention allocation and reporting frequency. This system replaces the manual priority tracking previously managed in Excel spreadsheets, with color-coded visual indicators throughout the interface.

**Market Segment Tracking**: Organizations are categorized into five key market segments (Fine Dining, Fast Food, Healthcare, Catering, Institutional), enabling targeted sales approaches and segment-specific reporting that aligns with industry sales methodologies.

**Distributor Relationship Management**: The system tracks primary distributor relationships (Sysco, USF, PFG, Direct, Other) which is critical for food service sales as it affects pricing, delivery logistics, and competitive positioning strategies.

### Contact Relationship Network

Contact management extends beyond traditional CRM approaches to accommodate the complex decision-making hierarchies common in food service operations, where purchasing decisions often involve multiple stakeholders with distinct roles and influence levels.

**Multi-Contact Architecture**: Each organization supports unlimited contacts with role-based categorization (Executive Chef, Buyer, Manager, Owner, Kitchen Manager) that reflects real food service organizational structures. This enables sales representatives to map decision-making processes accurately.

**Primary Contact Designation**: The system enforces business rules around primary contact designation while allowing flexibility for complex organizational structures where decision-making authority may shift based on purchase type or season.

**Contact Interaction History**: Complete interaction tracking at the contact level enables relationship building strategies and ensures continuity when account management responsibilities transfer between sales representatives.

### Rapid Interaction Documentation

The interaction tracking system is optimized for the fast-paced nature of food service sales, where representatives often manage multiple client touchpoints daily and need to capture interaction details quickly between appointments.

**30-Second Entry Target**: Form design and auto-complete functionality specifically target 30-second interaction entry times, recognizing that lengthy data entry processes reduce adoption and data quality in field sales environments.

**Six Interaction Types**: The system supports Email, Call, In Person, Demo/sampled, Quoted price, and Follow-up interactions, covering the complete spectrum of food service sales activities from initial contact through product sampling and pricing negotiations.

**Auto-Save and Recovery**: Interaction forms include automatic saving and form recovery capabilities, preventing data loss during mobile usage scenarios common in field sales operations.

### Sales Pipeline Management

The pipeline management system implements a five-stage process that aligns with food service sales cycles, from initial lead discovery through final close, with probability tracking and stage-specific business rules.

**Five-Stage Pipeline Process**: Lead-discovery → Contacted → Sampled/Visited → Follow-up → Close stages reflect the typical food service sales cycle where product sampling and site visits are critical conversion activities.

**Principal Integration**: Opportunities are tracked across 11 different principals/brands (Kaufholds, Frites Street, Better Balance, VAF, Ofk, Annasea, Wicks, RJC, Kayco, Abdale, Land Lovers), enabling brand-specific performance analysis and commission tracking.

**Probability Scoring**: Each opportunity includes probability percentage tracking that enables weighted pipeline reporting and more accurate sales forecasting for management decision-making.

### Dynamic Reporting Engine

The reporting system generates four core report types in under 10 seconds, replacing manual Excel report compilation that previously required hours of data manipulation and consolidation.

**Weekly Activity by Account Manager**: Comprehensive activity reporting that tracks interaction volume, types, and outcomes by sales representative, enabling performance management and territory optimization.

**Pipeline Status by Principal**: Brand-specific pipeline analysis that shows opportunity distribution and conversion rates across all principals, supporting strategic brand management decisions.

**Interaction Volume Analysis**: Detailed analysis of interaction patterns, frequency, and types that identifies relationship health indicators and optimization opportunities for sales process improvement.

**Organization Performance Tracking**: Account-level performance metrics that combine interaction history, pipeline progress, and outcome tracking to identify high-value accounts and improvement opportunities.

## User Experience

### User Personas

**Primary Sales Representative**: Field-based sales professional managing 50-100 restaurant accounts across a defined territory. Requires mobile-first interface design with touch optimization for in-vehicle and on-site usage. Values speed and simplicity over complex functionality, with primary focus on interaction logging and account status checking.

**Sales Manager**: Territory or brand manager responsible for 2-4 sales representatives and overall territory performance. Requires comprehensive reporting capabilities with drill-down functionality for performance analysis and coaching opportunities. Uses desktop interface primarily but needs mobile access for field coaching sessions.

**Administrative User**: Back-office support responsible for data maintenance, report generation, and system administration. Requires full CRUD capabilities across all system components with bulk operation support for data management efficiency.

### Key User Flows

**Daily Interaction Logging Flow**: Sales representative begins day by reviewing scheduled appointments and account priorities. During or immediately after client interactions, opens interaction form (auto-populates organization/contact from search), selects interaction type, adds brief notes, and saves within 30-second target time. System auto-saves progress and enables quick entry of follow-up tasks.

**Weekly Planning and Reporting Flow**: Sales manager accesses dashboard showing territory performance metrics, identifies accounts requiring attention based on interaction frequency and pipeline status, generates territory-specific reports for stakeholder review, and conducts one-on-one reviews with sales representatives using comparative performance data.

**Account Research and Preparation Flow**: Sales representative searches organization database, reviews complete interaction history and relationship mapping, identifies primary contacts and decision-makers, reviews current opportunities and their stages, and prepares call/visit strategy based on historical patterns and current pipeline status.

### UI/UX Considerations

**Touch-First Design Philosophy**: All interactive elements meet 44px minimum touch target requirements with generous spacing between clickable areas. Form inputs are optimized for touch keyboards with appropriate input types and validation feedback.

**Multi-Device Responsive Framework**: Interface adapts seamlessly between tablet (primary usage), desktop (reporting and administration), and smartphone (emergency access) form factors. Navigation patterns adjust based on screen size while maintaining functional consistency.

**Performance-Optimized Loading**: Page transitions complete within 3-second target on 3G connections with progressive loading for data-heavy reports and search results. Critical path optimization ensures core functionality (interaction entry, account search) loads first.

**Accessibility and Usability**: High contrast color schemes support outdoor mobile usage, clear typography hierarchy reduces cognitive load during rapid data entry, and error messaging provides specific, actionable guidance for data correction.

## Technical Architecture

### System Components

**Frontend Architecture**: Next.js 15 with React 19 RC provides the foundation for server-side rendering and optimal performance on Azure App Service. TypeScript strict mode ensures code quality and reduces runtime errors in production environment.

**Component Library Integration**: shadcn/ui components built on Radix UI primitives provide accessible, customizable interface elements that maintain design consistency across the application. Tremor charts handle all data visualization requirements for reporting functionality.

**Backend Services**: Node.js with Express provides RESTful API endpoints with Prisma ORM handling all database operations through type-safe queries. Server Actions supplement traditional API endpoints for optimized form submissions and real-time updates.

**Authentication and Authorization**: Auth.js integration supports multiple authentication providers with session management optimized for multi-device usage patterns. Role-based access control ensures data security without impeding sales workflow efficiency.

### Data Models

**Core Entity Relationships**: Organizations serve as the primary entity with one-to-many relationships to Contacts, Interactions, and Opportunities. Settings table provides dynamic configuration for all dropdown values, eliminating hard-coded enums and enabling business rule flexibility.

**Settings-Driven Configuration**: Priority levels, market segments, distributor relationships, interaction types, pipeline stages, and contact roles are all managed through the Settings table, enabling business users to modify configuration without code changes.

**Audit Trail Implementation**: All entities include created_at, updated_at, and created_by fields with automated timestamp management. Soft delete functionality preserves historical data while maintaining referential integrity.

**Data Integrity Constraints**: Foreign key relationships prevent orphaned records, unique constraints prevent duplicate organizations, and check constraints ensure data quality (priority levels A-D, valid email formats, positive probability percentages).

### APIs and Integrations

**RESTful API Design**: Standard CRUD operations for all entities with search endpoints optimized for auto-complete functionality. Batch operations support bulk data operations required for Excel import and administrative functions.

**Excel Import Pipeline**: Specialized endpoints handle file upload, validation, and batch insertion of historical data with comprehensive error reporting and rollback capabilities for data integrity protection.

**Reporting API Endpoints**: Optimized query endpoints for each of the four core report types with caching strategies to meet sub-10-second response time requirements under concurrent user load.

**Future Integration Points**: API design accommodates planned integrations with email marketing platforms (MailChimp, Listmonk) and invoice processing systems (Rossum AI) while maintaining current functionality boundaries.

### Infrastructure Requirements

**Azure SQL Database Basic Tier**: 2GB storage capacity supports hundreds of organizations with complete interaction history. 5 DTU capacity handles 4 concurrent users with appropriate query optimization and connection pooling.

**Azure App Service Basic B1 Tier**: Single instance deployment with automatic scaling capabilities provides sufficient capacity for user load while maintaining cost constraints. Integrated deployment pipeline supports continuous integration from GitHub repository.

**Performance Optimization Strategy**: Database indexing on frequently queried fields (organization names, interaction dates, pipeline stages), query result caching for reporting endpoints, and CDN utilization for static assets ensure responsive performance within infrastructure constraints.

**Monitoring and Alerting**: Azure Application Insights provides performance monitoring, error tracking, and user behavior analytics. Custom alerts monitor cost thresholds to prevent budget overruns while ensuring service availability.

## Development Roadmap

### Phase 1: Foundation and Infrastructure (Weeks 1-2) - CURRENT FOCUS

**Critical Architecture Resolution**: The immediate priority involves resolving NextCRM foundation issues that are currently blocking all development progress. Missing components (Feedback, ModuleMenu, FulltextSearch, AvatarDropdown) prevent the development server from starting, requiring either component implementation or removal strategies.

**Database Schema Implementation**: Complete migration from MongoDB to Azure SQL with all food service industry-specific fields and relationships. Settings table implementation enables dynamic configuration management that replaces hard-coded enums throughout the application.

**Development Environment Stabilization**: Resolve React 19 RC compatibility concerns and bundle size optimization requirements. Establish stable development workflow with proper TypeScript configuration and testing framework integration.

**Multi-Device Testing Framework**: Configure testing environment with Windows touch laptop as primary device, ensuring touch interface optimization and responsive design validation across form factors.

### Phase 2: Core CRM Functionality (Weeks 3-5)

**Organization Management Implementation**: Complete CRUD operations with food service industry fields, priority level system with color coding, market segment categorization, and distributor relationship tracking. Search functionality optimized for sub-second response times with auto-complete support.

**Contact Relationship System**: Multi-contact management per organization with role-based categorization specific to food service hierarchies. Primary contact designation logic with business rule enforcement and duplicate prevention mechanisms.

**Interaction Documentation System**: Rapid entry forms optimized for 30-second target times with auto-complete functionality for organizations and contacts. Auto-save capabilities and form recovery systems prevent data loss during mobile usage scenarios.

**Basic Reporting Foundation**: Initial implementation of reporting engine with Tremor charts integration. Focus on data retrieval optimization and report generation performance to meet sub-10-second requirements.

### Phase 3: Advanced Pipeline and Reporting (Weeks 6-7)

**Sales Pipeline Implementation**: Five-stage pipeline process with stage-specific business rules and validation. Integration of 11 principals with opportunity tracking and probability scoring systems for weighted pipeline analysis.

**Comprehensive Reporting Engine**: Implementation of all four core report types with advanced filtering, date range selection, and export capabilities. Print-optimized layouts for stakeholder distribution and mobile-responsive design for field access.

**Performance Optimization**: Database query optimization, caching implementation, and user interface performance tuning to ensure system responsiveness under concurrent user load within Azure infrastructure constraints.

**User Experience Refinement**: Touch interface optimization based on multi-device testing feedback, accessibility improvements, and workflow efficiency enhancements based on early user feedback sessions.

### Phase 4: Data Migration and Production Launch (Week 8)

**Excel Data Migration Pipeline**: Complete implementation of historical data import functionality with validation rules, duplicate detection, and comprehensive error reporting. Audit trail creation for all migrated data with source tracking.

**Production Deployment**: Azure App Service configuration with proper environment variables, security settings, and performance monitoring. Database optimization for production workload and backup strategy implementation.

**User Training and Documentation**: Comprehensive training materials creation with workflow guides specific to food service sales processes. User acceptance testing with actual sales scenarios and feedback incorporation.

**Launch Readiness Validation**: Complete system testing across all user personas and usage scenarios, performance validation under concurrent user load, and security review for production deployment readiness.

## Logical Dependency Chain

### Foundation Prerequisites (Must Complete First)

The development sequence must begin with NextCRM architecture resolution since missing components prevent any application functionality. React 19 RC compatibility assessment and resolution directly impacts all subsequent development work and must be completed before implementing custom components.

Database schema deployment and Settings table implementation provide the foundation for all business logic and user interface development. Without proper schema relationships and dynamic configuration capabilities, frontend development cannot proceed effectively.

Development environment stabilization, including TypeScript configuration and testing framework setup, enables sustainable development practices and prevents technical debt accumulation during rapid feature development phases.

### Core Functionality Build Sequence (Rapid User Value Delivery)

Organization management serves as the foundation for all other CRM functionality and should be implemented first to provide immediate user value. Sales representatives can begin using the system for account research and basic information management even without complete interaction tracking.

Contact management builds directly on organization foundation and enables relationship mapping that provides immediate value over Excel-based approaches. This functionality allows users to understand decision-making hierarchies and contact relationship networks.

Interaction documentation system represents the highest-value functionality for daily user adoption and should be implemented immediately after contact management. This feature directly replaces the most painful Excel workflows and demonstrates clear system value.

### Advanced Features and Optimization (Incremental Enhancement)

Sales pipeline implementation requires stable organization, contact, and interaction foundations since opportunities depend on relationship data quality and interaction history for accurate probability scoring and stage management.

Reporting engine development should proceed incrementally, beginning with basic data retrieval and visualization, then adding advanced filtering and export capabilities. Early reporting capabilities provide management value and support user adoption even without complete feature sets.

Performance optimization and user experience refinement should occur continuously throughout development but require working functionality as a foundation for meaningful testing and optimization efforts.

### Production Readiness (Final Integration)

Data migration pipeline development requires complete schema stability and validated business logic since historical data import cannot be easily reversed. This work should be completed only after core functionality is thoroughly tested.

Production deployment preparation, including security configuration and monitoring setup, builds on stable application architecture and should not begin until system functionality is validated in development environments.

User training and documentation development requires feature-complete functionality and should be coordinated with early user testing to ensure training materials address actual usage patterns and common workflow challenges.

## Risks and Mitigations

### Technical Architecture Risks

**NextCRM Foundation Instability (CRITICAL RISK)**: The current blocking issue with missing NextCRM components represents the highest project risk since it prevents all development progress. The foundation's React 19 RC dependency introduces additional stability concerns for production deployment.

_Mitigation Strategy_: Implement component removal strategy for missing NextCRM components rather than attempting to rebuild them, reducing complexity and development time. Evaluate React version downgrade to stable release if RC compatibility issues persist. Maintain fallback plan to implement custom CRM components if NextCRM foundation proves unusable.

**Azure Infrastructure Performance Constraints**: Basic tier Azure SQL (5 DTU) and App Service (single instance) may not handle concurrent user load or complex reporting queries efficiently, potentially degrading user experience and system adoption.

_Mitigation Strategy_: Implement aggressive query optimization with appropriate database indexing, result caching for reporting endpoints, and connection pooling for database efficiency. Monitor performance metrics continuously and prepare scaling strategies within budget constraints. Design reporting queries to minimize database load through data aggregation and caching.

**Bundle Size and Performance Optimization**: NextCRM foundation includes large dependencies (moment.js, AWS SDK) that may impact loading performance, particularly on mobile connections common in field sales scenarios.

_Mitigation Strategy_: Implement tree shaking and dependency analysis to remove unused code, replace heavy dependencies with lighter alternatives (day.js instead of moment.js), and implement code splitting for non-critical functionality. Monitor bundle size continuously and establish performance budgets for new features.

### Business and Adoption Risks

**User Adoption Resistance**: Sales representatives accustomed to Excel flexibility may resist structured CRM workflows, particularly if data entry requirements are perceived as slowing down sales activities.

_Mitigation Strategy_: Prioritize 30-second interaction entry target through extensive UX optimization, implement auto-save and form recovery to prevent data loss frustration, and provide clear value demonstration through immediate reporting benefits. Conduct continuous user feedback sessions and adjust workflows based on actual usage patterns.

**Data Migration Accuracy**: Historical Excel data contains inconsistencies, duplicates, and formatting variations that could corrupt the CRM database or create data quality issues affecting user trust and system adoption.

_Mitigation Strategy_: Implement comprehensive data validation and cleaning processes, provide detailed error reporting for manual correction, and maintain Excel system backup during transition period. Create audit trails for all imported data and implement rollback capabilities for migration corrections.

**Budget Constraint Limitations**: $18/month Azure budget severely constrains scaling options if user load or data volume exceeds initial projections, potentially requiring architectural changes or feature limitations.

_Mitigation Strategy_: Implement cost monitoring and alerting to prevent budget overruns, design system architecture for efficient resource utilization, and prepare scaling strategies that maintain cost constraints. Monitor usage patterns continuously and optimize resource allocation based on actual requirements.

### Project Delivery Risks

**Integration Testing Complexity**: Multi-device testing requirements and NextCRM integration complexity may reveal issues late in development cycle, potentially delaying production launch or requiring feature reductions.

_Mitigation Strategy_: Implement continuous integration testing with multi-device simulation, establish regular testing checkpoints throughout development phases, and maintain flexible scope management to adjust features based on testing results. Prioritize core functionality over advanced features if timeline constraints emerge.

**Scope Creep and Feature Expansion**: Food service industry complexity may drive additional feature requests that exceed development timeline or budget constraints, particularly as users begin experiencing system benefits.

_Mitigation Strategy_: Maintain strict scope boundaries with clear Phase 1 MVP definition, implement change request process with impact assessment, and establish future enhancement roadmap for post-launch improvements. Focus on core Excel replacement functionality rather than advanced CRM features for initial launch.

## Appendix

### Research Findings

**NextCRM Architecture Analysis**: Detailed examination of the NextCRM foundation reveals significant architectural challenges including missing critical components and React 19 RC stability concerns. The foundation provides substantial development acceleration benefits (60-70% time reduction) when functional but requires immediate resolution of component issues.

**Azure Infrastructure Optimization**: Analysis confirms that Basic tier services can support project requirements with proper optimization strategies. Database capacity (2GB) and DTU allocation (5) are sufficient for projected data volume and user load with appropriate query optimization and caching implementation.

**Food Service Industry Requirements**: Research into food service sales processes confirms the necessity of industry-specific features including distributor relationship tracking, principal-based opportunity management, and role-based contact categorization that distinguish this CRM from generic solutions.

### Technical Specifications

**Database Schema Implementation**:

```sql
-- Organizations table with food service industry fields
CREATE TABLE Organizations (
    id NVARCHAR(450) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    priority_id NVARCHAR(450) FOREIGN KEY REFERENCES Settings(id),
    segment_id NVARCHAR(450) FOREIGN KEY REFERENCES Settings(id),
    distributor_id NVARCHAR(450) FOREIGN KEY REFERENCES Settings(id),
    account_manager NVARCHAR(255),
    created_at DATETIME2 DEFAULT GETDATE(),
    updated_at DATETIME2 DEFAULT GETDATE()
);

-- Settings table for dynamic configuration
CREATE TABLE Settings (
    id NVARCHAR(450) PRIMARY KEY,
    category NVARCHAR(100) NOT NULL, -- 'Priority', 'Segment', etc.
    key NVARCHAR(100) NOT NULL,      -- 'A', 'fine-dining', etc.
    label NVARCHAR(255) NOT NULL,    -- Display name
    color NVARCHAR(7),               -- For priority colors
    sort_order INT DEFAULT 0,
    active BIT DEFAULT 1
);
```

**Performance Requirements Specification**:

- Search operations: Sub-second response time with auto-complete functionality
- Report generation: Complete processing within 10 seconds for all report types
- Page load times: Maximum 3 seconds on 3G mobile connections
- Touch targets: Minimum 44px for all interactive elements
- Concurrent users: Support 4 simultaneous users on Azure Basic tier

### Critical Gap Analysis

**IDENTIFIED ARCHITECTURAL FLAWS**:

1. **Missing Authentication Strategy**: While Auth.js is mentioned in technology stack, there is no detailed authentication flow or role-based access control implementation specified. This is critical for multi-user CRM deployment. _Recommendation_: Implement comprehensive authentication system with role-based permissions (Sales Rep, Manager, Admin) and session management optimized for multi-device usage.
    
2. **Insufficient Offline Capability Planning**: Food service sales representatives often work in areas with poor mobile connectivity, but current architecture lacks offline functionality or data synchronization strategies. _Recommendation_: Implement service worker-based offline capabilities for critical functions (interaction entry, account search) with background synchronization when connectivity resumes.
    
3. **Inadequate Data Backup and Disaster Recovery**: No backup strategy or disaster recovery procedures are defined for critical business data, representing significant business risk. _Recommendation_: Implement automated daily database backups to Azure Blob Storage, establish recovery time objectives (RTO) and recovery point objectives (RPO), and create tested disaster recovery procedures.
    
4. **Lacking Integration Testing Strategy**: While unit testing is mentioned, there's no comprehensive integration testing approach for NextCRM component integration, multi-device compatibility, or Azure service integration. _Recommendation_: Establish comprehensive testing strategy including component integration tests, cross-browser compatibility testing, and Azure service integration validation.
    
5. **Missing Performance Monitoring and Alerting**: Beyond basic Azure monitoring, there's no detailed performance monitoring strategy for user experience tracking, database query performance, or business process efficiency. _Recommendation_: Implement comprehensive monitoring including user experience tracking, business process analytics (interaction entry times, search performance), and proactive alerting for performance degradation.
    
6. **Insufficient Error Handling and User Feedback**: Current documentation lacks comprehensive error handling strategies and user feedback mechanisms for form validation, network failures, and data conflicts. _Recommendation_: Implement comprehensive error handling with user-friendly error messages, retry mechanisms for network failures, and validation feedback that guides users toward successful data entry.
    
7. **Limited Scalability Planning**: While current requirements support 4 users, there's no scalability strategy if business growth requires additional users or expanded functionality. _Recommendation_: Design architecture with scalability considerations including database partitioning strategies, caching layer implementation, and cost-effective scaling paths within Azure infrastructure.
    

### Success Metrics Definition

**User Adoption Metrics**:

- Week 1: 100% of sales representatives logging daily interactions
- Month 1: 50% reduction in Excel usage for sales tracking
- Month 3: Complete Excel system retirement with 100% CRM adoption

**Performance Achievement Metrics**:

- Interaction entry: Average time under 30 seconds (currently Excel requires 2-3 minutes)
- Report generation: All reports complete within 10-second target
- Search functionality: Sub-second response for organization and contact searches
- System availability: 99.5% uptime during business hours

**Business Value Realization**:

- Data quality improvement: 90% reduction in duplicate or incomplete records
- Reporting efficiency: 80% reduction in report generation time
- Sales process visibility: Real-time pipeline tracking replacing weekly manual updates
- Cost control: Monthly operating costs maintained under $18 budget threshold