# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a TechPARA + Zettelkasten hybrid knowledge management system designed for computer technicians transitioning to software development. The vault contains field service documentation (primarily HungerRush POS systems), coding projects, career development tracking, and interconnected knowledge networks.

## System Architecture

### TechPARA 6-Tier Structure
```
00 - Inbox/           → Quick capture for all incoming information
01 - Projects/        → Active work with deadlines (Field Service, Coding, Job Search)
02 - Areas/           → Ongoing expertise domains (POS Systems, Network Infrastructure, Software Development)
03 - Resources/       → Reference materials, templates, and tools
04 - Zettelkasten/    → Connected knowledge network with atomic notes and MOCs
05 - Archive/         → Completed projects and legacy content
```

### Key Architectural Principles
- **Template-Driven**: All content creation uses standardized templates from `03 - Resources/Templates/`
- **Cross-Domain Linking**: Field service knowledge explicitly connected to coding concepts through Zettelkasten notes
- **Systematic Maintenance**: Daily/weekly review cycles maintain system health
- **Career-Focused**: All content serves the technician-to-developer transition

## Common Operations

### Content Creation Workflow
1. **Capture**: Quick notes in `00 - Inbox/` using established naming conventions
2. **Process**: Move to appropriate permanent locations during daily/weekly reviews
3. **Template**: Use relevant template from `03 - Resources/Templates/`
4. **Connect**: Link to existing knowledge through Zettelkasten notes and MOCs

### Daily Maintenance
- Use `daily-review-checklist.md` template for 5-minute end-of-day processing
- Process inbox items to permanent locations
- Update active project status

### Weekly Maintenance  
- Use `weekly-system-maintenance.md` template for comprehensive review
- Clear inbox completely
- Update knowledge connections and MOCs

### Knowledge Development
- Create Zettelkasten notes using `ZK-###-concept-name.md` format
- Update Maps of Content (MOCs) when adding related knowledge
- Maintain bidirectional connections between concepts

## Project Structure Patterns

### Field Service Projects
Structure: `01 - Projects/Field Service/Active/[project-name]/`
- Use `field-service-installation-template.md` for new installations
- Reference knowledge base in `02 - Areas/Restaurant POS Systems/`
- Connect to relevant Zettelkasten notes for systematic approaches

### Coding Projects
Structure: `01 - Projects/Coding Projects/Active/[project-name]/`
- Use `coding-project-template.md` for new development projects
- Include `project-overview.md`, `development-log.md`, and technical documentation
- Connect to career development tracking in Job Search portfolio

### Knowledge Management
- **Zettelkasten Notes**: `04 - Zettelkasten/Permanent Notes/ZK-###-concept.md`
- **Maps of Content**: `04 - Zettelkasten/Maps of Content/MOC-topic.md`
- **Templates**: `03 - Resources/Templates/[purpose]-template.md`

## Naming Conventions

### Files and Folders
- **Folders**: `lowercase-with-hyphens/`
- **Files**: `descriptive-specific-name.md` (avoid generic names)
- **Zettelkasten**: `ZK-###-concept-name.md` (sequential numbering)
- **Templates**: `[purpose]-template.md`

### Content Organization Rules
- **Single files**: Simple reference materials, standalone concepts
- **Project folders**: Complex work requiring multiple documents (use when >2 related files needed)
- **Systematic linking**: All content should connect to broader knowledge network

## Key Reference Points

### Essential Templates
- `zettelkasten-note-template.md` - For atomic knowledge creation
- `troubleshooting-log-template.md` - For systematic problem solving
- `coding-project-template.md` - For development projects
- `daily-review-checklist.md` - For system maintenance

### Knowledge Hubs (MOCs)
- `MOC-hungerRush-expertise.md` - Central hub for POS system knowledge
- `MOC-coding-fundamentals.md` - Software development concepts
- `MOC-career-transition.md` - Professional development tracking
- `MOC-restaurant-technology-ecosystem.md` - Industry-specific knowledge

### Core System Files
- `TechPARA-System-How-To-Guide.md` - Comprehensive system usage guide
- `TechPARA-Quick-Reference.md` - Fast access to common workflows
- `TechPARA-Implementation-Checklist.md` - System development tracking

## Workflow Integration

### Problem-Solving Approach
1. Search existing knowledge using Zettelkasten connections
2. Apply systematic troubleshooting methodology from templates
3. Document solutions for future reference
4. Update relevant knowledge networks

### Learning Integration
1. Capture insights in inbox during work
2. Process to Zettelkasten notes with proper connections
3. Update MOCs to reflect new understanding
4. Apply knowledge to current projects

### Career Development
1. Connect all technical work to portfolio development
2. Document skill progression and learning
3. Build narrative bridging field service to coding experience
4. Maintain professional development tracking

## Special Considerations

### Cross-Domain Knowledge
The system explicitly connects field service experience to software development through systematic linking. Field service troubleshooting approaches directly inform software debugging methodologies.

### Portfolio Integration
All coding projects and field service experience contribute to career transition portfolio. Technical documentation serves dual purpose as knowledge management and professional showcase.

### Maintenance Requirements
System requires consistent daily/weekly maintenance for optimal function. Templates and checklists ensure this maintenance happens systematically without cognitive overhead.

### Automation Integration
The system supports Obsidian plugin automation to reduce manual overhead:
- **Templater**: Enhances template system with dynamic capabilities
- **Auto Note Mover**: Automates inbox processing using established naming conventions
- **Dataview**: Creates dynamic project dashboards and progress tracking
- **Automatic Linker**: Maintains Zettelkasten connections automatically

Reference `obsidian-extensions-for-techpara.md` for complete automation setup guide.