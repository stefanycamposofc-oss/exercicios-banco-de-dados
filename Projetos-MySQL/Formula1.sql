CREATE DATABASE IF NOT EXISTS db_formula1;
USE db_formula1;

CREATE TABLE paises (
    codigo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    PRIMARY KEY (codigo)
);

CREATE TABLE equipes (
    sigla VARCHAR(10) NOT NULL,
    nome VARCHAR(80) NOT NULL,
    cod_pais INT NOT NULL,
    PRIMARY KEY (sigla),
    FOREIGN KEY (cod_pais)
        REFERENCES paises(codigo)
);

CREATE TABLE pilotos (
    numero INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cod_pais INT NOT NULL,
    sigla_equipe VARCHAR(10) NOT NULL,
    PRIMARY KEY (numero),
    FOREIGN KEY (cod_pais)
        REFERENCES paises(codigo),
    FOREIGN KEY (sigla_equipe)
        REFERENCES equipes(sigla)
);

CREATE TABLE corridas (
    sigla_gp VARCHAR(10) NOT NULL,
    nome_gp VARCHAR(100) NOT NULL,
    cod_pais INT NOT NULL,
    qtd_voltas INT NOT NULL,
    PRIMARY KEY (sigla_gp),
    FOREIGN KEY (cod_pais)
        REFERENCES paises(codigo)
);

CREATE TABLE participantes (
    sigla_gp VARCHAR(10) NOT NULL,
    num_piloto INT NOT NULL,
    posicao_largada INT NOT NULL,
    PRIMARY KEY (sigla_gp, num_piloto),
    FOREIGN KEY (sigla_gp)
        REFERENCES corridas(sigla_gp),
    FOREIGN KEY (num_piloto)
        REFERENCES pilotos(numero)
);

INSERT INTO paises (codigo, nome) VALUES
(1, 'BRASIL'),
(2, 'ITALIA'),
(3, 'FRANCA'),
(4, 'ALEMANHA'),
(5, 'INGLATERRA'),
(6, 'ESPANHA'),
(7, 'MONACO'),
(8, 'JAPAO'),
(9, 'CANADA'),
(10, 'AUSTRALIA');

INSERT INTO equipes (sigla, nome, cod_pais) VALUES
('FER', 'Ferrari', 2),
('MER', 'Mercedes', 4),
('RBR', 'Red Bull Racing', 5),
('MCL', 'McLaren', 5),
('ALP', 'Alpine', 3),
('WIL', 'Williams', 5),
('AST', 'Aston Martin', 5),
('HAA', 'Haas', 5);

INSERT INTO pilotos
(numero, nome, cod_pais, sigla_equipe)
VALUES
(1, 'Ayrton Senna', 1, 'MCL'),
(2, 'Felipe Massa', 1, 'FER'),
(3, 'Rubens Barrichello', 1, 'FER'),
(4, 'Nelson Piquet', 1, 'WIL'),
(5, 'Emerson Fittipaldi', 1, 'MCL'),
(6, 'Giancarlo Fisichella', 2, 'FER'),
(7, 'Jarno Trulli', 2, 'ALP'),
(8, 'Antonio Giovinazzi', 2, 'FER'),
(9, 'Pierre Gasly', 3, 'ALP'),
(10, 'Esteban Ocon', 3, 'HAA'),
(11, 'Michael Schumacher', 4, 'MER'),
(12, 'Lewis Hamilton', 5, 'MER'),
(13, 'Fernando Alonso', 6, 'AST'),
(14, 'Charles Leclerc', 7, 'FER'),
(15, 'Max Verstappen', 5, 'RBR');

INSERT INTO corridas
(sigla_gp, nome_gp, cod_pais, qtd_voltas)
VALUES
('BRA', 'GP DO BRASIL', 1, 71),
('ITA', 'GP DA ITALIA', 2, 53),
('FRA', 'GP DA FRANCA', 3, 53),
('ALE', 'GP DA ALEMANHA', 4, 67),
('ING', 'GP DA INGLATERRA', 5, 52),
('ESP', 'GP DA ESPANHA', 6, 66),
('MON', 'GP DE MONACO', 7, 78),
('JAP', 'GP DO JAPAO', 8, 53),
('CAN', 'GP DO CANADA', 9, 70),
('AUS', 'GP DA AUSTRALIA', 10, 58);

