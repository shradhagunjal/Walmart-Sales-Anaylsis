# Walmart Sales Data Visualization
## Project Overview
This project involves the analysis and visualization of Walmart sales data. The goal is to derive insights from the sales data through various data visualization techniques.
## Database and Table Structure
### Database: walmart_sales.sql
The database contains a single table sales with the following structure:
*   **invoice_id**: `VARCHAR(30)` - Primary Key
*   **branch**: `VARCHAR(5)`
*   **city**: `VARCHAR(30)`
*   **customer_type**: `VARCHAR(30)`
*   **gender**: `VARCHAR(10)`
*   **product_line**: `VARCHAR(100)`
*   **unit_price**: `DECIMAL(10, 2)`
*   **quantity**: `INT`
*   **VAT**: `FLOAT(6, 4)`
*   **total**: `DECIMAL(12, 4)`
*   **date**: `DATETIME`
*   **time**: `TIME`
*   **payment_method**: `VARCHAR(15)`
*   **cogs**: `DECIMAL(10, 2)`
*   **gross_margin_percent**: `FLOAT(11, 9)`
*   **gross_income**: `DECIMAL(12, 4)`
*   **rating**: `FLOAT(2, 1)`
