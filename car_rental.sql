Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 32
Server version: 12.2.2-MariaDB MariaDB Server

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| apidb              |
| car_rental_db      |
| dbsample           |
| drivedash_db       |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| test               |
+--------------------+
9 rows in set (0.01 sec)

mysql> DESCRIBE car_rental_db
    -> ^C
mysql> DESCRIBE car_rental_db;
ERROR 1046 (3D000): No database selected
mysql> USE car_rental_db;
Database changed
mysql> SHOW TABLES;
+-------------------------+
| Tables_in_car_rental_db |
+-------------------------+
| bookings                |
| cars                    |
| users                   |
+-------------------------+
3 rows in set (0.00 sec)

mysql> DESCRIBE users;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id       | int(11)      | NO   | PRI | NULL    | auto_increment |
| username | varchar(100) | YES  | UNI | NULL    |                |
| email    | varchar(150) | YES  |     | NULL    |                |
| password | varchar(255) | YES  |     | NULL    |                |
| role     | varchar(20)  | YES  |     | USER    |                |
+----------+--------------+------+-----+---------+----------------+
5 rows in set (0.04 sec)

mysql> DROP DATABASE car_rental_db;
Query OK, 3 rows affected (0.03 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| apidb              |
| dbsample           |
| drivedash_db       |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| test               |
+--------------------+
8 rows in set (0.00 sec)

mysql> CREATE DATABASE IF NOT EXISTS car_rental;
Query OK, 1 row affected (0.00 sec)

mysql> USE car_rental;
Database changed
mysql> CREATE TABLE users (
    ->     ID INT AUTO_INCREMENT PRIMARY KEY,
    ->     USERNAME VARCHAR(50) NOT NULL UNIQUE,
    ->     EMAIL VARCHAR(200) NOT NULL,
    ->     password VARCHAR(50) NOT NULL,
    ->     legal_name VARCHAR(100),
    ->     drivers_license VARCHAR(50),
    ->     phone_number VARCHAR(20),
    ->     role VARCHAR(10) DEFAULT 'USER',
    ->     employee_id VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> DROP DATABASE car_rental;
Query OK, 1 row affected (0.01 sec)

mysql> CREATE DATABASE IF NOT EXISTS car_rental;
Query OK, 1 row affected (0.00 sec)

mysql> CREATE TABLE users (
    ->     ID INT AUTO_INCREMENT PRIMARY KEY,
    ->     USERNAME VARCHAR(50) NOT NULL UNIQUE,
    ->     EMAIL VARCHAR(200) NOT NULL,
    ->     password VARCHAR(50) NOT NULL,
    ->     legal_name VARCHAR(100),
    ->     drivers_license VARCHAR(50),
    ->     phone_number VARCHAR(20),
    ->     role VARCHAR(10) DEFAULT 'USER',
    ->     EMPLOYEE_ID VARCHAR(50)
    -> );
ERROR 1046 (3D000): No database selected
mysql> USE car_rental;
Database changed
mysql> CREATE TABLE users (
    ->     ID INT AUTO_INCREMENT PRIMARY KEY,
    ->     USERNAME VARCHAR(50) NOT NULL UNIQUE,
    ->     EMAIL VARCHAR(200) NOT NULL,
    ->     password VARCHAR(50) NOT NULL,
    ->     legal_name VARCHAR(100),
    ->     drivers_license VARCHAR(50),
    ->     phone_number VARCHAR(20),
    ->     role VARCHAR(10) DEFAULT 'USER',
    ->     EMPLOYEE_ID VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> USE car_rental;
Database changed
mysql> SHOW users;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'users' at line 1
mysql> SELECT * FROM users;
Empty set (0.02 sec)

mysql> CREATE DATABASE IF NOT EXISTS car_userDashboard;
Query OK, 1 row affected (0.00 sec)

mysql> USE car_userDashboard;
Database changed
mysql> CREATE TABLE cars (
    ->     id         INT AUTO_INCREMENT PRIMARY KEY,
    ->     brand      VARCHAR(50)  NOT NULL,
    ->     model      VARCHAR(50)  NOT NULL,
    ->     rating     DOUBLE       NOT NULL DEFAULT 4.0,
    ->     image_path VARCHAR(255),
    ->     available  BOOLEAN DEFAULT TRUE
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE bookings (
    ->     id         INT AUTO_INCREMENT PRIMARY KEY,
    ->     username   VARCHAR(100) NOT NULL,
    ->     car_id     INT          NOT NULL,
    ->     start_date DATE         NOT NULL,
    ->     end_date   DATE         NOT NULL,
    ->     booked_at  TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    ->     FOREIGN KEY (car_id) REFERENCES cars(id)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> CREATE TABLE bookings (
    ->     id           INT AUTO_INCREMENT PRIMARY KEY,
    ->     username     VARCHAR(100) NOT NULL,
    ->     car_id       INT          NOT NULL,
    ->     start_date   DATE         NOT NULL,
    ->     end_date     DATE         NOT NULL,
    ->     rental_days  INT          NOT NULL DEFAULT 1,
    ->     total_amount DOUBLE       NOT NULL DEFAULT 0.0,
    ->     booked_at    TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    ->     FOREIGN KEY (car_id) REFERENCES cars(id)
    -> );
ERROR 1050 (42S01): Table 'bookings' already exists
mysql> DROP car_userDashboard;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'car_userDashboard' at line 1
mysql> DROP database car_userDashboard;
Query OK, 2 rows affected (0.03 sec)

mysql> CREATE DATABASE IF NOT EXISTS car_userDashboard;
Query OK, 1 row affected (0.00 sec)

mysql> USE car_userDashboard;
Database changed
mysql> CREATE TABLE cars (
    ->     id         INT AUTO_INCREMENT PRIMARY KEY,
    ->     brand      VARCHAR(50)  NOT NULL,
    ->     model      VARCHAR(50)  NOT NULL,
    ->     rating     DOUBLE       NOT NULL DEFAULT 4.0,
    ->     image_path VARCHAR(255),
    ->     available  BOOLEAN DEFAULT TRUE
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE bookings (
    ->     id           INT AUTO_INCREMENT PRIMARY KEY,
    ->     username     VARCHAR(100) NOT NULL,
    ->     car_id       INT          NOT NULL,
    ->     start_date   DATE         NOT NULL,
    ->     end_date     DATE         NOT NULL,
    ->     rental_days  INT          NOT NULL DEFAULT 1,
    ->     total_amount DOUBLE       NOT NULL DEFAULT 0.0,
    ->     booked_at    TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    ->     FOREIGN KEY (car_id) REFERENCES cars(id)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> INSERT INTO cars (brand, model, rating, image_path) VALUES
    -> ('Toyota','Veloz',  4.0, 'toyota_veloz.png'),
    -> ('Honda', 'Civic',  4.7, 'honda_civic.png'),
    -> ('Ford',  'Everest',4.9, 'ford_everest.png'),
    -> ('Nissan','Z Proto',5.0, 'nissan_z_proto.png'),
    -> ('Nissan','Rogue',  4.6, 'nissan_rogue.png'),
    -> ('Nissan','Razer',  4.3, 'nissan_razer.png'),
    -> ('Toyota','Hilux',  4.2, 'toyota_hilux.png'),
    -> ('Toyota','Wigo',   3.4, 'toyota_wigo.png');
Query OK, 8 rows affected (0.00 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> DROP Database car_userDashboard;
Query OK, 2 rows affected (0.01 sec)

mysql> use car_rental;
Database changed
mysql> CREATE TABLE IF NOT EXISTS cars (
    ->     id         INT AUTO_INCREMENT PRIMARY KEY,
    ->     brand      VARCHAR(50)  NOT NULL,
    ->     model      VARCHAR(50)  NOT NULL,
    ->     rating     DOUBLE       NOT NULL DEFAULT 4.0,
    ->     image_path VARCHAR(255),
    ->     available  BOOLEAN DEFAULT TRUE
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> INSERT INTO cars (brand, model, rating, image_path) VALUES
    -> ('Toyota','Veloz',  4.0, 'toyota_veloz.png'),
    -> ('Honda', 'Civic',  4.7, 'honda_civic.png'),
    -> ('Ford',  'Everest',4.9, 'ford_everest.png'),
    -> ('Nissan','Z Proto',5.0, 'nissan_z_proto.png'),
    -> ('Nissan','Rogue',  4.6, 'nissan_rogue.png'),
    -> ('Nissan','Razer',  4.3, 'nissan_razer.png'),
    -> ('Toyota','Hilux',  4.2, 'toyota_hilux.png'),
    -> ('Toyota','Wigo',   3.4, 'toyota_wigo.png');
Query OK, 8 rows affected (0.00 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE IF NOT EXISTS bookings (
    ->     id           INT AUTO_INCREMENT PRIMARY KEY,
    ->     username     VARCHAR(100) NOT NULL,
    ->     car_id       INT          NOT NULL,
    ->     start_date   DATE         NOT NULL,
    ->     end_date     DATE         NOT NULL,
    ->     rental_days  INT          NOT NULL DEFAULT 1,
    ->     total_amount DOUBLE       NOT NULL DEFAULT 0.0,
    ->     booked_at    TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    ->     FOREIGN KEY (car_id) REFERENCES cars(id)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> DESCRIBE bookings;
+--------------+--------------+------+-----+---------------------+----------------+
| Field        | Type         | Null | Key | Default             | Extra          |
+--------------+--------------+------+-----+---------------------+----------------+
| id           | int(11)      | NO   | PRI | NULL                | auto_increment |
| username     | varchar(100) | NO   |     | NULL                |                |
| car_id       | int(11)      | NO   | MUL | NULL                |                |
| start_date   | date         | NO   |     | NULL                |                |
| end_date     | date         | NO   |     | NULL                |                |
| rental_days  | int(11)      | NO   |     | 1                   |                |
| total_amount | double       | NO   |     | 0                   |                |
| booked_at    | timestamp    | YES  |     | current_timestamp() |                |
+--------------+--------------+------+-----+---------------------+----------------+
8 rows in set (0.07 sec)

mysql> ALTER TABLE bookings ADD COLUMN total_price DOUBLE;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE IF NOT EXISTS user_cards (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     username VARCHAR(50),
    ->     card_number VARCHAR(16) NOT NULL,
    ->     expiry_date VARCHAR(5) NOT NULL, -- Format MM/YY
    ->     cvv VARCHAR(3) NOT NULL,
    ->     balance DOUBLE DEFAULT 1000.00,
    ->     FOREIGN KEY (username) REFERENCES users(username)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> ALTER TABLE bookings ADD COLUMN IF NOT EXISTS total_price DOUBLE;
Query OK, 0 rows affected, 1 warning (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> ALTER TABLE bookings ADD COLUMN IF NOT EXISTS payment_method VARCHAR(20);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO user_cards (username, card_number, expiry_date, cvv, balance)
    -> VALUES ('admin', '1234567812345678', '12/26', '123', 5000.00);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`car_rental`.`user_cards`, CONSTRAINT `1` FOREIGN KEY (`username`) REFERENCES `users` (`USERNAME`))
mysql> VALUES ('admin', '1234567812345678', '12/26', '123', 5000.00);
+-------+------------------+-------+-----+---------+
| admin | 1234567812345678 | 12/26 | 123 | 5000.00 |
+-------+------------------+-------+-----+---------+
| admin | 1234567812345678 | 12/26 | 123 | 5000.00 |
+-------+------------------+-------+-----+---------+
1 row in set (0.00 sec)

mysql> VALUES ('admin1', '1234567812345678', '12/26', '123', 5000.00);
+--------+------------------+-------+-----+---------+
| admin1 | 1234567812345678 | 12/26 | 123 | 5000.00 |
+--------+------------------+-------+-----+---------+
| admin1 | 1234567812345678 | 12/26 | 123 | 5000.00 |
+--------+------------------+-------+-----+---------+
1 row in set (0.00 sec)

mysql> CREATE TABLE IF NOT EXISTS user_cards (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     username VARCHAR(50),
    ->     card_number VARCHAR(16) NOT NULL,
    ->     expiry_date VARCHAR(5) NOT NULL, -- Format MM/YY
    ->     cvv VARCHAR(3) NOT NULL,
    ->     balance DOUBLE DEFAULT 1000.00,
    ->     FOREIGN KEY (username) REFERENCES users(username)
    -> );
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> ALTER TABLE bookings ADD COLUMN IF NOT EXISTS total_price DOUBLE;
Query OK, 0 rows affected, 1 warning (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> ALTER TABLE bookings ADD COLUMN IF NOT EXISTS payment_method VARCHAR(20);
Query OK, 0 rows affected, 1 warning (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> INSERT INTO user_cards (username, card_number, expiry_date, cvv, balance)
    -> VALUES ('Sophia202', '1234567812345678', '12/26', '123', 5000.00);
Query OK, 1 row affected (0.00 sec)

mysql> UPDATE users SET role = 'USER' WHERE USERNAME = 'YourUsername';
Query OK, 0 rows affected (0.01 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> CREATE TABLE rentals (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     car_id INT,
    ->     username VARCHAR(50),
    ->     start_date DATE,
    ->     end_date DATE,
    ->     total_price DECIMAL(10,2),
    ->     payment_method VARCHAR(20),
    ->     FOREIGN KEY (car_id) REFERENCES cars(id)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE IF NOT EXISTS cars (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     brand VARCHAR(50),
    ->     model VARCHAR(50),
    ->     rating DECIMAL(3,1),
    ->     image_path VARCHAR(255),
    ->     available BOOLEAN DEFAULT TRUE
    -> );
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> UPDATE cars SET image_path = 'tesla.png' WHERE brand = 'Tesla';
Query OK, 0 rows affected (0.02 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> UPDATE cars SET image_path = 'bmw.png' WHERE brand = 'BMW';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> CREATE TABLE IF NOT EXISTS rentals (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     car_id INT NOT NULL,
    ->     username VARCHAR(50) NOT NULL,
    ->     start_date DATE NOT NULL,
    ->     end_date DATE NOT NULL,
    ->     total_price DECIMAL(10, 2) NOT NULL,
    ->     payment_method VARCHAR(50),
    ->     rental_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ->     FOREIGN KEY (car_id) REFERENCES cars(id)
    -> );
Query OK, 0 rows affected, 1 warning (0.02 sec)

mysql> SELECT * FROM rentals;
Empty set (0.02 sec)

mysql> -- This resets every car to be bookable
mysql> UPDATE cars SET available = TRUE;
Query OK, 9 rows affected (0.02 sec)
Rows matched: 9  Changed: 9  Warnings: 0

mysql> ALTER TABLE cars
    -> ADD COLUMN description TEXT,
    -> ADD COLUMN type VARCHAR(50),
    -> ADD COLUMN price_per_day DECIMAL(10,2);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE cars
    -> ADD COLUMN type VARCHAR(50) DEFAULT 'Sedan',
    -> ADD COLUMN price_per_day DECIMAL(10,2) DEFAULT 55.00,
    -> ADD COLUMN description TEXT;
ERROR 1060 (42S21): Duplicate column name 'type'