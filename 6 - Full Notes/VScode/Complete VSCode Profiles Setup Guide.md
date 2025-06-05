# Complete VSCode Profiles Setup Guide

## Overview

This guide will create two optimized VSCode profiles:

1. **Python Data Science Profile** - For data science, machine learning, and Python development
2. **Azure Developer Profile** - For cloud development with Azure

## Prerequisites

1. VSCode version 1.75+ (Profiles feature)
2. Windows with WSL installed
3. PowerShell Core installed
4. Git installed

## Part 1: Initial Setup

### Step 1: Install Core Tools

#### Install Fonts

```powershell
# Using Scoop (recommended)
scoop bucket add nerd-fonts
scoop install CascadiaCode-NF

# Using Chocolatey
choco install cascadiacode-nf

# Manual download: https://github.com/microsoft/cascadia-code/releases
```

#### Install oh-my-posh

```powershell
# PowerShell
winget install JanDeDobbeleer.OhMyPosh -s winget

# WSL/Linux
curl -s https://ohmyposh.dev/install.sh | bash -s
```

#### Install Azure CLI (Optional for Azure profile)

```powershell
# PowerShell
winget install -e --id Microsoft.AzureCLI
```

#### Install Azure Functions Core Tools (Optional for Azure profile)

```powershell
# PowerShell
npm install -g azure-functions-core-tools@4 --unsafe-perm true
```

### Step 2: Create PowerShell and Bash Profile Files

#### Create/Edit PowerShell Profile

```powershell
# Open PowerShell as Administrator
New-Item -ItemType File -Path $PROFILE -Force
code $PROFILE
```

#### Create/Edit Bash Profile

```bash
# In WSL terminal
touch ~/.bashrc
nano ~/.bashrc
```

## Part 2: Create VSCode Profiles

### Step 1: Open VSCode Profile Manager

1. Press `Ctrl+Shift+P` to open Command Palette
2. Type "Profiles: Create Profile" and select it

### Step 2: Create Python Data Science Profile

1. **Create Profile**:
    
    - Name: "Python Data Science"
    - Icon: 🐍 (python emoji)
    - Copy from: "Default" or "None"
2. **Configure Python Profile Settings**:
    
    - Copy this into `settings.json` for Python profile:

```json
{
  // Core settings
  "workbench.startupEditor": "none",
  "workbench.sideBar.location": "right",
  "files.defaultLanguage": "python",
  "editor.rulers": [88, 120],
  "editor.minimap.enabled": false,
  "terminal.integrated.enableMultiLinePasteWarning": "never",

  // Dark High Contrast Theme
  "workbench.colorTheme": "Dark High Contrast",
  "editor.semanticHighlighting.enabled": true,
  
  // Python specific settings
  "python.defaultInterpreterPath": "C:\\Users\\Revadmin\\pyver\\py3125\\python.exe",
  "python.languageServer": "Pylance",
  "python.formatting.provider": "ms-python.black-formatter",
  "python.testing.pytestEnabled": true,
  "[python]": {
    "editor.defaultFormatter": "ms-python.black-formatter",
    "editor.tabSize": 4
  },
  
  // Terminal configuration
  "terminal.integrated.profiles.windows": {
    "PowerShell Data Science": {
      "source": "PowerShell",
      "icon": "graph",
      "env": {
        "POSH_THEME": "tonybaloney",
        "PYTHON_ENV": "DATA_SCIENCE"
      }
    },
    "WSL Python": {
      "path": "C:\\Windows\\System32\\wsl.exe",
      "icon": "terminal-bash",
      "env": {
        "POSH_THEME": "tonybaloney"
      }
    }
  },
  "terminal.integrated.defaultProfile.windows": "PowerShell Data Science",
  
  // Font settings
  "terminal.integrated.fontFamily": "Cascadia Code PL",
  "terminal.integrated.fontSize": 14,
  "editor.fontFamily": "Cascadia Code",
  "editor.fontSize": 14,
  
  // Python workflow optimizations
  "python.venvFolders": ["venv", ".venv", "envs", ".virtualenvs"],
  "python.terminal.activateEnvironment": true,
  "python.analysis.autoImportCompletions": true,
  
  // Data science specific
  "jupyter.askForKernelRestart": false,
  "jupyter.sendSelectionToInteractiveWindow": true,
  "notebook.cellToolbarLocation": {
    "default": "right",
    "jupyter-notebook": "left"
  }
}
```

### Step 3: Create Azure Developer Profile

1. **Create Profile**:
    
    - Name: "Azure Developer"
    - Icon: ☁️ (cloud emoji)
    - Copy from: "Default" or "None"
2. **Configure Azure Profile Settings**:
    
    - Copy this into `settings.json` for Azure profile:

