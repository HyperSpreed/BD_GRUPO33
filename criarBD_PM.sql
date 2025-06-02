-- ----------------------------------------
-- Criação da base de dados 
-- ----------------------------------------
-- DROP DATABASE IF EXISTS PM_Veículos;
CREATE DATABASE IF NOT EXISTS PM_Veículos
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
USE PM_Veículos;

-- -----------------------------------------
-- Criação das tabelas 
-- -----------------------------------------
-- DROP TABLE IF EXISTS Stand, Funcionario, Cliente, Veiculo, Aluguer;

CREATE TABLE IF NOT EXISTS Stand (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Data_inauguração DATE NOT NULL,
    Telefone INT(9) NOT NULL,
    Cod_Postal VARCHAR(10) NOT NULL,
    Rua VARCHAR(20) NOT NULL,
    Localidade VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Cliente (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(64) NOT NULL,
    Data_nasc DATE NOT NULL,
    Nacionalidade VARCHAR(50) NOT NULL,
    NIF INT(9) NOT NULL,
    Email VARCHAR(75) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    Cod_Postal VARCHAR(10) NOT NULL,
    Rua VARCHAR(20) NOT NULL,
    Localidade VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Funcionario (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(64) NOT NULL,
    Cargo VARCHAR(20) NOT NULL,
    Horas_trabalhadas INT NOT NULL,
    StandId INT NOT NULL,
    FOREIGN KEY (StandId) REFERENCES Stand(Id)
);

CREATE TABLE IF NOT EXISTS Veiculo (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Matricula VARCHAR(8) NOT NULL,
    Modelo VARCHAR(20) NOT NULL,
    Marca VARCHAR(20) NOT NULL,
    Tipo VARCHAR(10) NOT NULL,
    Estado VARCHAR(10) NOT NULL,
    Preço DECIMAL(5,2) NOT NULL,
    Histórico TEXT,
    StandId INT NOT NULL,
    FOREIGN KEY (StandId) REFERENCES Stand(Id)
);

CREATE TABLE IF NOT EXISTS Aluguer (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Data_início DATE NOT NULL,
    Data_fim DATE NOT NULL,
    Preço_total DECIMAL(6,2) NOT NULL,
    Estado VARCHAR(40) NOT NULL,
    ClienteId INT NOT NULL,
    FuncionarioId INT NOT NULL,
    VeículoId INT NOT NULL,
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id),
    FOREIGN KEY (FuncionarioId) REFERENCES Funcionario(Id),
    FOREIGN KEY (VeículoId) REFERENCES Veiculo(Id)
);
