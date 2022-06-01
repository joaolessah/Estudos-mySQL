USE gestao_matriculas;

/***      EXERCICIO 1     ****/

/*Inserção tabela tipo*/
INSERT INTO tipos (tipo_de_curso) VALUE ('Banco de dados');
INSERT INTO tipos (tipo_de_curso) VALUE ('Programação');
INSERT INTO tipos (tipo_de_curso) VALUE ('Modelagem de dados');

/*Inserção tabela instrutor*/
INSERT INTO instrutor (instrutor, telefone) VALUE ('André Milani','1111-1111');
INSERT INTO instrutor (instrutor, telefone) VALUE ('Carlos Tosin','1212-1212');

/*Inserção tabela curso*/

INSERT INTO curso (curso, tipo_id, instrutor_id, valor) VALUE ('Java Fundamentos', 2, 2, 270);
INSERT INTO curso (curso, tipo_id, instrutor_id, valor) VALUE ('Java Avançado', 2, 2, 230);
INSERT INTO curso (curso, tipo_id, instrutor_id, valor) VALUE ('SQL Completo', 1, 1, 170);
INSERT INTO curso (curso, tipo_id, instrutor_id, valor) VALUE ('Php Básico', 2, 1, 270);

/*Inserção aluno*/

ALTER TABLE aluno DROP COLUMN nascimento;

INSERT INTO aluno (nome_aluno, endereco, email) VALUE ('José','Rua XV de Novembro 72','jose@softblue.com.br');
INSERT INTO aluno (nome_aluno, endereco, email) VALUE ('Wagner','Av. Paulista','wagner@softblue.com.br');
INSERT INTO aluno (nome_aluno, endereco, email) VALUE ('Emilio','Rua Lajes 103 ap: 701','emilio@softblue.com.br');
INSERT INTO aluno (nome_aluno, endereco, email) VALUE ('Cris','Rua Tauney 22','cris@softblue.com.br');
INSERT INTO aluno (nome_aluno, endereco, email) VALUE ('Regina','Rua Salles 305','regina@softblue.com.br');
INSERT INTO aluno (nome_aluno, endereco, email) VALUE ('Fernando','Av. Central 30','fernando@softblue.com.br');

/*Inserção tabela Pedido*/

INSERT INTO pedido (aluno_id, data_dia, hora) VALUE (2, '2010-04-15', '11:23:32');
INSERT INTO pedido (aluno_id, data_dia, hora) VALUE (2, '2010-04-15', '11:23:32');
INSERT INTO pedido (aluno_id, data_dia, hora) VALUE (3, '2010-04-16', '11:23:32');
INSERT INTO pedido (aluno_id, data_dia, hora) VALUE (4, '2010-04-17', '11:23:32');
INSERT INTO pedido (aluno_id, data_dia, hora) VALUE (5, '2010-04-18', '11:23:32');
INSERT INTO pedido (aluno_id, data_dia, hora) VALUE (6, '2010-04-19', '11:23:32');
INSERT INTO pedido (aluno_id, data_dia, hora) VALUE (6, '2010-04-20', '11:23:32');

/*Inserção detalhe pedido*/

INSERT INTO pedido_detalhe (num_pedido, id_curso, valor) VALUE (1,1,270);
INSERT INTO pedido_detalhe (num_pedido, id_curso, valor) VALUE (1,2,330);
INSERT INTO pedido_detalhe (num_pedido, id_curso, valor) VALUE (2,1,270);
INSERT INTO pedido_detalhe (num_pedido, id_curso, valor) VALUE (2,2,330);
INSERT INTO pedido_detalhe (num_pedido, id_curso, valor) VALUE (2,3,170);
INSERT INTO pedido_detalhe (num_pedido, id_curso, valor) VALUE (3,4,270);
INSERT INTO pedido_detalhe (num_pedido, id_curso, valor) VALUE (4,2,330);
INSERT INTO pedido_detalhe (num_pedido, id_curso, valor) VALUE (4,4,270);
INSERT INTO pedido_detalhe (num_pedido, id_curso, valor) VALUE (5,3,170);
INSERT INTO pedido_detalhe (num_pedido, id_curso, valor) VALUE (6,3,170);
INSERT INTO pedido_detalhe (num_pedido, id_curso, valor) VALUE (7,4,270);


/***      EXERCICIO 2      ****/

/*Exibir todas as informações de todos os alunos*/

SELECT * FROM aluno;

/*Exibir somente o título de cada curso da softblue*/

SELECT curso FROM curso;

/*Exibir somente o título e valor de cada curso da softblue cujo preçoi seja maior que 200*/

SELECT curso, valor FROM curso WHERE valor > 200;

/*Exibir somente o titulo e valor de cada curso da softblue cujo preço seja maior que 200 e menor que 300*/

SELECT curso, valor FROM curso WHERE valor BETWEEN 200 AND 300;

/*Exibir as infomrações da tabela pedidos para os pedidos realizados entre 15-04-2010 e 18-04-2010*/

SELECT * FROM pedido WHERE data_dia BETWEEN "2010-04-15" AND "2010-04-18";

/*Exibir as informações da tabela pedidos para os pedidos realizados na data de 15-04-2010*/

SELECT * FROM pedido WHERE data_dia = "2010-04-15";


/***      EXERCICIO 3      ****/

/*Altere o endereço do aluno José para 'Av.Brasil 778'*/

UPDATE aluno SET endereco = 'Av. Brasil 778' WHERE id = 1;

/*Altere o e-mail do aluno cris para cristiano@softblue.com*/

UPDATE aluno SET email = 'cristiano@softblue.com' WHERE id = 4;

/* AUmente em 10% o valor dos cursos abaixo de 300*/

SET SQL_SAFE_UPDATES = 0;

UPDATE curso SET valor = valor * 1.1 WHERE valor < 300;

/*Altere o nome do curso de Phb Básico para Php Fundamentos*/

UPDATE curso SET curso = 'Php Fundamentos' WHERE curso = 'Php Básico';

SELECT * FROM curso;

SELECT *, ID FROM VEICULOS;

