-- ---------------------------------------------
-- Procedimento armazenado para alugar um veículo
-- ---------------------------------------------
DELIMITER $$
CREATE PROCEDURE Realizar_Aluguer (
    IN p_clienteId INT,
    IN p_funcionarioId INT,
    IN p_veiculoId INT,
    IN p_data_inicio DATE,
    IN p_data_fim DATE
)
BEGIN
    DECLARE v_preco_dia DECIMAL(10,2);
    DECLARE v_duracao INT;
    DECLARE v_preco_total DECIMAL(10,2);

    START TRANSACTION;

    -- Obter preço diário do veículo
    SELECT Preço INTO v_preco_dia
    FROM Veiculo
    WHERE Id = p_veiculoId;

    -- Calcular duração
    SET v_duracao = DATEDIFF(p_data_fim, p_data_inicio);

    -- Calcular preço total
    SET v_preco_total = v_duracao * v_preco_dia;

    -- Inserir aluguer
    INSERT INTO Aluguer (Data_início, Data_fim, Preço_total, Estado, ClienteId, FuncionarioId, VeículoId)
    VALUES (p_data_inicio, p_data_fim, v_preco_total, 'Normal', p_clienteId, p_funcionarioId, p_veiculoId);

    COMMIT;
END$$
DELIMITER ;

-- --------------------------------------------
-- Função para calcular a duração de um aluguer
-- --------------------------------------------
DELIMITER $$

CREATE FUNCTION Calcular_Duracao(data_inicio DATE, data_fim DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN DATEDIFF(data_fim, data_inicio);
END$$

DELIMITER ;

-- --------------------------------------------
-- Atualizar o estado do veiculo ao ser alugado
-- --------------------------------------------
DELIMITER $$

CREATE TRIGGER Atualizar_Estado_Veiculo
AFTER INSERT ON Aluguer
FOR EACH ROW
BEGIN
    UPDATE Veiculo
    SET Estado = 'Alugado'
    WHERE Id = NEW.VeículoId;
END$$

DELIMITER ;


-- --------------------------------------------

DROP TRIGGER IF EXISTS trg_Aluguer_PrecoTotal;

DELIMITER $$
CREATE TRIGGER trg_Aluguer_PrecoTotal
  BEFORE INSERT ON Aluguer
  FOR EACH ROW
BEGIN
  IF NEW.Preço_total = 0 THEN
    SET NEW.Preço_total =
      DATEDIFF(NEW.Data_fim, NEW.Data_início)
      * (SELECT Preço FROM Veiculo WHERE Id = NEW.VeículoId);
  END IF;
END$$
DELIMITER ;
