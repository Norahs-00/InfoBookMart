-- Create database and switch to it
CREATE DATABASE IF NOT EXISTS infobookmart;
USE infobookmart;

-- USERS table
CREATE TABLE IF NOT EXISTS users (
    userid INT PRIMARY KEY,
    email VARCHAR(100),
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    userName VARCHAR(50),
    role VARCHAR(20),
    accountStatus VARCHAR(20),
    dateOfBirth DATE,
    password VARCHAR(255),
    registerDate DATE,
    profileImg VARCHAR(255),
    contactNo VARCHAR(20),
    gender VARCHAR(10),
    address VARCHAR(100)
);

-- GENRE table
CREATE TABLE IF NOT EXISTS genre (
    genreId INT PRIMARY KEY,
    genreName VARCHAR(50),
    genreType VARCHAR(50)
);

-- BOOKS table
CREATE TABLE IF NOT EXISTS books (
    bookId INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(100),
    language VARCHAR(50),
    publishedYear YEAR,
    isbn VARCHAR(20),
    bookQuantity INT,
    bookImage VARCHAR(255),
    edition VARCHAR(10),
    genreId INT,
    description TEXT,
    price DECIMAL(10,2)
);

-- CART table
CREATE TABLE IF NOT EXISTS cart (
    cartId INT PRIMARY KEY,
    userId INT
);

-- CART ITEMS table
CREATE TABLE IF NOT EXISTS cartitems (
    cartItemId INT PRIMARY KEY,
    cartId INT,
    bookId INT,
    cartQuantity INT
);

-- ORDERS table
CREATE TABLE IF NOT EXISTS orders (
    orderId INT PRIMARY KEY,
    userId INT,
    orderDate DATE,
    orderStatus VARCHAR(20) DEFAULT "pending"
);

-- ORDER ITEMS table
CREATE TABLE IF NOT EXISTS order_items (
    orderItemId INT PRIMARY KEY,
    orderId INT,
    bookId INT,
    orderQuantity INT,
    eachPrice DECIMAL(10,2)
);