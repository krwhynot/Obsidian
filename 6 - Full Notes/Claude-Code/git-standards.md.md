# Git Industry Standards & Best Practices

  

## 🏗️ REPOSITORY STRUCTURE & CONFIGURATION

  

### Standard Directory Structure

```

project-root/

├── .git/                     # Git repository data

├── .github/                  # GitHub-specific files

│   ├── workflows/           # GitHub Actions CI/CD

│   ├── ISSUE_TEMPLATE/      # Issue templates

│   ├── PULL_REQUEST_TEMPLATE.md

│   └── CODEOWNERS          # Code review assignments

├── .gitignore              # Files to ignore

├── .gitattributes          # Git attributes configuration

├── .gitmessage             # Commit message template

├── README.md               # Project documentation

├── CHANGELOG.md            # Version history

├── CONTRIBUTING.md         # Contribution guidelines

├── LICENSE                 # Project license

└── src/                    # Source code

```

  

### Git Configuration (.gitconfig)

```ini

[user]

    name = Your Name

    email = your.email@company.com

  

[core]

    editor = code --wait

    autocrlf = input

    safecrlf = true

    quotepath = false

    ignorecase = false

  

[init]

    defaultBranch = main

  

[pull]

    rebase = true

  

[push]

    default = simple

    followTags = true

  

[branch]

    autosetuprebase = always

  

[rebase]

    autostash = true

  

[merge]

    ff = false

    conflictstyle = diff3

  

[diff]

    colorMoved = default

    algorithm = histogram

  

[log]

    abbrevCommit = true

    decorate = short

  

[status]

    showUntrackedFiles = all

  

[alias]

    # Status and information

    st = status

    br = branch

    co = checkout

    ci = commit

    # Logging

    lg = log --oneline --graph --decorate --all

    hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short

    # Staging

    unstage = reset HEAD --

    last = log -1 HEAD

    # Branching

    new = checkout -b

    del = branch -d

    # Rebasing

    rb = rebase

    rbi = rebase -i

    # Stashing

    save = stash push -m

    pop = stash pop

    # Remote operations

    sync = !git fetch origin && git rebase origin/main

    publish = push -u origin HEAD

    # Cleanup

    cleanup = !git branch --merged | grep -v '\\*\\|main\\|develop' | xargs -n 1 git branch -d

```

  

## 📋 BRANCHING STRATEGY

  

### Git Flow Model (Recommended for Kitchen Pantry CRM)

```

main branch (production-ready)

├── develop branch (integration)

│   ├── feature/KP-001-organization-crud

│   ├── feature/KP-002-contact-management

│   └── feature/KP-003-interaction-logging

├── release/v1.0.0 (release preparation)

├── hotfix/v1.0.1-critical-bug (urgent fixes)

└── support/v1.x (maintenance)

```

  

### Branch Naming Conventions

```bash

# Feature branches

feature/[TICKET-ID]-[short-description]

feature/KP-001-organization-search

feature/KP-002-touch-optimization

  

# Bug fix branches

bugfix/[TICKET-ID]-[short-description]

bugfix/KP-101-eslint-configuration

bugfix/KP-102-azure-deployment

  

# Hot fix branches (critical production issues)

hotfix/[VERSION]-[short-description]

hotfix/v1.0.1-login-security

hotfix/v1.0.2-data-corruption

  

# Release branches

release/[VERSION]

release/v1.0.0

release/v1.1.0

  

# Experimental branches

experiment/[description]

experiment/react-19-migration

experiment/performance-optimization

```

  

### Branch Protection Rules

```yaml

# main branch protection

main:

  required_status_checks:

    - continuous-integration

    - code-quality

    - security-scan

  required_reviews: 2

  dismiss_stale_reviews: true

  require_code_owner_reviews: true

  allow_force_pushes: false

  allow_deletions: false

  

# develop branch protection  

develop:

  required_status_checks:

    - continuous-integration

    - code-quality

  required_reviews: 1

  dismiss_stale_reviews: true

  allow_force_pushes: false

```

  

