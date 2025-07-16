## 1. Comprehensive Code Review & Architecture Analysis

```

You are an expert full-stack developer conducting a comprehensive code review for a Next.js 15 + TypeScript + Prisma application. Analyze the provided code for:

**Technical Standards:**
- Code structure and organization following Next.js 15 best practices
- TypeScript type safety and proper interface definitions
- Prisma ORM query optimization and data modeling
- React 19 RC feature usage and potential compatibility issues

**Performance Requirements:**
- Search operations must complete in <1 second
- Report generation must complete in <10 seconds
- Page load times must be <3 seconds on 3G connections
- Code that could impact these performance targets

**Critical Areas to Evaluate:**
1. Functional consistency with requirements
2. Logic errors and potential bugs
3. Security vulnerabilities and data privacy concerns
4. Performance bottlenecks and optimization opportunities
5. Code readability, maintainability, and documentation
6. Error handling and logging mechanisms
7. Testing coverage and testability
8. Dependency management and version compatibility

Provide specific recommendations with code examples for each issue found.
```


This prompt addresses comprehensive code quality assessment as recommended by industry experts[1](https://www.reddit.com/r/ClaudeAI/comments/1exy6re/the_people_who_are_having_amazing_results_with/)[6](http://teamai.com/prompts/conducting_a_comprehensive_code_review/)[12](https://www.michaelagreiler.com/code-review-checklist-2/).

## 2. Azure Deployment & Infrastructure Validation
```
As an Azure infrastructure specialist, validate this Next.js application's deployment configuration for Azure App Service Basic B1 tier with Azure SQL Server Basic tier:

**Infrastructure Requirements:**
- Support for 4 concurrent users maximum
- $18/month total budget ($5 SQL + $13 App Service)
- Production-ready security configuration
- Optimal performance within tier limitations

**Validation Checklist:**
1. Azure App Service configuration for Next.js 15
2. Connection string security and environment variable management
3. SQL Server Basic tier performance optimization
4. Resource scaling and monitoring setup
5. HTTPS enforcement and SSL certificate configuration
6. Backup and disaster recovery planning
7. Cost optimization strategies
8. Compliance with Azure security best practices

**Analyze the provided configuration files and identify:**
- Potential deployment failures
- Security misconfigurations
- Performance bottlenecks
- Cost optimization opportunities
- Missing monitoring and alerting setup

Provide specific ARM templates or configuration improvements where needed.
```
This prompt ensures proper Azure deployment validation following Microsoft's recommended practices[22](https://github.com/Azure/ResourceModules/wiki/The-CI-environment---Deployment-validation).

## 3. Database Security & Performance Audit

```
Conduct a comprehensive security and performance audit of this Prisma-based application with Azure SQL Server:

**Security Assessment:**
- SQL injection vulnerability analysis
- Data access control and user permissions
- Sensitive data exposure risks
- Authentication and authorization implementation
- Audit trail and logging mechanisms
- Connection security and encryption

**Performance Analysis:**
- Query optimization for <1 second search requirements
- Index strategy for frequently accessed data
- Connection pooling configuration
- Database schema design efficiency
- Migration strategy validation
- Backup and recovery procedures

**Prisma-Specific Review:**
1. Schema.prisma file structure and relationships
2. Query efficiency and N+1 problem prevention
3. Transaction handling and data consistency
4. Error handling in database operations
5. Type safety in database interactions
6. Migration scripts and version control

Provide specific recommendations for each area with code examples and configuration improvements.
```

This addresses database security best practices and audit requirements[23](https://blog.yarsalabs.com/audit-trail-in-postgresql-using-prisma/)[29](https://www.datasparc.com/standard-database-security/).

## 4. API Security & Validation Testing

```
As a cybersecurity expert, perform a comprehensive API security review for this Node.js/Next.js application:

**Authentication & Authorization:**
- JWT token implementation and validation
- Session management security
- Role-based access control (RBAC)
- Two-factor authentication setup
- Password policies and storage

**API Endpoint Security:**
1. Input validation and sanitization
2. Rate limiting implementation
3. CORS configuration
4. SQL injection prevention
5. Cross-site scripting (XSS) protection
6. Server-side request forgery (SSRF) prevention
7. Insecure direct object references (IDOR)
8. Transport layer security (TLS) enforcement

**Data Protection:**
- Sensitive data encryption at rest and in transit
- PII data handling and compliance
- Data masking for non-production environments
- Audit logging for sensitive operations

**Testing Requirements:**
Provide specific test cases for each vulnerability type with expected inputs/outputs and remediation steps.

```

This follows industry-standard API security checklists and penetration testing methodologies[28](https://www.linkedin.com/pulse/web-application-penetration-testing-checklist-cybersecurity-news-zqohc)[30](https://www.apisec.ai/blog/api-security-checklist).

## 5. Performance & Load Testing Validation

```
Analyze this Next.js application for performance bottlenecks and validate against these specific requirements:

**Performance Targets:**
- Search operations: <1 second response time
- Report generation: <10 seconds maximum
- Page load: <3 seconds on 3G connection
- Support 4 concurrent users on Azure Basic B1

**Areas to Analyze:**
1. **Frontend Performance:**
   - React component rendering optimization
   - Bundle size analysis and code splitting
   - Image optimization and lazy loading
   - CSS and JavaScript minification
   - Browser caching strategies

2. **Backend Performance:**
   - API response times and bottlenecks
   - Database query optimization
   - Memory usage and garbage collection
   - Connection pooling efficiency
   - Caching implementation (Redis/memory)

3. **Load Testing Scenarios:**
   - 4 simultaneous users performing searches
   - Concurrent report generation requests
   - Data entry operations under load
   - Database connection limits testing

Provide specific performance testing scripts and optimization recommendations with before/after metrics.

```


This addresses performance testing requirements specific to your technical constraints[16](https://codoid.com/ai-testing/prompt-engineering-for-qa-essential-tips/).

## 6. Mobile & Accessibility Compliance Audit

```
Conduct a comprehensive accessibility and mobile usability audit for this iPad-first application:

**Accessibility Requirements (WCAG 2.1 AA):**
- Touch target minimum 44px compliance
- Color contrast ratios
- Screen reader compatibility
- Keyboard navigation support
- Focus management and visual indicators

**Mobile-Specific Validation:**
1. **Touch Interface:**
   - All interactive elements meet 44px minimum
   - Touch gesture implementation
   - Swipe and scroll behavior
   - Haptic feedback integration

2. **Responsive Design:**
   - iPad viewport optimization
   - Portrait/landscape orientation handling
   - Font scaling and readability
   - Layout stability across screen sizes

3. **Performance on Mobile:**
   - 3G connection optimization
   - Battery usage efficiency
   - Offline functionality assessment
   - PWA capabilities evaluation

**Testing Checklist:**
Provide specific test cases for each accessibility criterion with automated testing recommendations using Jest + React Testing Library.

```

This ensures compliance with accessibility standards and mobile-first design principles[17](https://www.xfive.co/blog/code-quality-assurance-checklist/).

## 7. TypeScript & Code Quality Enforcement

```
As a senior TypeScript developer, perform a comprehensive code quality review focusing on:

**TypeScript Best Practices:**
- Strict type checking configuration
- Interface vs type usage optimization
- Generic type implementation
- Union and intersection type usage
- Utility type leveraging for code reuse

**Code Quality Standards:**
1. **ESLint Configuration:**
   - TypeScript-specific rules
   - React/Next.js best practices
   - Performance optimization rules
   - Security vulnerability detection

2. **Code Organization:**
   - Module structure and imports
   - Component composition patterns
   - Custom hook implementation
   - Service layer architecture
   - Utility function organization

3. **Error Handling:**
   - Type-safe error handling patterns
   - API error response typing
   - Form validation implementation
   - Async/await error management

**Static Analysis Requirements:**
Identify potential runtime errors, unused code, performance anti-patterns, and provide specific refactoring recommendations with code examples.

```

This addresses TypeScript-specific code quality and static analysis requirements[21](https://graphite.dev/guides/existing-code-review-tools-for-typescript)[25](https://dev.to/documatic/how-to-use-static-code-analysis-tools-to-improve-your-typescript-codebase-b6g).

## 8. CI/CD Pipeline & Deployment Security

```
Design and validate a comprehensive CI/CD pipeline for this Next.js application using GitHub Actions:

**Pipeline Requirements:**
- Automated testing (Jest + React Testing Library)
- TypeScript type checking
- ESLint and Prettier validation
- Security vulnerability scanning
- Azure deployment automation

**Security Integration:**
1. **Static Application Security Testing (SAST)**
2. **Dependency vulnerability scanning**
3. **Container security (if applicable)**
4. **Environment variable management**
5. **Secrets management and rotation**

**Deployment Validation:**
- Staging environment testing
- Database migration validation
- Performance regression testing
- Rollback strategy implementation
- Health check endpoints

**Quality Gates:**
- Code coverage thresholds
- Performance benchmark validation
- Security scan pass requirements
- Manual approval processes

Provide complete GitHub Actions workflow files with proper error handling and notification setup.

```

This ensures secure and reliable deployment practices[26](https://moldstud.com/articles/p-understanding-the-security-challenges-in-full-stack-development)[27](https://auditboard.com/blog/what-is-security-audit).

## 9. Data Migration & Integrity Validation

```
Validate the Excel-to-database migration strategy ensuring 100% data accuracy:

**Migration Requirements:**
- Complete data migration from Excel system
- Zero data loss tolerance
- Data integrity validation
- Performance optimization during migration
- Rollback capability

**Validation Framework:**
1. **Pre-Migration Analysis:**
   - Excel data structure mapping
   - Data type conversion validation
   - Constraint and relationship verification
   - Data quality assessment

2. **Migration Process:**
   - Batch processing optimization
   - Error handling and logging
   - Progress tracking and reporting
   - Transactional integrity maintenance

3. **Post-Migration Verification:**
   - Row count validation
   - Data checksum verification
   - Business logic validation
   - Performance testing with migrated data

**Testing Strategy:**
Provide specific test cases for data validation, including edge cases, data corruption scenarios, and performance benchmarks.

```

This addresses the critical 100% data migration accuracy requirement[14](https://www.fynd.academy/blog/what-is-project-audit).

## 10. End-to-End User Experience Validation

```
Conduct comprehensive user experience validation for this food service management application:

**User Journey Testing:**
- Data entry workflows (30-second target)
- Search functionality (<1 second requirement)
- Report generation (<10 seconds requirement)
- iPad-specific interactions
- Multi-user concurrent usage

**Usability Requirements:**
1. **Interface Validation:**
   - Touch target accessibility (44px minimum)
   - Navigation intuitiveness
   - Error message clarity
   - Loading state management
   - Offline capability

2. **Performance Under Real Conditions:**
   - 3G connection simulation
   - Multiple tab usage
   - Background app behavior
   - Memory management
   - Battery usage optimization

3. **Business Process Validation:**
   - Food service workflow optimization
   - Excel replacement effectiveness
   - User adoption barriers identification
   - Training requirement assessment

**Success Metrics Validation:**
Test each key success factor with specific scenarios and provide quantitative validation results with improvement recommendations.

```