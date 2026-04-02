USE car_rental;

-- USERS
INSERT INTO users (USERNAME, EMAIL, password, legal_name, drivers_license, phone_number, role, EMPLOYEE_ID) VALUES
('john_doe', 'john@example.com', 'pass123', 'John Doe', 'D1234567', '09171234567', 'customer', NULL),
('mary_smith', 'mary@example.com', 'pass123', 'Mary Smith', 'D7654321', '09179876543', 'customer', NULL),
('admin_user', 'admin@example.com', 'admin123', 'Admin User', NULL, '09170000000', 'admin', 'EMP001'),
('alex_tan', 'alex@example.com', 'pass123', 'Alex Tan', 'D1112223', '09175554444', 'customer', NULL),
('lisa_chen', 'lisa@example.com', 'pass123', 'Lisa Chen', 'D4445556', '09176667777', 'customer', NULL);

-- BOOKINGS
INSERT INTO bookings (username, car_id, start_date, end_date, rental_days, total_amount, total_price, payment_method) VALUES
('john_doe', 1, '2026-04-01', '2026-04-03', 2, 5000.00, 5000.00, 'card'),
('mary_smith', 3, '2026-04-05', '2026-04-08', 3, 13500.00, 13500.00, 'cash'),
('alex_tan', 2, '2026-04-10', '2026-04-12', 2, 5400.00, 5400.00, 'card'),
('lisa_chen', 4, '2026-04-15', '2026-04-18', 3, 6600.00, 6600.00, 'card'),
('john_doe', 5, '2026-04-20', '2026-04-22', 2, 9600.00, 9600.00, 'cash'); 
-- RENTALS
INSERT INTO rentals (car_id, username, start_date, end_date, total_price, payment_method) VALUES
(1, 'john_doe', '2026-04-01', '2026-04-03', 5000.00, 'card'),
(3, 'mary_smith', '2026-04-05', '2026-04-08', 13500.00, 'cash'),
(2, 'alex_tan', '2026-04-10', '2026-04-12', 5400.00, 'card'),
(4, 'lisa_chen', '2026-04-15', '2026-04-18', 6600.00, 'card'),
(5, 'john_doe', '2026-04-20', '2026-04-22', 9600.00, 'cash');

-- USER CARDS
INSERT INTO user_cards (username, card_number, expiry_date, cvv, balance) VALUES
('john_doe', '4111111111111111', '12/27', '123', 20000.00),
('mary_smith', '4222222222222222', '11/26', '456', 15000.00),
('alex_tan', '4333333333333333', '09/28', '789', 10000.00),
('lisa_chen', '4444444444444444', '03/27', '321', 18000.00);

-- CARS
INSERT INTO cars (brand, model, rating, image_path, available, description, type, price_per_day, seats, fuel_type, is_deleted)
VALUES
('Ford', 'Everest', 4.8, 'ford_everest.png', 1, 'Spacious SUV suitable for family trips and off-road driving.', 'SUV', 4800.00, 7, 'Diesel', 0),
('Honda', 'Civic', 4.7, 'honda_civic.png', 1, 'Stylish sedan with excellent fuel efficiency and comfort.', 'Sedan', 3500.00, 5, 'Gasoline', 0),
('Nissan', 'Razer', 4.3, 'nissan_razer.png', 1, 'Compact vehicle ideal for city driving.', 'Hatchback', 2200.00, 5, 'Gasoline', 0),
('Nissan', 'Rogue', 4.6, 'nissan_rogue.png', 1, 'Modern crossover SUV with advanced safety features.', 'SUV', 4200.00, 5, 'Gasoline', 0),
('Nissan', 'Z Proto', 4.9, 'nissan_z_proto.png', 1, 'High-performance sports car with aggressive styling.', 'Sports', 6500.00, 2, 'Gasoline', 0),
('Toyota', 'Hilux', 4.8, 'toyota_hilux.png', 1, 'Reliable pickup truck designed for heavy-duty tasks.', 'Pickup', 4500.00, 5, 'Diesel', 0),
('Toyota', 'Veloz', 4.5, 'toyota_veloz.png', 1, 'Family-friendly MPV with spacious interior.', 'MPV', 3800.00, 7, 'Gasoline', 0),
('Toyota', 'Wigo', 4.2, 'toyota_wigo.png', 1, 'Affordable compact hatchback perfect for daily use.', 'Hatchback', 2000.00, 5, 'Gasoline', 0);