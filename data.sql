-- Active: 1736310837360@@127.0.0.1@3306@blogs


-- Author Insert 
INSERT INTO authors (author_name) VALUES
('John Doe'),
('Rahim'),
('Rahul'),
('Smith'),
('Jane Doe');

-- Category Insert
INSERT INTO categories(category_name) VALUES
('Technology'),
('Sports'),
('Entertainment'),
('Business'),
('Politics');


--Blogs insert
INSERT INTO blogs(title,body,category_id,author_id) VALUES
('Blog 1','This is a blog 1',1,1),
('Blog 2','This is a blog 2',2,1),
('Blog 3','This is a blog 3',3,2),
('Blog 4','This is a blog 4',4,3),
('Blog 5','This is a blog 5',5,4);
