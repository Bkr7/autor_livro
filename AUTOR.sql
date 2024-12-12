create database autor_editora_109;
use autor_editora_109;

create table autor(
idautor int primary key auto_increment, 
NOME varchar (50) not null, 
EMAIL varchar (50) not null, 
CPF varchar (15) not null, 
SEXO char (1) not null
); 

create table editora(
ideditora int primary key auto_increment, 
NOMEEDITORA varchar (50) not null, 
TELEFONE varchar (20) not null, 
EMAIL varchar (50) not null, 
CNPJ varchar (30) not null
);

create table categoria(
idcategoria int primary key auto_increment, 
TIPOCATEGORIA varchar (50) not null
);

create table livro(
idlivro int primary key auto_increment, 
ISBN varchar (20) not null, 
TITULO varchar (50), 
DATALANCAMENTO date not null, 
NUMEROPAGINA int not null, 
VALOR decimal (10,2) not null, 
idautor int not null, 
ideditora int not null,     
idcategoria int not null, 
foreign key (idautor) references autor (idautor),
foreign key (ideditora) references editora (ideditora), 
foreign key (idcategoria) references categoria (idcategoria)
);

INSERT INTO autor (NOME, EMAIL, CPF, SEXO) 
VALUES ("guilherme", "gui23@gmail.com", "000.000.000-01", "M"),
("fernanda", "fefe@gmail.com", "000.000.000-02", "F"),
("erick", "erick14@gmail.com" , "000.000.000-03", "M"),
("maria", "mama34@gmail", "000.000.000-04", "F"),
("alexandre", "xandy23@gmail.com", "000.000.000-05", "M");

insert into editora (NOMEEDITORA, TELEFONE, EMAIL, CNPJ )
values ("Alvo Literário", "(61) 9822-2324", "alvo@gmail.com", "XX.XXX.XXX/0001-XX"),
("Horizonte Literário", "(68) 7263-78623", "hoho@gmail.com", "XX.XXX.XXX/0002-XX"),
("Ponto de Vista Editora", "(21) 8623-0912", "ponto@gmail.com", "XX.XXX.XXX/0003-XX"),
("Essencia Editorial", "(11) 8623-0912", "essen@gmail.com", "XX.XXX.XXX/0004-XX"), 
("Trilha Literaria", "(48) 65123-8213", "trilha@gmail.com", "XX.XXX.XXX/0005-XX");

insert into categoria (TIPOCATEGORIA)
values ("romance"),
("ação"), 
("terror"),
("aventura"), 
("comedia");  

INSERT INTO livro (ISBN, TITULO, DATALANCAMENTO, NUMEROPAGINA, VALOR, idautor, ideditora, idcategoria)
values ("978-85-1234-567-1", null, "2024-01-12", 244, 1.239, 1, 1, 1),
("976-85-5234-537-1", "ben 10", "2024-05-18", 222, "1.234", 2 , 1, 1), 
("108-65-1834-567-1", null , "2024-03-22", 244, "1.239", 3, 1, 1),
("971-12-7845-567-5", "rapazinho", "2024-08-01", 99, "1.239", 4, 1, 2),
("022-62-0812-567-4", "laoak", "2024-12-12", 244, "3.827", 5, 1, 2),
("927-72-0916-453-2", null , "2024-02-09", 281, "2.539", 1, 2, 2),
("978-85-1234-567-2", "cururu", "2024-02-19", 180, "1.225", 2 , 2, 2), 
("348-44-1234-567-2", null , "2024-01-12", 54, "1.875", 3, 2, 3),
("862-74-7514-567-2", "faca e assa", "2024-01-12", 300, "1.239", 4, 2, 2),
("198-62-0182-567-4", "kahu", "2024-01-12", 244, "1.239", 5, 2, 2),
("874-82-1628-0914-3", null , "2024-03-13", 87, "3.839", 1, 3, 3),
("776-95-1234-567-3", "chichizin", "2024-08-02", 23, "1.452", 2 , 3, 2), 
("123-05-1194-567-3", null , "2024-08-27", 244, "1.762", 3, 3, 1),
("926-51-1014-587-3", "clash piry", "2024-06-27", 509, "1.349", 4, 3, 1),
("875-62-9274-567-4", "hero el", "2024-01-12", 863, "1.539", 5, 3, 2),
("015-13-1093-7158-4", null, "2024-04-17", 109, "4.139", 1, 4, 3),
("982-77-1254-567-4", "blabla", "2024-04-24", 333, "1.987",2 , 4, 1),
("092-62-1014-567-4", null , "2024-01-12", 214, "1.239", 3, 4, 2), 
("982-62-2938-567-4", "of keyr", "2024-01-12", 244, "1.239", 4, 4, 3), 
("082-62-9274-567-4", "puab", "2024-11-02", 244, "1.239", 5, 4, 1),
("015-13-1093-7158-4", null , "2024-05-23", 298, "5.639", 1, 5, 3),
("858-55-1324-567-5", "pipio", "2024-12-12", 244, "1.386", 2 , 5, 2),
("342-54-4398-275-0","matrix", "2024-09-02", 321, "4.432", 4, 5, 3 ), 
("689-12-9913-341-3", "homens de preto", "2024-11-28", 412, "1.298", 5, 5, 2), 
("749-34-8771-495-9", null , "2024-02-29", 564, "2.332", 3, 2, 1);

select titulo from livro;

select * from editora;

select livro.TITULO ,editora.NOMEEDITORA
from livro
inner join editora
on livro.ideditora = editora.ideditora;

