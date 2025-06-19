Remembering this is the Food Service CRM project - a NextCRM-based customer relationship management system specifically designed for the food service industry, being built to replace an Excel-based system for a family company with 4 sales representatives.

<document>

# Food Service CRM - Consolidated Reference Document

## Project Overview

### Business Context

- **Client**: Family Food Service Company with 4 sales representatives
- **Current System**: Excel-based relationship management (causing operational inefficiencies)
- **Goal**: Complete replacement with modern, scalable CRM optimized for iPad usage
- **Timeline**: 8-week implementation (flexible, not hard deadline)
- **Budget**: Strict $18/month Azure hosting limit ($5 SQL + $13 App Service)

### Key Success Factors

- Complete Excel system replacement with 100% data migration accuracy
- 50% faster data entry compared to Excel workflow
- 80% faster report generation (<10 seconds vs manual Excel reports)
- Sub-second search performance with production data
- 100% user adoption within 3 months
- iPad-first design with 44px minimum touch targets

## Technical Architecture

### Technology Stack


- **Frontend**: Next.js 15, React 19 , TypeScript, shadcn/ui, Tremor charts
- **Backend**: Node.js with DRIZZLE ORM
- **Database**: Azure SQL Server Basic tier ($5/month)
- **Hosting**: Azure App Service Basic B1 tier ($13/month)
- **Testing**: Jest + React Testing Library with 44px touch target compliance
- **CI/CD**: GitHub Actions (planned)

### Performance Requirements

- **Search Operations**: <1 second response time
- **Report Generation**: <10 seconds for all report types
- **Touch Targets**: Minimum 44px for all interactive elements
- **Page Load**: <3 seconds on 3G connection
- **Concurrent Users**: Support 4 users on Azure Basic tier
- **Data Entry**: 30-second target for interaction logging

## Food Service Business Requirements

### Core Entities

#### Organizations (Restaurants & Food Service Businesses)

- **Priority Levels**: A (Green), B (Yellow), C (Orange), D (Red)
- **Market Segments**: Fine Dining, Fast Food, Healthcare, Catering, Institutional
- **Distributors**: Sysco, USF, PFG, Direct, Other
- **Account Manager Assignment**: Preserved from existing Excel data
- **Revenue Tracking**: Annual revenue and total value fields

#### Contacts (Multiple per Organization)

- **Roles**: Exec Chef, Buyer, Manager, Owner, Kitchen Manager
- **Primary Contact**: One designated per organization
- **Duplicate Prevention**: Name and email matching within same organization
- **Decision Hierarchy**: Role-based categorization for food service industry

#### Interactions (6 Types)

- **Types**: Email, Call, In Person, Demo/sampled, Quoted price, Follow-up
- **30-Second Entry Goal**: Optimized for quick field data capture
- **Auto-Complete**: Organizations and contacts with <500ms response
- **Auto-Save**: Every 30 seconds with form recovery

#### Sales Pipeline (5 Stages)

- **Stages**: Lead-discovery → Contacted → Sampled/Visited → Follow-up → Close
- **11 Principals**: Kaufholds, Frites Street, Better Balance, VAF, Ofk, Annasea, Wicks, RJC, Kayco, Abdale, Land Lovers
- **Status Tracking**: Open, Closed-Won, Closed-Lost, On Hold
- **Probability**: 0-100% tracking with stage-based defaults
- **Value Tracking**: Expected revenue and close date

### Settings Management System (9 Categories)

Dynamic configuration system replacing hard-coded values:

1. **Priority** (A-D with color coding)
2. **Segment** (Market categories)
3. **Distributor** (Supply chain partners)
4. **Account Manager** (Sales team assignments)
5. **Stage** (Pipeline progression)
6. **Position** (Contact roles)
7. **Reason** (Opportunity tracking)
8. **Source** (Lead generation)
9. **Interaction** (Activity types)

### Reporting Requirements (4 Core Types)

1. **Weekly Activity Reports by Account Manager**
    
    - Interaction volume and type breakdown
    - Visit frequency and activity summaries
    - Performance metrics and trend analysis
2. **Pipeline Status by Principal Reports**
    
    - Opportunities by stage for each of 11 principals
    - Principal-specific conversion rates and metrics
    - Stage duration analysis and progression tracking
3. **Interaction Volume Analysis Reports**
    
    - Time-based interaction trends and patterns
    - Interaction type effectiveness metrics
    - Account manager activity comparison
