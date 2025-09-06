-- MySQL Database Setup for gscomp268
-- Task 1: Create database and import data

-- Create database
CREATE DATABASE IF NOT EXISTS gscomp268;
USE gscomp268;

-- Create a sample table (replace with actual table from backup file)
CREATE TABLE IF NOT EXISTS students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    index_no VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data (replace with actual data from backup file)
INSERT INTO students (name, index_no) VALUES 
('Priyamal G.A.N.', 'gscomp268'),
('Sample Student 1', 'gscomp001'),
('Sample Student 2', 'gscomp002');

-- Show the created data
SELECT * FROM students;
