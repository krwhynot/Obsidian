
Kanban-style CRM board showing sales opportunities organized by stages. This is for Account Managers who are presenting products on behalf of Principals. User is wanting to know how many Opportunities are in each stage and the last time an interaction was done for that Opportunity for that stage. Revenue or volume being sold should not be concerned or mentioned.

Stages names are prioritized:
- **Clarity of intent**    
- **Action-oriented labeling**    
- **Stage-to-stage logical flow**    
- **CRM usability (quick glance understanding)**

| #   | Original               | New Name                 | Reason / Notes                                                                       |
| --- | ---------------------- | ------------------------ | ------------------------------------------------------------------------------------ |
| 1   | Lead-Discovery         | **New Lead**             | Simplifies and aligns with CRM convention (easy scanning/filtering)                  |
| 2   | Contacted: Email/Phone | **Initial Outreach**     | More intuitive wording for first interaction                                         |
| 3   | Sampled-Visited Invite | **Sample/Visit Offered** | Clarifies that the offer has been made, regardless of acceptance                     |
| 4   | Follow-Up              | **Awaiting Response**    | Makes the status clear to the team (follow-up → passive name)                        |
| 5   | Feedback-Received      | **Feedback Logged**      | “Logged” emphasizes CRM action and record-keeping                                    |
| 6   | Demo-Cookup            | **Demo Scheduled**       | “Cookup” is niche—“Demo Scheduled” is clearer and still accurate                     |
| 7   | SOLD                   | **Closed - Won**         | Standard CRM term that still means SOLD; use color or icon to differentiate visually |

OLD STAGES:
1. Lead-Discovery
2. Contacted: Email/Phone
3. Sampled-Visited Invite
4. Follow-Up
5. Feedback-Received
6. Demo-Cookup
7. SOLD

NEW STAGES:
1. New Lead
2. Initial Outreach
3. Sample/Visit Offered
4. Awaiting Response
5. Feedback logged
6. Demo Scheduled
7. Closed - Won

|Stage|Renamed Stage|Real-World Example|
|---|---|---|
|1️⃣|**New Lead**|A distributor sends over a list of independent restaurants. You spot “Tony’s Grill” as a good fit for a new BBQ sauce line you represent. You add them as a lead to your CRM.|
|2️⃣|**Initial Outreach**|You call Tony’s Grill and speak to the manager about the sauce. You follow up with a product sheet via email. They thank you but don’t commit yet.|
|3️⃣|**Sample/Visit Offered**|You offer to drop off BBQ sauce samples next week. You note the proposed visit date and flag the CRM record to remind yourself.|
|4️⃣|**Awaiting Response**|It’s been a week after the sample drop-off. You haven’t heard back. You send a friendly “just checking in” email to ask for feedback.|
|5️⃣|**Feedback Logged**|The manager replies: “The sauce was great, but too spicy for our regulars.” You log this feedback in your notes. They’re still open to alternatives.|
|6️⃣|**Demo Scheduled**|You set up a time next week to bring a chef and run a mini demo of three alternative sauces tailored to their clientele. It’s on the calendar.|
|7️⃣|**Closed - Won**|Tony’s Grill decides to bring in your mild BBQ sauce across all three of their locations. You update the CRM as “Closed - Won.” 🎉|


## Kanban Style Pipeline 
Purpose: Kanban-style CRM board showing sales opportunities organized by stages. This is for Account Managers who are presenting products on behalf of Principals. User is wanting to know how many Opportunities are in each stage and the last time an interaction was done for that Opportunity for that stage. Revenue or volume being sold should not be concerned or mentioned. I will need two versions of this pipeline:
1. For the Opportunity Page, which will be a fully detailed version that will be the the main focus if not the only focus on this Page. 
2. To replace 4 KPI Cards/Widgets on the Dashboard Page
### Kanban Card Components Design:

