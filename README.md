# Walmart Sales Data Visualization
## Project Overview
This project involves the analysis and visualization of Walmart sales data. The goal is to derive insights from the sales data through various data visualization techniques.
## Database and Table Structure
### Database: walmart_sales
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
### Feature Engineering
Additional columns were added for more detailed analysis:
*   **time_of_day**: Categorizes the `time` field into 'Morning', 'Afternoon', and 'Evening'.
*   **day_name**: Extracts the day of the week from the `date`.
*   **month_name**: Extracts the month name from the `date`.
## Data Import
The data is imported from a CSV file named `Walmart_Sales.csv`.
## Data Visualization
The visualization includes several types of analysis such as:

* Sales distribution across different cities.
* Sales trends over time (day, month).
* Analysis of sales by product line.
* Customer segmentation based on gender and customer type.
* Performance analysis based on different payment methods.
* Rating distribution.















