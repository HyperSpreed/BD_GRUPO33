-- ========================================
-- TESTES
-- ========================================

-- Verificar views
SELECT * FROM Veiculos_Disponiveis;
SELECT * FROM Veiculos_Indisponiveis;
SELECT * FROM Funcionarios_Stands;
SELECT * FROM Clientes_Por_Localidade;
SELECT * FROM Alugueres_Cliente;
SELECT * FROM Alugueres_Funcionario;
SELECT * FROM Clientes_Por_Nacionalidade;
SELECT * FROM Veiculos_Por_Tipo;

-- Testar função
SELECT Calcular_Duracao('2024-06-01', '2024-06-05') AS Duracao_Dias;

-- Testar procedimento (Cliente, Funcionário, Veiculo, Inicio, Fim)
CALL Realizar_Aluguer(6, 4, 7, '2024-06-1', '2024-06-15');

-- Verificar se trigger alterou o estado
SELECT Id, Estado FROM Veiculo WHERE Id = 7;

-- Verificar se o aluguer foi inserido
SELECT * FROM Aluguer WHERE ClienteId = 6 AND VeículoId = 7;
