-- Active: 1736310837360@@127.0.0.1@3306@blogs
-- Create database
CREATE DATABASE blogs;


-- Create Author table 
CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create Categories table 
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create Blogs table 
CREATE TABLE blogs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    category_id INT NOT NULL,
    author_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE ON UPDATE CASCADE
);




-----CRUD Operations----

--Insert Data into Authors table
INSERT INTO authors (author_name) VALUES ('Adam Smith');

--Retrieve all Author data 
SELECT * FROM authors;

--Retrieve specific author by there id 
SELECT * FROM authors WHERE id = 1;

--Update Specific author  
UPDATE authors SET author_name = "James Smith" WHERE id = 1;

--Delete Specific author 
DELETE FROM authors WHERE id = 2;


---------------- Category Table query------------------

--Insert Data into Categories table
INSERT INTO categories (category_name) VALUES ('Programming');

--Retrieve All category 
SELECT * FROM categories;

--Retrieve Specific category by id
SELECT * FROM categories WHERE id = 3;

--Update Specific category
UPDATE categories SET category_name = "Tech" WHERE id = 1;

--Delete Specific category
DELETE FROM categories WHERE id = 2;



----------- Blogs Table queries ---------------

--Insert Data into Blogs table
INSERT INTO blogs (title, body, category_id, author_id) VALUES
('This is my blog', 'This is my blog content',2, 3)

-- Retrieve all blogs
SELECT * FROM blogs;

--Retrieve Specific blog by id
SELECT * FROM blogs WHERE id = 4;

--Retrieve all blogs with category and author information 

SELECT title,body, categories.category_name, authors.author_name
FROM blogs
JOIN categories on blogs.category_id = categories.id
JOIN authors on blogs.author_id = authors.id;


--Update blogs title 
UPDATE blogs SET title = "This is first Blog" WHERE id = 1;

--Update blogs category and author
UPDATE blogs SET category_id = 3, author_id = 1 WHERE id = 1;

--Delete blog by id 
DELETE FROM blogs WHERE id = 1;

--Retrieve Blogs by specific author 
SELECT authors.author_name, blogs.title, blogs.body
FROM blogs
JOIN authors ON blogs.author_id = authors.id
WHERE authors.id = 3;

--Retrieve Blogs by specific category

SELECT categories.category_name, blogs.title, blogs.body
FROM blogs
JOIN categories on blogs.category_id = categories.id
WHERE categories.category_name = "Politics";
