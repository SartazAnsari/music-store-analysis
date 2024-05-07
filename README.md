# Music Store Analysis
## Overview
This project involves analyzing sales data from a music store using SQL queries. The dataset used can be found [here](https://www.kaggle.com/datasets/sartazansari/music-store-data). The dataset has been formatted to utilize the secure file priv.

***Note:** The original dataset is provided by [ADITI1001](https://www.kaggle.com/aditi1001) in Kaggle and can be found [here](https://www.kaggle.com/datasets/aditi1001/musicstore). Credit goes to the dataset provider for making it available.*

## Dataset
The dataset consists of 11 CSVs:

1. `artist_tbl`
2. `customer_tbl`
3. `employee_tbl`
4. `genre_tbl`
5. `media_type_tbl`
6. `playlist_tbl`
7. `album_tbl`
8. `invoice_tbl`
9. `track_tbl`
10. `playlist_track_tbl`
11. `invoice_line_tbl`

## Setup Instructions
1. Ensure you have MySQL Server 8.3 or higher installed on your system.
2. Open MySQL Workbench or any MySQL client tool.
3. **[Optional]** If you are using VSCode
    * If you are using VSCode with [MySQL by Jun Han](https://marketplace.visualstudio.com/items?itemName=formulahendry.vscode-mysql) extension then create a new user with old authentication type as the extension does't support new authentication type as of now.
        ```
        CREATE USER 'user'@'localhost' IDENTIFIED with mysql_native_password by 'password';
        GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost';
        FLUSH PRIVILEGES;
        ```
    * If you are using VSCode with any other extension that supports new authentication type then you can proceed using new authentication type.
        ```
        CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
        GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost';
        FLUSH PRIVILEGES;
        ```
5. Download the [dataset](https://www.kaggle.com/datasets/sartazansari/music-store-data) from Kaggle.
4. Place it in the location specified by your MySQL server's secure file privilege setting. You can find the path by executing
    ```
    SHOW VARIABLES LIKE 'secure_file_priv';
    ```

***Note:** Make sure to adjust file paths in the `LOAD DATA INFILE` statements according to your local file system.*

## SQL Queries
The SQL queries provided below perform various analyses on the sales data:

* **Creating Database and Tables:** Defines the database schema and creates tables for storing sales and customer data.
* **Loading Data into Tables:** Loads data from CSV files into the respective tables in the database.
* **Exploratory Data Analysis:** Performs exploratory analysis on the sales data.
* **Analytical Queries:** Performs various analytical queries to gain insights into sales trends, customer demographics, and more.

## Example Queries
Here are some example SQL queries included in the project:

* Listing records from each table.
* Finding the senior-most employee based on job title.
* Identifying countries with the most invoices.
* Determining the top 3 values of total invoice.
* Finding the city with the highest sum of invoice totals.
* Identifying the customer who spent the most.
* Listing email, first name, last name, and genre of rock music listeners alphabetically by email.
* Identifying track names and milliseconds longer than the average song length.
* Calculating the amount spent on the best-selling artist by each customer.
* Determining the country with the top genre.
* Identifying the top-spending customer by country.

Feel free to modify and extend the queries based on your analysis requirements.