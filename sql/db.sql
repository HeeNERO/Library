--Library

CREATE TABLE Author
(
ID INTEGER PRIMARY KEY AUTOINCREMENT,
Name varchar(255) NOT NULL
);

CREATE TABLE Book
(
ID INTEGER PRIMARY KEY AUTOINCREMENT,
ISBN int,
Title varchar(255),
PubYear int,
AuthorID int,
FOREIGN KEY (AuthorID) REFERENCES Author (ID)
);

CREATE TABLE Book_Author
(
ID INTEGER PRIMARY KEY AUTOINCREMENT,
BookID int,
AuthorID int,
FOREIGN KEY (BookID) REFERENCES Book (ID),
FOREIGN KEY (AuthorID) REFERENCES Author (ID)
);

CREATE TABLE Warehouse
(
ID INTEGER PRIMARY KEY AUTOINCREMENT,
BookID int NOT NULL,
Items int,
Rest int,
Reserved int,
KeepCell int,
FOREIGN KEY (BookID) REFERENCES Book (ID)
);

CREATE TABLE Role
(
ID INTEGER PRIMARY KEY AUTOINCREMENT,
RoleName varchar(255) NOT NULL,
Description varchar(255)
);

CREATE TABLE RolePrivilege
(
ID INTEGER PRIMARY KEY AUTOINCREMENT,
PrivilegeName varchar(255) NOT NULL,
Description varchar(255)
);

CREATE TABLE LibraryUser
(
ID INTEGER PRIMARY KEY AUTOINCREMENT,
Name varchar(255) NOT NULL,
Login varchar(255) NOT NULL,
Password varchar(255) NOT NULL,
RoleName int,
FOREIGN KEY (RoleName) REFERENCES Role (ID)
);

CREATE TABLE UserRole
(
ID INTEGER PRIMARY KEY AUTOINCREMENT,
UserID int,
RoleID int,
FOREIGN KEY (UserID) REFERENCES LibraryUser (ID),
FOREIGN KEY (RoleID) REFERENCES Role (ID)
);

CREATE TABLE OrderList
(
ID INTEGER PRIMARY KEY AUTOINCREMENT,
OrderID int,
OrderState int NOT NULL,
BookID int NOT NULL,
LibraryUserID int NOT NULL,
FOREIGN KEY (LibraryUserID) REFERENCES LibraryUser (ID),
FOREIGN KEY (BookID) REFERENCES Book (ID)
);

INSERT INTO Author (Name)
VALUES
('Ashlee Vance'),                     -- 1
('Isaac Asimov'),                     -- 2
('Луїза Мей Олкотт'),                 -- 3
('Айн Райд'),                         -- 4
('Мартти Ларни'),                     -- 5
('Дж.Р.Р. Толкін'),                   -- 6
('Адам Сміт'),                        -- 7
('Герні Форд'),                       -- 8
('Джефрі К. Лайкер'),                 -- 9
('Віктор Андрусів'),                  --10
('Яна Ваврик'),                       --11
('Андрій Довжанин'),                  --12
('Ювал Ной Харарі'),                  --13
('Дональд Дж.Бауэрсокс'),             --14
('Дейвид Дж.Клосс'),                  --15
('Нікола Тесла'),                     --16
("Лев Гумилевский"),                  --17
('Олександр Васильович Пьоришкін');   --18

INSERT INTO Book (ISBN, Title, PubYear, AuthorID)
VALUES
('9780062301239','Elon Musk','2015', '1'), -- 1
('9780553293354','Foundation','1951','2'), -- 2
('9780553293371','Foundation and Empire','1952','2'), --3
('9780553293364','Second Foundation','1953','2'),     --4
('9780553900934','Foundations Edge','1982','2'),      --5
('9789660354616','Маленькі жінки. Частина перша','2019','3'), --6
('9789660354616','Маленькі жінки. Частина друга','2019','3'), --7
('9786177279067','Атлант розправив плечі. Частина перша "Несуперечність"','2016','4'),  --8
('9786177279159','Атлант розправив плечі. Частина друга "Або - або"','2016','4'),       --9
('9786177279166','Атлант розправив плечі. Частина третя "А є А"','2016','4'),          --10
('4703000000007','Прекрасная свинарка. Об этом помалкивают','1984','5'),               --11
('9786176640226','Володар перснів. Частина перша "Братство персня"','2013','6'),       --12
('9786176640233','Володар перснів. Частина друга "Дві вежі"','2013','6'),              --13
('9786176640226','Володар перснів. Частина третя "Повернення короля"','2013','6'),     --14
('9786176640370','Гобіт. Або туди і звідти','2013','6'),                               --15
('9786177552146','Достідження про природу і причини багатство народів','2018','7'),    --16
('9789669742551','Моє життя та робота','2016','8'),        --17
('9786177388783','Філософія Toyota','2017','9'),           --18
('9786177766376','Кінець епохи потре*лядства','2020','10'), --11. 12
('9786171215313','Людина розумна','2014','13'),
('9785969301245','Логистика. Интегрированная цепь поставок','2017','14'),  --15
('9786176793940','Мої винаходи','2018','16'),
('0000000000000','Рудольф Дизель','1935','17'),
('0000000000000','Курс Фізики. Частина третя','1959','18');

INSERT INTO Book_Author (BookID, AuthorID)
VALUES
("1","1"),
("2","2"),
("3","2"),
("4","2"),
("5","2"),
("6","3"),
("7","3"),
("8","4"),
("9","4"),
("10","4"),
("11","5"),
("12","6"),
("13","6"),
("14","6"),
("15","6"),
("16","7"),
("17","8"),
("18","9"),
("19","10"),
('19','11'),
('19','12'),
('20','13'),
('20','14'),
("20",'15'),
('21','16'),
('22',"17"),
('23','18');

INSERT INTO Warehouse (BookID, Items, Rest, Reserved, KeepCell)
VALUES
('1', '1', '1', '0', '101'),
('2', '1', '1', '0', '102'),
('3', '1', '1', '0', '103'),
('4', '1', '1', '0', '104'),
('5', '1', '1', '0', '105'),
('6', '1', '1', '0', '106'),
('7', '1', '1', '0', '107'),
('8', '1', '1', '0', '108'),
('9', '1', '1', '0', '109'),
('10', '1', '1', '0', '110'),
('11', '1', '1', '0', '111'),
('12', '1', '1', '0', '112'),
('13', '1', '1', '0', '113'),
('14', '1', '1', '0', '114'),
('15', '1', '1', '0', '115'),
('16', '1', '1', '0', '116'),
('17', '1', '1', '0', '117'),
('18', '1', '1', '0', '118'),
('19', '1', '1', '0', '119'),
('20', '1', '1', '0', '120');

INSERT INTO Role (RoleName, Description)
VALUES
('Clerk', 'Library worker who can do everything with books'),
('User', 'Person who can take books');

INSERT INTO RolePrivilege (PrivilegeName, Description)
VALUES
('Create', 'An Ability to add a new book into the Library'),
('Delete', 'An Ability to delete a book from the Library'),
('Order', 'An Ability to order a book'),
('Take', 'An Ability to take a book from the Library'),
('Return', 'An Ability to return a book into Library');

INSERT INTO LibraryUser (Name, Login, Password, RoleName)
VALUES
('Bohomolny', 'Bohomolny', 'QR155', '1');

INSERT INTO UserRole (UserID, RoleID)
VALUES
('1','1');
