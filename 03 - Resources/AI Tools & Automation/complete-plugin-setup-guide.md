# Complete Plugin Setup Guide for TechPARA System

*Step-by-step GUI configuration for essential Obsidian plugins to automate and enhance your TechPARA + Zettelkasten workflow*

## Overview

This guide provides complete setup instructions for plugins that will transform your TechPARA system into a visual, automated project management platform. All plugins install via Obsidian's GUI (no git conflicts) and integrate seamlessly with your existing templates and folder structure.

## Priority Plugin Analysis

### Phase 1: Foundation Automation (Week 1)

#### 🔥 Auto Note Mover - CRITICAL
**Why Essential for TechPARA:**
- Automates your daily inbox processing workflow
- Moves notes to correct folders based on your naming conventions
- Reduces daily maintenance from 5 minutes to 2 minutes
- Critical for systematic knowledge organization

**Benefits:**
- Automatic routing: `#field-service` → Field Service projects
- Pattern matching: `install-*` → Active installations
- Template integration: Works with your existing naming system
- Error prevention: Won't overwrite existing files

#### 🔥 Virtual Linker (Automatic Linker) - CRITICAL  
**Why Essential for TechPARA:**
- Maintains Zettelkasten connections automatically
- Links field service concepts to coding knowledge
- Discovers cross-domain connections you might miss
- Essential for your technician-to-developer knowledge bridge

**Benefits:**
- Real-time linking as you type
- Works with aliases and note titles
- Supports your ZK-### numbering system
- No manual maintenance required

#### 🔥 Calendar Plugin - HIGH PRIORITY
**Why Valuable for TechPARA:**
- Visual scheduling for field service appointments
- Project deadline tracking across all domains
- Job interview and application timeline management
- Integrates with your daily notes system

**Benefits:**
- Visual project timelines
- Deadline awareness
- Schedule coordination
- Daily note integration

#### 🔥 Kanban Plugin - HIGH PRIORITY
**Why Valuable for TechPARA:**
- Visual project management for field service, coding, and job search
- Drag-and-drop task organization
- Progress tracking across all project types
- Complements your systematic approach

**Benefits:**
- Visual workflow: To Do → In Progress → Done
- Project status at a glance
- Multi-domain project tracking
- Integration with existing project structure

### Phase 2: Enhanced Productivity (Week 2)

#### 📊 Advanced Tables - MEDIUM PRIORITY
**Why Useful for TechPARA:**
- Enhanced technical documentation
- Equipment inventories and specifications
- Project tracking with formulas
- Professional data presentation

#### 🔍 Omnisearch - MEDIUM PRIORITY  
**Why Useful for TechPARA:**
- Search PDFs and images (technical manuals, screenshots)
- OCR capabilities for scanned documents
- Enhanced discovery of technical information
- Better access to field service documentation

#### 📁 Recent Files - LOW PRIORITY
**Why Convenient for TechPARA:**
- Quick access to active projects
- Streamlined workflow switching
- Reduced navigation time
- Complements your multi-domain work style

---

## Installation Instructions

### General Installation Process
1. Open **Settings** in Obsidian
2. Navigate to **Community plugins**
3. Ensure **Restricted mode** is **OFF**
4. Click **Browse** 
5. Search for plugin name
6. Click **Install**
7. **Enable** the plugin
8. Configure using sections below

---

## Phase 1 Plugin Configurations

### Auto Note Mover Configuration

#### Step 1: Access Settings
1. Go to **Settings** → **Community plugins**
2. Find **Auto Note Mover** → **Options**

#### Step 2: Basic Configuration
- **Enable automatic trigger**: ✅ ON
- **Trigger on file creation**: ✅ ON  
- **Trigger on file edit**: ✅ ON
- **Use exclusion list**: ✅ ON

#### Step 3: Create TechPARA Rules
Click **Add Rule** for each of the following:

**Rule 1: Field Service Projects**
- **Trigger**: Tag
- **Tag**: `#field-service`
- **Destination**: `01 - Projects/Field Service/Active/`
- **Priority**: 1

**Rule 2: Coding Projects**
- **Trigger**: Tag  
- **Tag**: `#coding`
- **Destination**: `01 - Projects/Coding Projects/Active/`
- **Priority**: 2

