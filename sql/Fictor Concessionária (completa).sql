-- ============================================================
-- Projeto: Fictor Concessionária - Análise de Vendas
-- Etapa 1: Criação das tabelas
-- Autor: Lucas Martins
-- ============================================================

CREATE DATABASE concessionaria;

USE concessionaria;


CREATE TABLE cliente (
	id_cliente INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR (255) NOT NULL,
	sobrenome VARCHAR (255) NOT NULL,
	endereco VARCHAR (255) NOT NULL,
	PRIMARY KEY (id_cliente));
    
CREATE TABLE marcas (
	id_marcas INT NOT NULL AUTO_INCREMENT,
	nome_marcas VARCHAR (255) NOT NULL,
    origem VARCHAR (255),
    PRIMARY KEY(id_marcas));

CREATE TABLE inventario (
	id_inventario INT NOT NULL AUTO_INCREMENT,
    modelo VARCHAR (255) NOT NULL,
    transmissao VARCHAR (255) NOT NULL,
    motor VARCHAR (255) NOT NULL,
    combustivel VARCHAR (255) NOT NULL,
    id_marcas INT NOT NULL,
    PRIMARY KEY (id_inventario),
    FOREIGN KEY (id_marcas) REFERENCES marcas (id_marcas));
    
CREATE TABLE vendedor(
	id_vendedor INT NOT NULL AUTO_INCREMENT,
    nome_vendedor VARCHAR (255),
    sobrenome_vendedor VARCHAR (255),
    PRIMARY KEY (id_vendedor));
    
CREATE TABLE vendas (
	id_venda INT NOT NULL AUTO_INCREMENT,
    id_vendedor INT NOT NULL,
    id_carro INT NOT NULL,
    tipo_pagamento VARCHAR (255) NOT NULL,
    valor_venda DECIMAL NOT NULL,
    data_venda DATE NOT NULL,
    PRIMARY KEY (id_venda),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor (id_vendedor),
    FOREIGN KEY (id_carro) REFERENCES inventario (id_inventario));
    
-- ============================================================
-- Etapa: 02 - Inserção de dados
-- ============================================================
    
INSERT INTO cliente (nome, sobrenome, endereco)
VALUES 
	('Andre', 'Iacono', 'Rua das Flores 123, Brasília, DF'),
	('Marcos', 'Souza', 'Avenida Paulista 1000, São Paulo, SP'),
	('Maria', 'Almeida', 'Rua XV de Novembro 45, Curitiba, PR'),
	('Pedro', 'Martins', 'Travessa do Sol 77, Rio de Janeiro, RJ'),
	('Sara', 'Motta', 'Alameda Santos 500, São Paulo, SP'),
    ('Guilherme', 'Andrade', 'Rua das Acácias 210, Belo Horizonte, MG'),
    ('Ana', 'Silva', 'Rua da Paz 88, Salvador, BA'),
    ('Pedro', 'Costa', 'Avenida Brasil 3500, Rio de Janeiro, RJ'),
    ('Mariana', 'Oliveira', 'Rua da Harmonia 150, Recife, PE'),
    ('Rafael', 'Sousa', 'Travessa das Laranjeiras 22, Fortaleza, CE');
    
INSERT INTO marcas (nome_marcas, origem)
VALUES
	('Volkswagen', 'Nacional'),
    ('Chevrolet', 'Nacional'),
    ('Toyota', 'Importado'),
    ('Honda', 'Importado'),
    ('Hyundai', 'Nacional'),
    ('Jeep', 'Importado'),
    ('Jeep', 'Importado'),
    ('Volkswagen', 'Nacional'),
    ('Nissan', 'Importado'),
    ('Hyundai', 'Nacional');
INSERT INTO inventario (modelo, transmissao, motor, combustivel, id_marcas)
VALUES
	('Gol GT','Manual', '1.6', 'Gasolina', 1),
    ('Onix LT','Automatico',  '1.0', 'Flex', 2),
    ('Corolla XEi', 'Automatico', '2.0', 'Flex', 3),
    ('Civic EX', 'Automatico', '2.0', 'Flex', 4),
    ('HB20 Comfort', 'Manual', '1.0', 'Flex', 5),
    ('Jeep Compass', 'Automatico', '2.0', 'Diesel', 6),
    ('Renegade Sport', 'Automatico', '1.8', 'Flex', 7),
    ('Renegade Sport', 'Automatico', '1.8', 'Flex', 8),
    ('Kicks SL', 'Automatico', '1.6', 'Flex', 9),
    ('Creta Prestige', 'Automatico', '2.0', 'Flex', 10);
INSERT INTO vendedor (nome_vendedor, sobrenome_vendedor)
VALUES
	('Beatriz', 'Almeida'),
    ('João', 'Ferreira'),
    ('Camila', 'Rocha'),
    ('Thiago', 'Mendes');
INSERT INTO vendas (id_vendedor, id_carro, tipo_pagamento, valor_venda, data_venda)
VALUES
	(1, 1, 'Credito', 75000, '2025-08-07'),
    (4, 2, 'PIX', 85000,'2025-08-23'),
    (3, 3, 'Crédito', 150000, '2025-08-16'),
    (3, 4, 'Dinheiro', 145000, '2025-08-02'),
    (4, 5, 'PIX', 80000, '2025-08-25'),
    (2, 6, 'Credito', 200000, '2025-08-10'),
    (2, 7, 'PIX', 180000, '2025-08-09'),
    (2, 8, 'Crédito', 90000, '2025-08-07'),
    (1, 9, 'Dinheiro', 120000, '2025-08-29'),
    (2, 10, 'PIX', 130000, '2025-08-11');