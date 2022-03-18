/*script de criação do banco db_Faculdade e suas tabelas*/

CREATE DATABASE if not exists db_Faculdade;
USE db_Faculdade;

CREATE TABLE CURSO(
   id_curso SMALLINT PRIMARY KEY AUTO_INCREMENT,
   nome_curso VARCHAR(40) NOT NULL
);

CREATE TABLE ALUNO(
    ra SMALLINT PRIMARY KEY AUTO_INCREMENT,
    nome_aluno VARCHAR(20) NOT NULL,
    sobrenome_aluno VARCHAR(50) NOT NULL,
    status TINYINT NOT NULL,
    nome_mae VARCHAR(80) NOT NULL,
    nome_pai VARCHAR(80) NOT NULL,
    sexo VARCHAR(1) NOT NULL,
    whatsapp VARCHAR(11),
    email VARCHAR(60) NOT NULL,
    cpf VARCHAR(11) NOT NULL, 
    id_curso SMALLINT,
    CONSTRAINT fk_id_curso_aluno FOREIGN KEY (id_curso)
       REFERENCES CURSO (id_curso)
);

CREATE TABLE DISCIPLINA(
   id_disciplina SMALLINT PRIMARY KEY AUTO_INCREMENT,
   nome_disciplina VARCHAR(30) NOT NULL,
   descricao VARCHAR(200),
   numero_aluno SMALLINT NOT NULL,
   carga_horaria SMALLINT NOT NULL
);

/*criando a entidade associativa ALUNO_DISCIPLINA
para evitar o relacionamento n-ário*/

CREATE TABLE ALUNO_DISCIPLINA(
   ra SMALLINT,
   id_disciplina SMALLINT,
   PRIMARY KEY(ra, id_disciplina),
   CONSTRAINT fk_id_aluno_disciplina FOREIGN KEY (ra) 
     REFERENCES ALUNO (ra),
   CONSTRAINT fk_id_disciplina_aluno FOREIGN KEY (id_disciplina)
     REFERENCES DISCIPLINA (id_disciplina)
);


/*script de inserção de dados nas tabelas do banco (carga de dados para teste)*/

    
INSERT INTO CURSO(nome_curso)
	VALUES
	('Matemática'),
	('Psicologia'),
	('Análise de Sistemas'),
	('Biologia'),
	('História'),
	('Engenharia');
    
INSERT INTO DISCIPLINA(nome_disciplina, carga_horaria,
descricao, numero_aluno)
    VALUES
    ('Raciocínio Lógico', 1200, 'Desenvolver o raciocínio lógico', 50),
    ('Psicologia Cognitiva', 1400, 'Entender o funcionamento do aprendizado', 30),
    ('Programação em C', 1200, 'Aprender uma linguagem de programação', 20),
    ('Eletrônica Digital', 300, 'Funcionamento de circuitos digitais', 30);

INSERT INTO ALUNO(nome_aluno, sobrenome_aluno, cpf, status,
sexo, id_curso, nome_pai, nome_mae, email, whatsapp)
    VALUES
    ('Marcos', 'Aurelio Martins', 14278914536, 1, 'M', 3, 'Marcio Aurelio', 'Maria Aparecida', 'marcosaurelio@gmail.com', 946231249),
    ('Gabriel', 'Fernando de ALmeida', 14470954536, 1, 'M', 1, 'Adão Almeida', 'Fernanda Almeida', 'gabrielalmeida@yahoo.com', 941741247),
    ('Beatriz', 'Sonia Meneguel', 1520984537, 1, 'F', 3, 'Samuel Meneguel', 'Gabriela Meneguel', 'beatrizmene@hotmail.com', 945781412),
    ('Jorge', 'Soares', 14223651562, 1, 'M', 4, 'João Soares', 'Maria Richtzer', 'jorgesoares@gmail.com', 925637857),
    ('Ana Paula', 'Ferretti', 32968914522, 1, 'M', 5, 'Marcio Ferretti', 'Ana Hoffbahn', 'anapaulaferretti@hotmail', 974267423),
    ('Mônica', 'Yamaguti', 32988914510, 1, 'F', 6, 'Wilson Oliveira', 'Fernanda Yamaguti', 'monyamaguti@outlook.com',932619560);

INSERT INTO ALUNO_DISCIPLINA(ra, id_disciplina)
    VALUES
    (3, 1),
    (1, 2),
    (2, 3),
    (4, 3),
    (5, 4),
    (6, 1);
   
/*Todos as alunos com seus respectivos: nome, sobrenome,
 ra, status, filiacao, sexo, cpf, id_curso, rua, cep, numero
 bairro, whatsapp, e-mail*/
 
 SELECT * FROM aluno;

/*Todos os cursos com seus respectivos: nome, id_curso*/
 
 SELECT * FROM curso;
 
 /*Todos as disciplinas e seus respectivos: nome, descrição,
 id_disciplina, número de alunos e carga horária*/
 
 SELECT * FROM disciplina;


/* ras, nomes e sobrenomes dos alunos, nomes dos cursos, 
ordenados pelo primeiro nome de aluno:*/

SELECT A.ra, A.nome_aluno, A.sobrenome_aluno, 
C.nome_curso FROM ALUNO A
	INNER JOIN CURSO C 
	ON C.id_curso = A.id_curso
	ORDER BY A.nome_aluno; 


/* Todas as disciplinas cursadas por um aluno, com seus respectivos:
Aluno: nome, sobrenome, nome das disciplinas*/
 
 SELECT CONCAT(A.nome_aluno,' ',A.sobrenome_aluno) AS ALUNO, 
 D.nome_disciplina FROM ALUNO A
	 INNER JOIN ALUNO_DISCIPLINA AD 
     ON A.ra = AD.ra
	 INNER JOIN DISCIPLINA D 
     ON D.id_disciplina = AD.id_disciplina; 

 