## 💬 COMMIT MESSAGE STANDARDS

  

### Conventional Commits Format

```

<type>[optional scope]: <description>

  

[optional body]

  

[optional footer(s)]

```

  

### Commit Types (Industry Standard)

```bash

# Production code changes

feat:     # New feature for the user

fix:      # Bug fix for the user

hotfix:   # Critical production fix

  

# Development and maintenance

docs:     # Documentation changes

style:    # Code style changes (formatting, semicolons, etc.)

refactor: # Code refactoring without functional changes

perf:     # Performance improvements

test:     # Adding or updating tests

  

# Build and deployment

build:    # Changes to build system or dependencies

ci:       # Changes to CI/CD configuration

chore:    # Maintenance tasks, dependency updates

  

# Breaking changes

BREAKING CHANGE: # In footer for major version changes

```

  

### Commit Message Examples

```bash

# Good commit messages

feat(auth): add OAuth2 login integration

fix(api): resolve organization search timeout issue

docs(readme): update installation instructions

refactor(components): extract QuickInteractionEntry logic

perf(database): optimize organization query with indexes

test(contacts): add unit tests for contact validation

build(deps): upgrade Next.js to v15.3.4

ci(azure): configure deployment pipeline

chore(eslint): update configuration for TypeScript

  

# Commit with body and footer

feat(interactions): implement 30-second entry workflow

  

Add QuickInteractionEntry component with:

- Auto-complete organization search

- Contact selection dropdown  

- Interaction type validation

- 30-second timer optimization

  

Closes #KP-003

Refs #KP-001, #KP-002

  

# Breaking change commit

feat(api)!: restructure organization endpoints

  

BREAKING CHANGE: Organization API endpoints now use REST conventions.

/api/organizations/search moved to /api/organizations?search=query

```

  

### Commit Message Template (.gitmessage)

```

# <type>[optional scope]: <description>

# |<----  Using a Maximum Of 50 Characters  ---->|

  

# Explain why this change is being made

# |<----   Try To Limit Each Line to a Maximum Of 72 Characters   ---->|

  

# Provide links or keys to any relevant tickets, articles or other resources

# Examples: Github issue #23, Jira KP-123

  

# --- COMMIT END ---

# Type can be:

#    feat     (new feature)

#    fix      (bug fix)

#    docs     (changes to documentation)

#    style    (formatting, missing semi colons, etc; no code change)

#    refactor (refactoring production code)

#    test     (adding missing tests, refactoring tests; no production code change)

#    chore    (updating grunt tasks etc; no production code change)

# --------------------

# Remember to:

#    Capitalize the subject line

#    Use the imperative mood in the subject line

#    Do not end the subject line with a period

#    Separate subject from body with a blank line

#    Use the body to explain what and why vs. how

#    Can use multiple lines with "-" for bullet points in body

```

  

## 🚫 .GITIGNORE COMPREHENSIVE TEMPLATE

  

### Universal .gitignore

