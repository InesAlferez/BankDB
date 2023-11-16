<h1 align="center">Welcome to BankDB 👋</h1>
<p>
</p>

> The MyBank Database is designed to manage and track various aspects of a banking system. It includes tables to store information about customers, accounts, employees, transactions, applications, and their associated statuses. The database aims to facilitate effective management of banking operations, customer details, and application processes within a financial institution.

Structure
Tables:
AccountType: Stores various types of accounts available, such as Checking, Savings, Mortgage, Credit Card, and Private Loan.

Customers: Holds information about bank customers including their personal details like name, contact information, and address.

Accounts: Contains data related to individual accounts, including the customer linked to the account, account type, balance, and opening date.

ApplicationType: Records different types of applications such as Credit Card, Private Loan, etc.

ApplicationStatus: Stores the status of different applications like Pending, Approved, or Denied.

Employees: Holds details about bank employees including their names, contact information, and address.

Applications: Stores information about various applications made by customers, the type of application, its status, date, and the employee handling the application.

TransactionType: Records different types of transactions like Deposit, Withdrawal, Transfer, and Check.

Transactions: Contains transaction records including customer details, transaction amount, date, and the type of transaction.

Views:
Several views are created to present summarized or combined data from the tables, such as:

CustomerAccountBalance: Shows account balances for each customer.
AccountTypes: Displays account types associated with customers.
CurrentApplications: Presents current application details with their status.
CurrentApplicationStatus: Joins application details with their respective statuses.
CustomerInformation: Provides a simplified view of customer details.
EmployeeInformation: Offers a simplified view of employee contact information.
CustomerTransactions: Shows customer transactions with transaction type.
TypeOfTransactions: Combines customer, transaction, and transaction type information.
Usage
This database can be utilized to:

Manage customer information and their associated accounts.
Track different types of applications and their statuses.
Record various transactions made by customers.
Monitor employee interactions with applications for efficient processing.
Notes
The database schema may be expanded or modified based on evolving banking needs.
Careful attention to data types and integrity is crucial for accurate financial representation.
Queries and views can be tailored to extract specific information as required by the bank's operations.

## Author

👤 **Ines Alferez**

* Github: [@InesAlferez](https://github.com/InesAlferez)
* LinkedIn: [@ines-alferez-0a0881234](https://linkedin.com/in/ines-alferez-0a0881234)

## Show your support

Give a ⭐️ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_