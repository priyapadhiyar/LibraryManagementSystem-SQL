-- FINAL PROJECT ON LIBRARY MANAGEMENT BY PRIYA PADHIYAR
-- STUDENT ID 01882661

/*CREATE SCHEMA AND TABLES*/
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Project_LIBRARY
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Project_LIBRARY
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Project_LIBRARY` DEFAULT CHARACTER SET utf8 ;
USE `Project_LIBRARY` ;

-- -----------------------------------------------------
-- Table `Project_LIBRARY`.`BORROWERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project_LIBRARY`.`BORROWERS` (
  `BORROWER_ID` INT NOT NULL AUTO_INCREMENT,
  `FIRSTNAME` VARCHAR(45) NOT NULL,
  `LASTNAME` VARCHAR(45) NOT NULL,
  `ADDRESS` VARCHAR(90) NULL,
  `PHONENO` VARCHAR(12) NOT NULL,
  `EMAIL` VARCHAR(45) NULL,
  `OTHER_DETAILS` VARCHAR(45) NULL,
  PRIMARY KEY (`BORROWER_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project_LIBRARY`.`CATEGORY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project_LIBRARY`.`CATEGORY` (
  `CATEGORY_ID` INT NOT NULL,
  `NAME` VARCHAR(45) NULL,
  PRIMARY KEY (`CATEGORY_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project_LIBRARY`.`BOOKS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project_LIBRARY`.`BOOKS` (
  `ISBN` INT NOT NULL,
  `BOOK_TITLE` VARCHAR(50) NULL,
  `PUBLICATION_DATE` DATE NULL,
  `CATEGORY_CATEGORY_ID` INT NOT NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `fk_BOOKS_CATEGORY1_idx` (`CATEGORY_CATEGORY_ID` ASC) VISIBLE,
  CONSTRAINT `fk_BOOKS_CATEGORY1`
    FOREIGN KEY (`CATEGORY_CATEGORY_ID`)
    REFERENCES `Project_LIBRARY`.`CATEGORY` (`CATEGORY_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project_LIBRARY`.`AUTHOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project_LIBRARY`.`AUTHOR` (
  `AUTHOR_ID` INT NOT NULL AUTO_INCREMENT,
  `FIRSTNAME` VARCHAR(45) NOT NULL,
  `LASTNAME` VARCHAR(45) NULL,
  PRIMARY KEY (`AUTHOR_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project_LIBRARY`.`BOOKS_ON_LOAN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project_LIBRARY`.`BOOKS_ON_LOAN` (
  `LOAN_ID` INT NOT NULL,
  `ISSUE_DATE` DATE NOT NULL,
  `DUE_DATE` DATE NOT NULL,
  `RETURN_DATE` DATE NULL,
  `RETURN_FINE` INT NULL,
  `BORROWERS_BORROWER_ID` INT NOT NULL,
  `BOOKS_ISBN` INT NOT NULL,
  PRIMARY KEY (`LOAN_ID`),
  INDEX `fk_BOOKS ON LOAN_BORROWERS_idx` (`BORROWERS_BORROWER_ID` ASC) VISIBLE,
  INDEX `fk_BOOKS ON LOAN_BOOKS1_idx` (`BOOKS_ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_BOOKS ON LOAN_BORROWERS`
    FOREIGN KEY (`BORROWERS_BORROWER_ID`)
    REFERENCES `Project_LIBRARY`.`BORROWERS` (`BORROWER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BOOKS ON LOAN_BOOKS1`
    FOREIGN KEY (`BOOKS_ISBN`)
    REFERENCES `Project_LIBRARY`.`BOOKS` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project_LIBRARY`.`AUTHOR_has_BOOKS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project_LIBRARY`.`AUTHOR_has_BOOKS` (
  `AUTHOR_AUTHOR_ID` INT NOT NULL,
  `BOOKS_ISBN` INT NOT NULL,
  INDEX `fk_AUTHOR_has_BOOKS_BOOKS1_idx` (`BOOKS_ISBN` ASC) VISIBLE,
  INDEX `fk_AUTHOR_has_BOOKS_AUTHOR1_idx` (`AUTHOR_AUTHOR_ID` ASC) VISIBLE,
  CONSTRAINT `fk_AUTHOR_has_BOOKS_AUTHOR1`
    FOREIGN KEY (`AUTHOR_AUTHOR_ID`)
    REFERENCES `Project_LIBRARY`.`AUTHOR` (`AUTHOR_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AUTHOR_has_BOOKS_BOOKS1`
    FOREIGN KEY (`BOOKS_ISBN`)
    REFERENCES `Project_LIBRARY`.`BOOKS` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

/*INSERT INTO TABLES*/
insert into author (firstname,lastname)
values ('William','Shakespeare'),
('Charles','Dickens'),
('Mark','Twain'),
('J.K.','Rowling'),
('Stephen','King'),
('Sidney','Sheldon');

insert into author (firstname,lastname)
values 	('Neil',' Gaiman');

insert into category 
values  (1,'History'),
		(2,'Comedy'),
        (3,'Tragedy'),
        (4,'Action and Adventure');
        
insert into category 
values  (5,'Fantasy Fiction'),
		(6,'Crime Fiction'),
        (7,'Horror');


insert into books 
values	(0743484975,'Alls Well That Ends Well','2006-01-01',2),
		(1853262439,'The Comedy of Errors','1998-09-01',2),
        (0743484983,'King John','2006-01-01',1),
        (0743482859,'Antony and Cleopatra','2005-08-02',3);

insert into books 
values	(0743484976,'Harry Potter','2001-01-01',5),
		(0744484977,'Fantastic Beast','2000-05-11',5),
        (0743481627,'Casual Vacancy','1998-06-01',5),
		(0719944699,'The Cuckoos Calling','2000-03-03',6),
        (0925186548,'Letha White','2000-04-02',6),
        (0719981699,'Bluerberry Girl','2000-03-03',6),
        (0619946687,'Anansi Boys','1950-04-05',2),
        (0719981459,'American Gods','1965-03-03',5),
        (0659096112,'Coraline','1989-03-03',7),
        (0719771457,'Chus Day','1965-03-03',5);
       
        
        
        
insert into author_has_books
values	(1,0743484975),
		(1,1853262439),
		(1,0743484983),
		(1,0743482859);
        

insert into author_has_books
values	(5,0743484976),
		(5,0744484977),
        (5,0743481627),
		(5,0719944699),
        (5,0925186548),
        (4,0719981699),
        (7,0619946687),
        (7,0719981459),
        (7,0659096112),
        (7,0719771457);
       
        
        
insert into borrowers (FIRSTNAME, LASTNAME, ADDRESS, PHONENO, EMAIL, OTHER_DETAILS)
values 	('James','Smith','Cecilia Chapman 711-2880 Nulla St. Mankato NYC 96522 ', 4155550132,'jamessmith@gmail.com','book is new'),
		('Michael','Healey','Iris Watson P.O. Box 283 8562 Fusce Rd. Frederick NYC 20620',3725872335,'michaelhealey@gmail.com',null),
        ('Robert','dimir','Celeste Slater 606-3727 Ullamcorper. Street Roseville NYC 11523',7867138616,'robertdimir@outlook.com','2 pgs missing'),
        ('Maria','Garcia','heodore Lowe Ap #867-859 Sit Rd. Azusa New York 39531',7931516230,'mariagarcia@gmail.com',null),
        ('James','Johnson','Calista Wise 7292 Dictum Av. San Antonio NYC 47096',4927096392,'jamesjohnson@outlook.com','book is torn');

insert into borrowers (FIRSTNAME, LASTNAME, ADDRESS, PHONENO, EMAIL, OTHER_DETAILS)
values 	('Priya','Padhiyar','20 Madison St Somerville MA 02143 ', 6179490305,'padhiyarpriya@gmail.com',null),
		('Kripa','Patel','20 Madison St Somerville MA 02143 ', 2034201365,'kripapatel@outlook.com','new book'),
        ('Jay','Shah','20 Trull Lane Somerville MA 02143 ', 6179540305,'jayshaha@gmail.com',null);
        
        
insert into books_on_loan 
values	(1,'2019-10-01','2019-11-01','2019-11-01',null,1,'743482859'),
		(2,'2019-10-15','2019-11-15','2019-11-15',null,2,'743484975'),
		(3,'2019-10-10','2019-11-10','2019-11-20',50,3,'743484983'),
		(4,'2019-10-01','2019-11-01','2019-12-01',100,4,'0743484976'),
        (5,'2019-10-14','2019-11-14','2019-12-01',100,4,'0744484977'),
	 	(6,'2019-11-01','2019-12-01','2019-12-01',null,5,'0719771457'),
        (7,'2019-11-01','2019-12-01','2019-12-01',null,6,'0659096112'),
        (8,'2019-11-10','2019-12-10','2019-12-20',50,7,'0659096112');
        
insert into books_on_loan 
values	(9,'2019-10-01','2019-11-01','2019-11-01',null,1,'0659096112'),
		(10,'2019-10-15','2019-11-15','2019-11-15',null,2,'0743484976'),
		(11,'2019-10-10','2019-11-10','2019-11-20',50,3,'0744484977'),
		(12,'2019-10-01','2019-11-01','2019-12-01',100,4,'0743481627'),
        (13,'2019-10-14','2019-11-14','2019-12-01',100,4,'0719944699'),
	 	(14,'2019-11-01','2019-12-01','2019-12-01',null,5,'0925186548'),
        (15,'2019-11-01','2019-12-01','2019-12-01',null,6,'0719981699'),
        (16,'2019-11-10','2019-12-10','2019-12-20',50,7,'0619946687');
        

               
/*QUERIES*/
USE PROJECT_LIBRARY;
 
/*SELECT ALL THOSE BOOKS THAT WERE RETURNED AFTER THE DUE DATE */
SELECT B.BOOK_TITLE, B.ISBN,BL.DUE_DATE, BL.RETURN_DATE
FROM BOOKS_ON_LOAN AS BL
INNER JOIN BOOKS AS B
ON BL.BOOKS_ISBN=B.ISBN
WHERE BL.RETURN_FINE IS NOT NULL;

/*SHOW FULL NAMES OF ALL THE BORROWERS WHO PAID FINE FOR RETURNING AFTER DUE DATE*/
SELECT B.BOOK_TITLE, B.ISBN, BL.RETURN_FINE, CONCAT(BR.FIRSTNAME, ' ', BR.LASTNAME) AS BORROWERNAME
FROM BOOKS_ON_LOAN AS BL
INNER JOIN BOOKS AS B
ON BL.BOOKS_ISBN=B.ISBN
INNER JOIN BORROWERS AS BR
ON BR.BORROWER_ID=BL.BORROWERS_BORROWER_ID
WHERE BL.RETURN_FINE IS NOT NULL;

/*LIST DOWN ALL THE BOOKS THAT BELONG TO ALL TYPE OF FICTION CATEGORY*/
SELECT B.BOOK_TITLE, C.NAME
FROM books AS B
INNER JOIN category AS C
ON C.CATEGORY_ID=B.CATEGORY_CATEGORY_ID
WHERE C.NAME LIKE '%FICTION%'
ORDER BY BOOK_TITLE;

/*LIST THE NAMES OF ALL THE BOOKS AND BORROWERS THAT WERE RETURNED BEFORE OR ON THE DUE DATE*/
SELECT B.BOOK_TITLE, CONCAT(BR.FIRSTNAME, ' ', BR.LASTNAME) AS BORROWERNAME
FROM BOOKS_ON_LOAN AS BL
INNER JOIN BOOKS AS B
ON BL.BOOKS_ISBN=B.ISBN
Inner join BORROWERS AS BR
On bl.BORROWERS_borrower_id = BR.borrower_id
WHERE BL.RETURN_DATE <= BL.DUE_DATE;

/*Write a stored procedure to get the details about all the fines.*/
use project_library;
DELIMITER //
CREATE PROCEDURE GetAllFineDetails()
BEGIN
SELECT B.BOOK_TITLE, B.ISBN, BL.RETURN_FINE, CONCAT(BR.FIRSTNAME, ' ', BR.LASTNAME) AS BORROWERNAME
	FROM BOOKS_ON_LOAN AS BL
	INNER JOIN BOOKS AS B
	ON BL.BOOKS_ISBN=B.ISBN
	INNER JOIN BORROWERS AS BR
	ON BR.BORROWER_ID=BL.BORROWERS_BORROWER_ID
	WHERE BL.RETURN_FINE IS NOT NULL;
	END //
DELIMITER ;

CALL `Project_LIBRARY`.`GetAllFineDetails`();

/*LIST DOWN ALL THE BOOKS THAT ARE DUE IN NOVEMBER 2019*/
SELECT B.BOOK_TITLE, BL.DUE_DATE 
FROM BOOKS AS B
INNER JOIN 
BOOKS_ON_LOAN AS BL
ON BL.BOOKS_ISBN=B.ISBN
WHERE BL.DUE_DATE LIKE '2019-11-%'
ORDER BY DUE_DATE;


/*SHOW TOTAL COUNT OF BOOKS UNDER ALL THE CATEGORIES*/
SELECT C.CATEGORY_ID, C.NAME, COUNT(BOOK_TITLE) AS TOTALBOOKS
FROM BOOKS AS B
INNER JOIN CATEGORY AS C
ON B.CATEGORY_CATEGORY_ID=C.CATEGORY_ID
GROUP BY CATEGORY_ID
ORDER BY C.CATEGORY_ID;

/*LIST DOWN ALL THE BOOKS THAT START WITH A */
SELECT * FROM BOOKS
WHERE BOOK_TITLE 
LIKE 'A%';

/*LIST DOWN ALL THE BOOKS THAT WERE NEVER ISSUED*/
SELECT ISBN, BOOK_TITLE
FROM books
WHERE isbn NOT IN (SELECT books_isbn
            FROM BOOKS_ON_LOAN);










