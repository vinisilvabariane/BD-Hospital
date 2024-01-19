CREATE DATABASE hospitalBD;
USE hospitalBD; 



/*Tabela Consulta*/
CREATE TABLE consulta
(
	idConsulta INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    dataconsulta DATETIME NOT NULL,
    valor DECIMAL(9,2) NOT NULL,
    idmedico INT NOT NULL,
    idpaciente INT NOT NULL,
    idespecialidade INT NOT NULL,
	FOREIGN KEY (idmedico) REFERENCES medico(idMedico),
	FOREIGN KEY (idpaciente) REFERENCES paciente(idPaciente),
    FOREIGN KEY (idespecialidade) REFERENCES especialidade(idEspecialidade)
);
ALTER TABLE consulta ADD idreceita INT NOT NULL;
ALTER TABLE consulta ADD FOREIGN KEY (idreceita) REFERENCES receita(idReceita);



/*Tabela Medico*/
CREATE TABLE medico
(
	idMedico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    generalista VARCHAR(45) NOT NULL,
    especialista VARCHAR(45) NOT NULL,
	residente VARCHAR(45) NOT NULL,
    id_especialidade INT NOT NULL,
    FOREIGN KEY (id_especialidade) REFERENCES especialidade(idEspecialidade)
);
ALTER TABLE medico ADD atividade VARCHAR(45);
ALTER TABLE medico DROP residente;
ALTER TABLE medico DROP especialista;
ALTER TABLE medico DROP generalista;
ALTER TABLE medico ADD cargo VARCHAR(45) NOT NULL;



/*Tabela Especialidade*/
CREATE TABLE especialidade
(
	idEspecialidade INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descrição VARCHAR(45) NOT NULL
);



/*Tabela Paciente*/
CREATE TABLE paciente
(
	idPaciente INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    nome VARCHAR(45) NOT NULL,
    data_de_nas DATE NOT NULL,
    telefone VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL, 
    CPF VARCHAR(45) NOT NULL UNIQUE KEY,
    RG VARCHAR(45) NOT NULL UNIQUE KEY
);
ALTER TABLE paciente ADD id_convenio INT NOT NULL;
ALTER TABLE paciente ADD FOREIGN KEY (id_convenio) REFERENCES convenio(idConvenio);



/*Tabela Receita*/
CREATE TABLE receita
(
	idReceita INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    remedio VARCHAR(45) NOT NULL,
    id_medico INT NOT NULL,
    id_paciente INT NOT NULL,
	FOREIGN KEY (id_medico) REFERENCES medico(idMedico),
	FOREIGN KEY (id_paciente) REFERENCES paciente(idPaciente)
);



/*Tabela Convenio*/
CREATE TABLE convenio
(
	idConvenio INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    CNPJ VARCHAR(45) NOT NULL,
    tempo_de_carencia VARCHAR(45) NOT NULL
);



/*Tabela TipoQuarto*/
CREATE TABLE tipoquarto
(
	idTipoquarto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45) NOT NULL,
    valor VARCHAR(45) NOT NULL
);



/*Tabela Quarto*/
CREATE TABLE quarto
(
	idQuarto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(45) NOT NULL,
	id_tipo INT NOT NULL,
	FOREIGN KEY (id_tipo) REFERENCES tipoquarto(idTipoquarto)
);



/*Tabela Inetrnação*/
CREATE TABLE internacao
(
	idInternacao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_entrada DATETIME NOT NULL,
	data_prev_alta DATETIME NOT NULL,
	data_alta DATETIME NOT NULL,
	procedimento VARCHAR(45) NOT NULL,
    id_quarto INT NOT NULL,
    id_medico INT NOT NULL,
    id_paciente INT NOT NULL,
    FOREIGN KEY (id_quarto) REFERENCES quarto(idQuarto),
    FOREIGN KEY (id_medico) REFERENCES medico(idMedico),
    FOREIGN KEY (id_paciente) REFERENCES paciente(idPaciente)
);



/*Tabela Inter_enfer*/
CREATE TABLE inter_enfer
(
    id_internacao INT NOT NULL,
    id_enfermeiros INT NOT NULL,
	FOREIGN KEY (id_enfermeiros) REFERENCES enfermeiros(idEnfermeiros),
    FOREIGN KEY (id_internacao) REFERENCES internacao(idInternacao),
    PRIMARY KEY (id_internacao, id_enfermeiros)
);