```gitignore

#==============================================================================

# OPERATING SYSTEMS

#==============================================================================

  

# macOS

.DS_Store

.AppleDouble

.LSOverride

Icon?

._*

.Spotlight-V100

.Trashes

  

# Windows

Thumbs.db

Desktop.ini

$RECYCLE.BIN/

*.lnk

  

# Linux

*~

.nfs*

  

#==============================================================================

# EDITORS & IDEs

#==============================================================================

  

# Visual Studio Code

.vscode/

!.vscode/settings.json

!.vscode/tasks.json

!.vscode/launch.json

!.vscode/extensions.json

  

# JetBrains IDEs

.idea/

*.iml

*.ipr

*.iws

  

# Sublime Text

*.sublime-project

*.sublime-workspace

  

# Vim

*.swp

*.swo

*~

  

# Emacs

*~

\#*\#

/.emacs.desktop

/.emacs.desktop.lock

*.elc

  

#==============================================================================

# PROGRAMMING LANGUAGES

#==============================================================================

  

# Node.js

node_modules/

npm-debug.log*

yarn-debug.log*

yarn-error.log*

.npm

.node_repl_history

.yarn-integrity

package-lock.json  # if using yarn

yarn.lock         # if using npm

  

# Python

__pycache__/

*.py[cod]

*$py.class

*.so

.Python

pip-log.txt

pip-delete-this-directory.txt

.env

venv/

ENV/

  

# Java

*.class

*.jar

*.war

*.ear

target/

.mvn/

mvnw

mvnw.cmd

  

# .NET

bin/

obj/

*.dll

*.exe

*.pdb

*.user

*.suo

*.cache

  

# Go

*.exe

*.test

*.prof

vendor/

  

# Rust

target/

Cargo.lock

  

#==============================================================================

# FRAMEWORKS & LIBRARIES

#==============================================================================

  

# Next.js

.next/

out/

.swc/

  

# React

build/

  

# Vue.js

dist/

.nuxt/

  

# Angular

dist/

.angular/

  

# Gatsby

.cache/

public/

  

# Nuxt.js

.nuxt/

dist/

  

#==============================================================================

# DATABASES

#==============================================================================

  

# SQLite

*.sqlite

*.sqlite3

*.db

  

# PostgreSQL

*.sql

  

# MongoDB

*.bson

  

# Redis

dump.rdb

  

#==============================================================================

# DEPLOYMENT & CLOUD

#==============================================================================

  

# Azure

*.azurePubxml

*.pubxml

*.publishproj

  

# AWS

.aws/

  

# Docker

Dockerfile.prod

docker-compose.override.yml

  

# Terraform

*.tfstate

*.tfstate.*

.terraform/

  

# Kubernetes

*.kubeconfig

  

#==============================================================================

# SECURITY & SECRETS

#==============================================================================

  

# Environment variables

.env

.env.local

.env.development.local

.env.test.local

.env.production.local

  

# API keys and secrets

secrets.json

*.pem

*.key

*.crt

*.p12

*.pfx

  

# Configuration files with secrets

config/secrets.yml

config/database.yml

config/production.rb

  

#==============================================================================

# BUILD ARTIFACTS & CACHE

#==============================================================================

  

# General build outputs

build/

dist/

out/

target/

bin/

obj/

  

# Cache directories

.cache/

.parcel-cache/

.eslintcache

.stylelintcache

  

# Temporary files

*.tmp

*.temp

.temp/

tmp/

  

# Archives

*.zip

*.tar.gz

*.rar

*.7z

  

#==============================================================================

# LOGS

#==============================================================================

  

# Application logs

logs/

*.log

npm-debug.log*

yarn-debug.log*

yarn-error.log*

  

# Runtime logs

*.out

*.err

  

#==============================================================================

# TESTING & COVERAGE

#==============================================================================

  

# Test coverage

coverage/

.nyc_output/

*.lcov

  

# Test results

test-results/

junit.xml

  

# Playwright

test-results/

playwright-report/

  

# Jest

.jest/

  

#==============================================================================

# DOCUMENTATION

#==============================================================================

  

# Generated documentation

docs/build/

.docusaurus/

  

# API documentation

api-docs/

  

#==============================================================================

# PROJECT SPECIFIC (Kitchen Pantry CRM)

#==============================================================================

  

# Claude Code logs

.claude/logs/

.claude/cache/

  

# Development database

*.db

kitchen-pantry-crm.sqlite

  

# Azure deployment

.azure/

azuredeploy.parameters.json

  

# Performance monitoring

.lighthouse/

bundle-analyzer/

```

  

## 🔧 GIT ATTRIBUTES CONFIGURATION

  

### .gitattributes File

