




#### **User**

- `id` (Primary Key)    
- `email`    
- `firstName`    
- `lastName`    
- `role`    
- `active` (boolean)    
- `createdAt` (datetime)    
- `updatedAt` (datetime)    

#### **Organization**

- `id` (Primary Key)    
- `name`    
- `priorityId` (Foreign Key → Setting)    
- `segmentId` (Foreign Key → Setting)    
- `distributorId` (Foreign Key → Setting)    