```json
{
  // Core settings (same as Python)
  "workbench.startupEditor": "none",
  "workbench.sideBar.location": "right",
  "files.defaultLanguage": "python",
  "editor.rulers": [88, 120],
  "editor.minimap.enabled": false,
  "terminal.integrated.enableMultiLinePasteWarning": "never",

  // Dark High Contrast Theme with Azure colors
  "workbench.colorTheme": "Dark High Contrast",
  "workbench.colorCustomizations": {
    "[Dark High Contrast]": {
      "activityBar.background": "#003366",
      "statusBar.background": "#0078D7",
      "statusBar.foreground": "#FFFFFF",
      "terminal.ansiBlue": "#0078D7",
      "terminal.ansiCyan": "#00BCF2"
    }
  },
  
  // Python settings (for Azure Functions)
  "python.defaultInterpreterPath": "C:\\Users\\Revadmin\\pyver\\py3125\\python.exe",
  "python.languageServer": "Pylance",
  
  // Terminal configuration
  "terminal.integrated.profiles.windows": {
    "PowerShell Azure": {
      "source": "PowerShell",
      "icon": "cloud",
      "env": {
        "POSH_THEME": "azure",
        "AZURE_CONFIG_DIR": "C:\\Users\\Revadmin\\.azure",
        "AZURE_DEFAULTS_LOCATION": "centralus"
      }
    },
    "WSL Azure": {
      "path": "C:\\Windows\\System32\\wsl.exe",
      "icon": "terminal-bash",
      "env": {
        "POSH_THEME": "azure",
        "AZURE_CONFIG_DIR": "~/.azure"
      }
    },
    "Azure Cloud Shell": {
      "path": "C:\\Windows\\System32\\wsl.exe",
      "args": ["-e", "az", "cloud-shell"],
      "icon": "cloud"
    }
  },
  "terminal.integrated.defaultProfile.windows": "PowerShell Azure",
  
  // Font settings
  "terminal.integrated.fontFamily": "Cascadia Code PL",
  "terminal.integrated.fontSize": 14,
  "editor.fontFamily": "Cascadia Code",
  "editor.fontSize": 14,
  
  // Azure specific settings
  "azureFunctions.projectLanguage": "Python",
  "azureFunctions.projectRuntime": "~4",
  "azureFunctions.pythonVenv": "venv",
  "azureResourceGroups.groupBy": "ResourceGroup",
  "azureStorage.showSasUris": false,
  
  // File associations
  "files.associations": {
    "*.bicep": "bicep",
    "*.azcli": "azcli",
    "local.settings.json": "json",
    "function.json": "json"
  }
}
```

## Part 3: Install Profile-Specific Extensions

### For Python Data Science Profile

#### Method 1: Using Command Palette

1. Switch to "Python Data Science" profile
2. Press `Ctrl+Shift+P` → "Extensions: Install Extension"
3. Install these extensions:

```
ms-python.python
ms-toolsai.jupyter
ms-python.vscode-pylance
ms-python.black-formatter
ms-python.flake8
ms-python.isort
ms-azuretools.vscode-docker (for containers)
```

#### Method 2: Using Terminal

```powershell
# Install Python data science extensions
$pythonExtensions = @(
    "ms-python.python",
    "ms-toolsai.jupyter",
    "ms-python.vscode-pylance",
    "ms-python.black-formatter",
    "ms-python.flake8",
    "ms-python.isort",
    "ms-azuretools.vscode-docker",
    "ms-ossdata.vscode-postgresql",
    "mtxr.sqltools"
)

foreach ($ext in $pythonExtensions) {
    code --install-extension $ext
}
```

### For Azure Developer Profile

1. Switch to "Azure Developer" profile
2. Install these extensions:

```
ms-vscode.vscode-node-azure-pack
ms-azuretools.vscode-azurefunctions
ms-azuretools.vscode-bicep
ms-azuretools.vscode-azureresourceman
ms-azuretools.vscode-azurestorage
ms-azuretools.vscode-cosmosdb
ms-azuretools.vscode-azurestaticwebapps
ms-azure-devops.azure-pipelines
ms-azuretools.vscode-docker
humao.rest-client
```

#### Using Terminal

```powershell
# Install Azure extensions
$azureExtensions = @(
    "ms-vscode.vscode-node-azure-pack",
    "ms-azuretools.vscode-azurefunctions",
    "ms-azuretools.vscode-bicep",
    "ms-azuretools.vscode-azureresourceman",
    "ms-azuretools.vscode-azurestorage",
    "ms-azuretools.vscode-cosmosdb",
    "ms-azuretools.vscode-azurestaticwebapps",
    "ms-azure-devops.azure-pipelines",
    "humao.rest-client"
)

foreach ($ext in $azureExtensions) {
    code --install-extension $ext
}
```