4. **Organization Performance Tracking Reports**
    
    - Priority level distribution and segment analysis
    - Account manager assignment effectiveness
    - Organization engagement metrics and trends

## Database Schema

### Core Models (DRIZZLE Schema)

```Drizzle
// Settings Management System
model Setting {
  id        String   @id @default(cuid())
  category  String   // Priority, Segment, Distributor, etc.
  key       String   // Actual value (e.g., "A", "Fine Dining", "Sysco")
  label     String?  // Display name
  color     String?  // For priority colors and UI highlighting
  sortOrder Int      // For maintaining specific order in dropdowns
  active    Boolean  @default(true)
  metadata  String?  @db.Text
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  @@unique([category, key])
  @@index([category, active])
}

// Organization with Food Service Fields
model Organization {
  id               String    @id @default(cuid())
  name             String
  priorityId       String?
  segmentId        String?
  distributorId    String?
  accountManagerId String?
  annualRevenue    Decimal?  @db.Decimal(18, 2)
  totalValue       Decimal?  @db.Decimal(18, 2)
  // ... address and contact fields
  
  // Relations
  priority         Setting?  @relation(name: "OrganizationPriority")
  segment          Setting?  @relation(name: "OrganizationSegment")
  distributor      Setting?  @relation(name: "OrganizationDistributor")
  contacts         Contact[]
  interactions     Interaction[]
  opportunities    Opportunity[]
}

// Contact with Role Hierarchy
model Contact {
  id             String    @id @default(cuid())
  organizationId String
  firstName      String
  lastName       String
  roleId         String?   // References Setting (category: "ContactRole")
  email          String?
  phone          String?
  title          String?
  notes          String?   @db.Text
  isActive       Boolean   @default(true)
  
  organization   Organization @relation(fields: [organizationId], references: [id])
  interactions   Interaction[]
  opportunities  Opportunity[]
}

// Interaction with 6 Types
model Interaction {
  id               String    @id @default(cuid())
  organizationId   String
  contactId        String?
  userId           String    // Account manager
  interactionDate  DateTime
  typeId           String    // References Setting (category: "InteractionType")
  notes            String?   @db.Text
  followUpDate     DateTime?
  isCompleted      Boolean   @default(false)
  
  organization     Organization @relation(fields: [organizationId], references: [id])
  contact          Contact?     @relation(fields: [contactId], references: [id])
  user             User         @relation(fields: [userId], references: [id])
}

// Opportunity with 11 Principals
model Opportunity {
  id                String    @id @default(cuid())
  organizationId    String
  contactId         String?
  userId            String
  principal         String    // One of 11 principals
  stage            String     // 5-stage pipeline
  status           String     // Open, Closed-Won, etc.
  probability      Int        // 0-100
  expectedRevenue  Decimal?   @db.Decimal(10, 2)
  expectedCloseDate DateTime?
  notes            String?    @db.Text
  
  organization     Organization @relation(fields: [organizationId], references: [id])
  contact          Contact?     @relation(fields: [contactId], references: [id])
  user             User         @relation(fields: [userId], references: [id])
}
```

### Critical Database Indexes

```sql
-- Search Performance (CRITICAL for <1 second requirement)
CREATE INDEX IX_organizations_name_prefix ON organizations(name);
CREATE INDEX IX_contacts_search ON contacts(firstName, lastName, organizationId);

-- Reporting Performance (CRITICAL for <10 second reports)
CREATE INDEX IX_interactions_reporting ON interactions(accountManagerId, interactionDate, interactionTypeId);
CREATE INDEX IX_opportunities_pipeline ON opportunities(stageId, statusId, expectedCloseDate);

-- Settings Cache Optimization
CREATE INDEX IX_setting_options_active ON setting_options(categoryId, isActive, sortOrder);
```

## Implementation Phases

### Phase 1: Foundation & Infrastructure (COMPLETED ✅)

- NextCRM repository setup and dependency resolution
- Azure SQL Database Basic ($5/month) deployment
- Database schema migration (MongoDB → Azure SQL)
- Prisma client generation and testing
- Food service component library creation
- Comprehensive testing setup (Jest + React Testing Library)
- 44px touch target compliance validation

### Phase 2: Core CRM Functionality (WEEKS 3-5)

**Task #3: Organization Management Implementation**

- Enhanced database schema with food service fields
- Organization API endpoints with search, filters, pagination
- iPad-optimized list view with sub-second search
- Priority color coding (A=Green, B=Yellow, C=Orange, D=Red)
- Comprehensive organization forms with real-time validation

