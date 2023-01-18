-- Active: 1674045355656@@127.0.0.1@3306


-- Práticas
--criar tabela
CREATE TABLE users(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
    
);
INSERT INTO users(id, name, email, password)
VALUES("a001", "Gleice", "gleiscylima123@gmail.com", "maria12"),
("a002", "Pedro", "pedro123@gmail.com", "joao123"
);
DROP TABLE users;

SELECT * FROM users;

CREATE TABLE phone(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO phone(id, phone_number, user_id)
VALUES("A01","55991256983", "a001"),
("B02","5591457030", "a002"), 
("C03","559192932094", "a001");

--junção com apelido e selecionando apenas  o que eu quero q apareça na tabela.
SELECT users.id AS UserId,
users.name,
users.email, 
-- users.password, 
-- phone.id AS phoneId, 

-- phone.user_id
 phone.phone_number FROM users
INNER JOIN phone
ON phone.user_id = users.id;


--junção simples
SELECT * FROM users
INNER JOIN phone
ON phone.user_id= users.id;

--criando uma tabela de carteira de habilitação
CREATE TABLE licenses(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT NOT NULL,
    category TEXT NOT NULL
);
INSERT INTO licenses(id, register_number, category)
VALUES("A01","001091256983", "a"),
("B02","0091457030", "b"), 
("C03","0089192932094", "c");

CREATE TABLE drivers(
    id TEXT PRIMARY KEY NOT NULL, 
    name TEXT NOT NULL, 
    email TEXT NOT NULL, 
    password TEXT NOT NULL, 
    user_id TEXT NOT NULL,

 FOREIGN KEY (user_id) REFERENCES licenses (id)

);
SELECT * FROM drivers; 
INSERT INTO drivers(id, name, email, password, user_id)
VALUES("A01","Gleice", "gleisclima@gmail.com","amakis", "A01"),
("B02","Pedro", "pedropaulo@gmail.com", "bananinha", "B02"), 
("C03","Paulo","pauloricadrdo@gmail.com", "carro123", "C03");

DROP TABLE drivers;

SELECT * FROM licenses
INNER JOIN drivers 
ON drivers.user_id = licenses.id;