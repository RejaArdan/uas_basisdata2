CREATE DATABASE soaluas;
USE soaluas;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255),
    role ENUM('Admin', 'user')
);

-- insert minimal 3 data pengguna
INSERT INTO users (username, password, role) VALUES
('reza', '1504za', 'Admin'),
('Daniel', '123el', 'user'),
('Jakson', '0205kiw', 'user');

CREATE TABLE profiles (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    full_name VARCHAR(100),
    birthdate DATE,
    bio TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- insert minimal 3 data pengguna
INSERT INTO profiles (profile_id, user_id, password, role,) VALUES
('15', '1', '1504za', 'Admin' ),
('20', '2', '123el', 'user'),
('25', '3', '0205kiw', 'user'),
CREATE TABLE post (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(255), 
    content VARCHAR(255),
    created_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- insert minimal 3 data pengguna
INSERT INTO post (user_id, title, content, created_at) VALUES
('1', 'Pohon Kehidupan', 'Edukasi', NOW()),
('2', 'Melodi Hujan', 'Horor', NOW()),
('3', 'Kisah Bintang', 'Komedi', NOW());


CREATE TABLE comments (
	comment_id INT AUTO_INCREMENT PRIMARY KEY,
	post_id VARCHAR(50) UNIQUE,
	user_id VARCHAR(255), 
	comment_text VARCHAR(255),
	commented_at VARCHAR (255),
	FOREIGN KEY (post_id) REFERENCES posts(post_id)
	FOREIGN KEY (user_id) REFERENCES users(id)
);

-- insert minimal 3 data pengguna
INSERT INTO post (comment_id, post_id, user_id, comment_text,commented_at) VALUES
('250', '5', '1', 'akut mendapatkan pengalaman', 'internet'),
('252', '4', '2', 'Aku Sangat Ketakutan ', 'Horor', 'Buku'),
('253', '2', '3', 'Sangat lucu Sekali WkWKWKWK','Novel'),

SELECT po.content, c.content_text
FROM posts po 
LEFT JOIN comments c ON po.post_id = c.post_id