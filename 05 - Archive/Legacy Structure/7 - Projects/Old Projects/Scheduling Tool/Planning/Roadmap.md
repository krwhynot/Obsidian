**Team Scheduling Tool — Step-by-Step Roadmap**

### 🧱 **Phase 1: Foundation – Set Up Your Project**

**Goal:** Create your WPF project and connect it to your SQL database.

| Step                     | Description                                                                       |
| ------------------------ | --------------------------------------------------------------------------------- |
| ✅ 1. Create Solution     | In Visual Studio: Create a new **WPF App (.NET Core/6/8)** project                |
| ✅ 2. Add EF Core         | Install NuGet packages: `Microsoft.EntityFrameworkCore`, `SqlServer`, and `Tools` |
| ✅ 3. Define Your Models  | Create C# classes: `Employee`, `Shift`, `ScheduleEntry`                           |
| ✅ 4. Set Up DbContext    | Create a `ScheduleDbContext` that defines `DbSet<>` for each model                |
| ✅ 5. Connect to SQL      | Use `appsettings.json` or hard-coded `OnConfiguring()` for local DB connection    |
| ✅ 6. Run First Migration | Use CLI or PMC: `Add-Migration Init`, `Update-Database` to create DB              |

📌 **Checkpoint:** You should have a working SQL database with tables and seeded data.

---

### 🖼️ **Phase 2: Build the GUI**

**Goal:** Design the desktop interface for scheduling.

|Step|Description|
|---|---|
|✅ 1. Create MainWindow Layout|Use XAML to add a sidebar or tabs: "Employees", "Shifts", "Schedule"|
|✅ 2. Display Employees|Bind a `DataGrid` or `ListView` to `ObservableCollection<Employee>`|
|✅ 3. Add/Edit Employees|Add buttons & forms (TextBoxes, DatePickers) to create/edit entries|
|✅ 4. Load from DB|Use EF to load and save employee data in real-time|

📌 **Checkpoint:** You can view and modify employees from the GUI.

---

### 📆 **Phase 3: Scheduling Logic**

**Goal:** Assign shifts to employees for a specific week.

|Step|Description|
|---|---|
|✅ 1. Create a Calendar UI|Use a `Grid` or `DataGrid` to show employees × weekdays|
|✅ 2. Populate Shift Options|Dropdown for shift selection (e.g., Morning, Evening)|
|✅ 3. Save to Schedule Table|When a shift is selected, create a `ScheduleEntry` and save to DB|
|✅ 4. Validate|Prevent overlaps or double-booking (optional: max 40 hrs/week)|

📌 **Checkpoint:** You can assign shifts to employees and store them in the database.

---

### 📊 **Phase 4: Reporting & Extras**

**Goal:** Add useful features to show your skills.

|Step|Description|
|---|---|
|✅ 1. Weekly Summary|Show total hours per employee (grouped by week)|
|✅ 2. Conflict Alerts|Red highlight if overlaps or too few staff on a day|
|✅ 3. Clock-In/Out Simulation|Add buttons to simulate in/out timestamps|
|✅ 4. Export Report|Export weekly schedule to CSV or print preview|

📌 **Checkpoint:** Your app is now helpful, visually clear, and gives insights.

---

### 🚀 **Phase 5: Polish & Publish**

**Goal:** Wrap up the project for your resume or portfolio.

|Step|Description|
|---|---|
|✅ 1. Add MVVM Pattern|Refactor code into ViewModel classes if not done yet|
|✅ 2. Add Logging|Simple logging for actions like saving or errors|
|✅ 3. Write Unit Tests|Use NUnit + Moq to test schedule logic & validation rules|
|✅ 4. Host Code|Push to GitHub with README, screenshots, features, and instructions|
|✅ 5. Resume Integration|Mention tech used: WPF, EF Core, SQL Server, MVVM, LINQ, XAML, Unit Testing|

---

## 📎 Sample Tech Stack Summary for Resume:

> **Tech Used:** C#, .NET 8, WPF (XAML), Entity Framework Core, SQL Server LocalDB, MVVM, LINQ, NUnit, Moq, Git

---

Would you like:

- A **basic ERD** of the tables (`Employee`, `Shift`, `ScheduleEntry`)?
    
- A **Visual Studio solution template** (skeleton of the above)?
    
- A **code walkthrough** of a key feature (e.g., saving a schedule entry)?