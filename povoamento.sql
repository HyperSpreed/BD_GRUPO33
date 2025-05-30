INSERT INTO Stand (Id, Data_inauguração, Telefone, Cod_Postal, Rua, Localidade) VALUES
(1, '2010-05-10', 211234567, '1000-001', 'Rua das Flores', 'Lisboa'),
(2, '2015-09-15', 212345678, '4000-002', 'Avenida Central', 'Porto'),
(3, '2020-03-01', 213456789, '8000-003', 'Estrada do Sul', 'Faro');

INSERT INTO Cliente (Id, Nome, Data_nasc, Nacionalidade, NIF, Email, Telefone, Cod_Postal, Rua, Localidade) VALUES
(1, 'João Silva', '1985-04-23', 'Portuguesa', 123456789, 'joao.silva@email.com', '919999999', '1100-001', 'Rua da Alegria', 'Lisboa'),
(2, 'Maria Santos', '1990-10-12', 'Portuguesa', 987654321, 'maria.santos@email.com', '929888888', '4200-002', 'Rua do Sol', 'Porto'),
(3, 'Carlos Neves', '1978-06-30', 'Portuguesa', 112233445, 'carlos.neves@email.com', '938777777', '3000-003', 'Rua das Oliveiras', 'Coimbra'),
(4, 'Ana Lopes', '1995-02-18', 'Brasileira', 223344556, 'ana.lopes@email.com', '967666666', '1500-004', 'Rua das Acácias', 'Lisboa'),
(5, 'Rui Martins', '1980-12-01', 'Portuguesa', 334455667, 'rui.martins@email.com', '968555555', '5000-005', 'Rua do Norte', 'Braga'),
(6, 'Sofia Almeida', '1992-11-22', 'Portuguesa', 445566778, 'sofia.almeida@email.com', '938444444', '6000-006', 'Rua do Mar', 'Setúbal'),
(7, 'Tiago Rocha', '1988-07-17', 'Portuguesa', 556677889, 'tiago.rocha@email.com', '927333333', '7000-007', 'Rua das Palmeiras', 'Évora');

INSERT INTO Funcionario (Id, Nome, Cargo, Horas_trabalhadas, StandId) VALUES
(1, 'Carlos Mendes', 'Vendedor', 160, 1),
(2, 'Ana Costa', 'Gestora', 170, 2),
(3, 'Bruno Teixeira', 'Mecânico', 150, 1),
(4, 'Inês Pereira', 'Assistente', 140, 3),
(5, 'Fábio Lima', 'Vendedor', 155, 2),
(6, 'Clara Matos', 'Gestora', 165, 3);

INSERT INTO Veiculo (Id, Matricula, Modelo, Marca, Tipo, Estado, Preço, Histórico, StandId) VALUES
(1, 'AA-11-BB', 'Clio', 'Renault', 'Citadino', 'Disponível', 75.00, 'Sem ocorrências.', 1),
(2, 'CC-22-DD', 'Focus', 'Ford', 'Familiar', 'Alugado', 85.50, 'Revisão em 2023.', 2),
(3, 'EE-33-FF', 'A3', 'Audi', 'Desportivo', 'Disponível', 120.00, 'Acidente leve em 2022.', 1),
(4, 'GG-44-HH', 'Yaris', 'Toyota', 'Citadino', 'Disponível', 70.00, 'Novo em 2024.', 2),
(5, 'II-55-JJ', 'Golf', 'Volkswagen', 'Familiar', 'Manutenção', 90.00, 'Revisão pendente.', 3),
(6, 'KK-66-LL', 'Civic', 'Honda', 'Desportivo', 'Alugado', 115.00, 'Excelente estado.', 1),
(7, 'MM-77-NN', 'Corsa', 'Opel', 'Citadino', 'Disponível', 65.00, 'Sem histórico.', 3),
(8, 'OO-88-PP', 'Model 3', 'Tesla', 'Elétrico', 'Disponível', 150.00, 'Novo.', 3),
(9, 'QQ-99-RR', 'Panda', 'Fiat', 'Citadino', 'Disponível', 60.00, 'Veículo económico.', 2),
(10, 'SS-00-TT', '208', 'Peugeot', 'Citadino', 'Alugado', 72.00, 'Alugado várias vezes.', 1);

INSERT INTO Aluguer (Id, Data_início, Data_fim, Preço_total, Estado, ClienteId, FuncionarioId, VeículoId) VALUES
(1, '2025-05-01', '2025-05-10', 750.00, 'Concluído', 1, 1, 1),
(2, '2025-05-15', '2025-05-20', 427.50, 'Em curso', 2, 2, 2),
(3, '2025-04-05', '2025-04-12', 840.00, 'Concluído', 3, 3, 3),
(4, '2025-05-20', '2025-05-22', 140.00, 'Cancelado', 4, 4, 4),
(5, '2025-03-10', '2025-03-15', 450.00, 'Concluído', 5, 5, 5),
(6, '2025-05-01', '2025-05-07', 805.00, 'Concluído', 6, 6, 6),
(7, '2025-05-25', '2025-06-01', 455.00, 'Reservado', 7, 1, 7),
(8, '2025-05-29', '2025-06-05', 1050.00, 'Em curso', 1, 2, 10);