CREATE DATABASE Library

USE Library

/*====================================CREATE TABLES====================================*/
CREATE TABLE Library_Branch(
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
);

CREATE TABLE Publisher(
	PublisherName VARCHAR(50) NOT NULL PRIMARY KEY,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL,
);

CREATE TABLE Books(
	BookID INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE Book_Authors(
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL,
);

CREATE TABLE Book_Copies( 
	BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_Library_Branch FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL,
);

CREATE TABLE Borrower(
	CardNo INT PRIMARY KEY IDENTITY(100,1) NOT NULL,
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL,
);

CREATE TABLE Book_Loans(
	BookID INT NOT NULL CONSTRAINT fk_BookID3 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL,
);


/*===================================INSERT DATA INTO TABLES ===============================*/

INSERT INTO Library_Branch
	(BranchName, Address) --BranchID auto populated
	VALUES
	('Sharpstown', '123 Abc Drive'),
	('Central', '456 Def Street'),
	('Multnomah', '789 Ghi Lane'),
	('Beaverton', '135 Jkl Road')
;

INSERT INTO Publisher
	(PublisherName, Address, Phone)
	VALUES
	('Penguin Random House', '6001 Shellmound Street, Suite 600', '510-285-3000'),
	('Scholastic', '5127 NE 158th Ave', '503-252-8486')
;

select * from Books

INSERT INTO Books
	(Title, PublisherName)  --BookID auto populated
	VALUES
	('Carrie', 'Penguin Random House'),
	('The Shining', 'Penguin Random House'),
	('The Hobbit', 'Penguin Random House'),
	('The Lord of the Rings', 'Penguin Random House'),
	('Dracula', 'Scholastic'),
	('The Graveyard Book', 'Scholastic'),
	('Neverwhere', 'Scholastic'),
	('Stardust', 'Penguin Random House'),
	('Charlie and the Chocolate Factory', 'Scholastic'),
	('Esio Trot', 'Scholastic'),
	('Matilda', 'Scholastic'),
	('Persepolis', 'Penguin Random House'),
	('Embroideries', 'Scholastic'),
	('Erotic Stories for Punjabi Housewives', 'Penguin Random House'),
	('The Palace of Illusions', 'Penguin Random House'),
	('Sugarbread', 'Scholastic'),
	('Frankenstein', 'Scholastic'),
	('The Bluest Eye', 'Scholastic'),
	('Beloved', 'Scholastic'),
	('The Lost Tribe', 'Scholastic')
;

INSERT INTO Book_Authors
	(BookID, AuthorName)
	VALUES
	(100, 'Stephen King'),
	(101, 'Stephen King'),
	(102, 'JRR Tolkein'),
	(103, 'JRR Tolkein'),
	(104, 'Bram Stoker'),
	(105, 'Neil Gaiman'),
	(106, 'Neil Gaiman'),
	(107, 'Neil Gaiman'),
	(108, 'Roald Dahl'),
	(109, 'Roald Dahl'),
	(110, 'Roald Dahl'),
	(111, 'Marjane Satrapi'),
	(112, 'Marjane Satrapi'),
	(113, 'Balli Kaur Jaswal'),
	(114, 'Chitra Divakaruni'),
	(115, 'Balli Kaur Jaswal'),
	(116, 'Mary Shelley'),
	(117, 'Toni Morrison'),
	(118, 'Toni Morrison'),
	(119, 'Mark Lee')
;


INSERT INTO Book_Copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	--Sharpstown
	(100, 100, 2),
	(101, 100, 3),
	(102, 100, 4),
	(103, 100, 5),
	(104, 100, 4),
	(105, 100, 3),
	(106, 100, 2),
	(107, 100, 6),
	(108, 100, 3),
	(119, 100, 4),

	--Central
	(110, 101, 6),
	(111, 101, 5),
	(112, 101, 4),
	(113, 101, 3),
	(114, 101, 2),
	(115, 101, 4),
	(116, 101, 2),
	(117, 101, 3),
	(118, 101, 4),
	(119, 101, 3),
	(100, 101, 2),
	(101, 101, 2)

	--Multnomah
	(100, 102, 3),
	(102, 102, 5),
	(104, 102, 7),
	(106, 102, 2),
	(108, 102, 4),
	(110, 102, 6),
	(112, 102, 5),
	(114, 102, 2),
	(116, 102, 3),
	(118, 102, 4),

	--Beaverton
	(101, 103, 3),
	(103, 103, 2),
	(105, 103, 4),
	(107, 103, 5),
	(109, 103, 2),
	(111, 103, 3),
	(113, 103, 3),
	(115, 103, 5),
	(117, 103, 6),
	(119, 103, 2)
;

INSERT INTO Borrower
	(Name, Address, Phone)
	VALUES
	('Spongebob Squarepants', 'Pineapple under the sea', '123-456-7890'),
	('Patrick Star', 'Under a rock', '234-567--8901'),
	('Squidward Tentacles', 'Moai, Bikini Bottom', '345-678-9012'),
	('Sandy Cheeks', 'Treedome', '456-789-0123'),
	('Gary', 'Pineapple under the sea','567-890-1234'),
	('Pearl Krabs', '3541 Anchor Way', '678-901-2345'),
	('Plankton', 'Chum Bucket Laboratory', '789-123-4567'),
	('King Neptune', 'Palace, Bikini Bottom', '890-123-4567')
	('Mr Krabs', '3541 Anchor Way', '678-901-2345')
;


INSERT INTO Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(100, 100, 100, '2019-08-27', '2019-09-10'),
	(101, 100, 100, '2019-08-27', '2019-09-10'),
	(102, 100, 100, '2019-08-27', '2019-09-10'),
	(103, 100, 100, '2019-08-27', '2019-09-10'),
	(104, 100, 100, '2019-08-27', '2019-09-10'),
	(105, 100, 100, '2019-08-27', '2019-09-10'),

	(110, 101, 101, '2019-08-22', '2019-09-05'),
	(111, 101, 101, '2019-08-22', '2019-09-05'),
	(112, 101, 101, '2019-08-22', '2019-09-05'),
	(113, 101, 101, '2019-08-22', '2019-09-05'),
	(114, 101, 101, '2019-08-22', '2019-09-05'),
	(115, 101, 101, '2019-08-22', '2019-09-05'),
	(116, 101, 101, '2019-08-22', '2019-09-05'),

	(100, 102, 102, '2019-08-17', '2019-08-31'),
	(102, 102, 102, '2019-08-17', '2019-08-31'),
	(104, 102, 102, '2019-08-17', '2019-08-31'),
	(106, 102, 102, '2019-08-17', '2019-08-31'),
	(108, 102, 102, '2019-08-17', '2019-08-31'),


	(101, 103, 103, '2019-08-14', '2019-08-28'),
	(103, 103, 103, '2019-08-14', '2019-08-28'),
	(105, 103, 103, '2019-08-14', '2019-08-28'),
	(107, 103, 103, '2019-08-14', '2019-08-28'),
	(109, 103, 103, '2019-08-14', '2019-08-28'),
	(111, 103, 103, '2019-08-14', '2019-08-28'),
	(113, 103, 103, '2019-08-14', '2019-08-28'),

	(119, 101, 104, '2019-08-16', '2019-08-30'),
	(118, 101, 104, '2019-08-16', '2019-08-30'),
	(117, 101, 104, '2019-08-16', '2019-08-30'),
	(115, 101, 104, '2019-08-16', '2019-08-30'),
	(112, 101, 104, '2019-08-16', '2019-08-30')

	(118, 102, 105, '2019-08-16', '2019-08-30'),
	(116, 102, 105, '2019-08-16', '2019-08-30'),
	(114, 102, 105, '2019-08-16', '2019-08-30'),
	(112, 102, 105, '2019-08-16', '2019-08-30'),
	(110, 102, 105, '2019-08-16', '2019-08-30'),

	(119, 100, 106, '2019-08-25', '2019-09-08'),
	(107, 100, 106, '2019-08-25', '2019-09-08'),
	(103, 100, 106, '2019-08-25', '2019-09-08'),
	(104, 100, 106, '2019-08-25', '2019-09-08'),
	(102, 100, 106, '2019-08-25', '2019-09-08'),
	(101, 100, 106, '2019-08-25', '2019-09-08'),
	(105, 100, 106, '2019-08-25', '2019-09-08'),

	(117, 103, 107, '2019-08-21', '2019-09-04'),
	(115, 103, 107, '2019-08-21', '2019-09-04'),
	(107, 103, 107, '2019-08-21', '2019-09-04'),
	(105, 103, 107, '2019-08-21', '2019-09-04'),
	(113, 103, 107, '2019-08-21', '2019-09-04'),
	(111, 103, 107, '2019-08-21', '2019-09-04'),
	(101, 103, 107, '2019-08-21', '2019-09-04'),
	(103, 103, 107, '2019-08-21', '2019-09-04'),
	(109, 103, 107, '2019-08-21', '2019-09-04')
;

/*==========================================STORED PROCEDURES========================================*/

--STORED PROCEDURE 1: Copies of "The Lost Tribe" owned by "Sharpstown"
USE Library
GO

CREATE PROC dbo.uspCountCopies
AS 
SELECT Number_Of_Copies
FROM Book_Copies
WHERE BranchID = 100 AND BookID = 119;

EXEC dbo.uspCountCopies


--STORED PROCEDURE 2: Copies of "The Lost Tribe" owned by each branch
USE Library
GO

CREATE PROC dbo.uspLTEachBranch
AS 
SELECT BranchName, Number_Of_Copies AS 'Copies'  
FROM Library_Branch
INNER JOIN Book_Copies ON Library_Branch.BranchID = Book_Copies.BranchID
WHERE BookID = 119;

EXEC dbo.uspLTEachBranch

--STORED PROCEDURE 3: All borrowers with no books checked out.
USE Library
GO

CREATE PROC dbo.uspNoBooks
AS
SELECT Name
FROM Borrower
LEFT JOIN Book_Loans ON Borrower.CardNo = Book_Loans.CardNo
WHERE Book_Loans.CardNo IS NULL;

EXEC dbo.uspNoBooks

--STORED PROCEDURE 4: For each book loaned out from "Sharpstown" whose DueDate is today, retrieve book title, borrower's name, and borrower's address.

USE Library
GO

CREATE PROC dbo.uspDueToday
AS
SELECT Title AS 'Book Title', Name AS 'Borrower''s Name', Address AS 'Borrower''s Address'
FROM ((Books
INNER JOIN Book_Loans ON Books.BookID = Book_Loans.BookID)
INNER JOIN Borrower ON Book_Loans.CardNo = Borrower.CardNo)
WHERE Book_Loans.DateDue = CONVERT(date, GETDATE());

EXEC dbo.uspDueToday

--STORED PROCEDURE 5: For each library branch, retrieve branch name and total number of books loaned out.
USE Library
GO

CREATE PROC dbo.uspBooksLoaned
AS
SELECT BranchName, COUNT(BookID) AS 'Number of Books Loaned Out'
FROM Library_Branch
INNER JOIN Book_Loans ON Library_Branch.BranchID = Book_Loans.BranchID GROUP BY Library_Branch.BranchName
;

EXEC dbo.uspBooksLoaned

--STORED PROCEDURE 6: Names, addresses, and number of books checked out for all borrowers with > five books checked out.
USE Library
GO

CREATE PROC dbo.uspBigBorrowers
AS
SELECT Name, Address, COUNT(BookID) AS 'Number of Books Checked Out' 
FROM Borrower
INNER JOIN Book_Loans ON Borrower.CardNo = Book_Loans.CardNo 
GROUP BY Borrower.Name, Borrower.Address
HAVING COUNT(BookID) > 5;

EXEC dbo.uspBigBorrowers

--STORED PROCEDURE 7: For each book authored by "Stephen King", retrieve title and number of copies owned by "Central".
USE Library
GO

CREATE PROC dbo.uspSKBooks
AS
SELECT Title, SUM(Number_Of_Copies) AS Copies
FROM (((Books 
INNER JOIN Book_Authors ON Books.BookID = Book_Authors.BookID)
INNER JOIN Book_Copies ON Books.BookID = Book_Copies.BookID) 
INNER JOIN Library_Branch ON Book_Copies.BranchID = Library_Branch.BranchID)
WHERE Book_Authors.AuthorName = 'Stephen King' AND Library_Branch.BranchName = 'Central'
GROUP BY Books.Title
;

EXEC dbo.uspSKBooks