```gitattributes

# Set default behavior to automatically normalize line endings

* text=auto eol=lf

  

# Explicitly declare text files you want to always be normalized and converted

# to native line endings on checkout

*.c text

*.h text

*.js text

*.ts text

*.jsx text

*.tsx text

*.css text

*.scss text

*.less text

*.html text

*.xml text

*.json text

*.md text

*.yml text

*.yaml text

*.txt text

*.sql text

  

# Declare files that will always have CRLF line endings on checkout

*.bat text eol=crlf

*.cmd text eol=crlf

  

# Declare files that will always have LF line endings on checkout

*.sh text eol=lf

Dockerfile text eol=lf

*.conf text eol=lf

  

# Denote all files that are truly binary and should not be modified

*.png binary

*.jpg binary

*.jpeg binary

*.gif binary

*.ico binary

*.svg binary

*.webp binary

*.pdf binary

*.zip binary

*.tar.gz binary

*.exe binary

*.dll binary

*.so binary

*.dylib binary

*.woff binary

*.woff2 binary

*.ttf binary

*.otf binary

*.eot binary

  

# Archive files

*.7z binary

*.gz binary

*.tar binary

*.tgz binary

*.zip binary

  

# Database files

*.db binary

*.sqlite binary

*.sqlite3 binary

  

# Office documents

*.doc binary

*.docx binary

*.xls binary

*.xlsx binary

*.ppt binary

*.pptx binary

  

# Git LFS (Large File Storage) tracking

*.psd filter=lfs diff=lfs merge=lfs -text

*.ai filter=lfs diff=lfs merge=lfs -text

*.sketch filter=lfs diff=lfs merge=lfs -text

*.mp4 filter=lfs diff=lfs merge=lfs -text

*.mov filter=lfs diff=lfs merge=lfs -text

*.avi filter=lfs diff=lfs merge=lfs -text

  

# Linguist overrides for GitHub language detection

*.sql linguist-detectable=true

*.md linguist-detectable=false

docs/ linguist-documentation

examples/ linguist-documentation

test/ linguist-vendored

tests/ linguist-vendored

spec/ linguist-vendored

*.min.js linguist-vendored

*.min.css linguist-vendored

vendor/ linguist-vendored

```

  

## 🔄 GIT HOOKS

  

### Pre-commit Hook (Quality Assurance)

```bash

#!/bin/sh

# .git/hooks/pre-commit

  

echo "Running pre-commit checks..."

  

# Check for debugging statements

if grep -r "console.log\|debugger\|TODO\|FIXME" --include="*.js" --include="*.ts" --include="*.jsx" --include="*.tsx" src/; then

    echo "❌ Found debugging statements or TODO items. Please remove or address them."

    echo "Use 'git commit --no-verify' to bypass this check if necessary."

    exit 1

fi

  

# Run linting

echo "🔍 Running ESLint..."

npm run lint

if [ $? -ne 0 ]; then

    echo "❌ ESLint failed. Please fix linting errors."

    exit 1

fi

  

# Run type checking

echo "🔍 Running TypeScript type check..."

npm run type-check

if [ $? -ne 0 ]; then

    echo "❌ TypeScript type check failed. Please fix type errors."

    exit 1

fi

  

# Run tests

echo "🧪 Running tests..."

npm run test -- --passWithNoTests

if [ $? -ne 0 ]; then

    echo "❌ Tests failed. Please fix failing tests."

    exit 1

fi

  

# Check commit message format

echo "✅ Pre-commit checks passed!"

```

  

### Commit Message Hook (Message Validation)

```bash

#!/bin/sh

# .git/hooks/commit-msg

  

commit_regex='^\s*(feat|fix|docs|style|refactor|perf|test|build|ci|chore|hotfix)(\(.+\))?\s*:\s*.{1,50}'

  

if ! grep -qE "$commit_regex" "$1"; then

    echo "❌ Invalid commit message format!"

    echo "Format: <type>[optional scope]: <description>"

    echo "Example: feat(auth): add OAuth2 login integration"

    echo ""

    echo "Valid types: feat, fix, docs, style, refactor, perf, test, build, ci, chore, hotfix"

    exit 1

fi

  

# Check commit message length

if [ "$(head -n1 $1 | wc -c)" -gt 72 ]; then

    echo "❌ Commit message first line too long (>72 characters)"

    exit 1

fi

  

echo "✅ Commit message format valid!"

```

  

