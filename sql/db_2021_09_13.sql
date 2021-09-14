--Library

CREATE TABLE authors
(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(255) NOT NULL
);

CREATE TABLE books
(
id INTEGER PRIMARY KEY AUTOINCREMENT,
isbn INTEGER,
title VARCHAR(255) NOT NULL,
publication_year INTEGER
);

CREATE TABLE book_author
(
id INTEGER PRIMARY KEY AUTOINCREMENT,
book_id INTEGER NOT NULL,
author_id INTEGER NOT NULL,
FOREIGN KEY (book_id) REFERENCES books (id),
FOREIGN KEY (author_id) REFERENCES authors (id)
);

CREATE TABLE warehouse
(
id INTEGER PRIMARY KEY AUTOINCREMENT,
book_id INTEGER NOT NULL,
items INTEGER,
rest INTEGER,
reserved INTEGER,
storage_cell INTEGER,
FOREIGN KEY (book_id) REFERENCES books (id)
);

CREATE TABLE roles
(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(255) NOT NULL,
description VARCHAR(255)
);

CREATE TABLE privileges
(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(255) NOT NULL,
description VARCHAR(255)
);

CREATE TABLE role_privilege
(
id INTEGER PRIMARY KEY AUTOINCREMENT,
role_id INTEGER NOT NULL,
privilege_id INTEGER NOT NULL,
FOREIGN KEY (role_id) REFERENCES roles (id),
FOREIGN KEY (privilege_id) REFERENCES privileges (id)
);

CREATE TABLE users
(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(255) NOT NULL,
login VARCHAR(255) NOT NULL,
password VARCHAR(255) NOT NULL,
role_id INTEGER NOT NULL,
FOREIGN KEY (role_id) REFERENCES roles (id)
);

CREATE TABLE orders
(
id INTEGER PRIMARY KEY AUTOINCREMENT,
order_state VARCHAR(30) NOT NULL,
book_id INTEGER NOT NULL,
requestor_id INTEGER NOT NULL,
executor_id INTEGER NOT NULL,
created_datetime TEXT NOT NULL,
updated_datetime TEXT NOT NULL,
FOREIGN KEY (book_id) REFERENCES books (id),
FOREIGN KEY (requestor_id) REFERENCES users (id),
FOREIGN KEY (executor_id) REFERENCES users (id)
);

INSERT INTO authors (name)
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
('Лев Гумилевский'),                  --17
('Олександр Васильович Пьоришкін');   --18

INSERT INTO books (isbn, title, publication_year)
VALUES
('9780062301239','Elon Musk','2015'),                                              -- 1
('9780553293354','Foundation','1951'),                                             -- 2
('9780553293371','Foundation and Empire','1952'),                                  -- 3
('9780553293364','Second Foundation','1953'),                                      -- 4
('9780553900934','Foundations Edge','1982'),                                       -- 5
('9789660354616','Маленькі жінки. Частина перша','2019'),                          -- 6
('9789660354616','Маленькі жінки. Частина друга','2019'),                          -- 7
('9786177279067','Атлант розправив плечі. Частина перша "Несуперечність"','2016'), -- 8
('9786177279159','Атлант розправив плечі. Частина друга "Або - або"','2016'),      -- 9
('9786177279166','Атлант розправив плечі. Частина третя "А є А"','2016'),          --10
('4703000000007','Прекрасная свинарка. Об этом помалкивают','1984'),               --11
('9786176640226','Володар перснів. Частина перша "Братство персня"','2013'),       --12
('9786176640233','Володар перснів. Частина друга "Дві вежі"','2013'),              --13
('9786176640226','Володар перснів. Частина третя "Повернення короля"','2013'),     --14
('9786176640370','Гобіт. Або туди і звідти','2013'),                               --15
('9786177552146','Достідження про природу і причини багатство народів','2018'),    --16
('9789669742551','Моє життя та робота','2016'),                                    --17
('9786177388783','Філософія Toyota','2017'),                                       --18
('9786177766376','Кінець епохи потре*лядства','2020'),                             --19
('9786171215313','Людина розумна','2014'),                                         --20
('9785969301245','Логистика. Интегрированная цепь поставок','2017'),               --21
('9786176793940','Мої винаходи','2018'),                                           --22
('0000000000000','Рудольф Дизель','1935'),                                         --23
('0000000000000','Курс Фізики. Частина третя','1959');                             --24

INSERT INTO book_author (book_id, author_id)
VALUES
('1','1'),
('2','2'),
('3','2'),
('4','2'),
('5','2'),
('6','3'),
('7','3'),
('8','4'),
('9','4'),
('10','4'),
('11','5'),
('12','6'),
('13','6'),
('14','6'),
('15','6'),
('16','7'),
('17','8'),
('18','9'),
('19','10'),
('19','11'),
('19','12'),
('20','13'),
('20','14'),
('20','15'),
('21','16'),
('22','17'),
('23','18');

INSERT INTO warehouse (book_id, items, rest, reserved, storage_cell)
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

INSERT INTO roles (name, description)
VALUES
('Clerk', 'A library worker who can perform any actions with books in the library'),
('Visitor', 'A person who can take away books from the library');

INSERT INTO privileges (name, description)
VALUES
('Create', 'An Ability to add a new book into the Library'),
('Delete', 'An Ability to delete a book from the Library'),
('Order', 'An Ability to order a book'),
('Take', 'An Ability to take a book from the Library'),
('Return', 'An Ability to return a book into Library');

INSERT INTO role_privilege (role_id, privilege_id)
VALUES
('1','1'),
('1','2'),
('1','3'),
('1','4'),
('1','5'),
('2','3'),
('2','4'),
('2','5');

INSERT INTO users (name, login, password, role_id)
VALUES
('Bohomolny', 'Bohomolny', 'QR155', '1'),  -- password should be stored in an encrypted form
('Guest', 'guest', 'p@ssw0rd', '2');