**Rule 3: Job Search Items**
- **Trigger**: Tag
- **Tag**: `#job-search`
- **Destination**: `01 - Projects/Job Search/`
- **Priority**: 3

**Rule 4: Installation Notes**
- **Trigger**: Title (regex)
- **Pattern**: `^install-.*`
- **Destination**: `01 - Projects/Field Service/Active/`
- **Priority**: 4

**Rule 5: Zettelkasten Notes**
- **Trigger**: Title (regex)
- **Pattern**: `^ZK-\d{3}-.*`
- **Destination**: `04 - Zettelkasten/Permanent Notes/`
- **Priority**: 5

**Rule 6: MOC Notes**
- **Trigger**: Title (regex)
- **Pattern**: `^MOC-.*`
- **Destination**: `04 - Zettelkasten/Maps of Content/`
- **Priority**: 6

#### Step 4: Exclusion Settings
**Excluded folders:**
- `03 - Resources/Templates/`
- `05 - Archive/`
- `.obsidian/`

**Excluded patterns:**
- `daily-review-*`
- `weekly-maintenance-*`
- `*-template`

#### Step 5: Test Configuration
1. Create a test note with `#field-service` tag
2. Verify it moves to correct folder
3. Test other rules with sample notes

### Virtual Linker Configuration

#### Step 1: Access Settings
1. Go to **Settings** → **Community plugins**  
2. Find **Virtual Linker** → **Options**

#### Step 2: Basic Configuration
- **Enable virtual links**: ✅ ON
- **Work in edit mode**: ✅ ON
- **Work in reading mode**: ✅ ON
- **Case sensitive matching**: ❌ OFF

#### Step 3: File Matching Settings
- **Match all files**: ✅ ON
- **Include aliases**: ✅ ON
- **Match partial words**: ❌ OFF (to avoid false positives)

#### Step 4: TechPARA-Specific Settings
**Include tags** (add these to your notes to force linking):
- `linker-include` 

**Exclude tags** (add these to avoid linking):
- `linker-exclude`

**Folders to exclude:**
- `00 - Inbox/` (until processed)
- `03 - Resources/Templates/`
- `.obsidian/`

#### Step 5: Advanced Settings
- **Minimum word length**: 3
- **Maximum links per note**: 50
- **Update frequency**: Real-time
- **Show link preview**: ✅ ON

### Calendar Plugin Configuration

#### Step 1: Access Settings
1. Install **Calendar** plugin
2. Go to **Settings** → **Calendar**

#### Step 2: Basic Configuration
- **Start week on**: Monday
- **Show week numbers**: ✅ ON
- **Confirm before creating**: ❌ OFF (for quick capture)

#### Step 3: TechPARA Integration
**Daily notes settings:**
- **Daily note format**: `YYYY-MM-DD-daily`
- **Daily note template**: Use your existing daily review template
- **Daily note folder**: `00 - Inbox/` (will auto-move via Auto Note Mover)

**Event tracking:**
- Create events for field service appointments
- Track project deadlines
- Schedule job interviews and follow-ups
- Mark coding project milestones

#### Step 4: Workflow Integration
**Color coding suggestions:**
- 🔴 Red: Urgent field service calls
- 🟡 Yellow: Project deadlines  
- 🟢 Green: Job search activities
- 🔵 Blue: Learning/development time

### Kanban Plugin Configuration

#### Step 1: Create Kanban Boards
Create separate Kanban boards for each domain:

**Field Service Kanban**: `01 - Projects/Field Service/field-service-board.md`
**Coding Projects Kanban**: `01 - Projects/Coding Projects/coding-projects-board.md`
**Job Search Kanban**: `01 - Projects/Job Search/job-search-pipeline.md`

#### Step 2: Standard Column Structure
For each board, use this structure:
- **Backlog** - Future tasks and ideas
- **To Do** - Ready to start  
- **In Progress** - Currently working
- **Review** - Completed, needs verification
- **Done** - Fully completed

