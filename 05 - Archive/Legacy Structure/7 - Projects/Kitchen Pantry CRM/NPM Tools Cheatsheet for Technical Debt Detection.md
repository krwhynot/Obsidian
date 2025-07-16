# NPM Tools Cheatsheet for Technical Debt Detection

## 🔍 Basic Quality Analysis Commands

### Security Vulnerability Detection

```bash
# Basic security audit
npm audit                           # Run security vulnerability scan [^14][^17]

# Detailed audit output
npm audit --json                    # Get JSON formatted audit report [^17]

# Fix vulnerabilities automatically  
npm audit fix                       # Auto-fix non-breaking vulnerabilities [^14][^33]

# Advanced audit options
npm audit --audit-level=moderate    # Set minimum severity level [^14]
npx audit-ci                       # Enhanced audit for CI environments [^11]
```


### Code Quality and Linting

```bash
# ESLint for TypeScript projects
npm run lint                        # Run ESLint linting [^15][^31]
npx eslint . --ext .ts,.tsx         # Direct ESLint execution [^31]
npx eslint --fix .                  # Auto-fix ESLint issues [^31]

# Prettier code formatting
npx prettier --write .              # Format all code files [^32]
npx prettier --check .              # Check if files are formatted [^32]

# Combined quality checks
npm run inspect:all                 # Run multiple quality checks in parallel [^29]
```


## 📦 Bundle Analysis and Performance

### Next.js Bundle Analysis

```bash
# Install bundle analyzer
npm install @next/bundle-analyzer    # Add bundle analyzer to project [^18]

# Analyze bundle size
ANALYZE=true npm run build          # Generate bundle analysis report [^18]

# Webpack bundle analysis (general)
npm install --save-dev webpack-bundle-analyzer  # Install analyzer [^16]
npx webpack-bundle-analyzer dist/static/js/*.js # Analyze specific bundles [^16]
```


### Package Analysis Commands

```bash
# List all available npm scripts
npm run                             # Show all package.json scripts [^45]
cat package.json | jq .scripts     # Extract scripts with jq [^45]

# Package information
npm docs <package-name>             # View package documentation [^43]
npm outdated                        # Check for outdated packages [^47]
npm ls                              # List installed packages [^44]
```


## 🛠️ Development and Testing Tools

### TypeScript Development

```bash
# TypeScript execution and checking
npx ts-node script.ts               # Execute TypeScript directly [^46]
npx tsc --noEmit                    # Type check without compilation [^46]
npx tsc --watch                     # Watch mode for type checking [^46]

# TypeScript with specific options
npx ts-node --transpile-only app.ts # Skip type checking for speed [^46]
npx ts-node --project tsconfig.json # Use specific TypeScript config [^46]
```


### Custom NPM Scripts Configuration

```bash
# Package.json script examples for quality inspection [^29]
{
  "scripts": {
    "inspect:lint": "eslint .",
    "inspect:vulnerabilities": "npm audit",
    "inspect:complexity": "plato .",
    "inspect:license": "license-checker --failOn GPLv2",
    "inspect:all": "concurrently \"npm:inspect:lint\" \"npm:inspect:vulnerabilities\""
  }
}
```


## 🔧 Advanced Analysis Tools

### Technical Debt Detection

```bash
# Self-admitted technical debt detection
npm install technical-debts         # Install SATD detection tool [^11]
npx technical-debts analyze .       # Detect technical debt in comments [^11]

# Code complexity analysis
npm install -g plato                # Install complexity analyzer [^29]
plato -r -d report src/             # Generate complexity reports [^29]
```


### Dependency Analysis

```bash
# Dependency security and management
npm ls --depth=0                    # Show top-level dependencies [^44]
npm ls --all                        # Show all dependencies [^44]
npm update --depth=6                # Update nested dependencies [^33]

# License checking
npm install license-checker          # Install license checker [^29]
npx license-checker --failOn GPL   # Check for problematic licenses [^29]
```


## ⚡ Quick Setup Scripts

### Pre-commit Quality Gates

```bash
# Install husky for git hooks
npx husky-init                      # Initialize git hooks [^32]
npm install -D pretty-quick         # Install prettier git hook [^32]

# Set up pre-commit hook
npx husky set .husky/pre-commit "npm run inspect:all"  # Quality gate on commit [^29]
```


### Parallel Quality Checks

```bash
# Install concurrently for parallel execution
npm install -D concurrently         # Run multiple scripts simultaneously [^29]

# Example parallel execution script
"inspect:all": "concurrently -c \"bgBlue.bold,bgMagenta.bold,yellow\" \"npm:inspect:lint\" \"npm:inspect:vulnerabilities\" \"npm:inspect:license\""
```


## 📋 Environment-Specific Commands

### CI/CD Pipeline Integration

```bash
# CI-friendly commands
npm ci                              # Clean install for CI environments [^44]
npm test -- --coverage             # Run tests with coverage [^44]
npm run build --if-present         # Build only if script exists [^44]

# Environment-specific flags
npm install --production            # Install only production dependencies [^44]
npm prune --production              # Remove dev dependencies [^44]
```


### Power User Commands

```bash
# Advanced npm features
npm run start -- --port=3000       # Pass arguments to npm scripts [^28]
npm config list                    # Show all npm configuration [^47]
npm shrinkwrap                      # Lock dependency versions [^47]

# Package exploration
npm view <package> versions --json  # View all package versions [^43]
npm info <package>                  # Get detailed package information [^43]
```

