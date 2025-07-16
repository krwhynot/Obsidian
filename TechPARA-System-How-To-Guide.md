# TechPARA System: How To Use Guide

*Your specialized knowledge management system for computer technicians transitioning to software development*

## System Overview & Philosophy

### The TechPARA Structure
Your vault is organized using a **Modified PARA + Zettelkasten hybrid** designed specifically for:
- **Field Service Work**: Restaurant POS installation and troubleshooting
- **Coding Development**: Personal projects and skill building
- **Career Transition**: Job search and professional development

### The 6-Tier System
```
00 - Inbox/           → Quick capture for everything
01 - Projects/        → Active work with deadlines 
02 - Areas/           → Ongoing expertise domains
03 - Resources/       → Reference materials & tools
04 - Zettelkasten/    → Connected knowledge network
05 - Archive/         → Completed & outdated content
```

## Core Organizational Logic

### Files vs Folders Decision Tree

**Use Single Files When:**
- Simple reference materials
- Quick lookup guides  
- Standalone concepts
- Single-session work

**Use Project Folders When:**
- Complex work requiring multiple documents
- Multi-phase projects (planning → development → deployment)
- Need separate files for different aspects (technical design, progress logs, testing)
- **Rule**: If you need >2 related files, create a folder

### Naming Conventions

**Folders**: `lowercase-with-hyphens/`
**Files**: `descriptive-name.md` (no generic names like "notes.md")
**Projects**: `project-name/` (clear, specific names)
**Zettelkasten**: `ZK-###-concept-name.md` (numbered for linking)

**Examples:**
- ✅ `hungerRush-kds-installation/`
- ✅ `pos-troubleshooting-guide.md`
- ✅ `ZK-001-restaurant-workflow-optimization.md`
- ❌ `Project 1/`
- ❌ `notes.md`
- ❌ `stuff.md`

## Daily Workflow & Navigation