#### Step 3: Card Templates
**Field Service Cards:**
```
## [Customer Name] - [Service Type]
- **Location**: 
- **System**: HungerRush POS
- **Priority**: High/Medium/Low
- **Estimated Time**: 
- **Due Date**: 
- **Notes**: 
```

**Coding Project Cards:**
```
## [Feature/Bug] - [Brief Description]  
- **Project**: 
- **Priority**: High/Medium/Low
- **Estimated Time**:
- **Due Date**:
- **Related Files**:
- **Notes**:
```

**Job Search Cards:**
```
## [Company] - [Position]
- **Application Date**:
- **Status**: Applied/Interview/Follow-up
- **Priority**: High/Medium/Low  
- **Next Action**:
- **Contact Info**:
- **Notes**:
```

---

## Phase 2 Plugin Configurations

### Advanced Tables Configuration

#### Step 1: Basic Settings
- **Enable table editor**: ✅ ON
- **Auto-format tables**: ✅ ON
- **Tab navigation**: ✅ ON (Excel-like behavior)
- **Formula evaluation**: ✅ ON

#### Step 2: TechPARA Use Cases
**Equipment Inventory Table:**
```markdown
| Equipment | Model | Serial | Location | Status | Last Service |
|-----------|-------|--------|----------|--------|-------------|
| POS Terminal | HR-2000 | SN001 | Site A | Active | 2025-01-15 |
```

**Project Tracking Table:**
```markdown
| Project | Type | Start Date | Due Date | Progress | Status |
|---------|------|------------|----------|----------|--------|
| Site Installation | Field Service | 2025-01-10 | 2025-01-20 | 75% | In Progress |
```

**Skill Development Tracking:**
```markdown  
| Skill | Current Level | Target Level | Progress | Completion Date |
|-------|---------------|--------------|----------|-----------------|
| React | Beginner | Intermediate | 60% | 2025-03-01 |
```

### Omnisearch Configuration

#### Step 1: Basic Settings
- **Enable PDF search**: ✅ ON
- **Enable image OCR**: ✅ ON  
- **Index vault on startup**: ✅ ON

#### Step 2: TechPARA Integration
**Folders to index:**
- `02 - Areas/` (technical documentation)
- `01 - Projects/` (active project files)
- `04 - Zettelkasten/` (knowledge network)

**File types to include:**
- `.md` (all notes)
- `.pdf` (technical manuals, documentation)
- `.png, .jpg` (screenshots, diagrams)

### Recent Files Configuration

#### Step 1: Basic Settings
- **Number of recent files**: 20
- **Show in sidebar**: ✅ ON
- **Group by folder**: ✅ ON

#### Step 2: TechPARA Optimization
- **Exclude folders**: 
  - `05 - Archive/`
  - `03 - Resources/Templates/`
- **Prioritize**: Active project folders

---

## Integration Examples & Workflows

### Daily Workflow Integration
1. **Morning Setup** (2 minutes):
   - Check Calendar for scheduled appointments
   - Review Kanban boards for daily priorities  
   - Use Recent Files to access active projects

2. **During Work**:
   - Auto Note Mover processes quick captures automatically
   - Virtual Linker maintains knowledge connections
   - Add tasks to Kanban boards as they arise

3. **End of Day** (2 minutes):
   - Update Kanban board progress
   - Check Auto Note Mover results
   - Plan tomorrow using Calendar

### Field Service Workflow
1. **Pre-Installation**:
   - Create Kanban card with site details
   - Schedule on Calendar
   - Link to relevant technical documentation

2. **During Installation**:
   - Quick capture notes with `#field-service` tag
   - Auto Note Mover routes to correct project folder
   - Take photos/screenshots for documentation

3. **Post-Installation**:
   - Update Kanban card to "Review"
   - Use Advanced Tables for equipment inventory
   - Move Kanban card to "Done" when complete

### Coding Project Workflow
1. **Project Planning**:
   - Create Kanban board for project
   - Set up Calendar milestones
   - Create project folder structure

2. **Development**:
   - Track features/bugs on Kanban
   - Quick capture learning notes with `#coding`
   - Use Virtual Linker to connect to existing knowledge

3. **Completion**:
   - Update project tables with final metrics
   - Archive completed Kanban cards
   - Link to portfolio documentation

