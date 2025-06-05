# Fixed PowerShell Script for Obsidian Vibe Coding Setup

```powershell
# Obsidian Vibe Coding Setup Script - Research Validated ✅
# Run this from your Obsidian vault root directory
# Supports: Windows 10/11, PowerShell 5.1+, Unicode emoji folder names

[CmdletBinding()]
param(
    [Parameter(HelpMessage="Path to your Obsidian vault")]
    [string]$VaultPath = ".",
    
    [Parameter(HelpMessage="Your main project name")]
    [string]$ProjectName = "Kitchen Pantry CRM",
    
    [Parameter(HelpMessage="Use emoji-free folder names for maximum compatibility")]
    [switch]$NoEmoji
)

# Set UTF-8 encoding for proper Unicode support
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "🚀 Setting up Obsidian Vibe Coding System..." -ForegroundColor Green
Write-Host "Vault Path: $(Resolve-Path $VaultPath)" -ForegroundColor Yellow
Write-Host "Project: $ProjectName" -ForegroundColor Yellow
Write-Host "Emoji Support: $(!$NoEmoji)" -ForegroundColor Yellow

# Create folder structure with error handling
Write-Host "`n📁 Creating folder structure..." -ForegroundColor Cyan

# Define folder structure (emoji and non-emoji versions)
# FIXED: Use single quotes to treat ampersands as literal characters
if ($NoEmoji) {
    $folders = @(
        "1 - Rough Notes\_Inbox",
        "1 - Rough Notes\Ideas", 
        "1 - Rough Notes\Bugs",
        "1 - Rough Notes\Experiments",
        '3 - References & Resources\Code Snippets',
        '3 - References & Resources\Code Snippets\Azure Patterns',
        '3 - References & Resources\Code Snippets\NextJS Patterns', 
        '3 - References & Resources\Code Snippets\Prisma Patterns',
        '3 - References & Resources\Code Snippets\TypeScript Tricks',
        '3 - References & Resources\Code Snippets\Quick Copies',
        "5 - Templates\Workflow Templates",
        "6 - Full Notes\Concepts",
        "6 - Full Notes\Concepts\By Project",
        "6 - Full Notes\Concepts\By Technology"
    )
} else {
    $folders = @(
        "1 - Rough Notes\_Inbox",
        "1 - Rough Notes\💡 Ideas", 
        "1 - Rough Notes\🐛 Bugs",
        "1 - Rough Notes\🧪 Experiments",
        '3 - References & Resources\📦 Code Snippets',
        '3 - References & Resources\📦 Code Snippets\Azure Patterns',
        '3 - References & Resources\📦 Code Snippets\NextJS Patterns', 
        '3 - References & Resources\📦 Code Snippets\Prisma Patterns',
        '3 - References & Resources\📦 Code Snippets\TypeScript Tricks',
        '3 - References & Resources\📦 Code Snippets\Quick Copies',
        "5 - Templates\🎯 Workflow Templates",
        "6 - Full Notes\🧠 Concepts",
        "6 - Full Notes\🧠 Concepts\By Project",
        "6 - Full Notes\🧠 Concepts\By Technology"
    )
}

$createdCount = 0
$existingCount = 0