### Pre-push Hook (Final Validation)

```bash

#!/bin/sh

# .git/hooks/pre-push

  

protected_branch='main'

current_branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')

  

# Prevent direct push to protected branches

if [ "$current_branch" = "$protected_branch" ]; then

    echo "❌ Direct push to $protected_branch branch is not allowed!"

    echo "Please use a feature branch and create a pull request."

    exit 1

fi

  

# Run full test suite before pushing

echo "🧪 Running full test suite before push..."

npm run test

if [ $? -ne 0 ]; then

    echo "❌ Tests failed. Push aborted."

    exit 1

fi

  

# Check for large files

large_files=$(git diff --cached --name-only --diff-filter=A | xargs -I {} du -k {} | awk '$1 > 500 { print $2 }')

if [ -n "$large_files" ]; then

    echo "❌ Large files detected (>500KB):"

    echo "$large_files"

    echo "Consider using Git LFS for large files."

    exit 1

fi

  

echo "✅ Pre-push checks passed!"

```

  

## 📝 PULL REQUEST TEMPLATE

  

### .github/PULL_REQUEST_TEMPLATE.md

```markdown

## 📋 Description

Brief description of what this PR does.

  

Fixes #(issue_number)

  

## 🔄 Type of Change

- [ ] 🐛 Bug fix (non-breaking change which fixes an issue)

- [ ] ✨ New feature (non-breaking change which adds functionality)  

- [ ] 💥 Breaking change (fix or feature that would cause existing functionality to not work as expected)

- [ ] 📚 Documentation update

- [ ] 🎨 Style/formatting changes

- [ ] ♻️ Code refactoring

- [ ] ⚡ Performance improvements

- [ ] 🧪 Test updates

  

## 🧪 Testing

- [ ] Unit tests pass

- [ ] Integration tests pass

- [ ] Manual testing completed

- [ ] Touch target compliance verified (if UI changes)

- [ ] Cross-browser testing (if applicable)

  

## 📱 Screenshots/Videos

<!-- Add screenshots or videos demonstrating the changes -->

  

## 🔍 Checklist

- [ ] My code follows the style guidelines of this project

- [ ] I have performed a self-review of my own code

- [ ] I have commented my code, particularly in hard-to-understand areas

- [ ] I have made corresponding changes to the documentation

- [ ] My changes generate no new warnings

- [ ] I have added tests that prove my fix is effective or that my feature works

- [ ] New and existing unit tests pass locally with my changes

- [ ] Any dependent changes have been merged and published

  

## 🏗️ Kitchen Pantry CRM Specific

- [ ] Azure SQL Basic tier performance considered

- [ ] Touch targets meet 44px requirement

- [ ] 30-second interaction entry workflow tested

- [ ] Settings Management system integration verified

- [ ] NextCRM component patterns followed

  

## 📊 Performance Impact

- [ ] No negative performance impact

- [ ] Performance improved

- [ ] Performance impact acceptable for requirements

  

## 🔒 Security Considerations

- [ ] No sensitive data exposed

- [ ] Input validation implemented

- [ ] Authentication/authorization requirements met

- [ ] SQL injection prevention measures in place

  

## 📝 Additional Notes

<!-- Any additional information that reviewers should know -->

  

## 🎯 Deployment Notes

- [ ] Database migrations required: Yes/No

- [ ] Environment variables added/changed: Yes/No

- [ ] Azure configuration changes needed: Yes/No

- [ ] Third-party service configuration required: Yes/No

  

---

**Reviewer Guidelines:**

- Focus on code quality, security, and performance

- Verify touch target compliance for UI changes

- Ensure Azure SQL Basic tier constraints are respected

- Check NextCRM integration patterns are followed

```

  