This cheatsheet provides copy-pasteable commands for detecting technical debt, analyzing code quality, and maintaining healthy JavaScript/TypeScript projects [^1][^2]. Use these tools regularly to prevent the accumulation of technical debt and maintain high code quality standards [^3].

<div style="text-align: center">⁂</div>

[^1]: https://brainhub.eu/library/tools-to-measure-technical-debt

[^2]: https://www.itconvergence.com/blog/measure-and-monitor-technical-debt-with-5-types-of-tools/

[^3]: https://4markdown.com/dealing-with-tech-debt-in-applications/

[^4]: paste.txt

[^5]: https://www.semanticscholar.org/paper/0ac9adef99e1a99833f1d249edb900c8a289230d

[^6]: https://ieeexplore.ieee.org/document/9402066/

[^7]: https://dl.acm.org/doi/10.1145/3377812.3381404

[^8]: https://dl.acm.org/doi/10.1145/3183440.3183478

[^9]: https://arxiv.org/abs/2411.05457

[^10]: https://ieeexplore.ieee.org/document/10207146/

[^11]: https://ieeexplore.ieee.org/document/10336277/

[^12]: https://ieeexplore.ieee.org/document/10850816/

[^13]: https://www.npmjs.com/package/technical-debts

[^14]: https://www.softwaretestingmaterial.com/technical-debt/

[^15]: https://docs.oracle.com/cd/E88353_01/html/E37839/npm-audit-1.html

[^16]: https://blog.logrocket.com/linting-typescript-eslint-prettier/

[^17]: https://www.npmjs.com/package/webpack-bundle-analyzer

[^18]: https://www.nodejs-security.com/blog/how-to-use-npm-audit

[^19]: https://www.npmjs.com/package/@next/bundle-analyzer

[^20]: https://arxiv.org/abs/2412.06948

[^21]: https://dl.acm.org/doi/10.1145/3196398.3196465

[^22]: https://dl.acm.org/doi/10.1145/3382494.3410685

[^23]: https://att.aptisi.or.id/index.php/att/article/view/484

[^24]: https://arxiv.org/abs/2501.03736

[^25]: https://arxiv.org/abs/2310.02059

[^26]: https://www.emerald.com/insight/content/doi/10.1108/RPJ-09-2021-0254/full/html

[^27]: http://journals.uran.ua/tarp/article/view/267160

[^28]: https://stackoverflow.com/questions/49866588/how-npmjs-com-calculates-the-code-quality

[^29]: https://snyk.io/articles/top-10-npm-power-user-commands-every-javascript-developer-should-know/

[^30]: https://gist.github.com/goldbergyoni/f503f42357c16d4455f75e02533d9d50

[^31]: https://www.jit.io/resources/appsec-tools/npm-audit-to-protect-your-code

[^32]: https://eslint.org/docs/latest/use/command-line-interface

[^33]: https://dev.to/bokub/how-to-properly-set-up-prettier-in-less-than-2-minutes-2ld0

[^34]: https://www.reddit.com/r/node/comments/qs2573/when_do_you_know_a_npm_vulnerability_warning_is/

[^35]: https://dl.acm.org/doi/10.1145/3627106.3627138

[^36]: https://dl.acm.org/doi/10.1145/3488932.3523262

[^37]: https://dl.acm.org/doi/10.1145/3524842.3528501

[^38]: https://dl.acm.org/doi/10.1145/3510457.3513044

[^39]: https://peerj.com/articles/17335

[^40]: https://dl.acm.org/doi/10.1145/3510003.3510104

[^41]: https://ieeexplore.ieee.org/document/10123674/

[^42]: https://arxiv.org/abs/2405.13175

[^43]: https://github.com/Sunil-Pradhan/npm-cheatsheet

[^44]: https://dev.to/ganesh-tyjo/npm-cheat-sheet-2om5

[^45]: https://stackoverflow.com/questions/59613870/how-to-list-all-the-commands-available-in-package-json

[^46]: https://www.npmjs.com/ts-node

[^47]: https://gist.github.com/MohammadYounes/3ab53cbedd55d95cfa25

[^48]: https://www.upgrad.com/blog/introduction-to-package-json-scripts-in-node-js/

[^49]: https://arxiv.org/abs/2412.14217

[^50]: https://ieeexplore.ieee.org/document/9551792/

[^51]: https://www.npmjs.com/search?q=keywords%3Adebt

[^52]: https://www.linkedin.com/pulse/week-14-technical-debt-accumulation-npm-analysis-api-matheus-

[^53]: https://www.mdpi.com/2306-5354/10/11/1281

[^54]: https://www.semanticscholar.org/paper/71b75dbc3e3fdff606d8b2134413f0f3203b60aa

[^55]: https://www.npmjs.com/search?q=code-analysis

[^56]: https://arxiv.org/abs/2212.01349

[^57]: https://www.emerald.com/insight/content/doi/10.1108/AAAJ-01-2020-4362/full/html

[^58]: https://devhints.io/npm

[^59]: https://webreference.com/cheat-sheets/npm/

[^60]: https://media.jfrog.com/wp-content/uploads/2021/08/23165237/JFrog_NPM_CheatSheet_V4.pdf