**Task #4: Contact Management Implementation**

- Contact CRUD with role hierarchy support
- Primary contact designation (one per organization)
- Duplicate prevention within organizations
- Quick contact creation for field visits

**Task #5: Interaction Tracking Implementation**

- 6 interaction types with 30-second entry target
- Auto-complete for organizations/contacts (<500ms)
- Auto-save functionality with form recovery
- Timeline displays with filtering capabilities

**Task #6: Global Search & Advanced Filtering**

- Full-text search across all entities
- Advanced filtering with multi-select components
- Search result highlighting and relevance scoring

### Phase 3: Pipeline, Opportunities & Reporting (WEEKS 6-7)

**Task #7: Sales Pipeline Implementation**

- 5-stage pipeline with drag-and-drop interface
- 11 principal integration and tracking
- Visual Kanban board optimized for iPad landscape
- Opportunity value and revenue tracking

**Task #8: Comprehensive Opportunity Tracking**

- Extended opportunity model with value tracking
- Pipeline value calculations and forecasting
- Win/loss ratio tracking

**Task #9: Reporting Engine**

- 4 core report types with <10 second generation
- Tremor charts integration for visualizations
- Date range filtering and export capabilities
- Real-time dashboard with key metrics

### Phase 4: Data Migration, Testing & Launch (WEEK 8)

**Task #10: Excel Data Migration Pipeline**

- .xlsx and .csv file format support
- Comprehensive data validation and quality checks
- Relationship preservation and integrity verification
- Duplicate detection and resolution

**Task #11: User Acceptance Testing**

- Multi-device testing (touch laptop primary)
- Performance validation with production data
- Sales team workflow testing and feedback integration

**Task #12: Production Deployment**

- Azure App Service Basic B1 configuration
- SSL and security hardening
- Monitoring and alerting setup
- Cost compliance verification

## Quality Gates & Testing

### Phase Requirements (100% Pass Required)

Each phase has mandatory quality gates that must pass before proceeding:

#### Phase 1 Quality Gate ✅

- NextCRM foundation operational
- Azure SQL Database connected
- All food service components passing tests
- Touch target compliance validated

#### Phase 2 Quality Gates

- Organization CRUD operations <2 seconds
- 30-second interaction entry achieved
- Auto-complete performance <500ms
- Multi-device functionality verified
- Search performance <1 second with 100+ records

#### Phase 3 Quality Gates

- 5-stage pipeline functional
- All 11 principals integrated
- Reports generate <10 seconds
- Chart integration working
- Data accuracy verified

#### Phase 4 Quality Gates

- 100% data migration accuracy
- Production environment operational
- User acceptance achieved
- Performance targets met consistently
- Cross-browser compatibility verified

### Testing Standards

- **Touch Target Compliance**: All interactive elements ≥44px
- **Multi-Device Testing**: Touch and mouse input validation
- **Performance Testing**: Azure Basic tier constraint validation
- **Coverage Requirements**: 70% overall, 80% for food service components
- **Browser Support**: Chrome, Edge, Firefox, Safari

## Component Library & Code Standards

### Food Service Components

```typescript
// PriorityBadge - Color-coded priority display
const PRIORITY_COLOR_MAP = {
  'A': 'bg-green-500 text-white',
  'B': 'bg-yellow-500 text-black',
  'C': 'bg-orange-500 text-white',
  'D': 'bg-red-500 text-white'
} as const;

interface PriorityBadgeProps {
  priority: keyof typeof PRIORITY_COLOR_MAP;
  className?: string;
}

// SegmentSelector - Market segment dropdown
interface SegmentSelectorProps {
  value: string;
  onValueChange: (value: string) => void;
  className?: string;
}

// DistributorField - Supply chain partner selection
interface DistributorFieldProps {
  value: string;
  onValueChange: (value: string) => void;
  className?: string;
}
```

### Code Standards

- **TypeScript**: Strict mode enabled with proper interfaces
- **React Patterns**: Functional components with hooks
- **Error Handling**: Comprehensive error boundaries
- **Touch Optimization**: Minimum 44px interactive elements
- **Performance**: React.memo and useCallback for optimization
- **Testing**: Jest + React Testing Library with touch compliance

### iPad Optimization CSS

