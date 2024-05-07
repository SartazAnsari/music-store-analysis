-- CREATING DATABASE --

CREATE DATABASE IF NOT EXISTS music_store_db;
USE music_store_db;




-- CREATING TABLES --

CREATE TABLE IF NOT EXISTS music_store_db.artist_tbl (
	artist_id INT NOT NULL PRIMARY KEY
    , name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS music_store_db.customer_tbl (
	customer_id INT NOT NULL PRIMARY KEY
    , first_name VARCHAR(255) 
    , last_name VARCHAR(255) 
    , company VARCHAR(255) 
    , address VARCHAR(255) 
    , city VARCHAR(255) 
    , state VARCHAR(255) 
    , country VARCHAR(255) 
    , postal_code VARCHAR(255)
    , phone VARCHAR(255)
    , fax VARCHAR(255)
    , email VARCHAR(255)
    , support_rep_id INT
);

CREATE TABLE IF NOT EXISTS music_store_db.employee_tbl (
	employee_id INT NOT NULL PRIMARY KEY
    , last_name VARCHAR(255)
    , first_name VARCHAR(255)
    , title VARCHAR(255)
    , reports_to VARCHAR(255)
    , levels VARCHAR(255)
    , birthdate DATETIME
    , hire_date DATETIME
    , address VARCHAR(255)
    , city VARCHAR(255)
    , state VARCHAR(255)
    , country VARCHAR(255)
    , postal_code VARCHAR(255)
    , phone VARCHAR(255)
    , fax VARCHAR(255)
    , email  VARCHAR(255)
); 

CREATE TABLE IF NOT EXISTS music_store_db.genre_tbl (
	genre_id INT NOT NULL PRIMARY KEY
    , name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS music_store_db.media_type_tbl (
	media_type_id INT NOT NULL PRIMARY KEY
    , name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS music_store_db.playlist_tbl (
	playlist_id INT NOT NULL PRIMARY KEY
    , name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS music_store_db.album_tbl (
	album_id INT NOT NULL PRIMARY KEY
    , title VARCHAR(255)
    , artist_id INT NOT NULL
	
    , FOREIGN KEY (artist_id) REFERENCES artist_tbl (artist_id)
);

CREATE TABLE IF NOT EXISTS music_store_db.invoice_tbl (
	invoice_id INT NOT NULL PRIMARY KEY
    , customer_id INT
    , invoice_date DATETIME
    , billing_address VARCHAR(255) 
    , billing_city VARCHAR(255)
    , billing_state VARCHAR(255)
    , billing_country VARCHAR(255)
    , billing_postal_code VARCHAR(255)
    , total DECIMAL(10, 2)
    
    , FOREIGN KEY (customer_id) REFERENCES customer_tbl (customer_id)
);

CREATE TABLE IF NOT EXISTS music_store_db.track_tbl (
	track_id INT NOT NULL PRIMARY KEY
    , name VARCHAR(255)
    , album_id INT
    , media_type_id INT 
    , genre_id INT 
    , composer VARCHAR(255) 
    , milliseconds INT
    , bytes INT
    , unit_price DECIMAL(10, 2)

	, FOREIGN KEY (album_id) REFERENCES album_tbl (album_id)
    , FOREIGN KEY (media_type_id) REFERENCES media_type_tbl (media_type_id)
    , FOREIGN KEY (genre_id) REFERENCES genre_tbl (genre_id)
);

CREATE TABLE IF NOT EXISTS music_store_db.playlist_track_tbl (
	playlist_id INT
    , track_id INT
    
    , FOREIGN KEY (playlist_id) REFERENCES playlist_tbl (playlist_id)
    , FOREIGN KEY (track_id) REFERENCES track_tbl (track_id)
);

CREATE TABLE IF NOT EXISTS music_store_db.invoice_line_tbl (
	invoice_line_id INT NOT NULL PRIMARY KEY
    , invoice_id INT 
    , track_id INT
    , unit_price DECIMAL(10, 2)
    , quantity INT
    
    , FOREIGN KEY (invoice_id) REFERENCES invoice_tbl (invoice_id)
    , FOREIGN KEY (track_id) REFERENCES track_tbl (track_id)
);




-- LOADING DATA INTO TABLES --

LOAD DATA INFILE 'D:\\ProgramData\\MySQL\\MySQL Server 8.3\\Uploads\\Music store dataset\\artist.csv'
	INTO TABLE music_store_db.artist_tbl
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS;
    
LOAD DATA INFILE 'D:\\ProgramData\\MySQL\\MySQL Server 8.3\\Uploads\\Music store dataset\\customer.csv'
	INTO TABLE music_store_db.customer_tbl
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS;
    
LOAD DATA INFILE 'D:\\ProgramData\\MySQL\\MySQL Server 8.3\\Uploads\\Music store dataset\\employee.csv'
	INTO TABLE music_store_db.employee_tbl
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS;
    
LOAD DATA INFILE 'D:\\ProgramData\\MySQL\\MySQL Server 8.3\\Uploads\\Music store dataset\\genre.csv'
	INTO TABLE music_store_db.genre_tbl
	FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS;
    
LOAD DATA INFILE 'D:\\ProgramData\\MySQL\\MySQL Server 8.3\\Uploads\\Music store dataset\\media_type.csv'
	INTO TABLE music_store_db.media_type_tbl
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS;
    
LOAD DATA INFILE 'D:\\ProgramData\\MySQL\\MySQL Server 8.3\\Uploads\\Music store dataset\\playlist.csv'
	INTO TABLE music_store_db.playlist_tbl
	FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS;
    
LOAD DATA INFILE 'D:\\ProgramData\\MySQL\\MySQL Server 8.3\\Uploads\\Music store dataset\\album.csv'
	INTO TABLE music_store_db.album_tbl
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS;
    
LOAD DATA INFILE 'D:\\ProgramData\\MySQL\\MySQL Server 8.3\\Uploads\\Music store dataset\\invoice.csv'
	INTO TABLE music_store_db.invoice_tbl
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS;
    
LOAD DATA INFILE 'D:\\ProgramData\\MySQL\\MySQL Server 8.3\\Uploads\\Music store dataset\\track.csv'
	INTO TABLE music_store_db.track_tbl
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS;
    
LOAD DATA INFILE 'D:\\ProgramData\\MySQL\\MySQL Server 8.3\\Uploads\\Music store dataset\\playlist_track.csv'
	INTO TABLE music_store_db.playlist_track_tbl
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS;
    
LOAD DATA INFILE 'D:\\ProgramData\\MySQL\\MySQL Server 8.3\\Uploads\\Music store dataset\\invoice_line.csv'
	INTO TABLE music_store_db.invoice_line_tbl
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 ROWS;




-- EXPLORATORY DATA ANALYSIS --

SELECT * FROM music_store_db.album_tbl LIMIT 100;
SELECT * FROM music_store_db.artist_tbl LIMIT 100;
SELECT * FROM music_store_db.customer_tbl LIMIT 100;
SELECT * FROM music_store_db.employee_tbl LIMIT 100;
SELECT * FROM music_store_db.genre_tbl LIMIT 100;
SELECT * FROM music_store_db.invoice_line_tbl LIMIT 100;
SELECT * FROM music_store_db.invoice_tbl LIMIT 100;
SELECT * FROM music_store_db.media_type_tbl LIMIT 100;
SELECT * FROM music_store_db.playlist_tbl LIMIT 100;
SELECT * FROM music_store_db.playlist_track_tbl LIMIT 100;
SELECT * FROM music_store_db.track_tbl LIMIT 100;


-- senior most employee based on job title 

SELECT 
	CONCAT(first_name, ' ', last_name) AS full_name
    , title
FROM music_store_db.employee_tbl
ORDER BY
	levels DESC
LIMIT 1;


-- countries have most invoices

SELECT
	billing_country
    , COUNT(billing_country) AS invoice_count
FROM music_store_db.invoice_tbl
GROUP BY
	billing_country 
ORDER BY
	invoice_count DESC;
    

-- top 3 values of total invoice

SELECT
	total
FROM music_store_db.invoice_tbl
ORDER BY
	total DESC
LIMIT 3;


-- city that has highest sum of invoice totals

SELECT
	billing_city
    , SUM(total) AS total
FROM music_store_db.invoice_tbl
GROUP BY
	billing_city
ORDER BY 
	total DESC
LIMIT 1;


-- most spent person

SELECT
	i.customer_id
    , CONCAT(first_name, ' ', last_name) AS full_name
    , SUM(i.total) AS total
FROM music_store_db.invoice_tbl i
	JOIN music_store_db.customer_tbl c ON c.customer_id = i.customer_id
GROUP BY
	customer_id
ORDER BY
	total DESC
LIMIT 1;


-- email, first name, last name, genre of rock music listners alphabetically by email

SELECT
	 DISTINCT c.email
    , c.first_name
    , c.last_name
    , g.name
FROM music_store_db.customer_tbl c
	JOIN music_store_db.invoice_tbl i ON i.customer_id = c.customer_id
	JOIN music_store_db.invoice_line_tbl il ON il.invoice_id = i.invoice_id
	JOIN music_store_db.track_tbl t ON t.track_id = il.track_id
	JOIN music_store_db.genre_tbl g ON g.genre_id = t.genre_id
WHERE
	LCASE(g.name) = 'rock' 
ORDER BY 
	c.email;


-- track names and milliseconds longer than the average song length, order by longer song length

WITH temp_tbl AS (
	SELECT
		name
		, milliseconds AS length
		, AVG(milliseconds) AS avg_length
	FROM music_store_db.track_tbl
	GROUP BY
		name
		, length
)

SELECT
	name
    , length
FROM temp_tbl
WHERE 
	length >= avg_length
ORDER BY 
	length DESC;


-- amount spent on best selling artist by each customer

WITH best_selling_artist AS (
	SELECT
		ar.name AS artist_name
		, ar.artist_id
		, SUM(il.unit_price * il.quantity) AS total
	FROM music_store_db.invoice_line_tbl il
		JOIN music_store_db.track_tbl t ON t.track_id = il.track_id
		JOIN music_store_db.album_tbl al ON al.album_id = t.album_id
		JOIN music_store_db.artist_tbl ar ON ar.artist_id = al.artist_id
	GROUP BY
		artist_name
        , artist_id
	ORDER BY 
		total DESC
	LIMIT 1
)

SELECT
	CONCAT(c.first_name, ' ', c.last_name) AS full_name
    , SUM(il.unit_price * il.quantity) AS spent
FROM music_store_db.customer_tbl c
	JOIN music_store_db.invoice_tbl i ON i.customer_id = c.customer_id
	JOIN music_store_db.invoice_line_tbl il ON il.invoice_id = i.invoice_id
    JOIN music_store_db.track_tbl t ON t.track_id = il.track_id
    JOIN music_store_db.album_tbl al ON al.album_id = t.album_id
    JOIN best_selling_artist bsa ON bsa.artist_id = al.artist_id
GROUP BY
	full_name
ORDER BY
	spent DESC;


-- country with top genre

WITH top_genres AS (
	SELECT
		i.billing_country AS country 
		, g.name AS genre_name
		, COUNT(il.track_id) AS track_sold
        , ROW_NUMBER() OVER(PARTITION BY i.billing_country ORDER BY COUNT(il.track_id) DESC) AS row_num
	FROM music_store_db.invoice_line_tbl il
		JOIN music_store_db.track_tbl t ON t.track_id = il.track_id
		JOIN music_store_db.genre_tbl g ON g.genre_id = t.genre_id
        JOIN music_store_db.invoice_tbl i ON i.invoice_id = il.invoice_id
	GROUP BY
		i.billing_country
        , genre_name
	ORDER BY
		i.billing_country ASC
		, track_sold DESC
)

SELECT 
	country
    , genre_name
    , track_sold
FROM top_genres
WHERE
	row_num = 1;
    
    
-- top most spent customer by country    

WITH top_customers AS (
	SELECT
		c.country
		, CONCAT(c.first_name, ' ', c.last_name) AS full_name
		, SUM(i.total) AS total_spent
		, ROW_NUMBER() OVER(PARTITION BY c.country ORDER BY SUM(i.total) DESC) AS row_num
	FROM music_store_db.customer_tbl c
		JOIN music_store_db.invoice_tbl i ON i.customer_id = c.customer_id
	GROUP BY
		country
		, full_name
	ORDER BY
		country
		, total_spent DESC
)

SELECT
	country
    , full_name
    , total_spent
FROM top_customers
WHERE
	row_num <= 1;
    