/*Tabela Enfermeiros*/
CREATE TABLE enfermeiros
(
	idEnfermeiros INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    cre VARCHAR(45) NOT NULL,
    CPF VARCHAR(45) NOT NULL
);



/*Inserção Dados Especialidade*/
INSERT INTO especialidade (descrição) 
VALUES ("odontologia"),("neurologia"),("clinica"),("pediatria"),
	   ("dermatologia"),("ardiologia"),("gastroenterologia");

   
   
/*Inserção Dados Medico*/
INSERT INTO medico (cargo, id_especialidade) 
VALUES ("Residente", 1),
	   ("Especialista",2),
	   ("Generalista",3),
	   ("Generalista",4),
       ("Especialista",5),
	   ("Especialista",1),
	   ("Generalista",7),
	   ("Residente",5),
	   ("Especialista",6),
	   ("Residente",6);		
UPDATE medico SET atividade = "Inativo" WHERE idMedico = 9;
UPDATE medico SET atividade = "Inativo" WHERE idMedico = 10; 
UPDATE medico SET atividade = "Ativo" WHERE idMedico = 1;
UPDATE medico SET atividade = "Ativo" WHERE idMedico = 2; 
UPDATE medico SET atividade = "Ativo" WHERE idMedico = 3; 
UPDATE medico SET atividade = "Ativo" WHERE idMedico = 4; 
UPDATE medico SET atividade = "Ativo" WHERE idMedico = 5; 
UPDATE medico SET atividade = "Ativo" WHERE idMedico = 6; 
UPDATE medico SET atividade = "Ativo" WHERE idMedico = 7;
UPDATE medico SET atividade = "Ativo" WHERE idMedico = 8;  



/*Inserção Dados Convenio*/
INSERT INTO convenio (nome, CNPJ, tempo_de_carencia)
VALUES ("SERPRAM", "91.823.611/0001-87", "15 dias"),
       ("UNIMED", "57.836.498/0001-23", "10 dias"),
       ("NOTRIDAME", "04.521.662/0001-29", "30 dias"),
       ("ULTRAFARMA", "08.698.662/0001-29", "5 dias");



/*Inserção Dados Pacientes*/
INSERT INTO paciente (nome, data_de_nas, telefone, email, RG, CPF, id_convenio)
VALUES ("Roberta", "1985-04-02", "(35) 9630 0001", "roberta@email.com", "25.760.719-5", "08526373064", 2),
	   ("Matheus", "1989-10-23", "(35) 9630 0002", "matheus@email.com", "30.909.163-9", "48235718430", 4),
	   ("Pedro", "1984-07-09", "(35) 9630 0003", "pedro@email.com", "23.924.847-8", "01103428799", 4),
	   ("Carla", "2003-07-04", "(35) 9630 0004", "carla@email.com", "33.890.384-7", "81106460421", 3),
	   ("Maria", "2001-12-29", "(35) 9630 0005", "maria@email.com", "22.319.223-5", "92061204767", 1),
	   ("Jorge", "1999-05-05", "(35) 9630 0006", "jorge@email.com", "17.128.698-4", "85476277234", 1),
       ("Antonio", "1999-11-26", "(35) 9630 0007", "antonio@email.com", "37.541.711-4", "41262394481", 1),
       ("Carlos", "1999-10-15", "(35) 9630 0008", "carlos@email.com", "34.567.310-4", "44649488710", 2),
       ("Luis", "1999-12-15", "(35) 9630 0009", "luis@email.com", "11.971.431-0", "84545787738", 4),
       ("Igor", "1992-04-25", "(35) 9630 0010", "igor@email.com", "20.373.247-9", "34639155611", 4),
       ("Clara", "1996-06-30", "(35) 9630 0011", "clara@email.com", "38.604.069-2", "31943562245", 1),
       ("Sara", "2004-09-25", "(35) 9630 0012", "sara@email.com", "32.853.159-5", "04793351174", 3),
       ("Kaiky", "1981-08-10", "(35) 9630 0013", "kaiky@email.com", "18.307.454-3", "79331145128", 4),
       ("Francisco", "1999-11-06", "(35) 9630 0014", "francisco@email.com", "23.544.499-6", "69125138243", 2),
       ("Aline", "2000-12-04", "(35) 9630 0015", "aline@email.com", "02.658.001.58", "31889365670", 3);



