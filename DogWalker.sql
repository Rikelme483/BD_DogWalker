create database dogwalker; 

use dogwalker; 

create table cliente( 
id_cliente int auto_increment primary key,
nome varchar(80) not null,
cpf varchar(15) unique, 
rg varchar(13) unique, 
datanascimento date,
sexo char not null,
cadastro timestamp 
);

insert into cliente (nome, cpf, rg, datanascimento, sexo) values 
('Caroline Paixão', '121.131.541-13', '12.151.141-1', '1990-05-01', 'F'),
('Emerson Marcelo', '260.548.952-24', '21.232.282-2', '1990-06-12', 'M'),
('Rikelme Gonçalves', '380.596.948-35', '34.393.753-3', '1992-07-20', 'F'),
('Sara Silva ', '426.435.154-45', '45.949.434-4', '1992-05-29', 'F'), 
('Vanessa Batista', '521.634.251.51', '51.505.505-5', '1992-12-31', 'F'); 

select * from cliente;

create table contatocliente(
id_contato int auto_increment primary key, 
telefone varchar(23),
telefoneCel varchar(23) not null, 
e_mail varchar(250), 
id_cliente int,
constraint fkcliecont foreign key(id_cliente) references cliente(id_cliente)
);

insert into contatocliente(telefone, telefoneCel, e_mail) values 
('+55(11)4444-4444' , '+55(11)94477-4444' , 'carolp@etec.sp.gov.br'),
('+55(11)5555-4444' , '+55(11)94466-4444' , 'emersonmp@etec.sp.gov.br'),
('+55(11)6666-4444' , '+55(11)94455-4444' , 'rikelmeg@etec.sp.gov.br'),
('+55(11)7777-4444' , '+55(11)94433-4444' , 'saras@etec.sp.gov.br'), 
('+55(11)8888-4444' , '+55(11)94422-4444' , 'vanessab@etec.sp.gov.br'); 

select * from contatocliente;

create table enderecocliente(
id_endereco int auto_increment primary key, 
logradouro varchar(80) not null,
numero varchar(10) not null, 
complemento varchar(20), 
bairro varchar(50),
cidade varchar(50), 
estado varchar(50), 
cep varchar(10),
id_cliente int,
constraint fk_clienteEnd foreign key(id_cliente) references cliente(id_cliente)
);

insert into enderecoCliente(logradouro, numero, complemento, bairro, cidade, estado, cep) values 
('Rua dos Canários' , '23' , 'casa 1' , 'Jardim Paineiras' , 'Embu das Artes' , 'SP' , '03783-450'),
('Avenida Bela Paulista' , '456' , 'apartamento' , 'Pinheiros' , 'Embu das Artes' , 'SP' , '03722-340'),
('Avenida Cupim' , '300' , 'casa 2' , 'Jardim dos Bandeirantes' , 'Embu das Artes' , 'SP' , '03742-420'),
('Avenida Brasil' , '06' , 'casa 3' , 'Jardim Silva' , 'Embu das Artes' , 'SP' , '05642-220'),
('Rua Camargo' , '55' , ' ' , 'Jardim da Paz' , 'Embu das Artes' , 'SP' , '04742-500');

select * from enderecocliente;

create table cachorro( 
id_cachorro int auto_increment primary key,
nome varchar(80) not null,
datanascimento date,
sexo char(1) not null,
porte varchar (15) not null,
raca varchar (30) not null,
castrado boolean, 
id_cliente int,
constraint fk_clienteCach foreign key(id_cliente) references cliente(id_cliente),
id_servico int,
constraint fk_servCach foreign key(id_servico) references servico(id_servico)
);

insert into cachorro(nome, datanascimento, sexo, porte, raca, castrado, id_cliente) values
('Rex', '2020-02-02', 'm', 'medio', 'sem raca definida', '0', '1'),
('vivi', '2020-03-03', 'f', 'pequeno', 'yorkshire', '1', '2'),
('rufus', '2020-04-03', 'm', 'gigante', 'huskin siberiano', '0', '3'),
('Aktor', '2019-05-10', 'm', 'pequeno', 'pastor alemão', '1', '4'),
('Apolo', '2018-10-15','m', 'medio', 'rottweiler', '0', '5');