## Part 4: Configure PowerShell Profiles

### Create Profile-Specific PowerShell Scripts

#### Method 1: Single Profile with Environment Variables

Add to your `$PROFILE`:

```powershell
# Detect which VSCode profile is active
$currentProfile = $env:VSCODE_PROFILE_NAME

if ($currentProfile -eq "Python Data Science") {
    # Python Data Science profile setup
    if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
        oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\tonybaloney.omp.json" | Invoke-Expression
    }
    
    # Python-specific aliases and functions
    function New-DataScienceProject {
        param([string]$name)
        mkdir $name
        cd $name
        python -m venv venv
        .\venv\Scripts\activate
        pip install numpy pandas matplotlib scikit-learn jupyter
        python -m ipykernel install --user --name="$name"
        git init
        Write-Host "Data Science project created!" -ForegroundColor Green
    }
    
    Set-Alias -Name dsproject -Value New-DataScienceProject
    Set-Alias -Name jn -Value "jupyter notebook"
    Set-Alias -Name jl -Value "jupyter lab"
    
} elseif ($currentProfile -eq "Azure Developer") {
    # Azure Developer profile setup
    if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
        oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\azure.omp.json" | Invoke-Expression
    }
    
    # Azure-specific aliases and functions
    function Connect-Azure {
        param([string]$subscription = "")
        az login
        if ($subscription) {
            az account set --subscription $subscription
        }
        az account show
    }
    
    function New-AzureFunction {
        param([string]$name, [string]$template = "HttpTrigger")
        func init . --worker-runtime python --python
        func new --name $name --template $template
        python -m venv venv
        .\venv\Scripts\activate
        pip install azure-functions azure-identity
        Write-Host "Azure Function created!" -ForegroundColor Green
    }
    
    Set-Alias -Name az-login -Value Connect-Azure
    Set-Alias -Name az-func -Value New-AzureFunction
    
} else {
    # Default profile
    if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
        oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression
    }
}

# Common aliases for all profiles
Set-Alias -Name ll -Value "Get-ChildItem"
Set-Alias -Name gs -Value "git status"
Set-Alias -Name ga -Value "git add"
Set-Alias -Name gc -Value "git commit -m"
```

#### Method 2: Separate Profile Scripts

Create separate PowerShell scripts:

```powershell
# Create profile directories
New-Item -ItemType Directory -Path "$env:USERPROFILE\Documents\PowerShell\Profiles" -Force

# Create Python profile script
@"
# Python Data Science Profile
if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
    oh-my-posh init pwsh --config "`$env:POSH_THEMES_PATH\tonybaloney.omp.json" | Invoke-Expression
}

# Python functions and aliases
# [Copy content from Python profile section above]
"@ | Out-File -FilePath "$env:USERPROFILE\Documents\PowerShell\Profiles\python_profile.ps1"

# Create Azure profile script
@"
# Azure Developer Profile
if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
    oh-my-posh init pwsh --config "`$env:POSH_THEMES_PATH\azure.omp.json" | Invoke-Expression
}

# Azure functions and aliases
# [Copy content from Azure profile section above]
"@ | Out-File -FilePath "$env:USERPROFILE\Documents\PowerShell\Profiles\azure_profile.ps1"

# Update main profile to source appropriate script
@"
# Load profile based on VSCode context
`$profilePath = "$env:USERPROFILE\Documents\PowerShell\Profiles"

switch ("`$env:VSCODE_PROFILE_NAME") {
    "Python Data Science" { . "`$profilePath\python_profile.ps1" }
    "Azure Developer" { . "`$profilePath\azure_profile.ps1" }
    default { 
        # Default setup
        if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
            oh-my-posh init pwsh --config "`$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression
        }
    }
}
"@ | Out-File -FilePath $PROFILE
```

## Part 5: Configure WSL/Bash Profiles

### Create Profile-Specific Bash Scripts

1. Create a profiles directory:

```bash
mkdir -p ~/.config/bash_profiles
```

2. Create Python profile script:

```bash
cat > ~/.config/bash_profiles/python_profile << 'EOF'
#!/bin/bash
# Python Data Science Profile

# Initialize oh-my-posh
if [ -x "$(command -v oh-my-posh)" ]; then
    eval "$(oh-my-posh init bash --config $POSH_THEMES_PATH/tonybaloney.omp.json)"
fi

# Python aliases
alias python='python3'
alias pip='pip3'
alias jn='jupyter notebook'
alias jl='jupyter lab'

