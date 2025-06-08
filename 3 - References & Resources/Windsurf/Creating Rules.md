# 5 Windsurf Rules for Kitchen Pantry CRM Development

## 🏗️ **Rule 1: Architecture-First Development**

_Reference File: `@architecture.md`_

### **When to Use:**

- Starting any new feature implementation
- Troubleshooting performance issues
- Planning component integrations
- Azure infrastructure questions

### **Rule Pattern:**

```
**System Context:** @architecture.md
**Request:** [Your specific development ask]
**Focus:** [Azure constraints/NextCRM integration/Performance optimization]
**Output:** [Code/Configuration/Optimization strategy]
```

### **Example Usage:**

```
**System Context:** @architecture.md
**Request:** Implement organization search with auto-complete
**Focus:** Azure SQL Basic tier limitations (5 DTU) and sub-second response target
**Output:** TypeScript component with optimized Prisma queries
```

### **Benefits:**

- AI understands your complete tech stack instantly
- Azure budget constraints ($18/month) always considered
- NextCRM foundation integration patterns followed
- Performance targets (sub-second search) never overlooked

---

## 📊 **Rule 2: Database-Driven Feature Development**

_Reference File: `@erd.md`_

### **When to Use:**

- Building CRUD operations
- Creating new API endpoints
- Planning data relationships
- Implementing search functionality

### **Rule Pattern:**

```
**Schema Context:** @erd.md
**Entity Focus:** [Organization/Contact/Interaction/Product/Opportunity]
**Request:** [Specific database operation or API endpoint]
**Validation:** Include Zod schemas and error handling
```

### **Example Usage:**

```
**Schema Context:** @erd.md
**Entity Focus:** Organization with Settings relationships
**Request:** Create organization search API with priority/segment filtering
**Validation:** Include Zod schemas and error handling
```

### **Benefits:**

- AI knows all your foreign key relationships
- Settings-driven configuration automatically considered
- Food service industry fields (priority A-D, segments, distributors) included
- Audit trail and user tracking built into suggestions

---

## ⚡ **Rule 3: Performance-Critical Implementation**

_Reference File: `@implementation_guide.md`_

### **When to Use:**

- Optimizing slow operations
- Meeting specific performance targets
- Azure DTU optimization
- Mobile/touch interface development

### **Rule Pattern:**

```
**Performance Guide:** @implementation_guide.md
**Target:** [30-second entry/Sub-second search/<10s reports]
**Constraint:** [Azure Basic tier/Mobile touch/4 concurrent users]
**Request:** [Specific optimization or implementation]
```

### **Example Usage:**

```
**Performance Guide:** @implementation_guide.md
**Target:** 30-second interaction entry from start to save
**Constraint:** Windows touch laptop with 44px minimum touch targets
**Request:** Design interaction entry form with auto-complete and quick-select
```

### **Benefits:**

- All performance targets clearly defined upfront
- Touch interface requirements (44px targets) automatically included
- Azure SQL DTU optimization strategies applied
- Mobile-first design principles followed

---

## 📅 **Rule 4: Timeline-Aware Development Planning**

_Reference File: `@roadmap.md`_

### **When to Use:**

- Planning development sprints
- Prioritizing features
- Understanding dependencies
- Estimating implementation effort

### **Rule Pattern:**

```
**Project Timeline:** @roadmap.md
**Current Phase:** [Phase 2: Core CRM/Phase 3: Enhanced Features]
**Dependencies:** [What must be completed first]
**Request:** [Feature planning or implementation guidance]
```

### **Example Usage:**

```
**Project Timeline:** @roadmap.md
**Current Phase:** Phase 2: Core CRM (Weeks 3-5)
**Dependencies:** Organization Management must be complete before Contact Management
**Request:** Plan the Contact Management implementation approach
```

### **Benefits:**

- AI understands where you are in the 16-week timeline
- Critical path dependencies respected
- Phase-appropriate feature scope maintained
- Resource allocation aligned with current priorities

---

## 🎯 **Rule 5: User-Centered Feature Development**

_Reference File: `@user_flows.md`_

### **When to Use:**

- Designing user interfaces
- Implementing user interactions
- Optimizing user experience
- Building mobile-responsive features

### **Rule Pattern:**

```
**User Experience:** @user_flows.md
**Flow Focus:** [Interaction Entry/Organization Management/Search/Pipeline]
**User Type:** [Field Sales Rep/Office Admin/Manager]
**Request:** [UI component or user experience implementation]
```

### **Example Usage:**

```
**User Experience:** @user_flows.md
**Flow Focus:** 30-second interaction entry flow
**User Type:** Field Sales Rep on iPad Safari
**Request:** Build the interaction type selection component with touch optimization
```

### **Benefits:**

- AI understands the complete user journey context
- 30-second entry target drives all UX decisions
- Multi-device compatibility (Windows touch + iPad) considered
- Food service industry workflow patterns followed

---

## 🔄 **Rule Combination Strategies**

### **Complex Feature Development:**

```
**Architecture:** @architecture.md
**Schema:** @erd.md
**Performance:** @implementation_guide.md
**Request:** Build complete organization management CRUD system
```

### **Sprint Planning:**

```
**Timeline:** @roadmap.md
**User Flows:** @user_flows.md
**Request:** Plan Week 1 development tasks for Phase 2
```

### **Performance Optimization:**

```
**Architecture:** @architecture.md
**Performance Guide:** @implementation_guide.md
**Issue:** Search queries taking 3+ seconds on Azure SQL Basic tier
```

---

## 📋 **Quick Reference Guide**

|Scenario|Primary Rule|Secondary Context|
|---|---|---|
|**New Feature**|Rule 1 (Architecture)|Rule 2 (ERD)|
|**Database Work**|Rule 2 (ERD)|Rule 3 (Performance)|
|**Performance Issue**|Rule 3 (Performance)|Rule 1 (Architecture)|
|**Sprint Planning**|Rule 4 (Timeline)|Rule 5 (User Flows)|
|**UI Development**|Rule 5 (User Flows)|Rule 3 (Performance)|
|**API Development**|Rule 2 (ERD)|Rule 1 (Architecture)|
|**Mobile Optimization**|Rule 5 (User Flows)|Rule 3 (Performance)|
|**Azure Configuration**|Rule 1 (Architecture)|Rule 3 (Performance)|

---

## 💡 **Pro Tips for Maximum Effectiveness**

### **Stack Multiple Rules for Complex Tasks:**

```
**Full Context Approach:**
@architecture.md @erd.md @implementation_guide.md
**Request:** Implement complete interaction tracking system
**Priority:** 30-second entry target with offline sync
```

### **Version Your Files:**

- Update file versions when major changes occur
- Reference specific versions in conversations
- Keep rule patterns consistent across versions

### **Conversation Efficiency:**

- Start with the most relevant rule for your task
- Add secondary context only when needed
- Use consistent formatting for AI recognition

### **Performance Monitoring:**

- Track which rule combinations work best
- Refine file contents based on AI response quality
- Update rules as project evolves

---

## 🎯 **Success Metrics**

These rules should help you achieve:

- **90% reduction** in context-setting time with Windsurf Cascade
- **Consistent consideration** of Azure constraints and performance targets
- **Faster development cycles** through clear architectural guidance
- **Better code quality** through comprehensive context understanding
- **Aligned implementation** with project timeline and user needs

Each rule transforms your Windsurf conversations from lengthy explanations into focused, efficient development sessions while ensuring the AI always understands your unique project constraints and requirements.