Banco de Dados do Hospital
Introdução
Este repositório contém scripts SQL para criar um esquema de banco de dados relacional para um sistema de gestão hospitalar. O esquema inclui tabelas para gerenciar pacientes, médicos, consultas, prescrições, quartos de hospital e muito mais.

Estrutura do Banco de Dados
Tabelas
Consulta

Atributos: idConsulta, dataconsulta, valor, idmedico, idpaciente, idespecialidade, idreceita
Chaves Estrangeiras: idmedico (referencia medico), idpaciente (referencia paciente), idespecialidade (referencia especialidade), idreceita (referencia receita)
Medico

Atributos: idMedico, cargo, atividade, id_especialidade
Chave Estrangeira: id_especialidade (referencia especialidade)
Especialidade

Atributos: idEspecialidade, descrição
Paciente

Atributos: idPaciente, nome, data_de_nas, telefone, email, CPF, RG, id_convenio
Chave Estrangeira: id_convenio (referencia convenio)
Receita

Atributos: idReceita, remedio, id_medico, id_paciente
Chaves Estrangeiras: id_medico (referencia medico), id_paciente (referencia paciente)
Convenio

Atributos: idConvenio, nome, CNPJ, tempo_de_carencia
TipoQuarto

Atributos: idTipoquarto, descricao, valor
Quarto

Atributos: idQuarto, numero, id_tipo
Chave Estrangeira: id_tipo (referencia tipoquarto)
Internacao

Atributos: idInternacao, data_entrada, data_prev_alta, data_alta, procedimento, id_quarto, id_medico, id_paciente
Chaves Estrangeiras: id_quarto (referencia quarto), id_medico (referencia medico), id_paciente (referencia paciente)
Inter_enfer

Atributos: id_internacao, id_enfermeiros
Chaves Estrangeiras: id_enfermeiros (referencia enfermeiros), id_internacao (referencia internacao)
Chave Primária: (id_internacao, id_enfermeiros)
Enfermeiros

Atributos: idEnfermeiros, nome, cre, CPF
Consultas SQL
Consulte o final do arquivo SQL para exemplos de consultas que podem ser realizadas no banco de dados, como a média de valores de consultas, dados de internações com datas de alta superiores às datas previstas, e informações sobre médicos, pacientes e enfermeiros.
