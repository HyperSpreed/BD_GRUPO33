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
