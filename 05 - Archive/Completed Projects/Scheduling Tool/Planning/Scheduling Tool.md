Perfect choice — a **Team Scheduling GUI Tool** is an excellent beginner-to-intermediate project that:

- Has **real-world relevance** for quick-service restaurant operations    
- Aligns with **.NET, SQL Server, and front-end** skill-building    
- Can scale in complexity over time (e.g., auto-scheduling, compliance rules, notifications)
    

---

## 🔧 Project: **Team Scheduling Tool for Quick-Service Restaurants**

### 🧩 Real-World Context:

- Managers need to create, view, and edit weekly schedules    
- Employees want to see their shifts, request changes, and maybe clock in/out    
- No overbooking or under-staffing on high-volume days
    

---

## ✅ MVP (Minimum Viable Product) Features

### 🖼️ GUI Interface (WPF or Blazor / WinForms / Web Frontend)

- Weekly calendar view (Mon–Sun) for each staff member    
- Drag & drop shift assignment OR dropdown to assign shifts    
- Employee filter/search
    

### 💾 Database Tables (SQL Server)

```sql
Employees (Id, FirstName, LastName, Role, HireDate, IsActive)
Shifts (Id, Name, StartTime, EndTime)
Schedule (Id, EmployeeId, ShiftId, ScheduledDate)
```

### 📡 Backend (C# .NET MVC or .NET 8 API)

- CRUD: Add/edit/remove shifts, assign to employees    
- Validation: No double-booking, max hours/week    
- Optional: auto-generate a default schedule template
    

---

## 📈 Stretch Features

|Feature|Purpose|
|---|---|
|🕒 Clock-In/Out|Track attendance (using local time or simulated)|
|📊 Schedule Report|Hours per employee per week|
|⚠️ Conflict Alerts|Highlight overlapping or unstaffed shifts|
|🧠 Auto-Fill Week|Simple algorithm to fill schedule (e.g., fair rotation)|
|📨 SMS/Email Notification|Notify team of their schedule (via dummy email/Twilio)|

---

## 🧪 Technologies to Practice

|Skill/Requirement|Technology|
|---|---|
|**.NET (MVC/API)**|.NET Core or .NET 8|
|**SQL + Entity Framework**|SQL Server + EF Core|
|**Frontend Framework**|Blazor (C#), or Vue/React (optional)|
|**Testing**|NUnit + Moq for backend logic|
|**Source Control**|GitHub project + commits|
|**Bonus**|WPF GUI or Web GUI depending on preference|

---

## 🧭 Suggested Build Steps

1. **Design schema** (Employees, Shifts, Schedule)
    
2. **Seed sample data** (5 employees, 3 shift types)
    
3. Build:
    
    - GUI to view weekly calendar
        
    - Form to assign shifts
        
    - Validation: no overlap, max 40 hrs
        
4. Save to database and reload
    
5. (Stretch) Clock-in/out & reporting
    

---

Would you like:

- A visual wireframe mockup?
    
- A database schema ERD to get started?
    
- A GitHub repo scaffold for this exact project (MVP setup)?