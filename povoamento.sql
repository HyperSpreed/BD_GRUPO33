INSERT INTO Stand (Id, Data_inauguração, Telefone, Cod_Postal, Rua, Localidade) VALUES
(1, '12-12-2012', 252180799, '4470-995', 'Rua da Caralinda', 'Porto'),
(2, '15-09-2015', 212345678, '4000-002', 'Avenida Central', 'Lisboa'),
(3, '03-01-2020', 213456789, '8000-003', 'Estrada do Sul', 'Portimão');

INSERT INTO Cliente (Id, Nome, Data_nasc, Nacionalidade, NIF, Email, Telefone, Cod_Postal, Rua, Localidade) VALUES
(1, 'João Silva', '23-04-1985', 'Portuguesa', 123456789, 'joao.silva@email.com', '919999999', '1100-001', 'Rua da Alegria', 'Lisboa'),
(2, 'Maria Santos', '12-10-1990', 'Portuguesa', 987654321, 'maria.santos@email.com', '929888888', '4200-002', 'Rua do Sol', 'Porto'),
(3, 'Carlos Neves', '30-06-1978', 'Portuguesa', 112233445, 'carlos.neves@email.com', '938777777', '3000-003', 'Rua das Oliveiras', 'Coimbra'),
(4, 'Ana Lopes', '18-02-1995', 'Brasileira', 223344556, 'ana.lopes@email.com', '967666666', '1500-004', 'Rua das Acácias', 'Lisboa'),
(5, 'Rui Martins', '01-12-1980', 'Portuguesa', 334455667, 'rui.martins@email.com', '968555555', '5000-005', 'Rua do Norte', 'Braga'),
(6, 'Sofia Almeida', '22-11-1992', 'Portuguesa', 445566778, 'sofia.almeida@email.com', '938444444', '6000-006', 'Rua do Mar', 'Setúbal'),
(7, 'Tiago Rocha', '17-07-1988', 'Portuguesa', 556677889, 'tiago.rocha@email.com', '927333333', '7000-007', 'Rua das Palmeiras', 'Évora');

INSERT INTO Funcionario (Id, Nome, Cargo, Horas_trabalhadas, StandId) VALUES
(1, 'Carlos Mendes', 'Vendedor', 160, 1),
(2, 'Ana Costa', 'Gerente', 170, 2),
(3, 'Bruno Teixeira', 'Vendedor', 150, 1),
(4, 'Inês Pereira', 'Assistente', 140, 3),
(5, 'Fábio Lima', 'Vendedor', 155, 2),
(6, 'Clara Matos', 'Gerente', 165, 3);

INSERT INTO Veiculo (Id, Matricula, Modelo, Marca, Tipo, Estado, Preço, Histórico, StandId) VALUES
(1, 'AA-11-BB', 'Clio', 'Renault', 'Normal', 'Disponível', 75.00, 'Sem ocorrências.', 1),
(2, 'CC-22-DD', 'Focus', 'Ford', 'Normal', 'Indisponível', 85.50, 'Revisão em 2023.', 2),
(3, 'EE-33-FF', 'A3', 'Audi', 'Desportivo', 'Disponível', 120.00, 'Acidente leve em 2022.', 1),
(4, 'GG-44-HH', 'Yaris', 'Toyota', 'Normal', 'Disponível', 70.00, 'Sem ocorrências.', 2),
(5, 'II-55-JJ', 'Golf', 'Volkswagen', 'Normal', 'Manutenção', 90.00, 'Revisão pendente.', 3),
(6, 'KK-66-LL', 'Civic', 'Honda', 'Desportivo', 'Indisponível', 115.00, 'Excelente estado.', 1),
(7, 'MM-77-NN', 'Corsa', 'Opel', 'Normal', 'Disponível', 65.00, 'Sem ocorrências.', 3),
(8, 'OO-88-PP', 'Model 3', 'Tesla', 'Desportivo', 'Disponível', 150.00, 'Novo.', 3),
(9, 'QQ-99-RR', 'Panda', 'Fiat', 'Normal', 'Disponível', 60.00, 'Veículo económico.', 2),
(10, 'SS-00-TT', '208', 'Peugeot', 'Normal', 'Indisponível', 72.00, 'Acidente grave em 2023.', 1);

INSERT INTO Aluguer (Id, Data_início, Data_fim, Preço_total, Estado, ClienteId, FuncionarioId, VeículoId) VALUES
(1, '01-05-2025', '10-05-2025', 750.00, 'Bom', 1, 1, 1),
(2, '15-05-2025', '20-05-2025', 427.50, 'Mau', 2, 2, 2),
(3, '05-04-2025', '12-04-2025', 840.00, 'Normal', 3, 3, 3),
(4, '20-05-2025', '22-05-2025', 140.00, 'Mau', 4, 4, 4),
(5, '10-03-2025', '15-03-2025', 450.00, 'Normal', 5, 5, 5),
(6, '01-05-2025', '07-05-2025', 805.00, 'Bom', 6, 6, 6),
(7, '25-05-2025', '01-06-2025', 455.00, 'Bom', 7, 1, 7),
(8, '29-05-2025', '05-06-2025', 1050.00, 'Normal', 1, 2, 10);
