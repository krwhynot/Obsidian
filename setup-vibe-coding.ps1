# Obsidian Vibe Coding Setup Script
# Run this from your Obsidian vault root directory

param(
    [string]$VaultPath = ".",
    [string]$ProjectName = "Kitchen Pantry CRM"
)

Write-Host "🚀 Setting up Obsidian Vibe Coding System..." -ForegroundColor Green
Write-Host "Vault Path: $VaultPath" -ForegroundColor Yellow
Write-Host "Project: $ProjectName" -ForegroundColor Yellow

# Create folder structure
Write-Host "`n📁 Creating folder structure..." -ForegroundColor Cyan

$folders = @(
    "1 - Rough Notes\_Inbox",
    "1 - Rough Notes\💡 Ideas", 
    "1 - Rough Notes\🐛 Bugs",
    "1 - Rough Notes\🧪 Experiments",
    "3 - References & Resources\📦 Code Snippets",
    "3 - References & Resources\📦 Code Snippets\Azure Patterns",
    "3 - References & Resources\📦 Code Snippets\NextJS Patterns", 
    "3 - References & Resources\📦 Code Snippets\Prisma Patterns",
    "3 - References & Resources\📦 Code Snippets\TypeScript Tricks",
    "3 - References & Resources\📦 Code Snippets\Quick Copies",
    "5 - Templates\🎯 Workflow Templates",
    "6 - Full Notes\🧠 Concepts",
    "6 - Full Notes\🧠 Concepts\By Project",
    "6 - Full Notes\🧠 Concepts\By Technology"
)

foreach ($folder in $folders) {
    $fullPath = Join-Path $VaultPath $folder
    if (!(Test-Path $fullPath)) {
        New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
        Write-Host "✅ Created: $folder" -ForegroundColor Green
    } else {
        Write-Host "⚠️  Exists: $folder" -ForegroundColor Yellow
    }
}

# Create template files
Write-Host "`n📝 Creating template files..." -ForegroundColor Cyan

# Daily Note Template
$dailyNoteTemplate = @"
---
created: {{date:YYYY-MM-DD}} {{time}}
tags: [daily, {{date:YYYY-MM}}]
energy: 🔥/🌊/🌙
---

# 📅 {{date:dddd, MMMM Do}}

## 🎯 Current Focus
![[7 - Projects/$ProjectName/🎯 Current Focus]]

## 💭 Quick Captures
### 🧠 Concepts Discovered
- #concept-capture 

### 🐛 Issues Hit  
- #bug-capture 

### 💡 Ideas to Explore
- #idea-capture 

### 📦 Snippets Found
- #snippet-capture 
```typescript

```

## 🔄 Process Queue
> Move these at day end!
- [ ] → Rough Notes: 
- [ ] → Full Notes: 
- [ ] → Code Snippets: 

## 📍 Left Off At
**Project**: [[$ProjectName]]
**File**: [[]]
**Line**: 
**Context**: 

---
*Process Timer: ⏱️ 5 min at day end*
"@

# Current Focus Template
$currentFocusTemplate = @"
---
updated: {{date}} {{time}}
tags: [active-focus, kitchen-pantry-crm]
---

# 🎯 Current Focus: $ProjectName

## 🚦 Right Now
**Working On**: {{feature/bug/concept}}
**File**: [[{{current-file}}]]
**Specific Task**: 
```typescript
// Last code I was writing
```

## 🧠 Context Brain Dump
*What was I thinking?*
- 
- 

## ⏭️ Next Actions
1. [ ] Immediate: 
2. [ ] Then: 
3. [ ] Later: 

## 🚧 Blockers
- 

## 💡 Ideas While Away
> Add ideas here when not actively coding
- 

---
*Last Updated: {{time}}*
"@

# Concept Capture Template
$conceptCaptureTemplate = @"
---
created: {{date}} {{time}}
stage: rough
tags: [{{cursor}}, concept-journey]
confidence: 🔴 low
project: [[]]
---

# 💡 {{title}}

## Raw Understanding
*What problem am I solving?*
{{cursor}}

## Vibe Check
*How does this feel? Natural or forced?*
- [ ] Flows naturally
- [ ] Needs refinement
- [ ] Fighting the framework

## Code Attempt #1
```typescript
// Quick and dirty
```

## What's Working
- 

## What's Not
- 

## Next Session Goals
- [ ] 
- [ ] 

---
### 📈 Evolution Tracker
- 🔴 **Rough**: {{date}} - Initial capture
- 🟡 **Refined**: [date] - [what changed]
- 🟢 **Full**: [date] - [[Link to Full Note]]
- 📦 **Snippet**: [date] - [[Link to Snippet]]
"@

