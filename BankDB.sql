/*
creates Bank Database
*/
CREATE DATABASE MyBankDB;

/*
ADD TABLES TO DB
*/

USE MyBankDB;

CREATE TABLE AccountType(
AccountTypeID INT PRIMARY KEY,
AccountType VARCHAR(100) NOT NULL
);

CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
EmailAddress NVARCHAR(100) NOT NULL,
PhoneNumber VARCHAR(20) NOT NULL,
Address1 VARCHAR(100) NOT NULL,
Address2 VARCHAR(100) NOT NULL,
City VARCHAR(50) NOT NULL,
State VARCHAR(50) NOT NULL,
ZipCode INT NOT NULL
);

CREATE TABLE Accounts(
AccountID INT PRIMARY KEY,
CustomerID INT NOT NULL REFERENCES Customers(CustomerID),
DateOpened DATETIME NOT NULL,
AccountTypeID INT NOT NULL REFERENCES AccountType(AccountTypeID),
AccountBalance DECIMAL(10, 2) NOT NULL
);

CREATE TABLE ApplicationType(
ApplicationTypeID INT PRIMARY KEY,
ApplicationType VARCHAR(50) NOT NULL
);

CREATE TABLE ApplicationStatus( 
ApplicationStatusID INT PRIMARY KEY,
ApplicationStatus VARCHAR(50) NOT NULL
);

CREATE TABLE Employees(
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
EmailAddress NVARCHAR(100) NOT NULL,
PhoneNumber VARCHAR(20) NOT NULL,
Address1 varchar(100) NOT NULL,
AdDress2 varchar(100) NOT NULL,
City varchar(50) NOT NULL,
State varchar(50) NOT NULL,
ZipCode INT NOT NULL
);

CREATE TABLE Applications(
ApplicationID INT PRIMARY KEY,
CustomerID INT NOT NULL REFERENCES Customers(CustomerID),
ApplicationTypeID INT NOT NULL REFERENCES ApplicationType(ApplicationTypeID),
ApplicationStatusID INT NOT NULL REFERENCES ApplicationStatus(ApplicationStatusID),
ApplicationDate DATETIME NOT NULL,
EmployeeID INT NOT NULL REFERENCES Employees(EmployeeID)
);

CREATE TABLE TransactionType(
TypeOfTransactionID INT PRIMARY KEY,
TypeOfTransaction VARCHAR(100) NOT NULL
);

CREATE TABLE Transactions(
TransactionID INT PRIMARY KEY,
CustomerID INT NOT NULL REFERENCES Customers(CustomerID),
Date DATETIME NOT NULL,
AmountOfTransaction DECIMAL(10, 2) NOT NULL,
TypeOfTransactionID INT NOT NULL REFERENCES TransactionType(TypeOfTransactionID)
);

/*
Insert data into tables
*/

INSERT INTO Customers VALUES 
('Ross', 'Geller', 'ross.geller@myemail.com', '8325574578', '1453 Teal bend', 'APT 4B', 'Missouri City', 'New Jersey', '10583'),
('Chandler', 'Bing', 'chandler.bing@myemail.com', '5645574577', '1455 Teal Avenue', 'APT 5A', 'Tulsa', 'Oklahoma', '11583'),
('Rachel', 'Greene', 'rachel.greene@myemail.com', '4315574852', '1234 Central Perk', 'APT20A', 'New York City', 'New York', '10012'),
('Monica', 'Geller', 'monica.geller@myemail.com', '5421632135', '1234 Central Perk', 'APT20B', 'New York City', 'New York', '10012'),
('Joseph', 'Tribiani', 'joseph.tribiani@myemail.com', '4516541423', '1234 Central Perk', 'APT21A', 'New York City', 'New York', '10012');

INSERT INTO TransactionType VALUES ('Deposit'), ('Withdrawal'), ('Transfer'), ('Check');

INSERT INTO ApplicationType VALUES ('CreditCard'), ( 'PrivateLoan'), ( 'OpenAccount'), ( 'CloseAccount'), ('Mortgage');

INSERT INTO AccountType VALUES ('Checking'), ('Savings'), ('Mortgage'), ('Credit Card'), ('Private Loan');

INSERT INTO ApplicationStatus VALUES ('Pending'), ('Approved'), ('Denied');

