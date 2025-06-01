-- Veículos disponíveis (RM01)
CREATE VIEW Veiculos_Disponiveis AS
SELECT * FROM Veiculo
WHERE Estado = 'Disponível';

-- Veículos indisponíveis (RM01)
CREATE VIEW Veiculos_Indisponiveis AS
SELECT * FROM Veiculo
WHERE Estado != 'Disponível';

-- Funcionários por stand (RM02)
CREATE VIEW Funcionarios_Stands AS
SELECT f.Id, f.Nome, f.Cargo, f.Horas_trabalhadas, s.Localidade AS Stand_Localidade
FROM Funcionario f
JOIN Stand s ON f.StandId = s.Id;

-- Clientes por localidade (RM12)
CREATE VIEW Clientes_Por_Localidade AS
SELECT Localidade, COUNT(*) AS Total_Clientes
FROM Cliente
GROUP BY Localidade;

-- Alugueres por cliente (RM06)
CREATE VIEW Alugueres_Cliente AS
SELECT a.Id AS AluguerId, c.Nome AS Cliente, v.Marca, v.Modelo, a.Data_início, a.Data_fim, a.Preço_total
FROM Aluguer a
JOIN Cliente c ON a.ClienteId = c.Id
JOIN Veiculo v ON a.VeículoId = v.Id;

-- Alugueres por funcionário (RM08)
CREATE VIEW Alugueres_Funcionario AS
SELECT a.Id AS AluguerId, f.Nome AS Funcionario, v.Marca, v.Modelo, a.Data_início, a.Data_fim
FROM Aluguer a
JOIN Funcionario f ON a.FuncionarioId = f.Id
JOIN Veiculo v ON a.VeículoId = v.Id;

-- Clientes por nacionalidade (RM11)
CREATE VIEW Clientes_Por_Nacionalidade AS
SELECT Nacionalidade, COUNT(*) AS Total_Clientes
FROM Cliente
GROUP BY Nacionalidade;



-- Total de veículos por tipo (RM10)
CREATE VIEW Veiculos_Por_Tipo AS
SELECT Tipo, COUNT(*) AS Total
FROM Veiculo
GROUP BY Tipo;

