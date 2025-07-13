## Overview

The **@itseasy21/mcp-knowledge-graph** is a persistent memory server that enables Claude Code and other MCP-compatible AI tools to remember information across conversations using a local knowledge graph. This guide focuses on using it effectively in coding projects to enhance your development workflow.
### How to Install for Project:

```bash
claude mcp add memory -s project -- npx -y @itseasy21/mcp-knowledge-graph --memory-path /home/krwhynot/Projects/KitchenPantry/.knowledge
```

## Core Components

### 1. **Entities**

Entities are the primary nodes in your knowledge graph, representing key concepts in your codebase:

- **Unique name**: Identifier (e.g., "UserAuthSystem", "PaymentAPI")
- **Entity type**: Classification (e.g., "component", "module", "bug", "feature")
- **Observations**: List of facts about the entity
- **Version tracking**: Historical context of changes

**Example Entity Structure:**
```json
{
  "name": "UserAuthSystem",
  "entityType": "component",
  "observations": [
    "Uses JWT tokens for authentication",
    "Implements OAuth2 flow",
    "Located in src/auth/ directory"
  ]
}
```

### 2. **Relations**
Relations define directed connections between entities, always stored in active voice:

- **Source and target entities**: Connected components
- **Relationship type**: Nature of connection (e.g., "depends_on", "implements", "fixes")
- **Version information**: Tracks relationship evolution[^2]

**Example Relation Structure:**
```json
{
  "from": "UserAuthSystem",
  "to": "DatabaseLayer",
  "relationType": "depends_on"
}
```
### 3. **Observations**
Discrete pieces of information about entities:
- **Atomic facts**: One concept per observation
- **Independently managed**: Can be added/removed separately
- **String format**: Stored as text descriptions

**Example Observations:**
```json
{
  "entityName": "UserAuthSystem",
  "observations": [
    "Refactored on 2025-01-15",
    "Performance improved by 40%",
    "Added rate limiting feature"
  ]
}
```
## Available Tools
The knowledge graph server provides nine core tools:

| Tool | Purpose | Usage |
| :-- | :-- | :-- |
| `create_entities` | Create multiple new entities | Add new components, features, or concepts |
| `create_relations` | Create relationships between entities | Link components, dependencies, or workflows |
| `add_observations` | Add facts to existing entities | Update component status, add implementation notes |
| `delete_entities` | Remove entities and their relations | Clean up deprecated components |
| `delete_observations` | Remove specific observations | Update outdated information |
| `delete_relations` | Remove specific relationships | Update changed dependencies |
| `read_graph` | Retrieve entire knowledge graph | Review complete project context |
| `search_nodes` | Search for specific entities | Find components by name or type |
| `open_nodes` | Open specific nodes by name | Access detailed entity information |
## Examples When to Use It

### 1. **Architecture Documentation**

**Scenario**: Track system architecture decisions and component relationships
```
Ask Claude: "Remember that we decided to use microservices architecture for the user management system. The AuthService depends on the UserDatabase and implements JWT authentication."

Claude uses:
- create_entities: "AuthService", "UserDatabase", "JWTAuth"
- create_relations: AuthService depends_on UserDatabase
- add_observations: "Uses microservices pattern", "JWT implementation completed"
```


### 2. **Bug Tracking and Resolution**

**Scenario**: Document bugs, their fixes, and architectural decisions

```
Ask Claude: "We found a performance issue in the payment processing module. It was caused by N+1 database queries. We fixed it by implementing query batching."

Claude uses:
- create_entities: "PaymentPerformanceBug", "QueryBatchingFix"
- create_relations: QueryBatchingFix fixes PaymentPerformanceBug
- add_observations: "N+1 query problem identified", "Batching reduced queries by 80%"
```
### 3. **Feature Development Context**
**Scenario**: Maintain context across development sessions

```
Session 1: "We're building a notification system. It should support email, SMS, and push notifications."

Session 2 (next day): "Continue working on the notification system"
Claude recalls: Previous context about notification system requirements and implementation approach
```
### 4. **Code Review and Standards**
**Scenario**: Remember coding standards and architectural guidelines

