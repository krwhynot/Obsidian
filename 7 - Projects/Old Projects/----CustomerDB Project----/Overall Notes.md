Here's a clean, detailed, and straightforward summary describing exactly what the tool needs to do to clean up a CSV customer database, structured clearly for easy copy-and-paste use:

---

# 📋 **Customer Database Cleanup Tool - Summary**

## 🎯 **Purpose of the Tool**

Create a simple, user-friendly tool to clean and format customer databases (CSV format) for seamless import into the HungerRush POS system.

---

## 📌 **Fields Required by HungerRush POS**

These are the exact column headers and their required formats:

|Column Name|Format Required|Example|
|---|---|---|
|**FirstName**|Text, Properly Capitalized|`John`|
|**LastName**|Text, Properly Capitalized|`Doe`|
|**Phone**|Numeric Only, 10 digits|`1234567890`|
|**StreetNum**|Numeric Only|`123`|
|**StreetName**|Text, Properly Capitalized|`Main Street`|
|**City**|Text, Properly Capitalized|`Houston`|
|**Zip**|Numeric Only, 5 digits|`77001`|

---

## 🔧 **Cleaning Rules & Actions**

The tool will perform the following specific cleaning operations automatically:

### ✅ **General Formatting**

- **Remove extra whitespace** from beginning and end of all text fields.
    
- **Ensure consistent capitalization**:
    
    - Default: Proper Case (e.g., `John Doe`, `Main Street`).
        
    - Optional (Deep Clean): UPPERCASE (e.g., `JOHN DOE`, `MAIN STREET`).
        

### ✅ **Phone Numbers**

- **Remove all special characters**: parentheses, dashes, spaces, etc.
    
    - Example: `(123) 456-7890` → `1234567890`
        
- Ensure exactly **10-digit** phone numbers.
    
    - If a phone number includes a leading "1" (country code), remove it.
        

### ✅ **Name Splitting**

- **Split full names** from a single field into separate **FirstName** and **LastName** fields:
    
    - Example: `Jane Doe` → FirstName: `Jane`, LastName: `Doe`
        

### ✅ **Address Splitting**

- **Split address** into separate fields:
    
    - **StreetNum**: numeric house number (e.g., `123`)
        
    - **StreetName**: remaining street details (e.g., `Main Street`)
        

### ✅ **ZIP Codes**

- **Trim ZIP+4** (e.g., `77001-1234`) to **5-digit ZIP** (`77001`).
    

---

## 🚩 **Row Removal Criteria**

Based on selected cleaning level:

- **Light Clean**:
    
    - No rows are removed; only minimal formatting fixes applied.
        
- **Standard Clean** _(recommended)_:
    
    - Remove rows missing **both FirstName and LastName**.
        
    - Remove rows with invalid **Phone** (less than or greater than 10 digits).
        
- **Deep Clean**:
    
    - Remove rows missing **either FirstName or LastName**.
        
    - Remove rows with invalid **Phone**.
        
    - Convert all text to uppercase.
        

---

## 📂 **Output**

- Generates a new CSV file with `_CLEANED` appended to the original filename.
    
    - Example: `customers.csv` → `customers_CLEANED.csv`
        
- Saved in the same directory as the original file.
    

---

## 🚧 **Future Enhancements (Optional)**

- Generate a simple log file showing details of removed rows.
    
- Allow customizable cleaning preferences/settings.
    

---

## 📌 **Summary Keywords**

- CSV customer database cleaner
    
- HungerRush POS compatibility
    
- Automated data formatting
    
- Easy, user-friendly interface
    
- Multiple cleaning levels (Light, Standard, Deep)
    

---

✨ **This summary is now ready for your notes—simply copy, paste, and use!**