## 🏷️ RELEASE MANAGEMENT

  

### Semantic Versioning (SemVer)

```

MAJOR.MINOR.PATCH (e.g., 1.4.2)

  

MAJOR: Breaking changes (API changes, major refactors)

MINOR: New features (backward compatible)

PATCH: Bug fixes (backward compatible)

  

Examples:

1.0.0 - Initial release

1.0.1 - Bug fixes

1.1.0 - New features added

2.0.0 - Breaking changes introduced

```

  

### Release Branch Workflow

```bash

# Create release branch

git checkout develop

git pull origin develop

git checkout -b release/v1.1.0

  

# Prepare release

npm version 1.1.0

git add package.json package-lock.json

git commit -m "chore(release): bump version to v1.1.0"

  

# Merge to main

git checkout main

git merge --no-ff release/v1.1.0

git tag -a v1.1.0 -m "Release version 1.1.0"

git push origin main --tags

  

# Merge back to develop

git checkout develop  

git merge --no-ff release/v1.1.0

git push origin develop

  

# Clean up

git branch -d release/v1.1.0

```

  

### CHANGELOG.md Format

```markdown

# Changelog

  

All notable changes to this project will be documented in this file.

  

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),

and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

  

## [Unreleased]

  

### Added

### Changed  

### Deprecated

### Removed

### Fixed

### Security

  

## [1.1.0] - 2024-06-11

  

### Added

- QuickInteractionEntry component with 30-second timer

- Organization search API with autocomplete

- Touch target compliance for iPad optimization

- Automated change logging system

  

### Changed

- Upgraded from React 18.2.0 to maintain stability

- Optimized Azure SQL queries for Basic tier performance

  

### Fixed

- ESLint configuration compatibility with TypeScript

- Windows EPERM build permission errors

- NextCRM component integration issues

  

### Performance

- Reduced search response time from 2s to 54-104ms

- Optimized development server startup to 3.4 seconds

  

## [1.0.0] - 2024-05-15

  

### Added

- Initial Kitchen Pantry CRM implementation

- NextCRM foundation integration

- Azure SQL database schema

- Authentication system

- Basic organization and contact management

  

[Unreleased]: https://github.com/username/kitchen-pantry-crm/compare/v1.1.0...HEAD

[1.1.0]: https://github.com/username/kitchen-pantry-crm/compare/v1.0.0...v1.1.0

[1.0.0]: https://github.com/username/kitchen-pantry-crm/releases/tag/v1.0.0

```

  

## 🔒 SECURITY BEST PRACTICES

  

### Sensitive Data Protection

```bash

# Never commit these files

echo "*.key" >> .gitignore

echo "*.pem" >> .gitignore

echo ".env*" >> .gitignore

echo "secrets.json" >> .gitignore

  

# Use git-secrets to prevent commits

git secrets --register-aws

git secrets --install ~/.git-templates/git-secrets

git config --global init.templateDir ~/.git-templates/git-secrets

```

  

### Git Commit Signing

```bash

# Configure GPG signing

git config --global user.signingkey [YOUR_GPG_KEY_ID]

git config --global commit.gpgsign true

git config --global tag.gpgsign true

  

# Sign commits

git commit -S -m "feat(auth): add secure OAuth2 implementation"

```

  

### Repository Security Scanning

```yaml

# .github/workflows/security.yml

name: Security Scan

on: [push, pull_request]

jobs:

  security:

    runs-on: ubuntu-latest

    steps:

      - uses: actions/checkout@v3

      - name: Run Trivy vulnerability scanner

        uses: aquasecurity/trivy-action@master

        with:

          scan-type: 'fs'

          scan-ref: '.'

          format: 'sarif'

          output: 'trivy-results.sarif'

```

  

## 📊 GIT WORKFLOW AUTOMATION

  

