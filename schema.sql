CREATE DATABASE online_bookstore;

USE online_bookstore;

-- 1. Users table 
CREATE TABLE users ( 
user_id INT AUTO_INCREMENT PRIMARY KEY, 
full_name VARCHAR(100) NOT NULL, 
email VARCHAR(150) NOT NULL UNIQUE, 
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
); 

-- 2. Categories table 
CREATE TABLE categories ( 
category_id INT AUTO_INCREMENT PRIMARY KEY, 
category_name VARCHAR(100) NOT NULL UNIQUE 
); 

-- 3. Books table 
CREATE TABLE books ( 
book_id INT AUTO_INCREMENT PRIMARY KEY, 
title VARCHAR(200) NOT NULL, 
isbn VARCHAR(20) NOT NULL UNIQUE, 
price DECIMAL(10, 2) NOT NULL, 
stock_quantity INT NOT NULL DEFAULT 0, 
category_id INT NOT NULL, 

CONSTRAINT chk_book_price 
CHECK (price >= 0), 

CONSTRAINT chk_book_stock 
CHECK (stock_quantity >= 0), 

CONSTRAINT fk_book_category 
FOREIGN KEY (category_id) 
REFERENCES categories(category_id) 
ON DELETE RESTRICT );

-- 4. Authors table 
CREATE TABLE authors ( 
author_id INT AUTO_INCREMENT PRIMARY KEY, 
author_name VARCHAR(150) NOT NULL 
); 

-- 5. Book-Authors junction table 
CREATE TABLE book_authors ( 
book_id INT NOT NULL, 
author_id INT NOT NULL, 

PRIMARY KEY (book_id, author_id), 

CONSTRAINT fk_book_authors_book 
FOREIGN KEY (book_id) 
REFERENCES books(book_id) 
ON DELETE CASCADE, 

CONSTRAINT fk_book_authors_author 
FOREIGN KEY (author_id) 
REFERENCES authors(author_id) 
ON DELETE CASCADE 
); 

-- 6. Orders table 
CREATE TABLE orders ( 
order_id INT AUTO_INCREMENT PRIMARY KEY, 
user_id INT NOT NULL, 
order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
status VARCHAR(20) NOT NULL DEFAULT 'Pending', 

CONSTRAINT chk_order_status 
CHECK ( 
status IN ( 
'Pending', 'Confirmed', 'Shipped', 'Delivered', 'Cancelled' 
) 
), 

CONSTRAINT fk_order_user 
FOREIGN KEY (user_id) 
REFERENCES users(user_id) 
ON DELETE RESTRICT, 
INDEX idx_orders_user_date (user_id, order_date
) 
); 

-- 7. Order Items table 
CREATE TABLE order_items ( 
order_item_id INT AUTO_INCREMENT PRIMARY KEY, 
order_id INT NOT NULL, 
book_id INT NOT NULL, 
quantity INT NOT NULL, 
unit_price DECIMAL(10, 2) NOT NULL, 

CONSTRAINT chk_item_quantity 
CHECK (quantity > 0), 

CONSTRAINT chk_item_price 
CHECK (unit_price >= 0), 

CONSTRAINT fk_order_item_order 
FOREIGN KEY (order_id) 
REFERENCES orders(order_id) 
ON DELETE CASCADE, 

CONSTRAINT fk_order_item_book 
FOREIGN KEY (book_id) 
REFERENCES books(book_id) 
ON DELETE RESTRICT, 

UNIQUE KEY uq_order_book (order_id, book_id), 

INDEX idx_order_items_book (book_id) 

);

