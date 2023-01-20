CREATE DATABASE friends_of_human;

USE friends_of_human;

CREATE TABLE pets (
	id SERIAL PRIMARY KEY,
    classname VARCHAR(100)    
);

CREATE TABLE pack_animals (
	id SERIAL PRIMARY KEY,
    classname VARCHAR(100)    
);

CREATE TABLE dogs (
	id SERIAL PRIMARY KEY,
pets_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(100),
FOREIGN KEY (pets_id) REFERENCES pets(id) ON UPDATE CASCADE ON DELETE CASCADE   
);


CREATE TABLE cats (
	id SERIAL PRIMARY KEY,
pets_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(100),
FOREIGN KEY (pets_id) REFERENCES pets(id) ON UPDATE CASCADE ON DELETE CASCADE   
);

CREATE TABLE hamsters (
	id SERIAL PRIMARY KEY,
pets_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(100),
FOREIGN KEY (pets_id) REFERENCES pets(id) ON UPDATE CASCADE ON DELETE CASCADE   
);

CREATE TABLE horses (
	id SERIAL PRIMARY KEY,
pack_animals_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(100),
FOREIGN KEY (pack_animals_id) REFERENCES pack_animals(id) ON UPDATE CASCADE ON DELETE CASCADE   
);

CREATE TABLE camels (
	id SERIAL PRIMARY KEY,
pack_animals_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(100),
FOREIGN KEY (pack_animals_id) REFERENCES pack_animals(id) ON UPDATE CASCADE ON DELETE CASCADE   
);

CREATE TABLE donkeys (
	id SERIAL PRIMARY KEY,
pack_animals_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(100),
FOREIGN KEY (pack_animals_id) REFERENCES pack_animals(id) ON UPDATE CASCADE ON DELETE CASCADE   
);

dogs
ALTER TABLE dogs ADD COLUMN command TEXT;
ALTER TABLE dogs ADD COLUMN birthday DATE;

ALTER TABLE cats ADD COLUMN command TEXT;
ALTER TABLE cats ADD COLUMN birthday DATE;

ALTER TABLE hamsters ADD COLUMN command TEXT;
ALTER TABLE hamsters ADD COLUMN birthday DATE;

ALTER TABLE horses ADD COLUMN command TEXT;
ALTER TABLE horses ADD COLUMN birthday DATE;

ALTER TABLE camels ADD COLUMN command TEXT;
ALTER TABLE camels ADD COLUMN birthday DATE;

ALTER TABLE donkeys ADD COLUMN command TEXT;
ALTER TABLE donkeys ADD COLUMN birthday DATE;

INSERT INTO pets (classname) 
VALUES ('dogs'),
('cats'),
('hamsters');

INSERT INTO pack_animals (classname) 
VALUES ('horses'),
('camels'),
('donkeys');


INSERT INTO dogs (pets_id, name, command, birthday) 
VALUES (1, 'Bim', 'throw', '1998-02-03'),
(1, 'Ruby', 'catch','2002-02-03' ),
(1, 'Black','play','1998-10-22');

INSERT INTO cats (pets_id, name, command, birthday) 
VALUES (2, 'Bim', 'throw', '1998-02-03'),
(2, 'Ruby', 'catch','2002-02-03' ),
(2, 'Black','play','1998-10-22');

INSERT INTO hamsters (pets_id, name, command, birthday) 
VALUES (3, 'Bim', 'throw', '1998-02-03'),
(3, 'Ruby', 'catch','2002-02-03' ),
(3, 'Black','play','1999-10-22');

INSERT INTO horses (pack_animals_id, name, command, birthday) 
VALUES (1, 'Bim', 'cart', '1998-02-03'),
(1, 'Ruby', 'eat','2002-02-03' ),
(1, 'Black','play','1998-10-22');

INSERT INTO camels (pack_animals_id, name, command, birthday) 
VALUES (2, 'Bim', 'cart', '1998-02-03'),
(2, 'Ruby', 'eat','2002-02-03' ),
(2, 'Black','play','1998-10-22');

INSERT INTO donkeys (pack_animals_id, name, command, birthday) 
VALUES (3, 'Bim', 'cart', '1998-02-03'),
(3, 'Ruby', 'eat','2002-02-03' ),
(3, 'Black','play','1999-10-22');

DROP TABLE camels;


SELECT * FROM horses
UNION  
SELECT * FROM donkeys;

CREATE VIEW horses_donkeys
AS
SELECT * FROM horses
UNION  
SELECT * FROM donkeys;



INSERT INTO donkeys (pack_animals_id, name, command, birthday) 
VALUES (3, 'Bim', 'cart', '2022-01-19'),
(3, 'Ruby', 'eat','2020-01-20' ),
(3, 'Black','play','2020-01-21');


CREATE VIEW animals_view
AS
SELECT * FROM dogs
UNION  
SELECT * FROM cats
UNION 
SELECT * FROM hamsters
UNION
SELECT * FROM horses_donkeys;

CREATE VIEW young_animals
AS
SELECT name, birthday, TIMESTAMPDIFF(MONTH, birthday, NOW()) AS age_month
FROM animals_view
WHERE TIMESTAMPDIFF(MONTH, birthday, NOW()) BETWEEN 12 AND 36;