### GitHub Actions CI/CD

```yaml

# .github/workflows/ci.yml

name: Continuous Integration

on:

  push:

    branches: [main, develop]

  pull_request:

    branches: [main, develop]

  

jobs:

  lint-and-test:

    runs-on: ubuntu-latest

    steps:

      - uses: actions/checkout@v3

      - uses: actions/setup-node@v3

        with:

          node-version: '18'

          cache: 'npm'

      - name: Install dependencies

        run: npm ci

      - name: Run linting

        run: npm run lint

      - name: Run type checking

        run: npm run type-check

      - name: Run tests

        run: npm run test -- --coverage

      - name: Upload coverage

        uses: codecov/codecov-action@v3

```

  

### Automated Version Bumping

```yaml

# .github/workflows/release.yml

name: Release

on:

  push:

    branches: [main]

jobs:

  release:

    runs-on: ubuntu-latest

    steps:

      - uses: actions/checkout@v3

        with:

          token: ${{ secrets.GITHUB_TOKEN }}

      - name: Automated Version Bump

        uses: phips28/gh-action-bump-version@master

        with:

          tag-prefix: 'v'

        env:

          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

```

  

## 🎯 KITCHEN PANTRY CRM SPECIFIC

  

### Project-Specific Git Aliases

```bash

# Add to .gitconfig [alias] section

kp-status = !git status && echo "\n📊 KP-CRM Status:" && git log --oneline -5

kp-deploy = !git checkout main && git pull && echo "🚀 Ready for Azure deployment"

kp-feature = "!f() { git checkout develop && git pull && git checkout -b feature/KP-$1-${2// /-}; }; f"

kp-hotfix = "!f() { git checkout main && git pull && git checkout -b hotfix/v$1-${2// /-}; }; f"

```

  

### Azure DevOps Integration

```yaml

# azure-pipelines.yml

trigger:

  branches:

    include:

      - main

      - develop

      - release/*

  

pool:

  vmImage: 'ubuntu-latest'

  

variables:

  buildConfiguration: 'Release'

  

steps:

- task: NodeTool@0

  inputs:

    versionSpec: '18.x'

  displayName: 'Install Node.js'

  

- script: npm ci

  displayName: 'Install dependencies'

  

- script: npm run build

  displayName: 'Build application'

  

- script: npm run test

  displayName: 'Run tests'

  

- task: AzureWebApp@1

  inputs:

    azureSubscription: 'Azure Service Connection'

    appType: 'webAppLinux'

    appName: 'kitchen-pantry-crm'

    package: '$(System.DefaultWorkingDirectory)'

```

  

---

  

## ✅ IMPLEMENTATION CHECKLIST

  

### Repository Setup

- [ ] Initialize git repository with proper structure

- [ ] Configure .gitignore with comprehensive exclusions

- [ ] Set up .gitattributes for cross-platform compatibility

- [ ] Install and configure git hooks for quality assurance

- [ ] Create pull request templates

- [ ] Set up branch protection rules

  

### Team Collaboration

- [ ] Establish branching strategy (Git Flow recommended)

- [ ] Define commit message conventions

- [ ] Create CONTRIBUTING.md guidelines

- [ ] Set up code review process

- [ ] Configure automated CI/CD pipeline

  

### Security & Compliance

- [ ] Enable commit signing

- [ ] Configure security scanning

- [ ] Set up secret detection

- [ ] Implement dependency vulnerability checks

- [ ] Regular security audits

  

### Kitchen Pantry CRM Specific

- [ ] Configure Azure DevOps integration

- [ ] Set up deployment pipeline to Azure App Service

- [ ] Implement performance monitoring in CI/CD

- [ ] Configure touch target testing automation

- [ ] Set up database migration validation

  

**Industry Standard Compliance**: This configuration follows Git best practices from GitHub, GitLab, Microsoft, Google, and other industry leaders, ensuring professional-grade version control for Kitchen Pantry CRM and all future projects.