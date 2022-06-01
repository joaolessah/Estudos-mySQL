CREATE DATABASE gestao_matriculas;

USE gestao_matriculas;

/*Criação das tabelas de acordo com o exercicio feito na normalizacao de dados*/

CREATE TABLE tipos (
	id int unsigned not null auto_increment,
    tipo_de_curso varchar (45) not null,
    PRIMARY KEY (id)
);

CREATE TABLE instrutor (
	id int unsigned not null auto_increment,
    instrutor varchar (45) not null,
    telefone varchar (20) not null,
	PRIMARY KEY (id)
);

CREATE TABLE curso (
	id int unsigned not null auto_increment,
    curso varchar (45) not null,
    tipo_id int unsigned not null,
    instrutor_id int unsigned not null,
    valor int unsigned not null,
    PRIMARY KEY (id),
    CONSTRAINT tipo_do_curso FOREIGN KEY (tipo_id) REFERENCES tipos (id),
    CONSTRAINT nome_do_intsutor FOREIGN KEY (instrutor_id) REFERENCES instrutor (id)
);

CREATE TABLE aluno (
	id int unsigned not null auto_increment,
    nome_aluno varchar (45) not null, 
    endereco varchar (45) not null,
    email varchar (45) not null,
    PRIMARY KEY (id)
);

CREATE TABLE pedido (
	id int unsigned not null auto_increment,
    aluno_id int unsigned not null,
    data_dia date not null,
    hora time not null,
    PRIMARY KEY (id),
    CONSTRAINT nome_do_aluno FOREIGN KEY (aluno_id) REFERENCES aluno (id)
);

CREATE TABLE pedido_detalhe (
	num_pedido int unsigned not null,
    id_curso int unsigned not null,
    valor int unsigned not null,
    CONSTRAINT numero_pedido FOREIGN KEY (num_pedido) REFERENCES pedido(id),
    CONSTRAINT id_curso FOREIGN KEY (id_curso) REFERENCES curso (id)
);

/* Alterações exercicio */
/*Incluir a coluna data de nascimento na tabela aluno do tipo string, de tamanho 10 caracteres*/
ALTER TABLE aluno ADD COLUMN data_nascimento varchar (10);

/*Altere a coluna data de nascimento para nascimento e seu tipo de dado para date*/
ALTER TABLE aluno CHANGE COLUMN data_nascimento nascimento date;

/*Crie um novo índice na tabela aluno, para o campo aluno */
CREATE INDEX alunos on aluno (nome_aluno);

/*Inclua o campo e-mail na tabela instrutor, com tamanho de 100 caracteres*/
ALTER TABLE instrutor ADD COLUMN email varchar(100);

/*Crie um novo índices na tabela CURSO para o campo instrutor */
CREATE INDEX instrutor on curso (instrutor_id);

/*Removar o campo email da tabela instrutor*/
ALTER TABLE instrutor DROP COLUMN email; 

