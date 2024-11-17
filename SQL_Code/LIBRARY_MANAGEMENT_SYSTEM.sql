-- Create Database
CREATE DATABASE library;

-- Use the library database
USE library;

-- Create Branch Table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- Create Employee Table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Create Books Table
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3),  -- 'yes' if available, 'no' if not available
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

-- Create Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- Create IssueStatus Table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issue_date DATE,
    ISBN_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (ISBN_book) REFERENCES Books(ISBN)
);

-- Create ReturnStatus Table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_date DATE,
    ISBN_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (ISBN_book2) REFERENCES Books(ISBN)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES 
(11, 101, '123 Main St, City, ABC', '123-456-7890'),
(22, 102, '456 Oak Rd, Town, DEF', '234-567-8901'),
(33, 103, '789 Pine Blvd, Village, GHI', '345-678-9012'),
(44, 104, '101 Maple Ave, City, JKL', '456-789-0123'),
(55, 105, '202 Birch Ln, Suburb, MNO', '567-890-1234');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES 
(2001, 'John Doe', 'Manager', 60000.00, 11),
(2002, 'Alice Smith', 'Assistant Manager', 45000.00, 22),
(2003, 'Robert Johnson', 'Clerk', 35000.00, 33),
(2004, 'Mary Williams', 'Manager', 70000.00, 44),
(2005, 'James Brown', 'Assistant Clerk', 30000.00, 55),
(2006, 'Emily Davis', 'Manager', 65000.00, 22),
(2007, 'Michael Wilson', 'Clerk', 33000.00, 11),
(2008, 'Linda Clark', 'Assistant Manager', 48000.00, 33),
(2009, 'David Lewis', 'Clerk', 32000.00, 44),
(2010, 'Patricia Harris', 'Manager', 75000.00, 55);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
(11111, 'Introduction to Python', 'Programming', 30.00, 'yes', 'John Smith', 'TechBooks'),
(22222, 'Advanced Java Programming', 'Programming', 40.00, 'yes', 'Emily Davis', 'CodePress'),
(33333, 'Data Structures and Algorithms', 'Programming', 35.00, 'no', 'Michael Green', 'LearnTech'),
(44444, 'The Great Gatsby', 'Literature', 25.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
(55555, 'Modern Art of Painting', 'Art', 50.00, 'yes', 'Anna Bell', 'ArtWorld'),
(66666, 'History of Ancient Civilizations', 'History', 45.00, 'no', 'William Harris', 'HistoryBooks'),
(77777, 'Digital Marketing 101', 'Business', 20.00, 'yes', 'Paul Walker', 'BizPress'),
(88888, 'Psychology of Human Behavior', 'Psychology', 30.00, 'yes', 'Linda Black', 'MindBooks'),
(99999, 'The Catcher in the Rye', 'Literature', 15.00, 'no', 'J.D. Salinger', 'Little Brown'),
(10101, 'The Art of Computer Programming', 'Programming', 60.00, 'yes', 'Donald Knuth', 'TechWorld');

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES 
(1001, 'Bob Brown', '456 Oak Rd, Townsville', '2022-02-20'),
(1002, 'Charlie Davis', '789 Pine Ave, Villageburg', '2022-03-05'),
(1003, 'David Green', '101 Maple St, Suburbia', '2022-04-18'),
(1004, 'Eve White', '202 Birch Ln, Countrytown', '2022-05-10'),
(1005, 'Frank Black', '303 Cedar Blvd, Metrocity', '2022-06-25'),
(1006, 'Grace Blue', '404 Willow Rd, Lakeview', '2022-07-30'),
(1007, 'Alice Johnson', '123 Elm St, Cityville', '2022-01-15');

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issue_date, ISBN_book)
VALUES 
(1, 1001, '2023-01-10', 11111),  -- Customer 1001 issued Book 11111 (Introduction to Python)
(2, 1002, '2023-02-15', 22222),  -- Customer 1002 issued Book 22222 (Advanced Java Programming)
(3, 1003, '2023-03-01', 44444),  -- Customer 1003 issued Book 44444 (The Great Gatsby)
(4, 1004, '2023-04-10', 55555),  -- Customer 1004 issued Book 55555 (Modern Art of Painting)
(5, 1005, '2023-05-20', 77777),  -- Customer 1005 issued Book 77777 (Digital Marketing 101)
(6, 1006, '2023-06-05', 88888),  -- Customer 1006 issued Book 88888 (Psychology of Human Behavior)
(7, 1007, '2023-07-25', 99999);  -- Customer 1007 issued Book 10101 (The Art of Computer Programming)

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_date, ISBN_book2)
VALUES 
(1, 1001, '2023-02-10', 11111),  -- Customer 1001 returned Book 11111 (Introduction to Python)
(2, 1002, '2023-03-18', 22222),  -- Customer 1002 returned Book 22222 (Advanced Java Programming)
(3, 1003, '2023-04-25', 44444),  -- Customer 1003 returned Book 44444 (The Great Gatsby)
(4, 1004, '2023-05-15', 55555),  -- Customer 1004 returned Book 55555 (Modern Art of Painting)
(5, 1005, '2023-06-30', 77777),  -- Customer 1005 returned Book 77777 (Digital Marketing 101)
(6, 1006, '2023-07-12', 88888),  -- Customer 1006 returned Book 88888 (Psychology of Human Behavior)
(7, 1007, '2023-08-05', 99999);  -- Customer 1007 returned Book 10101 (The Art of Computer Programming)

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

SELECT b.Book_title, c.Customer_name
FROM IssueStatus i
JOIN Books b ON i.ISBN_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

SELECT Category, COUNT(*) AS Book_Count
FROM Books
GROUP BY Category;

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT DISTINCT Issued_cust FROM IssueStatus);

SELECT e.Branch_no, COUNT(*) AS Employee_Count
FROM Employee e
GROUP BY e.Branch_no;

SELECT DISTINCT c.Customer_name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE i.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

SELECT Branch_no, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

SELECT e.Emp_name, b.Branch_address
FROM Employee e
JOIN Branch b ON e.Branch_no = b.Branch_no
WHERE e.Position = 'Manager';

SELECT DISTINCT c.Customer_name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id
JOIN Books b ON i.ISBN_book = b.ISBN
WHERE b.Rental_Price > 25;