### Job Search Workflow
1. **Application Tracking**:
   - Create Kanban card for each application
   - Schedule follow-ups on Calendar
   - Track company research in tables

2. **Interview Preparation**:
   - Move cards through interview stages
   - Use Omnisearch to find relevant project examples
   - Schedule interview prep time on Calendar

3. **Follow-up**:
   - Track communication in Advanced Tables
   - Update Kanban with outcomes
   - Archive completed applications

---

## Troubleshooting

### Auto Note Mover Issues
**Problem**: Notes not moving automatically
**Solutions:**
- Check rule priority order
- Verify tag/pattern format exactly matches
- Ensure destination folders exist
- Check exclusion list settings

**Problem**: Duplicate files created
**Solutions:**
- Check sync software conflicts (Dropbox, iCloud)
- Verify destination folder paths
- Review rule patterns for conflicts

### Virtual Linker Issues  
**Problem**: Too many false links
**Solutions:**
- Increase minimum word length to 4-5
- Enable case-sensitive matching for technical terms
- Add exclusion tags to template files
- Adjust matching sensitivity

**Problem**: Missing expected links
**Solutions:**
- Check if files are in excluded folders
- Verify note titles and aliases are correct
- Enable partial word matching if needed
- Review include/exclude tag settings

### Calendar Issues
**Problem**: Events not showing
**Solutions:**
- Check daily note format matches exactly
- Verify daily note folder path
- Ensure frontmatter format is correct
- Refresh calendar view

### Kanban Issues
**Problem**: Cards not displaying properly
**Solutions:**
- Check markdown formatting in board file
- Verify column structure syntax
- Refresh board view
- Check for conflicting plugins

---

## Maintenance Schedule

### Daily (2 minutes)
- ✅ Review Auto Note Mover results
- ✅ Update active Kanban cards
- ✅ Check Calendar for upcoming items
- ✅ Process any automation errors

### Weekly (5 minutes)  
- ✅ Review Virtual Linker connections
- ✅ Clean up completed Kanban cards
- ✅ Update Calendar with next week's schedule
- ✅ Check Advanced Tables for data updates

### Monthly (15 minutes)
- ✅ Review and optimize Auto Note Mover rules
- ✅ Analyze Virtual Linker effectiveness
- ✅ Archive completed Kanban boards
- ✅ Update plugin settings based on usage patterns
- ✅ Review Omnisearch index performance

### Quarterly (30 minutes)
- ✅ Full plugin performance review
- ✅ Update automation rules based on workflow changes
- ✅ Export important data (tables, Kanban archives)
- ✅ Plan system improvements and optimizations

---

## Success Metrics

### Automation Effectiveness
- **Daily maintenance time**: Target 2 minutes (from 5)
- **Inbox processing**: 90% automated routing
- **Link maintenance**: 80% automated connections
- **Project visibility**: Real-time status across all domains

### Quality Improvements  
- **Consistent organization**: 95% proper file placement
- **Knowledge connections**: 50% increase in cross-domain links
- **Project tracking**: Visual status for all active work
- **Search efficiency**: Faster access to technical information

### Workflow Enhancement
- **Visual project management**: Clear progress tracking
- **Scheduling integration**: Coordinated timeline across all work
- **Documentation quality**: Professional tables and formatting
- **Knowledge discovery**: Enhanced search and connection capabilities

---

## Next Steps After Setup

1. **Week 1**: Install and configure Phase 1 plugins (Auto Note Mover, Virtual Linker, Calendar, Kanban)
2. **Week 2**: Add Phase 2 plugins (Advanced Tables, Omnisearch, Recent Files)
3. **Week 3**: Optimize settings based on usage patterns
4. **Week 4**: Document custom workflows and share learnings

## Support Resources

- **Plugin Documentation**: Links to official docs for each plugin
- **Community Forums**: Obsidian Discord and Reddit communities
- **Backup Strategy**: Regular export of plugin settings and configurations
- **Rollback Plan**: How to disable plugins if issues arise

---

*This guide transforms your TechPARA system into a comprehensive visual project management platform while maintaining your systematic approach to knowledge management and career development.*

*Last Updated: 2025-07-16*
*Implementation Status: Ready for deployment*