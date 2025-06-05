Yes — using **WPF + Entity Framework Core (EF Core)** is an **excellent stack** for your **Team Scheduling GUI Tool**, especially considering you're new to coding and want a resume-friendly project relevant to HungerRush’s tech stack.

---

## ✅ Why This Stack Is a Smart Choice

### 🎯 1. **WPF (Windows Presentation Foundation)**

- ✅ **Modern** desktop UI framework (unlike WinForms, which is older)    
- ✅ Supports **MVVM pattern**, which teaches clean architecture    
- ✅ Great for **interactive scheduling UIs** (drag & drop, calendars)    
- ✅ Easier to scale into richer apps later
    

> If you can learn WPF early, it puts you ahead of many devs still stuck on WinForms.

---

### 🗃️ 2. **Entity Framework Core**

- ✅ Simplifies database operations (`DbContext`, LINQ queries)    
- ✅ Works seamlessly with **SQL Server**    
- ✅ You can **code-first** or **db-first** (you already have a SQL database)    
- ✅ You’ll gain experience with:
    
    - Migrations        
    - Query optimization        
    - Relational mapping (EF models = tables)
        

> EF Core is a **must-have resume skill** for .NET devs.

---

### 🧠 3. **How These Fit Together**

```
WPF GUI     →     ViewModels     →     EF Core     →     SQL Database
 (UI)             (Logic)            (Data Layer)      (Persisted Data)
```

You’ll get exposure to:

- UI programming    
- Data binding (WPF)    
- MVVM architecture    
- SQL querying & validation    
- Application-level logic (scheduling, overlap prevention, etc.)
    

---

## 🛠️ Recommendations for Your First Version

|Component|Tech|Why|
|---|---|---|
|UI|WPF + XAML|Modern, customizable|
|Logic Layer|C# Classes + MVVM|Separation of concerns|
|DB Access|EF Core|Simple and powerful|
|Database|SQL Server (LocalDB)|Real-world, resume-aligned|
|Testing (later)|NUnit + Moq|Practice test-driven patterns|

---

Would you like a **starter repo structure** or a **step-by-step roadmap** to build version 1 of this project with WPF + EF Core?