--Apagando databases
drop database dbconeccta;

-- criando banco de dados v
create database dbconeccta;
 
-- acessar o banco de dados
use dbconeccta;
 
--criando as tabelas no banco de dados

create table tbEmpresa(
	id_empresa int not null auto_increment,
	cnpj_empresa char (14) unique,
	nome_empresa varchar (50),
	email_empresa varchar (100) unique,
	local_empresa varchar (100),
	porte_empresa varchar (50),
	primary key(id_empresa)
	);
 
create table tbPessoaJuridica(
	id_pessoa_juridica int not null auto_increment,
	cpf_pessoa_juridica char (11) not null unique,
	nome_pessoa_juridica varchar (50),
	email_corp_pessoa_juridica varchar (100) not null,
	data_cad_pessoa_juridica DATE,
	id_empresa int not null,
	primary key(id_pessoa_juridica),
	foreign key(id_empresa)references tbEmpresa (id_empresa)
	);
 
 create table tbCandidatos(
	id_candidato int not null auto_increment,
	cpf_candidato char(14) not null unique,
	nome_candidato varchar (50),
	telefone_candidato char(12),
	email_candidato varchar (100) unique,
	local_candidato varchar (100),
	data_nasc_candidato date,
	estado_civil_candidato varchar (20),
	primary key(id_candidato)
	);

create table tbVagas(
	id_vagas int not null auto_increment,
	local_vagas varchar (100),
	requisitos_vagas text,
	salario_vagas DECIMAL (10),
	vinculo_vagas varchar (50),
	beneficios_vagas text,
	ramo_vagas varchar (50),
	id_empresa int not null,
	id_candidato int not null,
	primary key(id_vagas),
	foreign key(id_empresa)references tbEmpresa(id_empresa),
	foreign key(id_candidato)references tbCandidatos(id_candidato)
	);

create table tbCurriculo(
	id_curriculo int not null auto_increment,
	descricao_curriculo varchar (250),
	exper_profissional_curriculo text,
	exper_academico_curriculo text,
	certificados_curriculo text,
	endereco_curriculo varchar (50),
	linkedln_curriculo varchar (50),
	id_candidato int not null,
	primary key(id_curriculo),
	foreign key(id_candidato)references tbCandidatos(id_candidato)
);


 



insert into tbEmpresa (cnpj_empresa, nome_empresa, email_empresa, local_empresa, porte_empresa) 
values 
('12345678000195', 'Empresa A', 'contato@empresaa.com', 'Rua A, 100', 'Média'),
('98765432000189', 'Empresa B', 'contato@empresab.com', 'Rua B, 200', 'Grande');


insert into tbPessoaJuridica (cpf_pessoa_juridica, nome_pessoa_juridica, email_corp_pessoa_juridica, data_cad_pessoa_juridica, id_empresa) 
values 
('12345678901', 'Pessoa Juridica A', 'email@pjuridicaa.com', '2025-03-25', 1),
('98765432100', 'Pessoa Juridica B', 'email@pjuridicab.com', '2025-03-25', 2);


insert into tbCandidatos (cpf_candidato, nome_candidato, telefone_candidato, email_candidato, local_candidato, data_nasc_candidato, estado_civil_candidato) 
values 
('11122233344', 'Candidato A', '1234567890', 'candidatoA@email.com', 'Rua C, 300', '1990-01-01', 'Solteiro'),
('55566677788', 'Candidato B', '0987654321', 'candidatoB@email.com', 'Rua D, 400', '1995-02-02', 'Casado');


insert into tbCurriculo (descricao_curriculo, exper_profissional_curriculo, exper_academico_curriculo, certificados_curriculo, endereco_curriculo, linkedln_curriculo, id_candidato) 
values 
('Currículo de Candidato A', 'Experiência em TI', 'Formação em Ciências da Computação', 'Certificado XYZ', 'Rua C, 300', 'https://www.linkedin.com/candidatoa', 1),
('Currículo de Candidato B', 'Experiência em Marketing', 'Formação em Administração', 'Certificado ABC', 'Rua D, 400', 'https://www.linkedin.com/candidatob', 2);


insert into tbVagas (local_vagas, requisitos_vagas, salario_vagas, vinculo_vagas, beneficios_vagas, ramo_vagas, id_empresa, id_candidato)
values 
('Local A', 'Experiência em TI', 5000.00, 'CLT', 'Vale Transporte', 'Tecnologia', 1, 2),
('Local B', 'Experiência em Marketing', 4000.00, 'PJ', 'Vale Alimentação', 'Marketing', 2, 1);

