CREATE DATABASE IF NOT EXISTS student_registration;
USE student_registration;

CREATE TABLE IF NOT EXISTS students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    course VARCHAR(100) NOT NULL,
    gender VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Optional sample data
-- INSERT INTO students (name, email, phone, course, gender)
-- VALUES ('Rahul Kumar', 'rahul@example.com', '9876543210', 'Computer Science', 'Male');
