
-- Criar as ROLES
DROP ROLE IF EXISTS
    'proprietario'@'localhost',
    'gerente'@'localhost',
    'funcionario'@'localhost';
    
CREATE ROLE
    'proprietario'@'localhost',
    'gerente'@'localhost',
    'funcionario'@'localhost';

-- Permissoes

-- RC01:
GRANT ALL PRIVILEGES ON PM_Veículos.* TO 'proprietario'@'localhost';

-- RC02:
GRANT SELECT, INSERT, UPDATE ON PM_Veículos.Cliente TO 'gerente'@'localhost';
GRANT SELECT, INSERT, UPDATE ON PM_Veículos.Funcionario TO 'gerente'@'localhost';
GRANT SELECT, INSERT, UPDATE ON PM_Veículos.Aluguer TO 'gerente'@'localhost';

-- Gerente altera tudo, menos o preço dos veículos
GRANT SELECT(Id, Matricula, Modelo, Marca, Tipo, Estado, Histórico, StandId),
      UPDATE(Matricula, Modelo, Marca, Tipo, Estado, Histórico, StandId),
      INSERT(Id, Matricula, Modelo, Marca, Tipo, Estado, Histórico, StandId)
ON PM_Veículos.Veiculo TO 'gerente'@'localhost';

-- RC03:
-- Funcionários podem ver a propria informação e os dados dos alugueres
GRANT SELECT(Nome, Cargo, Horas_trabalhadas) ON PM_Veículos.Funcionario TO 'funcionario'@'localhost';
GRANT SELECT(Estado, Data_início, Data_fim, Preço_total) ON PM_Veículos.Aluguer TO 'funcionario'@'localhost';

-- RC04: 
-- Apenas o proprietário pode alterar o preço dos veículos
GRANT UPDATE(Preço) ON PM_Veículos.Veiculo TO 'proprietario'@'localhost';

-- Criar os utilizadores
DROP USER IF EXISTS
    'pedro.monteiro'@'localhost',
    'ana.costa'@'localhost',
    'carlos.mendes'@'localhost';

CREATE USER
    'pedro.monteiro'@'localhost' IDENTIFIED BY 'adminpm2025',
    'ana.costa'@'localhost' IDENTIFIED BY 'gerenteporto2025',
    'carlos.mendes'@'localhost' IDENTIFIED BY 'funcporto2025';

-- Atribuir as ROLES
GRANT 'proprietario'@'localhost' TO 'pedro.monteiro'@'localhost';
SET DEFAULT ROLE 'proprietario'@'localhost' TO 'pedro.monteiro'@'localhost';

GRANT 'gerente'@'localhost' TO 'ana.costa'@'localhost';
SET DEFAULT ROLE 'gerente'@'localhost' TO 'ana.costa'@'localhost';

GRANT 'funcionario'@'localhost' TO 'carlos.mendes'@'localhost';
SET DEFAULT ROLE 'funcionario'@'localhost' TO 'carlos.mendes'@'localhost';