select nome from autor;

select editora.NOMEEDITORA, livro.titulo
from livro
inner join editora
on livro.ideditora = editora.ideditora;

select livro.titulo, livro.valor
from livro;

select autor.nome, autor.email, livro.titulo, livro.valor 
from autor
inner join livro 
on autor.idautor = livro.idlivro; 

select autor.nome, autor.sexo, livro.TITULO, editora.NOMEEDITORA
from autor 
inner join livro
on autor.idautor = livro.idautor
inner join editora
on livro.ideditora = editora.ideditora;
   
select editora.ideditora, editora.NOMEEDITORA, livro.TITULO
from editora
inner join livro 
on editora.ideditora = livro.ideditora;

select autor.nome as  nome_autor, livro.TITULO AS TITULO_LIVRO, categoria.TIPOCATEGORIA, livro.ISBN
FROM autor
INNER JOIN livro 
ON autor.idautor = livro.idautor
INNER JOIN categoria 
ON livro.idcategoria = categoria.idcategoria;

SELECT categoria.TIPOCATEGORIA, livro.TITULO, categoria.TIPOCATEGORIA, livro.TITULO
FROM categoria
INNER JOIN livro 
ON categoria.idcategoria = livro.idcategoria;

SELECT COUNT(*) AS QUANTIDADE_AUTORES
FROM autor;

SELECT SEXO, SEXO, COUNT(*) AS QUANTIDADE_AUTORES
FROM autor
GROUP BY SEXO;

SELECT livro.TITULO AS TITULO_LIVRO,livro.VALOR AS VALOR_UNITARIO,
livro.VALOR * 2 AS VALOR_TOTAL
FROM livro;

SELECT livro.TITULO 
AS TITULO_LIVRO, livro.VALOR AS VALOR_UNITARIO, livro.VALOR * 0.85 AS VALOR_COM_DESCONTO
FROM livro;

SELECT livro.TITULO 
AS TITULO_LIVRO, livro.VALOR AS VALOR_UNITARIO, livro.VALOR * 1.10 AS VALOR_COM_ACRESCIMO
FROM livro;

SELECT COUNT(*) AS QUANTIDADE_EDITORAS
FROM editora;

SELECT COUNT(*) AS QUANTIDADE_CATEGORIAS
FROM categoria;

SELECT TIPOCATEGORIA, COUNT(*) AS QUANTIDADE_CATEGORIAS
FROM categoria
GROUP BY TIPOCATEGORIA;

SELECT livro.TITULO AS TITULO_LIVRO,editora.NOMEEDITORA,editora.NOMEEDITORA
AS NOME_EDITORA,
editora.EMAIL AS EMAIL_EDITORA,
categoria.TIPOCATEGORIA AS CATEGORIA,
livro.VALOR AS VALOR
FROM livro
INNER JOIN editora 
ON livro.ideditora = editora.ideditora
INNER JOIN categoria
ON livro.idcategoria = categoria.idcategoria;

SELECT livro.TITULO
AS TITULO_LIVRO,
editora.NOMEEDITORA AS NOME_EDITORA,
editora.CNPJ AS CNPJ_EDITORA,
categoria.TIPOCATEGORIA, 
categoria.TIPO AS CATEGORIA,
livro.VALOR AS VALOR
FROM livro
INNER JOIN editora 
ON livro.ideditora = editora.ideditora
INNER JOIN categoria 
ON livro.idcategoria = categoria.idcategoria; ERROR 21 

SELECT editora.NOMEEDITORA AS NOME_EDITORA,
editora.CNPJ AS CNPJ_EDITORA,
livro.TITULO AS TITULO_LIVRO,
livro.DATALANCAMENTO AS DATA_LANCAMENTO
FROM editora
INNER JOIN livro 
ON editora.ideditora = livro.ideditora; ERROR 22

SELECT livro.TITULO AS TITULO_LIVRO,
livro.DATALANCAMENTO AS DATA_LANCAMENTO,
livro.VALOR AS VALOR
FROM livro
WHERE livro.DATALANCAMENTO BETWEEN "2024-01-01" AND "2024-06-30";

SELECT livro.TITULO
AS TITULO_LIVRO, livro.DATALANCAMENTO AS DATA_LANCAMENTO,
livro.VALOR AS VALOR,
livro.VALOR * 0.5 AS VALOR_COM_DESCONTO
FROM livro
WHERE livro.DATALANCAMEN = "2024-02-12";

SELECT autor.NOME AS NOME_AUTOR,
autor.CPF AS CPF_AUTOR
FROM autor
INNER JOIN livro 
ON autor.idautor = livro.idautor
INNER JOIN categoria 
ON livro.idcategoria = categoria.idcategoria
WHERE categoria.TIPOCATEGORIA = 'romance'; 

CREATE VIEW vw_livros_editora AS 
SELECT livro.TITULO, livro.ISBN, editora.NOMEEDITORA, livro.DATALANCAMENTO
FROM livro
INNER JOIN editora ON livro.ideditora = editora.ideditora;

SELECT * FROM vw_livros_editoras_valores;

CREATE VIEW vw_livros_desconto_30 AS
SELECT livro.TITULO, livro.ISBN, editora.NOMEEDITORA, livro.VALOR, (livro.VALOR * 0.7) AS VALOR_COM_DESCONTO
FROM livro
INNER JOIN editora ON livro.ideditora = editora.ideditora
WHERE editora.NOMEEDITORA = 'Alvo Literário';

SHOW FULL TABLES WHERE Table_type = 'VIEW';

