-- ================================================
-- RM01 – Listar veículos disponíveis, indisponíveis e totais
-- ================================================
-- 1. Veículos disponíveis
SELECT *
  FROM Veiculo
 WHERE Estado = 'Disponível';

-- 2. Veículos indisponíveis
SELECT *
  FROM Veiculo
 WHERE Estado <> 'Disponível';

-- 3. Todos os veículos
SELECT *
  FROM Veiculo;


-- ================================================
-- RM02 – Listar funcionários
-- ================================================
SELECT Id,
       Nome,
       Cargo,
       Horas_trabalhadas,
       StandId
  FROM Funcionario;


-- ================================================
-- RM03 – Listar stands
-- ================================================
SELECT Id,
       Data_inauguração,
       Telefone,
       Cod_Postal,
       Rua,
       Localidade
  FROM Stand;


-- ================================================
-- RM04 – Listar clientes
-- ================================================
SELECT Id,
       Nome,
       Data_nasc,
       Nacionalidade,
       NIF,
       Email,
       Telefone
  FROM Cliente;


-- ================================================
-- RM05 – Calcular preço do aluguer
-- ================================================
-- Para cada aluguer, multiplica o número de dias pelo preço diário do veículo
SELECT A.Id AS AluguerId,
       DATEDIFF(A.Data_fim, A.Data_início) * V.Preço AS PrecoCalc
  FROM Aluguer AS A
  JOIN Veiculo AS V
    ON A.VeículoId = V.Id;


-- ================================================
-- RM06 – Visualizar alugueres de um cliente c
-- ================================================
SELECT *
  FROM Aluguer
 WHERE ClienteId = ?;


-- ================================================
-- RM07 – Média de alugueres por dia de um stand s
-- ================================================
-- 1) Junta veículos do stand s com os respetivos alugueres
-- 2) Agrupa por dia de início e conta nº de alugueres
-- 3) Calcula a média desses valores
SELECT AVG(R.NumAlug) AS MediaAlugueresPorDia
  FROM (
         SELECT A.Data_início,
                COUNT(*) AS NumAlug
           FROM Aluguer AS A
           JOIN Veiculo AS V
             ON A.VeículoId = V.Id
          WHERE V.StandId = ?
          GROUP
             BY A.Data_início
       ) AS R;


-- ================================================
-- RM08 – Alugueres por funcionário f
-- ================================================
SELECT *
  FROM Aluguer
 WHERE FuncionarioId = ?;


-- ================================================
-- RM09 – Consultar horas trabalhadas por um funcionário f
-- ================================================
SELECT Nome,
       Horas_trabalhadas
  FROM Funcionario
 WHERE Id = ?;


-- ================================================
-- RM10 – Veículos por tipo t
-- ================================================
SELECT *
  FROM Veiculo
 WHERE Tipo = ?;


-- ================================================
-- RM11 – Clientes por nacionalidade n
-- ================================================
SELECT *
  FROM Cliente
 WHERE Nacionalidade = ?;


-- ================================================
-- RM12 – Clientes por localidade l
-- ================================================
SELECT *
  FROM Cliente
 WHERE Localidade = ?;


