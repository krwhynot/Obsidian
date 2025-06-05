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
# Ensured double quotes for paths with '&' and no odd spacing
if ($NoEmoji) {
    $folders = @(
        "1 - Rough Notes\_Inbox",
        "1 - Rough Notes\Ideas", 
        "1 - Rough Notes\Bugs",
        "1 - Rough Notes\Experiments",
        "3 - References & Resources\Code Snippets",
        "3 - References & Resources\Code Snippets\Azure Patterns",
        "3 - References & Resources\Code Snippets\NextJS Patterns", 
        "3 - References & Resources\Code Snippets\Prisma Patterns",
        "3 - References & Resources\Code Snippets\TypeScript Tricks",
        "3 - References & Resources\Code Snippets\Quick Copies",
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

# Define template content with proper PowerShell escaping
# IMPORTANT: Ensure '---'@ and '@' are FLUSH LEFT with no leading/trailing spaces
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