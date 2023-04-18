create database trab1_abds5
	with 
	owner = postgres
	encoding = 'UTF8'
	connection limit = -1;
	
create sequence paciente_id_paciente_seq start 1;
create sequence medico_id_medico_seq start 1;
create sequence atende_id_atende_seq start 1;
create sequence cirurgia_id_cirurgia_seq start 1;

create table paciente 
(
	id_paciente serial,
  	codigo varchar (10) unique,
    nome varchar (100),
    idade integer,
	constraint paciente_pk primary key (id_paciente)
);
drop table paciente;

insert into paciente (codigo, nome, idade) values
    ('P1', 'João', 14),
    ('P2', 'Maria', 35),
    ('P3', 'Pedro', 27),
    ('P4', 'Antônio', 23),
    ('P5', 'Pablo', 18);	
select * from paciente;

create table medico
(
	id_medico serial,
    crm varchar (10) unique,
    nome varchar (100),
    especialidade varchar (50),
	constraint medico_pk primary key (id_medico) 
);
drop table medico;

insert into medico (crm, nome, especialidade) values
    ('CRM1', 'Marcos', 'Oftalmologia'),
    ('CRM2', 'Tereza', 'Clínico Geral'),
    ('CRM3', 'Paulo', 'Pediatra'),
    ('CRM4', 'João', 'Clínico Geral'),
    ('CRM5', 'Patrícia', 'Dentista');
select * from medico;

create table atende
(	
	id_atende serial,
    id_paciente integer,
    id_medico integer,
    data_cir date,
	constraint atende_pk primary key (id_atende),
	constraint paciente_fk foreign key (id_paciente) references paciente (id_paciente),
	constraint medico_fk foreign key (id_medico) references medico (id_medico)
);
drop table atende;

insert into atende (id_paciente, id_medico, data_cir) values
    (1, 5, '2023-02-15'),
    (2, 4, '2022-11-30'),
    (3, 3, '2023-03-15'),
    (4, 2, '2022-12-30'),
    (5, 1, '2023-04-15');
select * from atende;

create table cirurgia
(
	id_cirurgia serial,
    codigo varchar (10) unique,
    data_cirurgia date,
    descricao text,
    id_paciente integer,
	constraint cirurgia_pk primary key (id_cirurgia),
	constraint paciente_pk foreign key (id_paciente) references paciente (id_paciente)
);
drop table cirurgia;

insert into cirurgia (codigo, data_cirurgia, descricao, id_paciente) values
    ('C1', '2023-05-30', 'Plástica', 1),
    ('C2', '2023-05-25', 'Implante de Silicone', 2),
    ('C3', '2023-05-20', 'Pedra na Vesícula', 3),
    ('C4', '2023-05-15', 'Hérnia', 4),
    ('C5', '2023-05-10', 'Cirurgia Bariátrica', 5);
select * from cirurgia;