# Data Science project creation
create-ds-project() {
    local name=$1
    mkdir -p $name
    cd $name
    python3 -m venv venv
    source venv/bin/activate
    pip install numpy pandas matplotlib scikit-learn jupyter
    python -m ipykernel install --user --name="$name"
    git init
    echo "Data Science project created!"
}
EOF
```

3. Create Azure profile script:

```bash
cat > ~/.config/bash_profiles/azure_profile << 'EOF'
#!/bin/bash
# Azure Developer Profile

# Initialize oh-my-posh
if [ -x "$(command -v oh-my-posh)" ]; then
    eval "$(oh-my-posh init bash --config $POSH_THEMES_PATH/azure.omp.json)"
fi

# Azure environment
export AZURE_CONFIG_DIR="$HOME/.azure"
export AZURE_DEFAULTS_LOCATION="centralus"

# Azure aliases
alias az-login='az login'
alias az-rg='az group list --query "[].name" -o table'

# Azure Function creation
create-azure-function() {
    local name=$1
    func init . --worker-runtime python --python
    func new --name $name --template HttpTrigger
    python3 -m venv venv
    source venv/bin/activate
    pip install azure-functions azure-identity
    echo "Azure Function created!"
}
EOF
```

4. Update ~/.bashrc to load appropriate profile:

```bash
# Add to ~/.bashrc
load_vscode_profile() {
    case "$VSCODE_PROFILE_NAME" in
        "Python Data Science")
            source ~/.config/bash_profiles/python_profile
            ;;
        "Azure Developer")
            source ~/.config/bash_profiles/azure_profile
            ;;
        *)
            # Default setup
            if [ -x "$(command -v oh-my-posh)" ]; then
                eval "$(oh-my-posh init bash --config $POSH_THEMES_PATH/jandedobbeleer.omp.json)"
            fi
            ;;
    esac
}

# Load the appropriate profile
load_vscode_profile
```

## Part 6: Testing Your Setup

### Test Python Data Science Profile

1. Switch to "Python Data Science" profile
2. Open integrated terminal
3. Run:

```powershell
# PowerShell
New-DataScienceProject test-project
cd test-project
jn  # Should launch Jupyter Notebook
```

### Test Azure Developer Profile

1. Switch to "Azure Developer" profile
2. Open integrated terminal
3. Run:

```powershell
# PowerShell
Show-AzureContext
New-AzureFunction myFunction
func start  # Test local development
```

## Part 7: Switching Between Profiles

### Quick Profile Switching

1. **Using Command Palette**:
    
    - Press `Ctrl+Shift+P`
    - Type "Profiles: Switch Profile"
    - Select desired profile
2. **Using Status Bar**:
    
    - Click profile icon in status bar
    - Select profile from dropdown
3. **Keyboard Shortcut** (optional):
    
    - Add to `keybindings.json`:

```json
{
    "key": "ctrl+alt+p",
    "command": "workbench.action.openProfileList"
}
```

## Part 8: Troubleshooting

### Common Issues and Solutions

1. **oh-my-posh not working**:

```powershell
# Verify installation
oh-my-posh --version

# Check theme path
echo $env:POSH_THEMES_PATH
```

2. **Extensions not loading in profile**:
    
    - Restart VSCode after changing profiles
    - Check extension settings in profile-specific settings.json
3. **Terminal not using correct theme**:
    
    - Verify POSH_THEME environment variable
    - Check if theme file exists
4. **Python path issues**:
    

```powershell
# Verify Python path
python --version
where.exe python
```

## Part 9: Advanced Tips

### Profile Backup

```powershell
# Backup profiles
$profilesPath = "$env:APPDATA\Code\User\profiles"
Compress-Archive -Path $profilesPath -DestinationPath "vscode_profiles_backup_$(Get-Date -Format 'yyyyMMdd').zip"
```

### Automatic Profile Detection

Add to your PowerShell profile:

```powershell
function Switch-VSCodeProfile {
    param([string]$profileName)
    
    # Set environment variable for detection
    $env:VSCODE_PROFILE_NAME = $profileName
    
    # Reload profile
    & $PROFILE
}
```

### Profile-Specific Workspaces

Create workspace files for each profile:

- `data-science-workspace.code-workspace`
- `azure-workspace.code-workspace`

## Summary

You now have two fully configured VSCode profiles:

1. **Python Data Science Profile**: Optimized for data science, ML, and Python development
2. **Azure Developer Profile**: Optimized for cloud development with Azure

Each profile includes:

- Custom settings and themes
- Profile-specific extensions
- Tailored terminal configurations
- Specialized commands and aliases
- Automatic environment detection

Switch between profiles using the Command Palette or status bar, and enjoy optimized development environments for different workflows!