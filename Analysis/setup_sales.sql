-- setup_sales.sql
-- Creates the sales table and inserts sample rows.
CREATE TABLE IF NOT EXISTS sales (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    product_name TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    price REAL NOT NULL,
    sale_date TEXT NOT NULL
);

-- Sample data
INSERT INTO sales (product_name, quantity, price, sale_date) VALUES
('Laptop', 2, 75000.00, '2025-08-01'),
('Smartphone', 5, 25000.00, '2025-08-02'),
('Headphones', 10, 1500.00, '2025-08-02'),
('Monitor', 3, 12000.00, '2025-08-03'),
('Keyboard', 7, 1200.00, '2025-08-04');