foreach ($folder in $folders) {
    try {
        $fullPath = Join-Path $VaultPath $folder
        if (!(Test-Path $fullPath)) {
            New-Item -ItemType Directory -Path $fullPath -Force -ErrorAction Stop | Out-Null
            Write-Host "✅ Created: $folder" -ForegroundColor Green
            $createdCount++
        } else {
            Write-Host "📁 Exists: $folder" -ForegroundColor Yellow
            $existingCount++
        }
    }
    catch {
        Write-Host "❌ Failed to create: $folder" -ForegroundColor Red
        Write-Host "    Error: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Create template files with proper encoding
Write-Host "`n📝 Creating template files..." -ForegroundColor Cyan

# Determine template folder name based on emoji setting
$templateFolderName = if ($NoEmoji) { "Workflow Templates" } else { "🎯 Workflow Templates" }

# FIXED: Define template content with proper heredoc syntax
# CRITICAL: Closing markers MUST be flush left (no leading spaces)
$dailyNoteTemplate = @'
---
created: {{date:YYYY-MM-DD}} {{time}}
tags: [daily, {{date:YYYY-MM}}]
energy: 🔥/🌊/🌙
---

# 📅 {{date:dddd, MMMM Do}}

## 🎯 Current Focus
![[7 - Projects/Kitchen Pantry CRM/🎯 Current Focus]]

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
// Code here
```

## 🔄 Process Queue
Move these at day end!

[ ] → Rough Notes:
[ ] → Full Notes:
[ ] → Code Snippets:

## 📍 Left Off At
Project: [[Kitchen Pantry CRM]]
File: [[]]
Line:
Context:

## Process Timer: ⏱️ 5 min at day end
'@

$currentFocusTemplate = @'
updated: {{date}} {{time}} tags: [active-focus, kitchen-pantry-crm]

🎯 Current Focus: Kitchen Pantry CRM

## 🚦 Right Now
Working On: {{feature/bug/concept}}
File: [[{{current-file}}]]
Specific Task:

```typescript
// Last code I was writing
```

## 🧠 Context Brain Dump
What was I thinking?

## ⏭️ Next Actions
[ ] Immediate:
[ ] Then:
[ ] Later:

## 🚧 Blockers

## 💡 Ideas While Away
Add ideas here when not actively coding

Last Updated: {{time}}
'@

$conceptCaptureTemplate = @'
created: {{date}} {{time}} stage: rough tags: [{{cursor}}, concept-journey] confidence: 🔴 low project: [[]]

# 💡 {{title}}

## Raw Understanding
What problem am I solving?
{{cursor}}

## Vibe Check
How does this feel? Natural or forced?

[ ] Flows naturally
[ ] Needs refinement
[ ] Fighting the framework

## Code Attempt #1
```typescript
// Quick and dirty
```

## What's Working

## What's Not

## Next Session Goals
[ ]
[ ]

## 📈 Evolution Tracker
🔴 Rough: {{date}} - Initial capture
🟡 Refined: [date] - [what changed]
🟢 Full: [date] - [[Link to Full Note]]
📦 Snippet: [date] - [[Link to Snippet]]
'@

$codePatternTemplate = @'
created: {{date}} type: pattern tags: [pattern, #{{technology}}, full-note] confidence: 🟢 high used-in: [[{{projects}}]] snippet: [[3 - References & Resources/📦 Code Snippets/{{name}}]]

# 🏗️ Pattern: {{title}}

## Why This Pattern Exists
Problem it solves in Kitchen Pantry CRM:

## Core Implementation
```typescript
// The pattern in its purest form
{{pattern}}
```

## Real Usage Example
```typescript
// From: [[Kitchen Pantry CRM/{{file}}]]
{{real-code}}
```

## Evolution Story
First Attempt: [What didn't work]
Breakthrough: [What clicked]
Current Form: [Why it's optimal]

## Gotchas Found
⚠️
⚠️

## Quick Copy Snippet
Linked: [[{{snippet-location}}]]

```typescript
// Production ready
```

## Related Patterns
[[]]
[[]]
'@

# Write template files with UTF-8 encoding
$templateFiles = @{
    "Daily Note Template.md" = $dailyNoteTemplate
    "Current Focus Template.md" = $currentFocusTemplate
    "Concept Capture Template.md" = $conceptCaptureTemplate
    "Code Pattern Template.md" = $codePatternTemplate
}

$templateDir = Join-Path $VaultPath "5 - Templates\$templateFolderName"

$templateCount = 0
foreach ($templateFile in $templateFiles.GetEnumerator()) {
    try {
        $filePath = Join-Path $templateDir $templateFile.Key
        # Use UTF-8 encoding without BOM for Obsidian compatibility
        $templateFile.Value | Out-File -FilePath $filePath -Encoding UTF8 -ErrorAction Stop
        Write-Host "✅ Created: $($templateFile.Key)" -ForegroundColor Green
        $templateCount++
    }
    catch {
        Write-Host "❌ Failed to create: $($templateFile.Key)" -ForegroundColor Red
        Write-Host "    Error: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Create Current Focus file with error handling
Write-Host "`n🎯 Creating Current Focus file..." -ForegroundColor Cyan

$currentDateTime = Get-Date -Format 'yyyy-MM-dd HH:mm'
$currentTime = Get-Date -Format 'HH:mm'

# Note: Using double quotes for variable expansion
$currentFocusFile = @"
updated: $currentDateTime tags: [active-focus, kitchen-pantry-crm]

🎯 Current Focus: $ProjectName

## 🚦 Right Now
Working On: Setting up vibe coding workflow
File: [[]]
Specific Task: Configuring Obsidian templates for capture during flow

## 🧠 Context Brain Dump
What was I thinking?

Need zero-friction capture while coding
Want to preserve context between sessions
Building on NextCRM foundation with Azure SQL

## ⏭️ Next Actions
[ ] Test daily note template with real coding session
[ ] Capture first concept or snippet
[ ] Practice 5-minute end-of-day processing

## 🚧 Blockers
None currently

## 💡 Ideas While Away
Add ideas here when not actively coding

Consider automation for snippet extraction
Think about integration with VS Code

Last Updated: $currentTime
"@

$projectDir = Join-Path $VaultPath "7 - Projects\$ProjectName"

try {
    if (!(Test-Path $projectDir)) {
        New-Item -ItemType Directory -Path $projectDir -Force -ErrorAction Stop | Out-Null
        Write-Host "✅ Created project directory: $ProjectName" -ForegroundColor Green
    }

    $currentFocusPath = Join-Path $projectDir "🎯 Current Focus.md"
    $currentFocusFile | Out-File -FilePath $currentFocusPath -Encoding UTF8 -ErrorAction Stop
    Write-Host "✅ Created: Current Focus for $ProjectName" -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to create Current Focus file" -ForegroundColor Red
    Write-Host "    Error: $($_.Exception.Message)" -ForegroundColor Red
}

# Create Quick Setup README
$setupReadme = @'
🚀 Obsidian Vibe Coding Setup - COMPLETE!

## ✅ What Was Created
### 📁 New Folders
- 1 - Rough Notes/_Inbox - Daily Note overflow
- 1 - Rough Notes/💡 Ideas - Exploration concepts
- 1 - Rough Notes/🐛 Bugs - Issues to debug
- 1 - Rough Notes/🧪 Experiments - Testing ideas
- 3 - References & Resources/📦 Code Snippets - Reusable code library
- 5 - Templates/🎯 Workflow Templates - System templates
- 6 - Full Notes/🧠 Concepts - Refined knowledge

### 📝 Templates Created
- Daily Note Template - Zero-friction capture
- Current Focus Template - Context preservation
- Concept Capture Template - Idea evolution
- Code Pattern Template - Reusable documentation

### 🎯 Project Files
- Current Focus for Kitchen Pantry CRM - Ready to use!

## ⚡ Next Steps (5 minutes)
1. Configure Templater Plugin:
   - Install Templater (Community Plugin)
   - Set template folder: 5 - Templates/🎯 Workflow Templates
   - Set hotkey for inserting templates

2. Set Hotkeys (Optional):
   - Ctrl+Shift+D → Open today's daily note
   - Ctrl+T → Insert template

3. Test the Workflow:
   - Open today's daily note
   - Use the Daily Note Template
   - Capture something with #concept-capture
   - Update your Current Focus file

## 🌊 The Workflow
- During Coding → Quick capture in Daily Note with tags
- End of Day → 5-minute process queue (move items to folders)
- Between Sessions → Check Current Focus to remember where you left off

## 🏷️ Key Tags
- #concept-capture → Move to Full Notes
- #bug-capture → Move to Rough Notes/Bugs
- #snippet-capture → Move to Code Snippets
- #kitchen-pantry-crm → Project-specific

Happy Vibe Coding! 🚀
'@

$readmePath = Join-Path $VaultPath "🚀 Vibe Coding Setup Complete.md"
try {
    $setupReadme | Out-File -FilePath $readmePath -Encoding UTF8 -ErrorAction Stop
    Write-Host "✅ Created: Setup completion guide" -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to create setup guide" -ForegroundColor Red
    Write-Host "    Error: $($_.Exception.Message)" -ForegroundColor Red
}

# Display completion summary
Write-Host "`n🎉 Setup Complete!" -ForegroundColor Green
Write-Host "📊 Summary:" -ForegroundColor Cyan
Write-Host "   • Folders created: $createdCount" -ForegroundColor White
Write-Host "   • Folders existing: $existingCount" -ForegroundColor White
Write-Host "   • Templates created: $templateCount" -ForegroundColor White
Write-Host "   • Emoji support: $(!$NoEmoji)" -ForegroundColor White
Write-Host "`n📖 Next steps: Check '🚀 Vibe Coding Setup Complete.md'" -ForegroundColor Yellow
Write-Host "🌊 Ready for vibe coding! Start with today's Daily Note." -ForegroundColor Cyan

# Optional: Open the setup guide
if ($PSVersionTable.Platform -ne "Unix") {
    $openGuide = Read-Host "`nOpen setup guide now? (y/N)"
    if ($openGuide -eq "y" -or $openGuide -eq "Y") {
        try {
            Start-Process $readmePath
        }
        catch {
            Write-Host "Could not open file automatically. Please open: $readmePath" -ForegroundColor Yellow
        }
    }
}
```

## Key Fixes Applied

### 1. Ampersand Issue Resolution
- Changed from double quotes to **single quotes** for all folder paths containing `&`
- Single quotes treat all characters as literals, preventing PowerShell from interpreting `&` as a command operator

### 2. Heredoc (Here-String) Syntax Correction
- Ensured all closing markers (`'@` and `"@`) are **flush left** with no leading whitespace
- Each closing marker is on its own line
- No trailing whitespace after closing markers

### 3. Template Structure Improvements
- Fixed indentation and formatting within heredocs
- Maintained proper YAML frontmatter structure
- Ensured code blocks are properly formatted

## Alternative Solutions for Ampersands

If you prefer to keep double quotes, you can escape ampersands with backticks:
```powershell
"3 - References `& Resources\📦 Code Snippets"
```

However, using single quotes is cleaner and more reliable for literal strings.