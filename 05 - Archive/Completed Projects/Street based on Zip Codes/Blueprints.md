# Software Architect's Blueprint: ZIP Code Street Finder for HungerRush POS

## Project Overview

- **Project Name:** ZIP Code Street Finder for HungerRush POS Installation
- **Prepared By:** Project Architect
- **Date:** April 16, 2025
- **Version:** 1.0

## 1. Project Goals

- **Problem Statement:** Create a specialized tool that generates properly formatted street lists from U.S. ZIP codes specifically for import into the HungerRush POS system during installation, ensuring data compatibility and preventing truncation errors through precise string formatting and length limitations. The street list will be used to auto-complete street names when entering customer addresses.

- **Measurable Objectives:**
    - Successfully retrieve street data for any valid U.S. ZIP code
    - Format street names to match HungerRush database import requirements (`,StreetName,`)
    - Prevent truncation errors by limiting string length to NVARCHAR(50) compatibility
    - Filter out invalid street names containing non-alphanumeric characters
    - Complete ZIP code street data retrieval in under 30 seconds
    - Seamlessly integrate with HungerRush POS installation workflow
- **Primary Stakeholders:**
    - HungerRush POS installers 

- **Project Constraints:**
    - External API rate limits (Nominatim, OpenStreetMap)
    - HungerRush database field size limitation (NVARCHAR(50))
    - Character restrictions (letters plus spaces only)
    - Must be formatted to be imported with HungerRush POS

- **Expected Outcomes:**
    - Installer-friendly utility for generating street lists
    - GUI application with HungerRush branding
    - CSV output files with properly formatted street names
## 2. Users and Use Cases

- **User Personas:**
    - **Billy (Installer)**: HungerRush installation specialist who sets up new restaurant systems

- **User Journeys:**
    - Billy arrives at a new restaurant, runs the tool to generate a CVS file with the street list then in  imported list into the POS through the Customer Maintenance menu under the Streets option in POS.
    
- **Critical Use Cases:**
    - Generate street list during HungerRush POS installation
    - Export properly formatted CSV file compatible with HungerRush POS
    - List will be used to auto-complete street names when entering customer addresses
    - Review street names before import to ensure quality
- **User Stories:**
    - As a HungerRush installer, I need to quickly generate accurate street lists for the restaurant's customer database so I can complete the POS setup efficiently

- **User Types and Access Levels:**
    - HungerRush installers (primary users)

## 3. Inputs, Outputs, and Constraints

- **Input Sources:**
    - User provides 5-digit U.S. ZIP code(s) in the restaurant area
    - Nominatim API for geocoding ZIP codes to boundaries
    - OpenStreetMap Overpass API for street data within boundaries
- **Expected Outputs:**
    - CSV file containing street names formatted as `,StreetName,`
    - Format must match HungerRush POS import specifications
    - One street name per line
    - File ready for direct import during POS installation
    - File named `streets_[ZIP].csv` for easy identification
- **Technical Constraints:**
    - Street names must contain only Letters and Spaces (HungerRush requirement)
    - Each formatted street name (`",StreetName,"`) must be <= 50 characters
    - Must have access to internet
    - Must complete processing quickly 
    - Needs to work on HungerRush installer laptops
    
- **Data Validation Rules:**
    - ZIP code must be exactly 5 digits
    - Street names must be alphanumeric plus spaces (HungerRush requirement)
    - Street names must be unique to prevent POS database duplicates
    - Street names must be <= 28 characters after formatting
    - Output must be validated against HungerRush import specifications
- **Error Handling Procedures:**
    - Invalid ZIP code: Display installer-friendly error message
    - Geocoding failure: Attempt alternative method with clear status updates
    - API timeout: Implement retry mechanism with progress indicators
    - No streets found: Notify user with troubleshooting suggestions

## 4. System Architecture and Data Flow

- **Architectural Pattern:**
    - Command pattern for core functionality
    - MVC pattern for installer-friendly GUI
    - Repository pattern for data access
    - Factory pattern for output formatting
- **Data Flow Map:**
    1. Installer inputs ZIP code(s) through HungerRush-branded GUI
    2. System geocodes ZIP to boundary coordinates
    3. System queries street data within boundary
    4. System filters and formats street names per HungerRush requirements
    5. System exports HungerRush-compatible CSV file
    6. Installer imports CSV during POS setup process
- **Component Boundaries(Actions):**
    - Input handler (GUI interface)
    - Geocoding service (ZIP to boundary conversion)
    - Street data service (retrieving street information)
    - HungerRush data formatter (filtering and formatting per POS requirements)
    - Output generator (file creation in CSV format)
- **Integration Points:**
	***APIs***
    - Nominatim API for geocoding
    - OpenStreetMap Overpass API for street data
    ***File System***
    - Local file system for output of CSV file
    
## 5. Component Breakdown

- **System Components:**
	- **`ZipCodeStreetFinder` class**: The primary entry point and coordinator for all other components.
	
	- **Geocoding module**: This component is responsible for converting ZIP codes to geographical boundaries. 
	
	- **Street data retrieval module**: This handles the specialized task of querying external services for street information. 
	
	- **Street List formatting module**: This  handles the task of formatting street data according to HungerRush requirements.
	
	- **CSV file output module**: This component manages file creation and formatting. It's distinct from the processing module because it handles the physical output creation rather than data transformation.
	
	- **Installer-friendly GUI interface**: This represents the user interface layer. It's separated from business logic components to maintain clean separation of concerns.
