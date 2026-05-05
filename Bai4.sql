CREATE TABLE Pharmacy_Inventory (
    Inventory_ID INT AUTO_INCREMENT PRIMARY KEY,
    Drug_Name VARCHAR(255) NOT NULL,
    Batch_Number VARCHAR(50),
    Expiry_Date DATE,
    Quantity INT DEFAULT 0
);

CREATE INDEX idx_drug_name ON Pharmacy_Inventory(Drug_Name);
CREATE INDEX idx_expiry_date ON Pharmacy_Inventory(Expiry_Date);

EXPLAIN ANALYZE
SELECT * FROM Pharmacy_Inventory 
WHERE Drug_Name = 'Paracetamol' 
AND Expiry_Date < '2026-12-31';

SELECT * FROM Pharmacy_Inventory 
WHERE Drug_Name LIKE 'Para%';

-- Composite Index giúp tối ưu truy vấn nhiều điều kiện → giảm số dòng quét.
-- LIKE '%keyword%' làm mất khả năng dùng index → gây Full Table Scan.
