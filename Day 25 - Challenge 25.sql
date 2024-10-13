

# DAY 25 - Challenge 25

# VIEWS AND THEIR APPLICATIONS IN DATA ANALYSIS

USE Challenge;

CREATE TABLE Customer (
Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
First_Name VARCHAR(50),
Last_Name VARCHAR(50),
Email VARCHAR(100),
Phone_No INT,
Address VARCHAR(100),
City VARCHAR(50),
State VARCHAR(50),
Zip_Code INT,
Country VARCHAR(50)
);

INSERT INTO Customer (First_Name, Last_Name, Email, Phone_No, Address, City, State, Zip_Code, Country)
VALUES 
('John', 'Doe', 'john.doe@example.com', '5551234', '123 Elm St', 'Springfield', 'IL', '62701', 'USA'),
('Oliver', 'Anderson', 'oliver.anderson@example.com', '5557890', '606 Palm St', 'Toronto', 'Ontario', '26145', 'Canada'),
('Jane', 'Smith', 'jane.smith@example.com', '5555678', '456 Oak St', 'Chicago', 'IL', '60601', 'USA'),
('Ava', 'Thomas', 'ava.thomas@example.com', '5554322', '707 Spruce St', 'London', 'England', '22565', 'United Kingdom'),
('Elijah', 'Walker', 'elijah.walker@example.com', '5556540', '1212 Aspen St', 'Dubai', 'Dubai', '00000', 'United Arab Emirates'),
('Michael', 'Johnson', 'michael.johnson@example.com', '5558765', '789 Pine St', 'Los Angeles', 'CA', '90001', 'USA'),
('Isabella', 'Lee', 'isabella.lee@example.com', '5551235', '808 Chestnut St', 'Sydney', 'NSW', '2000', 'Australia'),
('Emily', 'Brown', 'emily.brown@example.com', '5554321', '101 Maple St', 'San Francisco', 'CA', '94101', 'USA'),
('David', 'Davis', 'david.davis@example.com', '5559876', '202 Cedar St', 'San Diego', 'CA', '92101', 'USA'),
('Emma', 'Wilson', 'emma.wilson@example.com', '5556543', '303 Birch St', 'Phoenix', 'AZ', '85001', 'USA'),
('Mason', 'Harris', 'mason.harris@example.com', '5555432', '909 Willow St', 'Berlin', 'Berlin', '10115', 'Germany'),
('James', 'Martinez', 'james.martinez@example.com', '5553456', '404 Redwood St', 'Dallas', 'TX', '75201', 'USA'),
('Lucas', 'Clark', 'lucas.clark@example.com', '5552345', '1010 Fir St', 'Cape Town', 'Western Cape', '8001', 'South Africa'),
('Mia', 'Lewis', 'mia.lewis@example.com', '5558760', '1111 Cypress St', 'Tokyo', 'Tokyo', '1000001', 'Japan'),
('Sophia', 'Garcia', 'sophia.garcia@example.com', '5556789', '505 Walnut St', 'Miami', 'FL', '33101', 'USA');


SELECT * FROM Customer;

# 1. Create a view named customer_info for the Customer table 
# that displays Customer’s Full name and email address. 
# Then perform the SELECT operation for the customer_info view.

CREATE VIEW Customer_Info AS
SELECT CONCAT(First_Name,' ',Last_Name)
AS Full_Name,
Email FROM Customer;

SELECT * FROM Customer_Info;

# 2. Create a view named US_Customers that displays customers located in the US.

CREATE VIEW US_Customers AS
SELECT CONCAT(First_Name,' ',Last_Name)
AS Full_Name,
Country FROM Customer
WHERE Country = 'USA';

SELECT * FROM US_Customers;


# 3. Create another view named Customer_details with 
# columns full name(Combine first_name and last_name), email, phone_no, and state.

CREATE VIEW Customer_Details AS
SELECT CONCAT(First_Name,' ',Last_Name) 
AS Full_Name, Email, Phone_No, State
FROM Customer;

SELECT * FROM Customer_Details;

# 4. Update phone numbers of customers who live in California for Customer_details view.

UPDATE Customer_Details
SET Phone_No = 5559999 
WHERE State = 'CA';

# 5. Count the number of customers in each state and show only states with more than 2 customers.

CREATE VIEW Customer_Count AS
SELECT State, COUNT(Customer_ID)
AS NoOfCustomers
FROM Customer
GROUP BY State
HAVING COUNT(Customer_ID) >= 2;

SELECT * FROM Customer_Count;

# 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view.

SELECT State, 
COUNT(Full_Name) AS NoOfCustomers
FROM Customer_Details
GROUP BY State;

# 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.

SELECT * FROM Customer_Details
ORDER BY State;