select * from cachorro;

create table servico( 
id_servico int auto_increment primary key, 
datahora timestamp, 
periodo varchar(10) not null, 
valor float(50) not null
);

alter table servico add column id_ocorrencia int;
alter table servico add constraint fk_servOcorrencia foreign key(id_ocorrencia) references ocorrencia(id_ocorrencia);
select * from servico; 

insert into servico (periodo, valor) values
('manhã', '100'),
('tarde', '100'),
('manhã', '100'),
('manhã', '100'),
('tarde', '100'); 

select * from servico; 
  
create table funcionario(
id_funcionario int auto_increment primary key,
nome varchar(80) not null,
cpf varchar(15) not null unique,
rg varchar(13) not null unique
);

insert into funcionario (nome, cpf, rg) values 
('Maria Luiza Cerqueira de Oliveira', '250.456.789-01', '21.123.122-12'),
('Marcelo Macedo', '568.983.155-35', '24.867.729-98'), 
('José Paulo Cerqueira', '048.151.627-24', '25.867.729-98'), 
('Caetano Souza', '235.135.147.64', '30.827.684-25'), 
('Samela Rodrigues', '527.688.957-11', '85954.957-04');

select* from funcionario; 

create table contatoFuncionario(
id_contatoFuncionario int auto_increment primary key,
email varchar(250) not null,
telefoneResidencial varchar(23),
telefoneCelular varchar(23) ,
id_funcionario int,
constraint fk_contatoFunc foreign key(id_funcionario) references funcionario(id_funcionario)
);

insert into contatoFuncionario(email, telefoneResidencial, telefoneCelular) values
('maria.luiza_oliveira@outlook.com', '4241-0976', '+55 11 99472-5610'),
('marcelo_macedo01@outlook.com', '4241-5959', '+55 11 94000-3000'),
('jose.p.cerqueira@outlook.com', '4241-5366', '+55 11 90299-5610'),
('caetano_souza@gmail.com', '4785-6588', '+55 11 95269-5497'),
('samela.rodrigues@hotmail.com', '4278-2588', '+55 11 9856-9957');

select * from contatoFuncionario;
  
create table enderecoFuncionario(
id_enderecoFuncionario int auto_increment primary key,
logradouro varchar(80) not null,
numero varchar(10) not null,
bairro varchar(300) not null,
cidade varchar(300) not null,
estado varchar(100) not null,
cep varchar(10) not null,
id_funcionario int,
constraint fk_endFunc foreign key(id_funcionario) references funcionario(id_funcionario)
);
  
insert into enderecoFuncionario(logradouro, numero, bairro, cidade,  estado, cep) values 
('Rua Santo Antonio', '120', 'Jardim da Rosas', 'SP', 'SP', '12462-345'),
('Rua Sao Francisco', '20', 'Jardins', 'SP', 'SP', '12478-422'),
('Rua Sete de setembro', '250', 'Pomares', 'SP', 'SP', '14737-335'),
('Rua Martins', '120', 'Jardim da Merces', 'SP', 'SP', '15462-222'),
('Rua São Caetano', '450', 'Jardim São Miguel', 'SP', 'SP', '16158-678');

select * from enderecoFuncionario;

create table ocorrencia(
id_ocorrencia int auto_increment primary key,
relatorio varchar(9000),
hora time,
dia date,
id_cachorro int
);

insert into ocorrencia(relatorio, hora, dia) values
('Sem problemas', '9:00', '2020-07-17'),
('Sem problemas', '13:00', '2020-07-17'),
('Sem problemas', '1:00', '2020-07-17'), 
('Sem problemas', '15:00', '2020-07-18'),
('Sem problemas', '16:00', '2020-07-18');

select * from ocorrencia;

create table funcionarioOcorrencia(
id_funcionario int, 
id_ocorrencia int, 
constraint relatfuncocor foreign key(id_funcionario) references funcionario(id_funcionario), 
foreign key(id_ocorrencia) references ocorrencia(id_ocorrencia)); 

insert into funcionarioOcorrencia (id_funcionario, id_ocorrencia) values
(1,1), (2,2), (3,3), (4,4), (5,5); 

select * from funcionarioOcorrencia; 
