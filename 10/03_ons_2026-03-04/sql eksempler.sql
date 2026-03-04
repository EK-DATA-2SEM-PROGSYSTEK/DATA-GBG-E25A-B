-- create database depemp;
/*
use depemp;
drop table if exists employee;
drop table if exists department;
*/
CREATE TABLE if not exists department (
    dept_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE employee (
    emp_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    salary DECIMAL(10,2) DEFAULT 0,
    dept_id INT,
    PRIMARY KEY (emp_id),
    FOREIGN KEY (dept_id)
        REFERENCES department(dept_id)
);

-- Indsæt afdelinger først (pga. FK)
INSERT INTO department (dept_id, name) VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'Finance'),
(40, 'Marketing'),
(50, 'Operations');

drop table employee;

-- Indsæt medarbejdere
INSERT INTO employee (name, age, email, dept_id) VALUES
('Mads Jensen', 34, 'mads.jensen@company.dk', 20),
('Sofie Larsen', 29, 'sofie.larsen@company.dk', 10),
('Jonas Holm', 41, 'jonas.holm@company.dk', 30),
('Emma Nielsen', 25, 'emma.nielsen@company.dk', 40),
('Frederik Olsen', 38, 'frederik.olsen@company.dk', 20),
('Laura Pedersen', 31, 'laura.pedersen@company.dk', 50),
('Anders Mikkelsen', 45, 'anders.mikkelsen@company.dk', 30),
('Ida Christensen', 27, 'ida.christensen@company.dk', 10),
('William Rasmussen', 52, 'william.rasmussen@company.dk', 50),
('Clara Mortensen', 23, 'clara.mortensen@company.dk', 40);