### Essential Obsidian Hotkeys
- **Ctrl+O** → Quick switcher (find any file instantly)
- **Ctrl+Shift+F** → Global search across vault
- **Ctrl+N** → New note (always starts in current folder)
- **Ctrl+E** → Toggle edit/preview mode
- **Ctrl+]** → Follow link under cursor
- **Ctrl+[** → Go back to previous note
- **Ctrl+Shift+O** → Quick switcher for folders

### Daily Workflow Pattern

**🌅 Morning Routine (5 minutes)**
1. Open `00 - Inbox/` 
2. Review yesterday's captures
3. Process items to proper locations
4. Check active projects for today's priorities

**⚙️ Field Work**
- Quick capture in `00 - Inbox/field-notes-YYYY-MM-DD.md`
- Use voice memos → transcribe later
- Photo documentation with descriptive filenames
- Immediate problem-solution capture

**💻 Coding Sessions**
- Update project's `development-log.md`
- Capture learning moments in Zettelkasten
- Link new concepts to existing knowledge

**🌙 Evening Processing (10 minutes)**
- Move inbox items to proper locations
- Update project status
- Plan tomorrow's priorities
- Quick maintenance (fix broken links, update tags)

## Project Organization Systems

### Field Service Projects
```
01 - Projects/Field Service/Active/
├── hungerRush-installation-site-A/
│   ├── project-overview.md          # Client info, scope, timeline
│   ├── technical-requirements.md    # Hardware, network, software specs
│   ├── installation-log.md          # Daily progress and issues
│   ├── troubleshooting-notes.md     # Problems encountered and solutions
│   └── handoff-checklist.md         # Training and documentation
```

### Coding Projects
```
01 - Projects/Coding Projects/Active/
├── wordle-game-project/
│   ├── project-overview.md          # Goals, features, timeline
│   ├── technical-design.md          # Architecture, tech stack
│   ├── development-log.md           # Daily coding progress
│   ├── testing-notes.md             # Bugs, tests, QA
│   └── deployment-checklist.md      # Release preparation
```

### Job Search Projects
```
01 - Projects/Job Search/Active Applications/
├── company-position-tracker.md      # Single file for simple tracking
└── major-opportunity-company/       # Folder for complex applications
    ├── application-overview.md      # Position details, timeline
    ├── company-research.md          # Culture, tech stack, people
    ├── interview-preparation.md     # Technical prep, questions
    └── follow-up-actions.md         # Next steps and contacts
```

## Template System Usage

### How to Use Templates

1. **Navigate to**: `03 - Resources/Templates/`
2. **Select template** that fits your need
3. **Copy the file** (Ctrl+C)
4. **Navigate to target location** (e.g., `01 - Projects/`)
5. **Paste and rename** with descriptive name
6. **Fill in the template** replacing placeholders
7. **Add links and tags** for discoverability

### Core Templates Available

#### Field Service Installation Template
```markdown
# Installation: [Restaurant Name] - [System Type]
**Status**: Planning/In Progress/Completed
**Client**: [Restaurant Name]
**System**: [POS System/Equipment]
**Timeline**: [Start Date] - [Completion Date]

## Pre-Installation Survey
- [ ] Network infrastructure assessed
- [ ] Power requirements verified  
- [ ] Hardware placement planned
- [ ] Staff availability confirmed

## Installation Checklist
- [ ] Hardware installed and connected
- [ ] Network configuration completed
- [ ] Software installation and setup
- [ ] System testing and validation
- [ ] Data migration (if applicable)

## Post-Installation
- [ ] Staff training completed
- [ ] Documentation provided
- [ ] Support contact information shared
- [ ] Follow-up appointment scheduled

## Technical Notes
[Installation-specific technical details]

## Issues & Solutions
[Problems encountered and how they were resolved]

## Links
- [[02 - Areas/Restaurant POS Systems/]]
- [[troubleshooting-guide]]
```

#### Coding Project Template
```markdown
# Project: [Project Name]
**Status**: Planning/Active/Testing/Completed
**Tech Stack**: [Languages, frameworks, tools]
**Timeline**: [Start Date] - [Target Completion]
**Repository**: [GitHub/GitLab link if applicable]

## Project Objective
[What you're building and why]

## Key Features
- [ ] Core feature 1
- [ ] Core feature 2  
- [ ] Advanced feature 1
- [ ] Polish feature 1

## Current Progress
[Latest development status and next steps]

## Technical Architecture
[High-level system design]

## Development Environment
[Setup instructions, dependencies]

## Testing Strategy
[How you plan to test the application]

## Deployment Plan
[How you'll deploy and share the project]

## Learning Goals
[What you want to learn from this project]

## Links
- [[technical-design]]
- [[development-log]]
- [[testing-notes]]
- [[02 - Areas/Software Development/]]
```

#### Job Application Tracker Template
```markdown
# [Company Name] - [Position Title]
**Applied**: [Date]
**Status**: Applied/Phone Screen/Interview/Offer/Rejected
**Salary Range**: [If disclosed]
**Location**: [Remote/Hybrid/On-site]

## Position Details
**Job Description Summary**: [Key responsibilities]
**Required Skills**: [Technologies, experience needed]
**Preferred Skills**: [Nice-to-have qualifications]

## Company Research
**Company Size**: [Employee count, funding stage]
**Industry**: [What they do]
**Culture Notes**: [What you learned about working there]
**Technology Stack**: [What they use]
**Recent News**: [Funding, product launches, etc.]

## Application Materials
- [ ] Resume tailored for this position
- [ ] Cover letter written
- [ ] Portfolio updated with relevant projects
- [ ] LinkedIn profile optimized

## Interview Preparation
- [ ] Technical questions for this stack researched
- [ ] Company-specific questions prepared
- [ ] Questions to ask them prepared
- [ ] Mock interview completed

## Interview History
**[Date]**: [Type of interview - phone, video, on-site]
- **Interviewer(s)**: [Names and roles]
- **Topics Covered**: [Technical questions, behavioral, etc.]
- **My Performance**: [How it went, what went well/poorly]
- **Next Steps**: [What they said about timeline]

## Follow-up Actions
- [ ] Thank you email sent (within 24 hours)
- [ ] Additional materials requested sent
- [ ] Connections made on LinkedIn
- [ ] Calendar reminder set for follow-up

## Outcome & Lessons
[Final result and what you learned for next applications]

## Links
- [[01 - Projects/Job Search/]]
- [[portfolio-projects]]
- [[interview-preparation-guide]]
```

## Zettelkasten Knowledge Network

### Creating Atomic Notes

**Purpose**: Build a web of connected knowledge that grows smarter over time

**Structure of a Zettelkasten Note**:
```markdown
# ZK-001: [Concept Name]

[One clear concept explained in 1-3 paragraphs]

## Key Insights
- Bullet point summary
- Main takeaways
- Practical applications

## Connections
- **Builds on**: [[ZK-002-foundational-concept]]
- **Relates to**: [[ZK-015-similar-concept]]
- **Applied in**: [[project-name]]

## Sources
- [Where you learned this]
- [Related documentation]

#zettelkasten #domain-tag #concept-type
```

### Linking Strategy

**Always Connect**:
- Every new Zettelkasten note should link to at least 2 existing notes
- Link to both foundational concepts and applications
- Use descriptive link text: `[[ZK-005-database-indexing|database performance]]`

**Types of Links**:
- **Builds on**: Foundational concepts this note depends on
- **Relates to**: Similar or complementary concepts  
- **Applied in**: Projects or areas where this is used
- **Contradicts**: Alternative viewpoints or approaches

### Sample Zettelkasten Notes

#### ZK-001: Restaurant POS Architecture Fundamentals
```markdown
# ZK-001: Restaurant POS Architecture Fundamentals

Restaurant POS systems typically follow a client-server architecture where terminals (clients) connect to a central database server. This centralized approach ensures data consistency across all ordering points while providing real-time inventory and sales tracking.

## Key Components
- **Terminal Layer**: Customer-facing interfaces for order entry
- **Processing Layer**: Business logic, payment processing, tax calculation
- **Data Layer**: Customer data, inventory, sales transactions, reporting

## Key Insights
- Network reliability is critical - lost connections halt operations
- Local caching can provide limited offline functionality
- Database performance directly impacts customer experience
- Security must protect payment data throughout the entire system

## Connections
- **Builds on**: [[ZK-002-client-server-architecture]]
- **Relates to**: [[ZK-015-payment-processing-security]]
- **Applied in**: [[hungerRush-installation-project]]

## Sources
- Field experience with HungerRush installations
- POS vendor technical documentation

#zettelkasten #pos-systems #architecture #restaurant-tech
```

### Maps of Content (MOCs)

**Purpose**: Create navigation hubs for related topics

#### MOC: Restaurant Technology Ecosystem
```markdown
# MOC: Restaurant Technology Ecosystem

*Navigation hub for restaurant technology knowledge*

## POS System Knowledge
- [[ZK-001-pos-architecture-fundamentals]]
- [[ZK-003-payment-processing-flow]]
- [[ZK-005-inventory-management-integration]]
- [[hungerRush-system-specifics]]

## Network Infrastructure
- [[ZK-002-restaurant-network-design]]
- [[ZK-004-wifi-vs-wired-considerations]]
- [[network-troubleshooting-guide]]

## Field Service Expertise  
- [[installation-best-practices]]
- [[common-troubleshooting-scenarios]]
- [[customer-training-techniques]]

## Industry Trends
- [[cloud-vs-local-pos-systems]]
- [[mobile-payment-integration]]
- [[kitchen-display-system-evolution]]

## Active Projects
- [[01 - Projects/Field Service/Active/]]

#moc #restaurant-tech #knowledge-hub
```

## Search & Discovery

### Tagging Strategy

**Domain Tags**:
- `#field-service` - Restaurant installation work
- `#coding` - Software development activities  
- `#job-search` - Career transition activities
- `#networking` - Network infrastructure knowledge

**Status Tags**:
- `#active` - Currently working on
- `#review-needed` - Needs attention or update
- `#completed` - Finished work
- `#someday` - Future possibilities

**Type Tags**:
- `#troubleshooting` - Problem-solving knowledge
- `#learning` - Educational content
- `#reference` - Quick lookup materials
- `#template` - Reusable structures

### Advanced Search Techniques

**Boolean Search**:
- `"POS system" AND troubleshooting` - Exact phrase plus keyword
- `installation OR setup` - Either term
- `network -wifi` - Network but not wifi

**Tag Combinations**:
- `tag:#field-service tag:#troubleshooting` - Field service troubleshooting
- `tag:#coding tag:#active` - Active coding projects

**Date-based Search**:
- `created:2025-01-01` - Files created since January 1st
- `modified:2025-01-15..2025-01-20` - Modified within date range

## Maintenance & Review Cycles

### Daily (5-10 minutes)
- [ ] Process inbox captures
- [ ] Update active project logs
- [ ] Check for broken links (Obsidian will highlight them)

### Weekly (30 minutes)
- [ ] Review all active projects for stalled items
- [ ] Archive completed work
- [ ] Update job search tracking
- [ ] Clean up tags and organize new content
- [ ] Create any needed Zettelkasten connections

### Monthly (2 hours)
- [ ] Comprehensive system health check
- [ ] Update MOCs with new knowledge areas
- [ ] Review and improve templates based on usage
- [ ] Archive old projects and outdated information
- [ ] Plan upcoming projects and learning goals

### Quarterly (4 hours)
- [ ] Major reorganization if needed
- [ ] Export important data for backup
- [ ] Evaluate system effectiveness and make improvements
- [ ] Career progress review and planning

## Quick Reference

### Most Used Folders
- `00 - Inbox/` - Daily capture
- `01 - Projects/Field Service/Active/` - Current installations
- `01 - Projects/Coding Projects/Active/` - Current development
- `01 - Projects/Job Search/` - Career transition
- `02 - Areas/Restaurant POS Systems/` - Core expertise
- `03 - Resources/Templates/` - Reusable structures

### Emergency Quick Captures
- **Field Issue**: `00 - Inbox/urgent-[restaurant-name]-[date].md`
- **Code Solution**: `00 - Inbox/code-solution-[brief-description].md`  
- **Job Lead**: `00 - Inbox/job-[company-name]-[date].md`
- **Learning**: `00 - Inbox/learned-[concept]-[date].md`

### Link Shortcuts
- `[[]]` - Create internal link
- `![[]]` - Embed content from another note
- `[[note#heading]]` - Link to specific section
- `[[note|display text]]` - Custom link text

This system grows with you as you transition from technician to developer, maintaining your field service expertise while building your coding knowledge and career opportunities.