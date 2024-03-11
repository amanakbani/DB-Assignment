Q1) Based on the provided information, it seems like there is a one-to-many relationship between the "Product" and "Product_Category" entities.

Here's how the relationship works:

- Each product belongs to one category.
- Each category can have multiple products.

Q2)We can enforce referential integrity by using a foreign key constraint.                

following steps should be done to acheive:-


1. Add a Foreign Key Constraint: 

   sql
   ALTER TABLE Product
   ADD CONSTRAINT FK_Product_Category
   FOREIGN KEY (Category_id)
   REFERENCES Product_Category(Id);
   

2. Disallow NULL Values: 

   sql
   ALTER TABLE Product
   MODIFY COLUMN Category_id INT NOT NULL;
   

Hence we can guarantee that each product in the "Product" table will have a valid category assigned to it, as it must reference and existing category in the "Product_Category" table.

Q3)
sql
-- Create Product table
CREATE TABLE Product (
    Id INT PRIMARY KEY,
    Name VARCHAR(255),
    Description TEXT,
    Sku VARCHAR(50),
    Category_id INT,
    Inventory_id INT,
    Price DECIMAL(10, 2),
    Discount_id INT,
    Created_at TIMESTAMP,
    Modified_at TIMESTAMP,
    Deleted_at TIMESTAMP
);

-- Create Product_Category table
CREATE TABLE Product_Category (
    Id INT PRIMARY KEY,
    Name VARCHAR(255),
    Description TEXT,
    Created_at TIMESTAMP,
    Modified_at TIMESTAMP,
    Deleted_at TIMESTAMP
);

-- Create Product_Inventory table
CREATE TABLE Product_Inventory (
    Id INT PRIMARY KEY,
    Quantity INT,
    Created_at TIMESTAMP,
    Modified_at TIMESTAMP,
    Deleted_at TIMESTAMP
);

-- Create Discount table
CREATE TABLE Discount (
    Id INT PRIMARY KEY,
    Name VARCHAR(255),
    Description TEXT,
    Discount_percent DECIMAL(5, 2),
    Active BOOLEAN,
    Created_at TIMESTAMP,
    Modified_at TIMESTAMP,
    Deleted_at TIMESTAMP
);

-- Add Foreign Key constraint for Product table
ALTER TABLE Product
ADD CONSTRAINT FK_Product_Category
FOREIGN KEY (Category_id)
REFERENCES Product_Category(Id);

-- Add Foreign Key constraint for Product table
ALTER TABLE Product
ADD CONSTRAINT FK_Product_Discount
FOREIGN KEY (Discount_id)
REFERENCES Discount(Id);