# Code Pattern Template
$codePatternTemplate = @"
---
created: {{date}}
type: pattern
tags: [pattern, #{{technology}}, full-note]
confidence: 🟢 high
used-in: [[{{projects}}]]
snippet: [[3 - References & Resources/📦 Code Snippets/{{name}}]]
---

# 🏗️ Pattern: {{title}}

## Why This Pattern Exists
*Problem it solves in $ProjectName:*

## Core Implementation
```typescript
// The pattern in its purest form
{{pattern}}
```

## Real Usage Example
```typescript
// From: [[$ProjectName/{{file}}]]
{{real-code}}
```

## Evolution Story
1. **First Attempt**: [What didn't work]
2. **Breakthrough**: [What clicked]
3. **Current Form**: [Why it's optimal]

## Gotchas Found
- ⚠️ 
- ⚠️ 

## Quick Copy Snippet
> Linked: [[{{snippet-location}}]]
```typescript
// Production ready
```

## Related Patterns
- [[]]
- [[]]
"@

# Write template files
$templateFiles = @{
    "Daily Note Template.md" = $dailyNoteTemplate
    "Current Focus Template.md" = $currentFocusTemplate  
    "Concept Capture Template.md" = $conceptCaptureTemplate
    "Code Pattern Template.md" = $codePatternTemplate
}

$templateDir = Join-Path $VaultPath "5 - Templates\🎯 Workflow Templates"

foreach ($templateFile in $templateFiles.GetEnumerator()) {
    $filePath = Join-Path $templateDir $templateFile.Key
    $templateFile.Value | Out-File -FilePath $filePath -Encoding UTF8
    Write-Host "✅ Created: $($templateFile.Key)" -ForegroundColor Green
}

# Create Current Focus file for the project
Write-Host "`n🎯 Creating Current Focus file..." -ForegroundColor Cyan

$projectDir = Join-Path $VaultPath "7 - Projects\$ProjectName"
if (!(Test-Path $projectDir)) {
    New-Item -ItemType Directory -Path $projectDir -Force | Out-Null
    Write-Host "✅ Created project directory: $ProjectName" -ForegroundColor Green
}

$currentFocusFile = @"
---
updated: $(Get-Date -Format 'yyyy-MM-dd HH:mm')
tags: [active-focus, kitchen-pantry-crm]
---

# 🎯 Current Focus: $ProjectName

## 🚦 Right Now
**Working On**: Setting up vibe coding workflow
**File**: [[]]
**Specific Task**: Configuring Obsidian templates for capture during flow

## 🧠 Context Brain Dump
*What was I thinking?*
- Need zero-friction capture while coding
- Want to preserve context between sessions
- Building on NextCRM foundation with Azure SQL

## ⏭️ Next Actions
1. [ ] Test daily note template with real coding session
2. [ ] Capture first concept or snippet
3. [ ] Practice 5-minute end-of-day processing

## 🚧 Blockers
- None currently

## 💡 Ideas While Away
> Add ideas here when not actively coding
- Consider automation for snippet extraction
- Think about integration with VS Code

---
*Last Updated: $(Get-Date -Format 'HH:mm')*
"@

$currentFocusPath = Join-Path $projectDir "🎯 Current Focus.md"
$currentFocusFile | Out-File -FilePath $currentFocusPath -Encoding UTF8
Write-Host "✅ Created: Current Focus for $ProjectName" -ForegroundColor Green

# Create Quick Setup README
$setupReadme = @"
# 🚀 Obsidian Vibe Coding Setup - COMPLETE!

## ✅ What Was Created

### 📁 New Folders
- **1 - Rough Notes/_Inbox** - Daily Note overflow
- **1 - Rough Notes/💡 Ideas** - Exploration concepts  
- **1 - Rough Notes/🐛 Bugs** - Issues to debug
- **1 - Rough Notes/🧪 Experiments** - Testing ideas
- **3 - References & Resources/📦 Code Snippets** - Reusable code library
- **5 - Templates/🎯 Workflow Templates** - System templates
- **6 - Full Notes/🧠 Concepts** - Refined knowledge

### 📝 Templates Created
- **Daily Note Template** - Zero-friction capture
- **Current Focus Template** - Context preservation  
- **Concept Capture Template** - Idea evolution
- **Code Pattern Template** - Reusable documentation

### 🎯 Project Files
- **Current Focus for $ProjectName** - Ready to use!

## ⚡ Next Steps (5 minutes)

1. **Configure Templater Plugin**:
   - Install Templater (Community Plugin)
   - Set template folder: `5 - Templates/🎯 Workflow Templates`
   - Set hotkey for inserting templates

2. **Set Hotkeys** (Optional):
   - `Ctrl+Shift+D` → Open today's daily note
   - `Ctrl+T` → Insert template

3. **Test the Workflow**:
   - Open today's daily note
   - Use the Daily Note Template
   - Capture something with `#concept-capture`
   - Update your Current Focus file

## 🌊 The Workflow

**During Coding** → Quick capture in Daily Note with tags
**End of Day** → 5-minute process queue (move items to folders)
**Between Sessions** → Check Current Focus to remember where you left off

## 🏷️ Key Tags
- `#concept-capture` → Move to Full Notes
- `#bug-capture` → Move to Rough Notes/Bugs
- `#snippet-capture` → Move to Code Snippets
- `#kitchen-pantry-crm` → Project-specific

**Happy Vibe Coding! 🚀**
"@

$readmePath = Join-Path $VaultPath "🚀 Vibe Coding Setup Complete.md"
$setupReadme | Out-File -FilePath $readmePath -Encoding UTF8

Write-Host "`n🎉 Setup Complete!" -ForegroundColor Green
Write-Host "📖 Check '🚀 Vibe Coding Setup Complete.md' for next steps" -ForegroundColor Yellow
Write-Host "`n🌊 Ready for vibe coding! Start with today's Daily Note." -ForegroundColor Cyan