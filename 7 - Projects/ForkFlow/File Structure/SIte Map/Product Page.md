Product- Home page: will have a list of all the products. 
- Create a new Product Button

When user clicks on Product will open a Product Info Page:
- User can edit any info or delete product

Start with the Organizations batch
- Product Name
- Principal Name(Dropdown of checked checkbox "Principal" from Organization)
- Supplier Name (Dropdown of checked checkbox "Supplier" from Organization)
- Product Description
- Size
- Price
- sku




#### **Product**

- `id` (Primary Key)    
- `name`    
- `principalId` (Foreign Key → Setting)    
- `category`    
- `description` (text)    
- `price` (decimal)    
- `sku`    
- `active` (boolean)    
- `createdAt` (datetime)    
- `updatedAt` (datetime)    
- `createdBy`