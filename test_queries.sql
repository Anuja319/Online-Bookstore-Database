-- ==========================================
-- ONLINE BOOKSTORE DATABASE
-- TEST QUERIES
-- ==========================================

USE online_bookstore;


-- 1. DISPLAY ALL TABLES

SHOW TABLES;


-- 2. DISPLAY ALL USERS

SELECT * FROM users;


-- 3. DISPLAY ALL CATEGORIES

SELECT * FROM categories;


-- 4. DISPLAY ALL BOOKS

SELECT * FROM books;


-- 5. DISPLAY BOOKS WITH CATEGORY NAMES

SELECT
    b.book_id,
    b.title,
    b.price,
    c.category_name
FROM books b
INNER JOIN categories c
ON b.category_id = c.category_id;


-- 6. DISPLAY BOOKS WITH AUTHORS

SELECT
    b.title,
    a.author_name
FROM books b
INNER JOIN book_authors ba
ON b.book_id = ba.book_id
INNER JOIN authors a
ON ba.author_id = a.author_id;


-- 7. DISPLAY CUSTOMER ORDERS

SELECT
    o.order_id,
    u.full_name,
    o.order_date,
    o.status
FROM orders o
INNER JOIN users u
ON o.user_id = u.user_id;


-- 8. CALCULATE TOTAL ORDER AMOUNT

SELECT
    o.order_id,
    u.full_name,
    SUM(oi.quantity * oi.unit_price) AS total_amount
FROM orders o
INNER JOIN users u
ON o.user_id = u.user_id
INNER JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id, u.full_name;


-- 9. VERIFY PRIMARY KEYS

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'online_bookstore'
AND CONSTRAINT_NAME = 'PRIMARY';


-- 10. VERIFY FOREIGN KEYS

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'online_bookstore'
AND REFERENCED_TABLE_NAME IS NOT NULL;


-- 11. VERIFY INDEXES

SHOW INDEX FROM books;

SHOW INDEX FROM orders;

SHOW INDEX FROM order_items;


-- ==========================================
-- END OF TEST QUERIES
-- ==========================================