# Model Context Protocol (MCP) Server Integration Guidelines

## Core Configuration Verification
1. Memory Server
```json
{
  "mcpServers": {
    "memory": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-memory",
        "--memory-check-interval=60",
        "--max-heap-size=4096",
        "--gc-interval=300"
      ]
    }
  }
}
```

## Project Integration Instructions

### 1. Knowledge Management Protocol
#### Memory Server Implementation
- Initialize project-specific entity types at start
- Create hierarchical knowledge structure
- Maintain relationship mappings
- Implement regular garbage collection cycles

```javascript
// Example Entity Structure
{
  "entities": [
    {
      "name": "PROJECT_NAME",
      "entityType": "project",
      "observations": [
        "Project initialization date: DATE",
        "Primary objectives: OBJECTIVES"
      ]
    }
  ]
}
```

### 2. File System Integration
#### Filesystem Server Configuration
- Define project directory structure
- Set access permissions
- Establish backup protocols

```bash
/project_root
├── /src
├── /docs
├── /tests
├── /resources
└── /backups
```

### 3. Research & Analysis Protocol
#### Brave Search Integration
1. Initial Research Phase
   - Broad domain exploration
   - Technology stack verification
   - Market analysis queries
   - Competitor research

2. Development Phase
   - Technical documentation search
   - Problem-solving queries
   - Implementation references
   - Best practices validation

3. Optimization Phase
   - Performance benchmarking
   - Security compliance verification
   - Industry standard alignment

### 4. Version Control Integration
#### GitHub Server Utilization
1. Repository Management
   ```json
   {
     "github": {
       "repository": {
         "structure": [
           "main branch: production code",
           "develop: integration branch",
           "feature/*: feature development",
           "hotfix/*: critical fixes"
         ]
       }
     }
   }
   ```

2. Automation Integration
   - Workflow templates
   - CI/CD pipeline configuration
   - Issue tracking integration
   - Documentation automation

### 5. Problem-Solving Framework
#### Sequential Thinking Server Implementation
1. Project Planning Phase
   ```json
   {
     "thoughtProcess": {
       "maxThoughts": 25,
       "branchLimit": 3,
       "detailLevel": "high",
       "revisionDepth": 5
     }
   }
   ```

2. Implementation Structure
   - Break down complex features
   - Evaluate alternative approaches
   - Document decision trees
   - Track implementation progress

## Standard Operating Procedures

### 1. Project Initialization
1. Configure Memory Server
   - Define entity types
   - Set up relationship schemas
   - Initialize knowledge base

2. Setup Filesystem Structure
   - Create directory hierarchy
   - Set access controls
   - Configure backup system

3. Configure Source Control
   - Initialize repository
   - Set up branch protection
   - Configure workflow automation

### 2. Development Workflow
1. Research Phase
   ```markdown
   - Utilize Brave Search for technical documentation
   - Create knowledge entities for key findings
   - Document architectural decisions
   ```

2. Implementation Phase
   ```markdown
   - Use Sequential Thinking for complex problems
   - Maintain documentation in Filesystem
   - Track progress in GitHub
   ```

3. Review Phase
   ```markdown
   - Verify against knowledge base
   - Update documentation
   - Perform security checks
   ```

### 3. Maintenance Protocol
1. Regular Health Checks
   ```markdown
   - Memory Server garbage collection
   - Filesystem cleanup
   - Knowledge base optimization
   ```

2. Performance Monitoring
   ```markdown
   - Track API usage limits
   - Monitor response times
   - Optimize resource usage
   ```

## Error Handling & Recovery

### 1. Server-Specific Protocols
1. Memory Server
   ```markdown
   - Regular state backups
   - Corruption recovery procedure
   - Data integrity verification
   ```

2. Filesystem Server
   ```markdown
   - File versioning
   - Backup rotation
   - Access control verification
   ```

3. GitHub Server
   ```markdown
   - Local backup procedures
   - Token rotation schedule
   - Rate limit management
   ```

### 2. Integration Points
1. Cross-Server Communication
   ```markdown
   - Error propagation handling
   - State synchronization
   - Recovery coordination
   ```

2. Data Consistency
   ```markdown
   - Validation procedures
   - Integrity checks
   - Reconciliation protocols
   ```

## Performance Optimization

### 1. Resource Management
1. Memory Allocation
   ```markdown
   - Heap size optimization
   - Garbage collection timing
   - Cache management
   ```

2. API Usage
   ```markdown
   - Rate limit monitoring
   - Request optimization
   - Response caching
   ```

### 2. Workflow Optimization
1. Task Prioritization
   ```markdown
   - Sequential processing
   - Parallel execution
   - Resource allocation
   ```

2. System Integration
   ```markdown
   - Inter-server communication
   - Data flow optimization
   - Response time management
   ```