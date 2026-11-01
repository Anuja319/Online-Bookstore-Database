
USE online_bookstore;

-- 1.Insert customers
INSERT INTO users (full_name, email)
VALUES
    ('Anuja Kokitkar', 'anuja@example.com'),
    ('Rahul Patil', 'rahul@example.com');

-- 2.Insert categories
INSERT INTO categories (category_name)
VALUES
    ('Programming'),
    ('Database'),
    ('Web Development');

-- 3.Insert books
INSERT INTO books
    (title, isbn, price, stock_quantity, category_id)
VALUES
    ('Learning Python', '9781000000001', 500.00, 20, 1),
    ('SQL Fundamentals', '9781000000002', 350.00, 15, 2),
    ('HTML and CSS Basics', '9781000000003', 400.00, 10, 3);

-- 4.Insert authors
INSERT INTO authors (author_name)
VALUES
    ('Amit Sharma'),
    ('Priya Desai');

-- 5.Connect books and authors
INSERT INTO book_authors (book_id, author_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (3, 2);

-- 6.Insert orders
INSERT INTO orders (user_id, status)
VALUES
    (1, 'Confirmed'),
    (2, 'Pending');

-- 7.Insert order items
INSERT INTO order_items
    (order_id, book_id, quantity, unit_price)
VALUES
    (1, 1, 1, 500.00),
    (1, 2, 2, 350.00),
    (2, 3, 1, 400.00);

