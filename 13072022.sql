DROP TABLE IF EXISTS Отделы CASCADE;
CREATE TABLE Отделы (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    Отделы VARCHAR(30),
    Отделы_id INT
);


DROP TABLE IF EXISTS Сотрудники CASCADE;
CREATE TABLE Сотрудники (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    Фамилия VARCHAR(30),
    Имя VARCHAR(30),
    Отчество VARCHAR(30),
    Отделы_id INT,
	Сотрудники_id INT,
    CONSTRAINT fk_Отделы
        FOREIGN KEY(Отделы_id)
        REFERENCES Отделы(id)
);

INSERT INTO Отделы
    (Отделы, Отделы_id)
 VALUES
    ('АСУ', 1),
    ('ПЭО', 2),
    ('БУХ', 3),
    ('ОМТС', 4),
    ('ОТ', 5)
;

INSERT INTO Сотрудники
    (Фамилия, Имя, Отчество, Отделы_id, Сотрудники_id)
VALUES
    ('Блоцкая', 'Ирина', 'Петровна', 1, 1),
    ('Минченок', 'Марина', 'Валерьевна', 2, 2),
    ('Филипчик', 'Наталья', 'Владимировна', 3,3),
    ('Краснобаева', 'Кристина', 'Сергеевна', 1, 4),
    ('Иванов', 'Иван', 'Иванович', 5, 5),
    ('Петров', 'Сергей', 'Петрович', 1, 6),
    ('Сидоров', 'Александр', 'Васильевич', 2, 7),
    ('Солодилова', 'Алеся', 'Ивановна', 3, 8),
    ('Бусел', 'Валентина', 'Анатольевна', 2, 9),
    ('Михалишина', 'Татьяна', 'Ивановна', 3, 10)
;

INSERT INTO Отделы
    (Отделы, Отделы_id)
VALUES
    ('Кадры', NULL);

INSERT INTO Отделы
    (Отделы)
VALUES
    ('ПТО');


DROP TABLE IF EXISTS Оклады CASCADE;
CREATE TABLE Оклады (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    Оклады INT NOT NULL,
	Отделы_id INT,
    CONSTRAINT fk_Отделы
        FOREIGN KEY(Отделы_id)
        REFERENCES Отделы(id)
);


DROP TABLE IF EXISTS Личные_данные CASCADE;
CREATE TABLE Личные_данные (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,   
    Дата_приема DATE,
	Сотрудники_id INT,
    CONSTRAINT fk_Сотрудники
        FOREIGN KEY(Сотрудники_id)
        REFERENCES Сотрудники(id)
);

INSERT INTO Оклады
    (Оклады, Отделы_id)
 VALUES
    (1000, 1),
    (1000, 2),
    (1000, 3),
    (1000, 4),
    (1000, 5)
;

INSERT INTO Личные_данные
    (Дата_приема, Сотрудники_id)
 VALUES
    ('16-08-2021', 1),
    ('01-12-2015', 2),
    ('25-02-2017', 3),
    ('12-04-2020', 4),
    ('20-08-2005', 5),
    ('23-01-2013', 6),
    ('02-11-2019', 7),
    ('19-06-2018', 8),
    ('22-09-2022', 9),
    ('01-12-2021', 10)
;

ALTER TABLE Сотрудники
ADD Номер_телефона INT;

UPDATE Сотрудники
SET Номер_телефона = 293854672
WHERE id = 1;

UPDATE Сотрудники
SET Номер_телефона = 444561225
WHERE id = 2;

UPDATE Сотрудники
SET Номер_телефона = 333894516
WHERE id = 3;

UPDATE Сотрудники
SET Номер_телефона = 254567182
WHERE id = 4;

UPDATE Сотрудники
SET Номер_телефона = 294961223
WHERE id = 5;

select p.Имя, p.Отчество, p.Фамилия, a.Отделы
from Сотрудники as p left outer join Отделы as a
on p.id= a.id;