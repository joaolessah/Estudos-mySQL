USE gestao_matriculas_2;



SELECT * FROM curso;
SELECT * FROM tipos;
SELECT * FROM instrutor;
SELECT * FROM aluno;

/************ EXECICIO 1 *************/

/*EXIBA UMA LISTA COM OS TÍTULOS DOS CURSOS DA SOFTBLUE E O TIP ODE CURSO AO LADO*/

SELECT curso, tipo_de_curso FROM curso c INNER JOIN tipos t ON c.tipo_id = t.id;

/*EXIBA UMA LISTA COM OS TITULOS DOS CURSOS DA SOFTBLUE, TIPO DE CURSO, NOME DO INSTRUTOR RESPONSÁVEL PELO MENOS E TELEFONE;*/

SELECT curso, tipo_de_curso, instrutor, telefone FROM curso c 
INNER JOIN tipos t ON c.tipo_id = t.id
INNER JOIN instrutor ON  instrutor.id = c.instrutor_id;

/*EXIBA UMA LISTA COM O CÓDIGO E DATA E HORA DOS PEDIDOS E OS CODIGOS DO CURSO DE CADA PEDIDO*/

SELECT * FROM pedido_detalhe;
SELECT * FROM pedido;

/* NUM_PEDIDO É CHAVE ESTRAINGEIRA E ID É PK*/

SELECT p.id, p.data_dia, p.hora, id_curso FROM pedido p  RIGHT JOIN pedido_detalhe ON  num_pedido = p.id;

/*EXIBA UMA LISTA COM O CODIGO E DATA E HORA DOS PEDIDOS E OS TITULOS DOS CURSOS DE CADA PEDIDO*/

SELECT p.id, p.data_dia, p.hora, c.curso FROM pedido p  INNER JOIN pedido_detalhe ON  num_pedido = p.id
left JOIN curso c ON id_curso = c.id;

/* EXIBA UMA LISTA COM O CÓDIGO E DATA E HORA DOS PEDIDOS, NOME DO ALUNO E OS TITULOS DOS CURSOS DE CADA PEDIDO*/

SELECT p.id, p.data_dia, p.hora, a.nome_aluno ,c.curso FROM pedido p  
INNER JOIN pedido_detalhe ON  num_pedido = p.id
INNER JOIN aluno a ON p.aluno_id = a.id
LEFT JOIN curso c ON id_curso = c.id;


/************ EXECICIO 2 *************/

/* CRIE UMA VISÃO QUE TRAGA O TITULO E PREÇO SOMENTE DOS CURSOS DE PROGRAMAÇÃO DA SOFTBLUE*/

CREATE VIEW cursos_programacao AS 
SELECT curso, valor FROM curso WHERE tipo_id = 2;

SELECT * FROM cursos_programacao;

/* CRIE UMA VISÃO QUE TRAGA OS TITULOS DOS CURSOS, TIPO DO CURSO E NOME DO INSTRUTOR*/

CREATE VIEW cursos_inst_tipo AS
SELECT c.curso, i.instrutor, t.tipo_de_curso FROM curso c
INNER JOIN instrutor i ON i.id = c.instrutor_id
INNER JOIN tipos t ON t.id = c.tipo_id;

/* CRIE UMA VISÃO QUE EXIBA OS PEDIDOS REALIZADOS, INFORMANDO O NOME DO ALUNO, DATA E CÓDIGO DO PEDIDO*/

CREATE VIEW aluno_pedido AS
SELECT a.nome_aluno, p.data_dia, p.id FROM pedido p
INNER JOIN aluno a ON  a.id = p.aluno_id;