```css
/* Touch target minimum sizes */
.touch-target {
  min-height: 44px;
  min-width: 44px;
}

.form-input-touch {
  height: 48px;
  font-size: 16px; /* Prevents zoom on iOS */
  padding: 12px 16px;
}

.button-touch {
  min-height: 48px;
  padding: 12px 24px;
  font-size: 16px;
}

/* iPad landscape optimization */
@media (min-width: 768px) and (orientation: landscape) {
  .ipad-landscape {
    max-width: 1024px;
    margin: 0 auto;
    padding: 20px;
  }
}
```

## Infrastructure & Deployment

### Azure Configuration

- **SQL Database**: Basic tier, 2GB storage, 5 DTUs, $5/month
- **App Service**: Basic B1, 1.75GB RAM, 1 CPU core, $13/month
- **Total Cost**: $18/month (within budget constraint)
- **Firewall**: Configured for development access
- **Backup**: 7-day retention included with Basic tier

### Environment Setup

```powershell
# Database operations
npx prisma generate
npx prisma db push
npx prisma db seed

# Development server
npm run dev

# Testing
npm test

# Production build
npm run build
```

### CI/CD Pipeline (Planned)

- GitHub Actions for automated deployment
- Automated testing before deployment
- Database migration automation
- Environment-specific configuration management
- Rollback procedures for failed deployments

## Known Issues & Solutions

### Critical Issues Resolved

1. **Missing NextCRM Components**: Simplified Header and SideBar for food service focus
2. **React 19 RC Compatibility**: Replaced react-beautiful-dnd with @hello-pangea/dnd
3. **Bundle Size Optimization**: Removed moment.js (replaced with date-fns), audit PrimeReact usage
4. **AWS SDK Mismatch**: Replace with Azure Blob Storage SDK for consistency

### Database Optimization

- **N+1 Query Prevention**: Strategic use of Prisma includes
- **Index Strategy**: Comprehensive indexing for search and reporting performance
- **Azure SQL Optimization**: Query hints and DTU management for Basic tier

### Performance Optimizations

```typescript
// Optimized organization search
const searchOrgs = await prisma.organization.findMany({
  where: {
    name: { startsWith: searchTerm }  // Uses prefix index
  },
  select: {
    id: true,
    name: true,
    priority: { select: { label: true, colorCode: true }},
    segment: { select: { label: true }}
  },
  take: 20,
  orderBy: { name: 'asc' }
});

// Strategic includes to prevent N+1
const organizations = await prisma.organization.findMany({
  include: {
    priority: true,
    segment: true,
    contacts: {
      where: { isPrimary: true },
      include: { position: true }
    },
    _count: {
      select: {
        contacts: true,
        interactions: true,
        opportunities: true
      }
    }
  }
});
```

## Migration & Data Quality

### Excel Import Pipeline

- **File Support**: .xlsx and .csv formats
- **Validation**: Comprehensive business rule checking
- **Duplicate Detection**: Fuzzy matching for organization names and contact emails
- **Relationship Preservation**: Organization-Contact-Interaction-Opportunity integrity
- **Progress Tracking**: Real-time status updates and error reporting
- **Rollback Capability**: Complete recovery for failed imports

### Data Integrity Verification

```sql
-- Verify migration completeness
SELECT 'Orphaned Contacts' as Issue, COUNT(*) as Count
FROM contacts c 
LEFT JOIN organizations o ON c.organizationId = o.id
WHERE o.id IS NULL

UNION ALL

SELECT 'Invalid Priority References', COUNT(*)
FROM organizations o
LEFT JOIN setting_options p ON o.priorityId = p.id  
WHERE p.id IS NULL
```

## Success Metrics & KPIs

### Performance Targets

- **Search Response**: <1 second with production data
- **Report Generation**: <10 seconds for all 4 types
- **Data Entry Speed**: 50% improvement over Excel
- **Touch Interaction**: Drag-and-drop <30 seconds per move
- **System Uptime**: 99%+ availability
- **User Adoption**: 100% within 3 months

### Business Value Metrics

- **Time Savings**: 50% reduction in data entry time
- **Report Efficiency**: 80% faster report creation
- **Data Accuracy**: Zero formatting errors and duplicates
- **Mobile Productivity**: Seamless field data entry
- **Cost Efficiency**: <$18/month operational cost

### Quality Assurance

- **Code Coverage**: 70% overall, 80% for critical components
- **Touch Compliance**: 100% of interactive elements ≥44px
- **Multi-Device Support**: Full functionality on touch and mouse interfaces
- **Cross-Browser**: 100% feature parity across Chrome, Edge, Firefox, Safari
- **Data Migration**: 100% accuracy with zero data loss

</document>