**Essential Information Display:**
Each opportunity card should contain **7 key fields maximum** to avoid cognitive overload (**Miller's Law**)

**Opportunity card Info:**
1. Organization Name *(prominently displayed)*
2. Principal Name 
3. Account Manager
4. Priority Level
5. Days since last Interaction for this Opportunity
6. Link to notes *(if there are any Opportunity notes)*

##### Card Views
**Collapsed View**: Organization name, Principal, Account Manager, priority indicator,  Days since last Interaction for this Opportunity

**Expanded View**: Full contact details, Interaction history Timeline List, any notes
##### Visual Design Elements
Cards must implement **Aesthetic-Usability Effect** through:
- **Consistent color palette** with professional appearance    
- **High-quality icons** for actions and status indicators    
- **Generous whitespace** around elements for clarity    
- **Clear typography hierarchy** with readable fonts

##### Filter Option
Be able to filter cards by one or any combo of the following:
- Principal Name
- Account Manager
- Priority Level
- Days since last Interaction(Options: 7days, 14 days, 30 days, 60 days, 90 days)
###  UI Flow and Interaction Design
#### Drag-and-Drop Functionality
The system should optimize for **Fitts's Law** by ensuring:
- **Minimum 44px touch targets** for all interactive elements    
- **Large drop zones** between columns for easy card movement    
- **Visual feedback** during drag operations (highlight drop zones)    
- **Smooth animations** that provide clear system status
#### Work-in-Progress (WIP) Limits
Implement **WIP limits** to prevent bottlenecks and maintain focus:
- **Qualified**: 8-10 opportunities maximum    
- **Proposal**: 5-7 opportunities maximum    
- **Negotiation**: 3-5 opportunities maximum
When limits are exceeded, the system should provide visual warnings and prevent new additions until space is available.
#### Swimlanes for Organization
Use horizontal **swimlanes** to categorize opportunities by:
- **Sales representative** (individual performance tracking)    
- **Lead source** (channel attribution)    
- **Deal size** (strategic vs. transactional)    
- **Industry vertical** (sector-specific tracking)
### Psychological Optimization Features
#### Tesler's Law (Complexity Management)
**Automate routine tasks** to reduce user cognitive load:
- **Smart field completion** using existing contact data    
- **Automatic stage progression** based on predefined triggers    
- **Intelligent deal scoring** using historical patterns    
- **Contextual next action suggestions** based on stage and deal characteristics
#### Forgiveness Principle
**Error prevention and recovery** mechanisms:
- **Undo functionality** for drag-and-drop actions (30-second window)    
- **Confirmation dialogs** for destructive actions (archiving deals)    
- **Auto-save** for all field changes    
- **Version history** for important deal modifications
#### Social Proof and Gamification
Implement **social proof** elements:
- **Leaderboards** showing top performers    
- **Recent activity feeds** displaying team successes    
- **Achievement badges** for milestone completions    
- **Progress indicators** showing individual and team goals
### Final Recommended Design Structure
#### Board Header
- **Pipeline selector** dropdown (multiple pipelines support)    
- **Filter controls** (owner, date range, deal value)    
- **Search functionality** with autocomplete    
- **Add New Opportunity** button (prominent, high-contrast)
#### Column Headers
- **Stage name** with opportunity count    
- **Total pipeline value** for each stage    
- **WIP limit indicator** with visual warning when approaching limit    
- **Quick actions** dropdown (bulk operations)
#### Card Quick Actions
**Bottom-row action buttons** for immediate access:
- **Contact** (phone/email icons)    
- **Schedule** (calendar icon)    
- **Notes** (comment icon)    
- **Edit** (pencil icon)
#### Mobile Optimization
- **Responsive design** with touch-friendly interactions    
- **Simplified card layout** for smaller screens    
- **Gesture-based navigation** (swipe between stages)   
- **Floating action button** for quick opportunity creation
### Psychological Principle Annotations
Each design element serves specific psychological purposes:
- **Jakob's Law**: Familiar CRM terminology and layout patterns reduce learning curve    
- **Hick's Law**: Limited action options prevent decision paralysis    
- **Fitts's Law**: Large targets and optimal positioning improve interaction efficiency    
- **Aesthetic-Usability Effect**: Professional visual design increases perceived usability    
- **Progressive Disclosure**: Layered information access reduces cognitive overload    
- **Goal-Gradient Effect**: Clear stage progression motivates completion    
- **Anchoring Bias**: High-value deals create positive value perception    
- **Tesler's Law**: Automation reduces user complexity burden    
- **Forgiveness Principle**: Error recovery builds user confidence    
- **Law of Proximity**: Grouped elements create logical relationships