```
Ask Claude: "Remember that we decided to use TypeScript strict mode for all new components and follow the Domain-Driven Design patterns."

Claude uses:
- create_entities: "TypeScriptStandards", "DDDPatterns"
- add_observations: "Strict mode required", "Domain models in /domain directory"
```
## How to Make Claude Code Use It Regularly

### 1. **Establish a Documentation Workflow**
**Start each coding session with context queries:**
```
"What do you remember about the current project architecture?"
"What were the key decisions we made about the authentication system?"
"What bugs did we fix in the last session?"
```
### 2. **Use Structured Prompts*
**For new features:**
```
"I'm implementing a new [FEATURE_NAME]. Remember that this feature:
- Depends on [COMPONENT_1] and [COMPONENT_2]
- Uses [TECHNOLOGY/PATTERN]
- Should follow [ARCHITECTURAL_PRINCIPLE]
- Solves [BUSINESS_PROBLEM]"
```

**For bug fixes:**
```
"I found a bug in [COMPONENT_NAME]. The issue is [PROBLEM_DESCRIPTION]. 
Remember this fix: [SOLUTION_DESCRIPTION]"
```
### 3. **Create Knowledge Graph Entities for Key Concepts**

**Project Components:**
- "Frontend_React_App"
- "Backend_API_Server"
- "Database_PostgreSQL"
- "Authentication_System"

**Development Standards:**
- "Coding_Standards"
- "Testing_Guidelines"
- "Deployment_Process"
- "Performance_Requirements"


### 4. **Regular Knowledge Graph Reviews**
**Weekly or sprint reviews:**
```
"Show me the current knowledge graph structure"
"What are all the components we've worked on this week?"
"What relationships exist between our main system components?"
```


### 5. **Context-Aware Development Sessions**
**Before starting work:**
```
"Before we start coding, remind me:
- What components are we working on?
- What are the current architectural constraints?
- What decisions did we make in previous sessions?"
```

## Best Practices for Coding Projects

### 1. **Consistent Entity Naming*

- Use **PascalCase** for component names: `UserAuthSystem`
- Use **snake_case** for relationships: `depends_on`, `implements`
- Include entity type in name when helpful: `PaymentAPI_Service`
### 2. **Meaningful Observations**
- Be specific: "Uses JWT with 1-hour expiration" vs. "Uses JWT"
- Include dates: "Refactored on 2025-01-15"
- Add performance metrics: "Reduced response time by 200ms"
### 3. **Relationship Patterns**
**Common relationship types for coding:**

- `depends_on`: Component dependencies
- `implements`: Interface implementations
- `extends`: Class inheritance
- `uses`: Service utilization
- `fixes`: Bug resolution
- `replaces`: Component replacement
### 4. **Session Management**

- **Start sessions** with context queries
- **End sessions** with summary updates
- **Document decisions** as they're made
- **Update observations** when implementations change
### 5. **Project Structure Mapping**

Create entities that mirror your project structure:
```
"Frontend_Components" -> "UserLogin_Component"
"Backend_Services" -> "Authentication_Service"
"Database_Models" -> "User_Model"
"API_Endpoints" -> "Login_Endpoint"
```
## Integration with Development Workflow

### 1. **Daily Standups**
Use the knowledge graph to recall:

- What was completed yesterday
- Current blockers and dependencies
- Today's priorities

### 2. **Code Reviews**
Reference stored architectural decisions:

- Why certain patterns were chosen
- What alternatives were considered
- Performance implications documented
### 3. **Sprint Planning**
Leverage relationship mapping:

- Identify component dependencies
- Understand impact of changes
- Plan feature rollouts based on prerequisites


### 4. **Technical Debt Management**
Track technical debt as entities:

- Document debt rationale
- Link to affected components
- Plan remediation strategies

The **@itseasy21/mcp-knowledge-graph** transforms Claude Code from a stateless assistant into a context-aware development partner that remembers your project's evolution, architectural decisions, and implementation details across all coding sessions[^4]. This persistent memory enables more efficient development workflows and better architectural consistency over time.