- **Component Interfaces:**
    - `get_zip_area_boundary(zip_code)` → boundary coordinates
    - `get_streets_from_overpass(bbox)` → list of street dictionaries
    - `get_streets_alternate_method(zip_code)` → list of street dictionaries
    - `save_streets_to_hungerrush_format(streets, zip_code, output_dir)` → file path
    - `validate_hungerrush_compatibility(file_path)` → validation result
- **Data Contracts:**
    - Boundary format: `[south, west, north, east]` as float values
    - Street object: `{'name': str, 'type': str}`
    - Streets list: `[Street, Street, ...]`
    - HungerRush import format: `,StreetName,` lines without headers
- **Work Packages:**
    1. Core street data functionality implementation
    2. HungerRush-specific formatting module
    3. Installer-friendly GUI with progress indicators

- **Component Acceptance Criteria:**
    - Correctly identifies all streets 
    - Output files successfully import into HungerRush POS without errors
    - GUI provides clear feedback during installation process
    - Completes processing within typical installation 
    - Works with internet connectivity

## 6. Data Structures and Storage

- **Domain Entities:**
    - ZIP Code (string, 5 digits)
    - Boundary Box (array of 4 float values)
    - Street (dictionary with name and type)
    - Restaurant Delivery Area (collection of ZIP codes)
- **Entity Relationships:**
    - Each Restaurant has multiple ZIP Codes
    - Each ZIP Code has one Boundary Box
    - Each Boundary Box contains multiple Streets
- **Data Structures:**
    - ZIP Code: string
    - Boundary: List[float] = [south, west, north, east]
    - Street: Dict = {'name': str, 'type': str}
    - Streets: List[Dict]
    - ZipList: List[str] (ZIP codes)
- **Storage Mechanisms:**
    - Temporary file storage for HungerRush import CSV

- **Data Volume and Access Patterns:**
    - Typical restaurant delivery area covers 5-10 ZIP codes
    - Each ZIP code contains 50-200 streets
    - One-time data retrieval during POS installation

## 7. Error Handling and Edge Cases

- **Potential Failure Points:**
    - Invalid ZIP code input
    - Poor internet connectivity 
    - API rate limiting during bulk installation
    - No streets found for newer areas
    - Street names exceeding HungerRush character limits
- **User Feedback Mechanisms:**
    - Real-time progress indicators for installers
    - Clear success/failure messages relevant to POS installation
    - Preview of street data before HungerRush import

## 8. Technical Specifications

- **Interface Contracts:**
    - GUI: HungerRush-branded interface with ZIP code input and restaurant location fields
    - Core class: `ZipCodeStreetFinder().find_streets_for_hungerrush(zip_code, output_dir)`

- **Performance Requirements:**
    - Complete processing in minutes for typical zip code
    - Operate on  installer laptops

- **Technical Environment Constraints:**
    - Windows 10/11 (HungerRush installer laptops)
    - Python 3.6+ with PyInstaller packaging
    - Must work alongside HungerRush installation software
    - Limited internet
- **Coding Standards:**
    - PEP 8 compliance
    - Comprehensive exception handling targeting installation scenarios
    - Clear logging for installation troubleshooting
    - Installer-friendly error messages
- **Documentation Requirements:**
    - Integration guide for HungerRush installation process
    - Troubleshooting guide for common installation scenarios
    - Quick reference card for installers
    - Training materials for installation team

## Complete Project Planning Checklist

### Goal Clarification

- [x] Problem statement defined
- [x] Measurable objectives established
- [x] Stakeholders identified
- [x] Project constraints documented
- [x] Expected outcomes specified
d39h-D0
### User Analysis

- [x] User personas created
- [x] Critical use cases identified
- [x] User journeys mapped
- [x] User stories developed
- [x] User types differentiated

### Input/Output Definition

- [x] Input sources documented
- [x] Output specifications defined
- [x] Technical constraints identified
- [x] Validation rules established
- [x] Error handling procedures outlined

### Architecture Design

- [x] Architectural pattern selected
- [x] Component boundaries defined
- [x] Data flows mapped
- [x] Integration points identified
- [x] Failure handling designed

### Component Breakdown

- [x] Discrete components identified
- [x] Component interfaces defined
- [x] Data contracts established
- [x] Work packages created
- [x] Component acceptance criteria set

### Data Structure Planning

- [x] Domain entities modeled
- [x] Entity relationships defined
- [x] Data structures chosen
- [x] Storage mechanisms planned
- [x] Volume and access patterns considered

### Error Handling Strategy

- [x] Failure points identified
- [x] Recovery mechanisms designed
- [x] Fallback strategies created
- [x] Logging and monitoring planned
- [x] User feedback mechanisms defined

### Technical Documentation

- [x] Interface contracts documented
- [x] Performance requirements specified
- [x] Environment constraints noted
- [x] Coding standards established
- [x] Documentation plan created

---

**Notes and Additional Considerations:**

The integration with HungerRush POS creates both challenges and opportunities. By tailoring this tool specifically for the HungerRush ecosystem, we can dramatically streamline the installation process while ensuring data quality. A few critical insights emerged during planning:

- Installation environments vary significantly in connectivity quality, necessitating robust offline capabilities
- POS installers require clear visual feedback during potentially lengthy operations
- The street data quality directly impacts restaurant delivery operations, making accuracy paramount
- The tool should seamlessly fit into existing installation workflows to minimize training needs

By focusing on the installer experience while maintaining strict adherence to HungerRush data requirements, this tool can significantly reduce installation time while improving data quality. This creates a dual benefit: faster implementations for the installation team and better delivery operations for restaurant clients.