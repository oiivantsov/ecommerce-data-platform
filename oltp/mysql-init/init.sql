USE sales;

-- Create Table
CREATE TABLE IF NOT EXISTS sales_data (
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    price INT NOT NULL,
    quantity INT NOT NULL,
    timestamp DATETIME NOT NULL,
    PRIMARY KEY (product_id, customer_id)  -- Composite key to avoid duplicate rows
);


-- Create Index
CREATE INDEX idx_timestamp ON sales_data (timestamp);