/*Inserção Dados Consulta*/
INSERT INTO consulta (dataconsulta, valor, idmedico, idpaciente, idespecialidade, idreceita)
VALUES  ('2018-06-23 10:30:00', '120.00', '3', '1', '3', '1'),
		('2022-01-01 11:30:00', '345.00', '5', '3', '5', '2'),
		('2019-12-31 10:00:00', '100.00', '6', '15', '6', '3'),
		('2016-04-21 15:30:00', '154.00', '7', '12', '7', '4'),
		('2017-07-23 07:30:00', '167.00', '2', '1', '2', '5'),
		('2020-11-21 18:00:00', '140.00', '5', '2', '5', '6'),
		('2021-03-17 10:30:00', '550.00', '2', '8', '3', '7'),
		('2015-01-16 11:30:00', '164.00', '1', '9', '1', '8'),
		('2017-10-15 08:30:00', '120.00', '1', '6', '1', '9'),
		('2018-05-14 17:00:00', '450.00', '6', '7', '6', '10'),
		('2018-04-05 19:30:00', '260.00', '3', '7', '3', '11'),
		('2015-11-27 10:30:00', '245.00', '7', '11', '7', '12'),
		('2021-11-20 10:30:00', '364.00', '6', '13', '6', '13'),
		('2020-07-01 07:30:00', '490.00', '8', '2', '5', '14'),
		('2018-08-02 07:00:00', '123.00', '4', '11', '4', '15'),
		('2019-10-17 10:00:00', '120.00', '2', '5', '2', '16'),
		('2018-06-15 08:00:00', '120.00', '1', '14', '1', '17'),
		('2019-06-14 10:30:00', '400.00', '2', '3', '2', '18'),
		('2020-01-30 11:00:00', '630.00', '3', '8', '3', '19'),
		('2021-02-28 07:30:00', '450.00', '3', '8', '3', '20');



/*Inserção Dados Receita*/
INSERT INTO receita (remedio, id_medico, id_paciente)
VALUES  (1, "Dipirona", 3, 1),
	    (2, "Xarope e Dipirona", 5, 3),
	    (3,	"Dorflex", 6, 1, 5),
		(4, "Sonrisal e Morfina", 7, 12),
		(5, "Antibiotico", 2, 1),
		(6, "Dipirona", 5, 2),
		(7, "Xarope", 2, 8),
		(8, "Dipirona", 1, 9),
		(9, "Dorflex e Dipirona", 1, 6),
		(10, "Morfina", 6, 7),
		(11, "Sem Receita nem Procedimento", 3,	7),
		(12, "Sem Receita nem Procedimento", 7,	11),
		(13, "Sem Receita nem Procedimento", 6,	13),
		(14, "Sem Receita nem Procedimento", 8,	2),
		(15, "Sem Receita nem Procedimento", 4,	11),
		(16, "Sem Receita nem Procedimento", 2,	5),
		(17, "Sem Receita nem Procedimento", 1,	14),
		(18, "Sem Receita nem Procedimento", 2,	3),
		(19, "Sem Receita nem Procedimento", 3,	8),
		(20, "Sem Receita nem Procedimento", 3,	8);



/*Inserção Dados Inter_Enfer*/
INSERT INTO inter_enfer (id_internacao, id_enfermeiros)
VALUES (1, 1),
       (1, 2),
	   (2, 3),
       (2, 4),
       (3, 5),
	   (3, 6),
       (4, 7),
       (4, 8),
       (5, 9),
       (5, 10),
       (6, 1),
       (6, 2),
       (7, 3),
       (7, 4);
       
       
	