INSERT INTO participantes
(sigla_gp, num_piloto, posicao_largada)
VALUES
('BRA', 1, 1),
('BRA', 2, 2),
('BRA', 3, 3),
('BRA', 4, 4),
('BRA', 5, 5),
('ITA', 6, 1),
('ITA', 7, 2),
('ITA', 8, 3),
('ITA', 11, 4),
('FRA', 9, 1),
('FRA', 10, 2),
('FRA', 12, 3),
('ALE', 11, 1),
('ALE', 15, 2),
('ING', 12, 1),
('ING', 1, 2),
('ESP', 13, 1),
('ESP', 14, 2),
('MON', 14, 1),
('MON', 15, 2),
('JAP', 1, 1),
('JAP', 11, 2),
('CAN', 12, 1),
('CAN', 15, 2),
('AUS', 13, 1),
('AUS', 9, 2);

SELECT
    p.nome AS pais,
    COUNT(pi.numero) AS quantidade_pilotos
FROM paises p
INNER JOIN pilotos pi
    ON p.codigo = pi.cod_pais
WHERE p.nome IN ('BRASIL', 'ITALIA', 'FRANCA')
GROUP BY p.nome;

SELECT * FROM paises;
SELECT * FROM equipes;
SELECT * FROM pilotos;
SELECT * FROM corridas;
SELECT * FROM participantes;
SELECT nome
FROM paises
WHERE nome LIKE 'B%L';

SELECT
    pi.nome AS piloto,
    p.nome AS pais
FROM pilotos pi
INNER JOIN paises p
    ON pi.cod_pais = p.codigo
WHERE p.nome IN ('BRASIL', 'ITALIA', 'FRANCA');

SELECT nome
FROM pilotos;

SELECT
    nome_gp AS 'Grande Premio',
    qtd_voltas AS 'Quantidade de Voltas'
FROM corridas;

SELECT
    pi.nome AS 'Nome do Piloto',
    p.nome AS 'Pais de Origem'
FROM pilotos pi
INNER JOIN paises p
    ON pi.cod_pais = p.codigo;

ALTER TABLE pilotos
ADD COLUMN salario DECIMAL(10,2);

UPDATE pilotos SET salario = 95000.00 WHERE numero = 1;
UPDATE pilotos SET salario = 80000.00 WHERE numero = 2;
UPDATE pilotos SET salario = 75000.00 WHERE numero = 3;
UPDATE pilotos SET salario = 90000.00 WHERE numero = 4;
UPDATE pilotos SET salario = 85000.00 WHERE numero = 5;
UPDATE pilotos SET salario = 70000.00 WHERE numero = 6;
UPDATE pilotos SET salario = 65000.00 WHERE numero = 7;
UPDATE pilotos SET salario = 72000.00 WHERE numero = 8;
UPDATE pilotos SET salario = 88000.00 WHERE numero = 9;
UPDATE pilotos SET salario = 78000.00 WHERE numero = 10;
UPDATE pilotos SET salario = 120000.00 WHERE numero = 11;
UPDATE pilotos SET salario = 150000.00 WHERE numero = 12;
UPDATE pilotos SET salario = 110000.00 WHERE numero = 13;
UPDATE pilotos SET salario = 130000.00 WHERE numero = 14;
UPDATE pilotos SET salario = 160000.00 WHERE numero = 15;

SELECT nome, salario
FROM pilotos;

SELECT
    nome AS 'Piloto',
    salario AS 'Salario'
FROM pilotos
WHERE salario BETWEEN 70000 AND 100000
ORDER BY salario ASC;

SELECT
    cod_pais AS 'Codigo do Pais',
    AVG(salario) AS 'Media Salarial'
FROM pilotos
GROUP BY cod_pais
ORDER BY cod_pais;

SELECT DISTINCT salario
FROM pilotos
ORDER BY salario ASC;