INSERT INTO Accounts VALUES 
(1, getdate(), 1, 50582.98),
(1, getdate(), 3, 420050.00),
(101, getdate(), 1, 25098.36),
(101, getdate(), 4, 30382.71),
(201, getdate(), 1, 10582.35),
(201, getdate(), 2, 49020.21),
(301, getdate(), 1, 582.98),
(301, getdate(), 3, 230582.98),
(401, getdate(), 1, 50582.78),
(401, getdate(), 4, 10582.82);

INSERT INTO Employees VALUES
('Jane', 'Doe', 'jane.doe@employee.com', '1234567890', '12 County Road', 'TRLR123', 'Floral Park', 'New York', '11005'),
('John', 'Doe', 'john.doe@employee.com', '1235547880', '22 street', 'APT23A', 'Astoria', 'New York', '11101'),
('Janice', 'Smith', 'janice.smith@employee.com', '2134567897', '213 street', 'APT40B', 'Long Island', 'New York', '11101'),
('Robert', 'Pierce', 'robert.pierce@employee.com', '4561328977', '67 Farm Road', '1234', 'Tulsa', 'Oklahoma', '74103');

INSERT INTO Transactions VALUES (1, getdate(), 34.99, 2),
(101, getdate(), 50.00, 3),
(201, getdate(), 2350.00, 1),
(301, getdate(), 200.00, 2),
(401, getdate(), 630.98, 4);

INSERT INTO Applications VALUES 
(1, 2, 1, getdate(), 1),
(101, 1, 3, getdate(), 101),
(201, 3, 2, getdate(), 201),
(301, 4, 1, getdate(), 301),
(401, 5, 1, getdate(), 101);

/* View shows the account balance 
for each account that a customer has*/

CREATE VIEW CustomerAccountBalance
AS
SELECT CustomerID, AccountID, AccountBalance
FROM Accounts;

/* View shows the types of account each 
customer has*/ 

CREATE VIEW AccountTypes
AS
SELECT AccountID, CustomerID, AccountType
FROM Accounts JOIN AccountType
ON Accounts.AccountTypeID = AccountType.AccountTypeID;

/*This view shows the current applicaitons and their applicationstatusID*/

CREATE VIEW CurrentApplications
AS
SELECT ApplicationID, ApplicationStatusID, ApplicationDate
FROM Applications;

/* View joins the application table and application status table
it shows the applicationID, type of status of application, 
and date of application*/

CREATE VIEW CurrentApplicationStatus
AS
SELECT ApplicationID, ApplicationStatus, ApplicationDate
FROM Applications JOIN ApplicationStatus
ON Applications.ApplicationStatusID = ApplicationStatus.ApplicationStatusID;

/* View creates a simplified view of the customer information*/

CREATE VIEW CustomerInformation
AS
SELECT CustomerID, FirstName, LastName, EmailAddress, PhoneNumber, City, ZipCode
FROM Customers;

/* View creates a simplified view of the employee contact information*/

CREATE VIEW EmployeeInformation
AS
SELECT EmployeeID, FirstName, LastName, EmailAddress, PhoneNumber, City, ZipCode
FROM Employees;

/*View shows all customer transactions with the transactionTypeID*/
CREATE VIEW CustomerTransactions
AS
SELECT CustomerID, TypeOfTransactionID, AmountOfTransaction, Date
FROM Transactions;

/*View combines the customers table, transactions table and the transactionType table
to show the type of transaction that occured*/
CREATE VIEW TypeOfTransactions
AS
SELECT c.CustomerID, c.LastName, TypeOfTransaction, AmountOfTransaction, Date
FROM Customers AS c JOIN Transactions AS t
ON c.CustomerID = t.CustomerID JOIN TransactionType AS tt
ON t.TypeOfTransactionID = tt.TypeOfTransactionID;

/*This query shows the new account balance of savings and checking accounts
after transactions that are not deposits which is any 
TypeOfTransactionID that is greater than 1*/

USE MyBankDB;
SELECT a.AccountID, a.AccountBalance, t.AmountOfTransaction, a.AccountBalance - t.AmountOfTransaction AS NewBalance
FROM Accounts AS a JOIN Transactions AS t
ON a.CustomerID = t.CustomerID
WHERE t.TypeOfTransactionID > 1 AND a.AccountTypeID <= 2
ORDER BY NewBalance;

/*This query gives you the number of applications 
each employee is/will/has review*/
USE MyBankDB;
SELECT e.EmployeeID, COUNT(a.EmployeeID) AS NumberOfApps
FROM Employees AS e INNER JOIN Applications AS a ON e.EmployeeID = a.EmployeeID
GROUP BY e.EmployeeID
ORDER BY e.EmployeeID;