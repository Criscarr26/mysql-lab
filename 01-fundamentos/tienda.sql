/*
 * Esquema de una tienda: articulos, compradores, ordenes de compra
 * y detalle de ordenes (relacion N:M con atributos).
 */

DROP DATABASE IF EXISTS tienda_2;
CREATE DATABASE tienda_2;
USE tienda_2;

CREATE TABLE Item (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100),
    UnitCost DECIMAL(10,2)
);

CREATE TABLE Buyer (
    BuyerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

CREATE TABLE PurchaseOrder (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATE,
    TotalPrice DECIMAL(10,2),
    BuyerID INT,
    FOREIGN KEY (BuyerID) REFERENCES Buyer(BuyerID)
);

CREATE TABLE OrderDetails (
    OrderID INT,
    ItemID INT,
    Quantity INT,
    PricePerUnit DECIMAL(10,2),
    PRIMARY KEY (OrderID, ItemID),
    FOREIGN KEY (OrderID) REFERENCES PurchaseOrder(OrderID),
    FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
);

INSERT INTO Item (ItemName, UnitCost) VALUES
('Refrigerator', 1500.00),
('Washing Machine', 1000.00);

INSERT INTO Buyer (FullName, PhoneNumber) VALUES
('Carlos Hernández', '555-1234'),
('Ana García', '555-5678');

INSERT INTO PurchaseOrder (OrderDate, TotalPrice, BuyerID) VALUES
('2024-10-01', 2500.00, 1);

INSERT INTO OrderDetails (OrderID, ItemID, Quantity, PricePerUnit) VALUES
(1, 1, 1, 1500.00),
(1, 2, 1, 1000.00);

SELECT * FROM Item;
SELECT * FROM Buyer;
SELECT * FROM PurchaseOrder;
