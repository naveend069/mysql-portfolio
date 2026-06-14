CREATE DATABASE rfm_project;
USE rfm_project;

DROP TABLE IF EXISTS retail_raw;

CREATE TABLE retail_raw (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate VARCHAR(10),
    UnitPrice DECIMAL(10,2),
    CustomerID INT,
    Country VARCHAR(100)
);