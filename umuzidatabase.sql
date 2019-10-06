

CREATE TABLE `Umuzi`.`Payments` (
 `CustomerID` INT NOT NULL,
 `PaymentID` INT NOT NULL,
 `PaymentDate` DATETIME NOT NULL,
 `Amount` DECIMAL NOT NULL,
 PRIMARY KEY (`PaymentID`),
 INDEX `Amount_idx` (`Amount` ASC),
 INDEX `CustomerID_idx` (`CustomerID` ASC),
 FOREIGN KEY (`CustomerID`)
 REFERENCES `Umuzi`.`Customers` (`CustomerID`)
 FOREIGN KEY (`Amount`)
 REFERENCES `Umuzi`.`Products` (`BuyPrice`);

CREATE TABLE `Umuzi`.`Products` (
 `ProductId` INT NOT NULL AUTO_INCREMENT,
 `ProductName` VARCHAR(100) NOT NULL,
 `Description` VARCHAR(300) NOT NULL,
 `BuyPrice` DECIMAL NOT NULL,
 PRIMARY KEY (`ProductId`));

CREATE TABLE `Umuzi`.`Employees` (
 `EmployeeID` INT NOT NULL AUTO_INCREMENT,
 `FirstName` VARCHAR(50) NOT NULL,
 `LastName` VARCHAR(50) NOT NULL,
 `Email` VARCHAR(100) NOT NULL,
 `JobTitle` VARCHAR(20) NOT NULL,
 PRIMARY KEY (`EmployeeID`));

CREATE TABLE `Umuzi`.`Customers` (
 `CustomerID` INT NOT NULL AUTO_INCREMENT,
 `FirstName` VARCHAR(50) NOT NULL,
 `LastName` VARCHAR(50) NOT NULL,
 `Gender` VARCHAR(20) NOT NULL,
 `Address` VARCHAR(200) NOT NULL,
 `Phone` INT NOT NULL,
 `Email` VARCHAR(100) NOT NULL,
 `City` VARCHAR(20) NOT NULL,
 `Country` VARCHAR(50) NOT NULL,
 PRIMARY KEY (`CustomerID`));

CREATE TABLE `Umuzi`.`Orders` (
 `OrderID` INT NOT NULL AUTO_INCREMENT,
 `ProductID` INT NOT NULL,
 `PaymentID` INT NOT NULL,
 `FulfilledByEmployeeID` INT NOT NULL,
 `DateRequired` DATETIME NOT NULL,
 `DateShipped` DATETIME NOT NULL,
 `Status` VARCHAR(20) NOT NULL,
 PRIMARY KEY (`OrderID`));

 DROP TABLE Customer;

ALTER TABLE Orders
ADD FOREIGN KEY (FulfilledByEmployeeID) REFERENCES Employees(EmployeeID);

CREATE TABLE `Umuzi`.`Payments` (
 `CustomerId` INT NOT NULL,
 `PaymentsID` INT NOT NULL AUTO_INCREMENT,
 `PaymentDate` DATETIME NULL,
 `Amount` DECIMAL NULL,
 PRIMARY KEY (`PaymentsID`),
 INDEX `fk_Payments_1_idx` (`CustomerId` ASC),
 CONSTRAINT `fk_Payments_1`
 FOREIGN KEY (`CustomerId`)
 REFERENCES `Umuzi`.`Customers` (`CustomerID`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION);

ALTER TABLE `Umuzi`.`Payments` 
DROP FOREIGN KEY `fk_Payments_1`;

ALTER TABLE `Umuzi`.`Payments` 
ADD INDEX `fk_PaymentsAmount_idx` (`Amount` ASC);

ALTER TABLE `Umuzi`.`Payments` 
ADD CONSTRAINT `fk_PaymentsCustomerID`
 FOREIGN KEY (`CustomerId`)
 REFERENCES `Umuzi`.`Customers` (`CustomerID`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_PaymentsAmount`
 FOREIGN KEY (`Amount`)
 REFERENCES `Umuzi`.`Products` (`BuyPrice`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION;

ALTER TABLE Payments
ADD FOREIGN KEY (Amount) REFERNCES Products(BuyPrice);

ALTER TABLE `Umuzi`.`Products` 
ADD UNIQUE INDEX `BuyPrice_UNIQUE` (`BuyPrice` ASC);

ALTER TABLE Payments
ADD FOREIGN KEY (Amount) REFERENCES Products(BuyPrice);


ALTER TABLE Orders
ADD FOREIGN KEY (PaymentID) REFERENCES Payments(PaymentID);


ALTER TABLE `Umuzi`.`Payments` 
DROP FOREIGN KEY `fk_Payments_1`;


ALTER TABLE Orders
ADD FOREIGN KEY (PaymentID) REFERENCES Payments(PaymentID);

ALTER TABLE Orders
ADD FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

INSERT INTO Customers(FirstName,LastName,Gender,Address,Phone,Email,City,Country)
VALUES ('John','Hibert','Male','284 chaucer st','084789657','john@gmail.com','Johannesburg','South Africa');

INSERT INTO Customers(FirstName,LastName,Gender,Address,Phone,Email,City,Country)
VALUES ('Thando','Sithole','Female','240 Sect 1','0794445584','thando@gmail.com','Cape Town','South Africa');

INSERT INTO Customers(FirstName,LastName,Gender,Address,Phone,Email,City,Country)
VALUES ('Leon','Glen','Male','81 Everton Rd,Gillits','0820832830','Leon@gmail.com','Durban','South Africa');

ALTER TABLE Customers
MODIFY COLUMN Phone VARCHAR(15);

INSERT INTO Customers(FirstName,LastName,Gender,Address,Phone,Email,City,Country)
VALUES ('Charl','Muller','Male','290A Dorset Ecke','+44856872553','Charl.muller@yahoo.com','Berlin','Germany');

INSERT INTO Customers(FirstName,LastName,Gender,Address,Phone,Email,City,Country)
VALUES ('Julia','Stein','Female','2 Wernerring','+448672445058','Js234@yahoo.com','Frankfurt','Germany');

INSERT INTO Employees(FirstName,LastName,Email,JobTitle)
VALUES ('Kani','Matthew','mat@gmail.com','Manager');

INSERT INTO Employees(FirstName,LastName,Email,JobTitle)
VALUES ('Lesly','Cronje','LesC@gmail.com','Clerk');

INSERT INTO Employees(FirstName,LastName,Email,JobTitle)
VALUES ('Gideon','Maduku','m@gmail.com','Accountant');



ALTER TABLE `Umuzi`.`Orders` 
CHANGE COLUMN `DateShipped` `DateShipped` DATETIME NULL;


ALTER TABLE Products
MODIFY COLUMN BuyPrice VARCHAR(10);

INSERT INTO Products(ProductName,Description,BuyPrice)
VALUES ('Harley Davidson Chopper','This replica features working kickstand, front suspension, gear-shift lever',150.75);

INSERT INTO Products(ProductName,Description,BuyPrice)
VALUES ('Classic Car','Turnable front wheels, steering function',550.75);

INSERT INTO Products(ProductName,Description,BuyPrice)
VALUES ('Sports car','Turnable front wheels, steering function',700.60);

INSERT INTO Payments(CustomerId,PaymentDate,Amount)
VALUES (1,'2018-09-01',150.75);

INSERT INTO Payments(CustomerId,PaymentDate,Amount)
VALUES (5,'2018-09-03',	150.75);

INSERT INTO Payments(CustomerId,PaymentDate,Amount)
VALUES (4,'2018-09-03',700.60);

INSERT INTO Orders(ProductID,PaymentID,FulfilledByEmployeeID,DateRequired,DateShipped,Status)
VALUES (1,1,2,'2018-09-05',NULL,'Not shipped');

INSERT INTO Orders(ProductID,PaymentID,FulfilledByEmployeeID,DateRequired,DateShipped,Status)
VALUES (1,2,2,'2018-09-04','2018-09-03','Shipped');

INSERT INTO Orders(ProductID,PaymentID,FulfilledByEmployeeID,DateRequired,DateShipped,Status)
VALUES (3,3,3,'2018-09-06',NULL,'Not shipped');






