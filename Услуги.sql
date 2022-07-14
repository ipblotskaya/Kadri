DROP TABLE IF EXISTS Организация CASCADE;
CREATE TABLE Организация (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    Название VARCHAR(25) NOT NULL
    
);

INSERT INTO Организация
    (Название)
VALUES
    ('Программист'),
    ('Сопровождение'),
    ('Бухгалтерия')
;
DROP TABLE IF EXISTS Сотрудники CASCADE;
CREATE TABLE Сотрудники (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    Имя VARCHAR(35) NOT NULL,
    Фамилия VARCHAR(35) NOT NULL,
    Номер_телефона VARCHAR(11),
    СотрудникId INT,
    ОрганизацияId INT NOT NULL,
    Оклад INT NOT NULL,
    Дата_приема DATE NOT NULL,
    FOREIGN KEY (СотрудникId) REFERENCES Сотрудники(Id),
    FOREIGN KEY (ОрганизацияId) REFERENCES Организация(Id)
);

INSERT INTO Сотрудники
    (Имя, Фамилия, Номер_телефона, СотрудникId, ОрганизацияId, Оклад, Дата_приема)
VALUES
    ('Ирина', 'Блоцкая', 291483031, 1, 1, 1000, '16-08-2021'),
    ('Кристина', 'Краснобаева', 293672123, '2', 1, 1000, '23-03-2019'),
    ('Валентина', 'Бусел', 291463221, '3', 2, 1000, '12-05-2020'),
    ('Марина', 'Минченок', 295631478, '4', 2, 1000, '24-07-2016')

;
DROP TABLE IF EXISTS Клиенты CASCADE;
CREATE TABLE Клиенты (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    Имя VARCHAR(35) NOT NULL,
    Фамилия VARCHAR(35) NOT NULL,
    Email varchar(100) NOT NULL,
    Номер_телефона VARCHAR(11),
    Основной_контакт VARCHAR(11) NOT NULL
   
);

INSERT INTO Клиенты
    (Имя, Фамилия, Email, Номер_телефона, Основной_контакт)
VALUES
    ('Денис', 'Селицкий', 'dzenis@mail.ru', '293411332', 'телефон'),
    ('Михаил', 'Ганак', 'ganak@mail.ru', '296542123', 'email'),
    ('Мария', 'Богач', 'bogach@mail.ru', NULL, 'email'),
    ('Наталья', 'Филипчик', 'natasik@mail.ru', '298761245', 'телефон'),
    ('Татьяна', 'Михалишина', 'tanya@mail.ru', '334562123', 'телефон'),
    ('Анастасия', 'Реут', 'reyt@mail.ru', '447894152', 'телефон')
;
DROP TABLE IF EXISTS Услуги CASCADE;
CREATE TABLE Услуги (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    КлиентId INT NOT NULL,
    МенеджерId INT NOT NULL,
    Услуга varchar(50) NOT NULL,
    Статус varchar(25) NOT NULL,
    Стоимость INT NOT NULL,
    FOREIGN KEY (КлиентId) REFERENCES Клиенты(Id),
    FOREIGN KEY (МенеджерId) REFERENCES Сотрудники(Id)
);

INSERT INTO Услуги
    (КлиентId, МенеджерId, Услуга, Статус, Стоимость)
VALUES
    ('1', '1', 'Разработка', 'Готова', '2000'),
    ( '1', '3', 'Сопровождение', 'Готова', '1200'),
    ('2', '2', 'Разработка', 'В_работе', '2000'),
    ('3', '2', 'Разработка', 'В_работе', '2000'),
    ('4', '4', 'Сопровождение', 'В_работе', '1300'),
    ('5', '3', 'Сопровождение', 'В_работе', '1300')
;

INSERT INTO Организация
    (Название)
VALUES
    ('Снабжение');

ALTER TABLE Сотрудники
ADD Табельный_номер INT;

UPDATE Сотрудники
SET Табельный_номер = 555
WHERE id = 1;

UPDATE Сотрудники
SET Табельный_номер = 556
WHERE id = 2;

UPDATE Сотрудники
SET Табельный_номер = 557
WHERE id = 3;

UPDATE Сотрудники
SET Табельный_номер = 558
WHERE id = 4;

select p.Имя, p.Фамилия, a.Услуга, a.Статус, a.Стоимость
from Сотрудники as p left outer join Услуги as a
on p.id= a.id;