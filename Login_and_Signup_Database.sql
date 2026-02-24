CREATE DATABASE car_rental;

USE car_rental;

CREATE TABLE users (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    USERNAME VARCHAR(50) NOT NULL UNIQUE,
    EMAIL VARCHAR(200) NOT NULL,
    password VARCHAR(50) NOT NULL,
    legal_name VARCHAR(100),
    drivers_license VARCHAR(50),
    phone_number VARCHAR(20),
    role VARCHAR(10) DEFAULT 'USER',
    employee_id VARCHAR(50)
)