/*Inserção Dados Internacao*/
INSERT INTO internacao (data_entrada, data_prev_alta, data_alta, procedimento, id_quarto, id_medico, id_paciente)
VALUES ("2015-11-27 10:30:00", "2015-11-28 10:30:00", "2015-02-01 07:00:00", "Exames e Monitoramento", 1, 7 ,7),
	   ("2015-02-06 07:00:00", "2015-03-15 07:00:00", "2015-03-15 07:00:00", "Recuperação de Cirurgia", 1, 7 ,7),
       ("2017-12-15 10:30:00", "2018-01-28 07:30:00", "2018-01-28 07:30:00", "Recuperação de Cirurgia", 2, 3 ,15),
       ("2019-04-01 17:30:00", "2019-04-06 10:30:00", "2019-04-06 10:30:00", "Fisioterapia", 2, 3 ,15),
       ("2020-06-17 07:30:00", "2020-06-28 10:30:00", "2020-06-28 10:30:00", "Tratamento", 3, 1 ,10),
       ("2021-01-01 10:00:00", "2021-01-30 10:30:00", "2021-01-30 10:30:00", "Monitoramento", 3, 2 ,3),
       ("2021-10-06 10:30:00", "2021-11-28 15:30:00", "2021-11-28 15:30:00", "Inalação", 3, 4 ,9);
       
       
       
/*Consulta dos Dados das Tabelas*/
SELECT * FROM consulta;
SELECT * FROM convenio;
SELECT * FROM enfermeiros;
SELECT * FROM especialidade;
SELECT * FROM inter_enfer;
SELECT * FROM internacao;
SELECT * FROM medico;
SELECT * FROM paciente;
SELECT * FROM receita;



-- Consulta 1: Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.
SELECT AVG(valor) 
FROM consulta
WHERE YEAR(dataconsulta) = 2020 OR convenio = 'sim';
SELECT *
FROM consulta
WHERE YEAR(dataconsulta) = 2020 OR convenio = 'sim';



-- Consulta 2: Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.
SELECT *
FROM internacao
WHERE data_alta > data_prev_alta;



-- Consulta 3: Receituário completo da primeira consulta registrada com receituário associado.
SELECT *
FROM consulta c
JOIN receita r ON c.idConsulta = r.idReceita
WHERE c.dataconsulta = (SELECT MIN(dataconsulta) FROM consulta);



-- Consulta 4: Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio).
SELECT *
FROM consulta
WHERE convenio = 'nao'
ORDER BY valor DESC
LIMIT 1;
SELECT *
FROM consulta
WHERE convenio = 'nao'
ORDER BY valor ASC
LIMIT 1;



-- Consulta 5: Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.
SELECT i.*, diaria * DATEDIFF(i.data_alta, i.data_entrada) AS total_internacao
FROM internacao i
JOIN quarto q ON i.id_quarto = q.numero;



-- Consulta 6: Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.
SELECT data_entrada, procedimento, id_quarto
FROM internacao i
JOIN quarto q ON i.id_quarto= q.numero
WHERE q.id_tipo = 1;



-- Consulta 7: Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta.
SELECT p.nome, c.dataconsulta, c.idespecialidade
FROM consulta c
JOIN paciente p ON c.idPaciente = p.idpaciente
WHERE DATEDIFF(p.data_de_nas, c.dataconsulta) < 18 AND c.idespecialidade != 'pediatria'
ORDER BY c.dataconsulta;



-- Consulta 8: Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.
SELECT i.id_paciente, i.id_medico, i.data_entrada, i.procedimento
FROM internacao i
JOIN paciente p ON i.id_paciente = p.idPaciente
JOIN medico m ON i.id_medico = m.idMedico
WHERE i.id_especialidade = 7 AND i.id_quarto = 3;



-- Consulta 9: Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.
SELECT m.nome, m.crm, COUNT(c.idConsulta) AS total_consultas
FROM medico m
LEFT JOIN consulta c ON m.idMedico = c.idMedico
GROUP BY m.nome, m.crm;



-- Consulta 10: Nomes, CREs e número de internações de enfermeiros que participaram de mais de uma iternação
SELECT e.nome, e.cre, COUNT(DISTINCT ie.id_internacao) as num_internacoes
FROM enfermeiros e
JOIN inter_enfer ie ON e.idEnfermeiros = ie.id_enfermeiros
GROUP BY e.nome, e.cre
HAVING COUNT(DISTINCT ie.id_internacao) > 1;















