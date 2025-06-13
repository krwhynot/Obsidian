# Software Testing Order for Food Service CRM Development

Based on the comprehensive testing prompts provided for your food service CRM system, here's the recommended testing sequence that follows industry best practices and the software testing pyramid methodology[8](https://ieeexplore.ieee.org/document/8048644/)[12](https://ieeexplore.ieee.org/document/9660999/).

## Phase 1: Foundation Testing (Weeks 1-2)

## Code Quality & Security Assessment

Start with these fundamental tests that establish the foundation for all subsequent testing:

- **TypeScript Code Review** (Prompt #3) - Validates type safety and React 19 RC compatibility before any functional testing[8](https://ieeexplore.ieee.org/document/8048644/)[11](https://dl.acm.org/doi/10.1145/3439961.3439991)
    
- **Security Vulnerability Assessment** (Prompt #4) - Critical for food service industry compliance requirements[8](https://ieeexplore.ieee.org/document/8048644/)
    
- **Prisma ORM Security & Performance Review** (Prompt #5) - Database security must be validated early in the process[7](http://ksiresearchorg.ipage.com/seke/seke18paper/seke18paper_128.pdf)
    

## Architecture Validation

- **Project Architecture Analysis** (Prompt #1) - Ensures the tech stack foundation is solid[8](https://ieeexplore.ieee.org/document/8048644/)
    
- **Performance Requirements Validation** (Prompt #2) - Confirms Azure Basic B1 can meet sub-second response requirements[8](https://ieeexplore.ieee.org/document/8048644/)
    

## Phase 2: Unit & Component Testing (Weeks 3-4)

## Frontend Component Testing

Following the testing pyramid approach, unit tests form the base layer[8](https://ieeexplore.ieee.org/document/8048644/)[12](https://ieeexplore.ieee.org/document/9660999/):

- **React 19 RC Compatibility Check** (Prompt #6) - Validates component-level compatibility[4](https://ieeexplore.ieee.org/document/10847365/)
    
- **shadcn/ui Component Integration Review** (Prompt #8) - Tests individual UI component functionality[4](https://ieeexplore.ieee.org/document/10847365/)
    
- **Touch Target Accessibility Validation** (Prompt #7) - Ensures 44px minimum touch targets for iPad interface[4](https://ieeexplore.ieee.org/document/10847365/)
    

## Backend Unit Testing

- **Node.js API Security Review** (Prompt #10) - Tests individual API endpoint security[7](http://ksiresearchorg.ipage.com/seke/seke18paper/seke18paper_128.pdf)[11](https://dl.acm.org/doi/10.1145/3439961.3439991)
    
- **Jest Test Coverage Analysis** (Prompt #13) - Validates unit test completeness and quality[4](https://ieeexplore.ieee.org/document/10847365/)[8](https://ieeexplore.ieee.org/document/8048644/)
    

## Phase 3: Integration Testing (Weeks 5-6)

Integration testing addresses component interactions and data flow[7](http://ksiresearchorg.ipage.com/seke/seke18paper/seke18paper_128.pdf)[8](https://ieeexplore.ieee.org/document/8048644/):

- **Database Query Optimization** (Prompt #11) - Tests database integration performance[7](http://ksiresearchorg.ipage.com/seke/seke18paper/seke18paper_128.pdf)
    
- **API Rate Limiting & Caching Strategy** (Prompt #12) - Validates API integration under load[7](http://ksiresearchorg.ipage.com/seke/seke18paper/seke18paper_128.pdf)
    
- **Tremor Charts Performance Analysis** (Prompt #9) - Tests chart rendering integration[5](https://onlinelibrary.wiley.com/doi/10.1002/smr.2714)
    
- **Data Validation & Integrity Checks** (Prompt #20) - Ensures data consistency across system components[7](http://ksiresearchorg.ipage.com/seke/seke18paper/seke18paper_128.pdf)
    

## Phase 4: System & Data Migration Testing (Weeks 7-8)

## Data Migration Validation

Critical for ensuring 100% data migration accuracy:

- **Excel Data Migration Strategy** (Prompt #19) - Tests complete data migration process[7](http://ksiresearchorg.ipage.com/seke/seke18paper/seke18paper_128.pdf)
    
- **Data Validation & Integrity Checks** (Prompt #20) - Validates migrated data accuracy[7](http://ksiresearchorg.ipage.com/seke/seke18paper/seke18paper_128.pdf)
    

## System-Level Testing

- **Performance Testing Validation** (Prompt #15) - Tests complete system under 4 concurrent user load[5](https://onlinelibrary.wiley.com/doi/10.1002/smr.2714)[8](https://ieeexplore.ieee.org/document/8048644/)
    
- **Database Performance Optimization** (Prompt #24) - Validates system-wide database performance[7](http://ksiresearchorg.ipage.com/seke/seke18paper/seke18paper_128.pdf)
    

## Phase 5: User Experience & Workflow Testing (Weeks 9-10)

## UX Validation

- **Mobile-First Design Validation** (Prompt #21) - Tests complete iPad-first user experience[8](https://ieeexplore.ieee.org/document/8048644/)
    
- **Food Service Workflow Optimization** (Prompt #22) - Validates industry-specific workflows[29](https://ijssrr.com/journal/article/view/141)
    

## End-to-End Testing

Following the testing pyramid, E2E tests form the top layer with fewer but comprehensive tests[5](https://onlinelibrary.wiley.com/doi/10.1002/smr.2714)[8](https://ieeexplore.ieee.org/document/8048644/):

- **End-to-End Testing Strategy** (Prompt #14) - Tests complete user journeys and business workflows[5](https://onlinelibrary.wiley.com/doi/10.1002/smr.2714)[8](https://ieeexplore.ieee.org/document/8048644/)
    

## Phase 6: Deployment & Infrastructure Testing (Weeks 11-12)

## DevOps & Security

- **Azure Deployment Configuration Review** (Prompt #16) - Validates production deployment setup[8](https://ieeexplore.ieee.org/document/8048644/)
    
- **GitHub Actions CI/CD Pipeline Design** (Prompt #17) - Tests automated deployment processes[8](https://ieeexplore.ieee.org/document/8048644/)
    
- **Environment Configuration Security** (Prompt #18) - Validates production security configurations[8](https://ieeexplore.ieee.org/document/8048644/)
    

## System Architecture Assessment

- **System Architecture Scalability Review** (Prompt #23) - Tests scaling within Azure Basic tier limitations[8](https://ieeexplore.ieee.org/document/8048644/)[12](https://ieeexplore.ieee.org/document/9660999/)
    

## Phase 7: Comprehensive System Validation (Week 13)

## Final System Assessment

- **Comprehensive System Health Check** (Prompt #25) - Complete end-to-end system validation[8](https://ieeexplore.ieee.org/document/8048644/)[11](https://dl.acm.org/doi/10.1145/3439961.3439991)
    

This testing sequence ensures all success criteria are met:

- 100% data migration accuracy through early data validation testing[7](http://ksiresearchorg.ipage.com/seke/seke18paper/seke18paper_128.pdf)
    
- Sub-second search performance through progressive performance testing[5](https://onlinelibrary.wiley.com/doi/10.1002/smr.2714)[8](https://ieeexplore.ieee.org/document/8048644/)
    
- 50% faster data entry through UX workflow optimization[8](https://ieeexplore.ieee.org/document/8048644/)
    
- 80% faster report generation through performance optimization testing[5](https://onlinelibrary.wiley.com/doi/10.1002/smr.2714)
    
## Key Testing Principles Applied

The recommended order follows established software testing best practices[8](https://ieeexplore.ieee.org/document/8048644/)[11](https://dl.acm.org/doi/10.1145/3439961.3439991):

1. **Test Pyramid Structure** - More unit tests at the base, fewer integration tests in the middle, and focused E2E tests at the top[8](https://ieeexplore.ieee.org/document/8048644/)[12](https://ieeexplore.ieee.org/document/9660999/)
    
2. **Shift-Left Testing** - Critical security and architecture validation occurs early in the process[7](http://ksiresearchorg.ipage.com/seke/seke18paper/seke18paper_128.pdf)[8](https://ieeexplore.ieee.org/document/8048644/)
    
3. **Risk-Based Prioritization** - High-risk areas like security and data migration are tested first[8](https://ieeexplore.ieee.org/document/8048644/)[11](https://dl.acm.org/doi/10.1145/3439961.3439991)
    
4. **Progressive Complexity** - Testing moves from simple components to complex system interactions[7](http://ksiresearchorg.ipage.com/seke/seke18paper/seke18paper_128.pdf)[8](https://ieeexplore.ieee.org/document/8048644/)


#

## Project Overview Prompts

### x1. Project Architecture Analysis

```
You are an expert software architect analyzing a food service CRM system. Use sequential thinking to break down the following architecture:

- Next.js 15 + React 19 RC frontend
- Node.js backend with Prisma ORM
- Azure SQL Server database
- Azure App Service hosting

Using Context7, retrieve the latest Next.js 15 and React 19 RC documentation. Then use Exa Search to find similar food service CRM architectures and validate this tech stack against current best practices. Provide step-by-step reasoning for each architectural decision and cite official documentation for performance benchmarks.

Specific requirements to validate:
- Sub-second search performance
- <10 second report generation
- Support for 4 concurrent users on Azure Basic tier
- iPad-first design with 44px touch targets
```


### x2. Performance Requirements Validation

```
Act as a performance engineer using sequential thinking to analyze these requirements:

1. Search operations: <1 second response time
2. Report generation: <10 seconds
3. Page load: <3 seconds on 3G
4. 4 concurrent users on Azure Basic B1

Use Context7 to get current Azure App Service Basic B1 specifications. Then use Exa Search to find performance benchmarks for similar Next.js applications on Azure. Provide detailed reasoning for whether these requirements are achievable and cite specific performance studies or Azure documentation.
```


## Code Quality \& Security Prompts

### x3. TypeScript Code Review

```
You are a senior TypeScript developer conducting a comprehensive code review. Use sequential thinking to analyze this code systematically:

[Insert code here]

Steps to follow:
1. Analyze type safety and TypeScript best practices
2. Check for potential runtime errors
3. Validate React 19 RC compatibility
4. Review performance implications

Use Context7 to get the latest TypeScript and React 19 RC documentation. Cross-validate your findings using Exa Search for TypeScript code review best practices. Cite official TypeScript handbook and React documentation for each recommendation.
```

```
<Task> Conduct a deep code review of a TypeScript project. </Task> <Inputs> <codebase></codebase> </Inputs> <Instructions> You are a senior TypeScript developer reviewing a large codebase. Systematically analyze the code with the following priorities:

1. Use sequential thinking to review type safety and adherence to TypeScript best practices.
    
2. Identify any patterns that could lead to runtime errors in real-world usage.
    
3. Confirm compatibility with React 19 RC, noting deprecated APIs or unsupported patterns.
    
4. Evaluate performance optimizations, such as render bottlenecks, unnecessary re-renders, or large bundle sizes.
    

Use **Context7** to refer to the latest official documentation for TypeScript and React 19 RC. Use **Exa Search** to validate code review best practices.  
**For every recommendation, cite the source from the TypeScript Handbook or React documentation.** Present your findings inside `<review>` tags.  
</Instructions>
```


### x4. Security Vulnerability Assessment

```
As a cybersecurity expert, use sequential thinking to perform a comprehensive security audit:

1. Analyze authentication and authorization patterns
2. Review data validation and sanitization
3. Check for OWASP Top 10 vulnerabilities
4. Validate Azure SQL Server security configurations

Use Context7 to retrieve current OWASP guidelines and Azure SQL Server security best practices. Use Exa Search to find recent security vulnerabilities in similar Node.js/Prisma applications. Provide step-by-step reasoning for each security concern and cite official security documentation.

Focus on food service industry compliance requirements.
```


### x5. Prisma ORM Security \& Performance Review

```
You are a database security specialist. Use sequential thinking to analyze Prisma ORM implementation:

1. Review query patterns for SQL injection prevention
2. Analyze connection pooling configuration
3. Check for N+1 query problems
4. Validate data access patterns

Use Context7 to get current Prisma documentation and security best practices. Cross-validate using Exa Search for Prisma performance optimization techniques. Cite official Prisma documentation and provide reasoning for each optimization recommendation.
```


## Frontend Development Prompts

### x6. React 19 RC Compatibility Check

```
As a React expert, use sequential thinking to validate React 19 RC implementation:

1. Analyze new React 19 features being used
2. Check for deprecated patterns from earlier versions
3. Validate concurrent features implementation
4. Review component performance patterns

Use Context7 to retrieve React 19 RC documentation and migration guides. Use Exa Search to find React 19 RC compatibility issues and solutions. Provide detailed reasoning for each compatibility concern and cite official React documentation.
```


### x7. Touch Target Accessibility Validation

```
You are a UX accessibility expert. Use sequential thinking to validate 44px minimum touch targets:

1. Analyze current component touch target sizes
2. Check CSS implementation for touch-friendly interfaces
3. Validate iPad-specific design patterns
4. Review accessibility compliance (WCAG guidelines)

Use Context7 to get current WCAG accessibility guidelines. Use Exa Search for iPad interface design best practices. Provide step-by-step reasoning for accessibility improvements and cite official accessibility documentation.
```


### x8. shadcn/ui Component Integration Review

```
As a component library specialist, use sequential thinking to review shadcn/ui integration:

1. Analyze component customization approaches
2. Check for theme consistency
3. Validate accessibility features
4. Review performance impact

Use Context7 to get latest shadcn/ui documentation. Cross-validate using Exa Search for shadcn/ui best practices and common issues. Cite official shadcn/ui documentation for each recommendation.
```


### x9. Tremor Charts Performance Analysis

```
You are a data visualization expert. Use sequential thinking to analyze Tremor charts implementation:

1. Review chart rendering performance
2. Analyze data processing efficiency
3. Check for memory leaks in chart updates
4. Validate mobile responsiveness

Use Context7 to retrieve Tremor documentation and performance guidelines. Use Exa Search for chart performance optimization techniques. Provide detailed reasoning and cite official Tremor documentation.
```


## Backend Development Prompts

### x10. Node.js API Security Review

```
As a backend security specialist, use sequential thinking to audit Node.js API endpoints:

1. Analyze input validation patterns
2. Review authentication middleware
3. Check for rate limiting implementation
4. Validate error handling security

Use Context7 to get current Node.js security best practices. Use Exa Search for Node.js API security vulnerabilities and solutions. Provide step-by-step security assessment and cite official Node.js security documentation.
```


### x11. Database Query Optimization

```
You are a database performance expert. Use sequential thinking to optimize database queries:

1. Analyze current query patterns
2. Review indexing strategies
3. Check for slow query identification
4. Validate connection pooling setup

Use Context7 to get Azure SQL Server optimization documentation. Cross-validate using Exa Search for Prisma query optimization techniques. Cite official Azure and Prisma documentation for each optimization.
```


### x12. API Rate Limiting \& Caching Strategy

```
As a performance architect, use sequential thinking to design caching and rate limiting:

1. Analyze current API usage patterns
2. Design appropriate rate limiting rules
3. Implement caching strategies for reports
4. Validate cache invalidation patterns

Use Context7 to retrieve caching best practices documentation. Use Exa Search for rate limiting implementations in similar applications. Provide detailed reasoning and cite official documentation.
```


## Testing \& Quality Assurance Prompts

### x13. Jest Test Coverage Analysis

```
You are a testing specialist. Use sequential thinking to analyze test coverage:

1. Review current test coverage metrics
2. Identify untested critical paths
3. Analyze test quality and effectiveness
4. Validate testing patterns for React 19 RC

Use Context7 to get latest Jest and React Testing Library documentation. Use Exa Search for testing best practices in Next.js applications. Cite official testing documentation for each recommendation.
```


### x14. End-to-End Testing Strategy

```
As a QA engineer, use sequential thinking to design E2E testing:

1. Identify critical user journeys
2. Design test scenarios for food service workflows
3. Validate cross-browser compatibility
4. Check mobile responsiveness testing

Use Context7 to retrieve E2E testing framework documentation. Use Exa Search for food service application testing strategies. Provide step-by-step testing plan with cited documentation.
```


### x15. Performance Testing Validation

```
You are a performance testing expert. Use sequential thinking to validate performance requirements:

1. Design load testing scenarios for 4 concurrent users
2. Test search performance under load
3. Validate report generation times
4. Check memory usage patterns

Use Context7 to get performance testing best practices. Use Exa Search for Node.js application performance testing tools. Cite official performance testing documentation.
```


## Deployment & DevOps Prompts

### x16. Azure Deployment Configuration Review

```
As a DevOps specialist, use sequential thinking to review Azure deployment:

1. Analyze Azure App Service Basic B1 configuration
2. Review scaling limitations and options
3. Validate monitoring and logging setup
4. Check backup and disaster recovery plans

Use Context7 to get current Azure App Service documentation. Use Exa Search for Next.js deployment best practices on Azure. Provide detailed configuration review with cited Azure documentation.
```


### 17. GitHub Actions CI/CD Pipeline Design

```
You are a CI/CD expert. Use sequential thinking to design GitHub Actions workflow:

1. Design build and test pipeline stages
2. Implement deployment automation
3. Configure environment-specific deployments
4. Validate security scanning integration

Use Context7 to retrieve GitHub Actions documentation. Use Exa Search for Next.js CI/CD pipeline examples. Cite official GitHub Actions documentation for each pipeline component.
```


### 18. Environment Configuration Security

```
As a security engineer, use sequential thinking to audit environment configurations:

1. Review secrets management practices
2. Analyze environment variable security
3. Check for hardcoded credentials
4. Validate Azure Key Vault integration

Use Context7 to get Azure Key Vault documentation. Use Exa Search for Node.js secrets management best practices. Provide security assessment with cited documentation.
```


## Data Migration \& Validation Prompts

### x19. Excel Data Migration Strategy

```
You are a data migration specialist. Use sequential thinking to plan Excel migration:

1. Analyze current Excel data structures
2. Design data transformation pipelines
3. Validate data integrity checks
4. Plan rollback strategies

Use Context7 to get data migration best practices documentation. Use Exa Search for Excel to database migration tools and techniques. Cite official migration documentation and provide step-by-step plan.
```


### x20. Data Validation \& Integrity Checks

```
As a database specialist, use sequential thinking to implement data validation:

1. Design comprehensive data validation rules
2. Implement data integrity constraints
3. Create automated validation testing
4. Plan data quality monitoring

Use Context7 to retrieve database validation best practices. Use Exa Search for data integrity patterns in food service applications. Cite official database documentation.
```


## User Experience \& Interface Prompts

### x21. Mobile-First Design Validation

```
You are a mobile UX expert. Use sequential thinking to validate mobile-first design:

1. Analyze touch interface patterns
2. Review responsive design implementation
3. Validate gesture handling
4. Check offline functionality requirements

Use Context7 to get mobile design guidelines. Use Exa Search for iPad-specific interface design patterns. Provide UX assessment with cited design documentation.
```


### 22. xFood Service Workflow Optimization

```
As a food broker industry expert, use sequential thinking to optimize user workflows:

1. Analyze typical food service operations
2. Design efficient data entry patterns
3. Optimize reporting workflows
4. Validate industry-specific requirements

Use Context7 to retrieve food service software documentation. Use Exa Search for food service CRM best practices. Cite industry-specific documentation and standards.
```


## Architecture \& Scalability Prompts

### 23. System Architecture Scalability Review

```
You are a systems architect. Use sequential thinking to assess scalability:

1. Analyze current architecture limitations
2. Design scaling strategies within Azure Basic tier
3. Identify potential bottlenecks
4. Plan future scaling requirements

Use Context7 to get Azure scaling documentation. Use Exa Search for Next.js application scaling patterns. Provide architectural assessment with cited documentation.
```


### 24. Database Performance Optimization

```
As a database architect, use sequential thinking to optimize database performance:

1. Analyze query performance patterns
2. Design optimal indexing strategies
3. Review connection pooling configuration
4. Validate backup and recovery procedures

Use Context7 to retrieve Azure SQL Server optimization guides. Use Exa Search for Prisma performance optimization techniques. Cite official database documentation.
```


### 25. Comprehensive System Health Check

```
You are a senior system administrator. Use sequential thinking to perform a complete system health assessment:

1. Review all system components and integrations
2. Analyze monitoring and alerting setup
3. Validate security configurations across all layers
4. Check compliance with food service industry requirements
5. Assess overall system reliability and maintainability

Use Context7 to get comprehensive system monitoring documentation. Use Exa Search for full-stack application health check procedures. Provide complete system assessment with step-by-step recommendations and cite relevant documentation for each finding.

Focus on ensuring the system meets all success criteria:
- 100% data migration accuracy
- 50% faster data entry
- 80% faster report generation
- Sub-second search performance
- 100% user adoption potential
- iPad-first design compliance
```


## Implementation Guidelines

Each prompt is designed to leverage Claude's advanced reasoning capabilities through Sequential Thinking and Context7 MCP tools[^1][^2]. The prompts explicitly request validation through Exa Search for cross-referencing official documentation and real-world examples[^21][^22]. This approach ensures comprehensive code review and architectural validation while maintaining adherence to current best practices and official specifications[^8][^23].

The prompts are structured to address every critical aspect of your food service CRM development project, from initial architecture validation through deployment and ongoing maintenance[^4][^28]. Each prompt includes specific requirements for citing official documentation and providing step-by-step reasoning to ensure thorough analysis and actionable recommendations[^11][^26].

<div style="text-align: center">⁂</div>

[^1]: https://www.reddit.com/r/ClaudeAI/comments/1exy6re/the_people_who_are_having_amazing_results_with/

[^2]: https://www.anthropic.com/engineering/claude-code-best-practices

[^3]: https://harper.blog/2025/05/08/basic-claude-code/

[^4]: https://www.reddit.com/r/ChatGPTCoding/comments/1f51y8s/a_collection_of_prompts_for_generating_high/

[^5]: https://arxiv.org/html/2407.07064v2

[^6]: https://github.com/avijeett007/Develop-With-AI-Beginners-Guide

[^7]: https://promptleo.com/prompt/claude/developer

[^8]: http://teamai.com/prompts/conducting_a_comprehensive_code_review/

[^9]: https://www.reddit.com/r/PromptEngineering/comments/1l7y10l/code_review_prompts/

[^10]: https://dev.to/techiesdiary/chatgpt-prompts-for-code-review-and-debugging-48j

[^11]: https://addyo.substack.com/p/the-prompt-engineering-playbook-for

[^12]: https://github.com/getFrontend/next-app-ai-prompts

[^13]: https://www.linkedin.com/posts/emollick_automated-testing-of-prompts-in-claude-is-activity-7216549116254810115-adww

[^14]: https://blog.logrocket.com/dynamic-type-validation-in-typescript/

[^15]: https://www.reddit.com/r/ChatGPT/comments/1i1xuoj/chatgpt_prompt_of_the_day_azure_cloud_solutions/

[^16]: https://www.reddit.com/r/ClaudeAI/comments/1gds696/the_only_prompt_you_need/

[^17]: https://github.com/modelcontextprotocol/servers/tree/main/src/sequentialthinking

[^18]: https://www.pulsemcp.com/servers/anthropic-sequential-thinking

[^19]: https://www.alooba.com/skills/concepts/prompt-engineering/chain-of-thought-prompting/

[^20]: https://www.youtube.com/watch?v=R-5ucM-5P5o

[^21]: https://upstash.com/blog/context7-mcp

[^22]: https://python.langchain.com/api_reference/exa/tools/langchain_exa.tools.ExaSearchResults.html

[^23]: https://repomix.com/guide/prompt-examples

[^24]: https://smarttales.app/2024/05/10/logic-sequencing-developing-sequential-thinking-in-children/

[^25]: https://huggingface.co/blog/lynn-mikami/context7-mcp-server

[^26]: https://latitude-blog.ghost.io/blog/top-open-source-tools-for-real-time-prompt-validation/

[^27]: https://webdeveloper.com/community/241610-prompt-and-validate-entry/

[^28]: https://neurealm.com/whitepaper/prompt-engineering-for-software-architecture/

[^29]: https://www.perfmatrix.com/prompt-engineering-for-performance-testing/

[^30]: https://auditboard.com/blog/what-is-security-audit

[^31]: https://www.linkedin.com/posts/matt-hammel-84a38054_pumped-to-announce-the-latest-airops-copilot-activity-7328056928805224451-QUF7

[^32]: https://earlynode.com/prompt-engineering/chatgpt-prompts-for-system-architects

[^33]: https://logicballs.com/ai-prompt/prompts/database-query-optimizer

[^34]: https://docs.aws.amazon.com/bedrock/latest/userguide/prompt-management-optimize.html

[^35]: https://blog.langchain.dev/exploring-prompt-optimization/

[^36]: https://docsbot.ai/prompts/technical/api-testing-prompt

[^37]: https://stackoverflow.com/questions/78633757/how-to-add-interactive-prompts-in-gitlab-ci-cd-pipelines

[^38]: https://www.linkedin.com/pulse/ultimate-guide-ai-prompting-full-stack-development-2024-2025-patil-9n4zf

[^39]: https://arize.com/blog/prompt-optimization-few-shot-prompting/

[^40]: https://apidog.com/blog/validation-testing/

[^41]: https://github.com/langgptai/awesome-claude-prompts

[^42]: https://promptadvance.club/claude-prompts/learning/coding

[^43]: https://community.vercel.com/t/code-review-for-first-next-js-project/847

[^44]: https://docsbot.ai/prompts/tags?tag=Code+Review

[^45]: https://www.reddit.com/r/mcp/comments/1jwjagw/how_does_the_sequential_thinking_mcp_work/

[^46]: https://www.learnprompt.org/chat-gpt-prompts-for-coding/

[^47]: https://www.datacamp.com/blog/prompt-optimization-techniques

[^48]: https://www.reddit.com/r/PromptEngineering/comments/1fhe3g4/automated_prompt_optimisation/

