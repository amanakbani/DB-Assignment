
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