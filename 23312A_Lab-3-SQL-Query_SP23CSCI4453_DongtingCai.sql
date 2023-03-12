/*
CSCI 4453, Lab 3
SP23, 23312A
By Dongting Cai
*/

USE DCai;

/*
PART 01
A more in-depth set of exercises: Some Simple Tables
*/

-- create the Lab03 schema
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Lab03')
BEGIN
    EXEC('CREATE SCHEMA Lab03');
END

/*

-- create and link group member in sub-database
CREATE USER CPeng FOR LOGIN CPeng;
GO

CREATE USER HLyu FOR LOGIN HLyu;
GO

CREATE USER YMao FOR LOGIN YMao;
GO

-- grant access to group memebers
GRANT ALTER, CONTROL, DELETE, EXECUTE, INSERT, REFERENCES, SELECT, UPDATE
    ON SCHEMA::Lab03 TO CPeng, HLyu, YMao ;
GO

-- some test code to see if the the user can be successfully found
SELECT name FROM sys.sysusers WHERE name = 'CPeng';
EXEC sp_helpuser 'CPeng';

SELECT name FROM sys.sysusers WHERE name = 'HLyu';
EXEC sp_helpuser 'HLyu';

SELECT name FROM sys.sysusers WHERE name = 'YMao';
EXEC sp_helpuser 'YMao';

*/

-- create the "master" table
CREATE TABLE Lab03.master(
    tid INTEGER PRIMARY KEY,
    start DATETIME,
    stop DATETIME,
    register INTEGER,
    [user] NVARCHAR(50), -- treat the word "user" as a reg string instead of a reserved keyword
    total DECIMAL(10, 2)
)

-- create the "t_items" table
CREATE TABLE Lab03.t_items(
    tid INTEGER,
    pid INTEGER,
    price DECIMAL(10, 2),
    gid INTEGER,
    amount DECIMAL(10, 2)
)

-- create the "combos" table
CREATE TABLE Lab03.combos(
    uid INTEGER PRIMARY KEY,
    comboName NVARCHAR(50),
    item INTEGER,
    price DECIMAL(10, 2),
    comboCode INTEGER
)

-- create the "poorDesign" table
CREATE TABLE Lab03.poorDesign(
    tid INTEGER,
    pid INTEGER,
    price DECIMAL(10, 2),
    gid INTEGER,
    amount DECIMAL(10, 2)
)

-- insert 5 records indicated in the prompt
INSERT INTO Lab03.combos(uid, comboName, item, price, comboCode) 
VALUES
(1, 'Double Slam', 2, 1.99, 1),
(2, 'Double Slam', 3, 1.99, 1),
(3, 'Quacker Jack special', 2, 2.15, 2),
(4, 'Quacker Jack special', 17, 2.15, 2),
(5, 'Quacker Jack special', 191, 2.15, 2);
