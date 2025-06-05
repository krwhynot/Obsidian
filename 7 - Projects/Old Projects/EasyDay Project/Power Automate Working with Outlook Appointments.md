# 

## Initial Trigger
Start with the "When a new event is created (V3)" or "When an event is modified (V3)" trigger from Office 365 Outlook connector.

```
[Trigger Card]
When a new event is created (V3)
Required fields:
- Calendar ID: (Select your calendar)
- Advanced Options:
  - Include Attachments: Yes/No
  - Include Link to Event: Yes/No
```

## Available Dynamic Content
After the trigger, you can access these appointment properties:

### Basic Properties
- Subject
- Start time
- End time
- Location
- Body
- Importance
- IsAllDay
- WebLink

### Attendee Information
- Organizer
  - Email
  - Name
- Attendees
  - Email
  - Name
  - Status (Accepted/Tentative/Declined)
  - Type (Required/Optional)

### Additional Properties
- Categories
- SeriesMasterId (if part of recurring series)
- Sensitivity (Normal/Personal/Private/Confidential)
- ShowAs (Busy/Free/Tentative)
- Type (SingleInstance/Occurrence/Exception/SeriesMaster)

## Common Actions for Processing Appointments

### 1. Parse Appointment Body
```
[Action Card]
Parse HTML
Input: Body
Output: Text content
```

### 2. Extract Specific Information
```
[Action Card]
Compose
Inputs: Use expressions to extract specific data
Examples:
- formatDateTime(triggerBody()?['Start'],'yyyy-MM-dd')
- substring(body('Parse_HTML'), 0, 100)
```

### 3. Create Variables for Extracted Data
```
[Action Card]
Initialize variable
Name: [YourVariableName]
Type: String/Array/Object
Value: [Dynamic content or expression]
```

## Settings Panels

### Trigger Settings
- Run recurrence
- Time zone handling
- Subscription lifetime
- Include attachments
- Include event link

### Action Settings
#### Parse HTML
- Keep formatting: Yes/No
- Remove scripts: Yes/No
- Remove styles: Yes/No

#### Variables
- Array variables: Collection type
- Object variables: Schema definition
- String variables: Default value

## Best Practices

1. Error Handling:
```
[Scope Card]
Configure run after
- Has failed
- Has timed out
- Has been skipped
```

2. Condition Checks:
```
[Condition Card]
If yes:
- Appointment type equals 'SingleInstance'
- Sensitivity equals 'Normal'
```

3. Data Formatting:
```
[Expression Examples]
Date: formatDateTime()
Text: replace(), substring()
Arrays: join(), split()
```

## Example Flow Structure

1. Trigger: When new appointment is created
2. Initialize Variables
   - Subject
   - StartTime
   - EndTime
   - Attendees
3. Parse Appointment Body
4. Condition Check (if needed)
5. Process Data
6. Store or Forward Information

## Common Dynamic Content Usage

### Date/Time Handling
```
formatDateTime(triggerBody()?['Start'],'yyyy-MM-dd HH:mm')
addDays(triggerBody()?['Start'], 7)
```

### Attendee Processing
```
join(map(triggerBody()?['Attendees'], item => item?['EmailAddress']?['Address']), ';')
```

### Location Formatting
```
if(empty(triggerBody()?['Location']), 'No Location', triggerBody()?['Location'])
```