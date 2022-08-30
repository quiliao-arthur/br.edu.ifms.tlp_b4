--a) Apresente o nome de todos os doces que são produzidos com chocolate, pesam, em média, mais de 3 kg e custam mais de 126,00.
SELECT doce.nome AS Nome_doce_chocolate_3kg_126reis FROM doce 
INNER JOIN doceingrediente ON doce.id = iddoce 
INNER JOIN ingrediente ON idingrediente = ingrediente.id 
WHERE UPPER(ingrediente.nome) = 'CHOCOLATE' AND 
    doce.pesomedio>3 AND 
    doce.valor>126;

--b) Apresente a média dos pesos de todos os doces cadastrados.
SELECT AVG(pesomedio) FROM doce;

--c) Apresente o nome de todos os cursos ordenados em ordem decrescente de duração.
SELECT nome FROM curso ORDER BY duracao DESC;

--d) Apresente o nome de todos os cursos que possuem duração superior a 20 horas, é ofertado pela instituição "Mundo dos doces" e que possuem algum aluno com a especialidade em "Bolos".
SELECT curso.nome Curso_mais20Hrs_MundoDoces_alunoBoleiro
FROM curso INNER JOIN cursoconfeiteiro ON idcurso=curso.id
INNER JOIN confeiteiro ON idconfeiteiro=confeiteiro.id
INNER JOIN instituicao ON idinstituicao=instituicao.id
WHERE curso.duracao>20 AND
    UPPER(instituicao.nome) = 'MUNDO DOS DOCES' AND
    UPPER(confeiteiro.especialidade)='BOLOS';

--e) Apresente o nome de cada confeiteiro junto com o nome de todos os cursos que ele já fez;
SELECT confeiteiro.nome Nome_Confeiteiro, curso.nome Cursos_feitos
FROM confeiteiro LEFT JOIN cursoconfeiteiro ON confeiteiro.id = idconfeiteiro
INNER JOIN curso ON idcurso = curso.id;

--f) Apresente o nome de cada ingrediente, o nome dos doces que eles estão vinculados; O nome do confeiteiro que criou cada doce.
SELECT ingrediente.nome Ingrediente, doce.nome Doce_ingredido, confeiteiro.nome Confeiteiro_criador
FROM ingrediente LEFT JOIN doceingrediente ON ingrediente.id=idingrediente
INNER JOIN doce ON doce.id=iddoce 
INNER JOIN confeiteiro ON confeiteiro.id=idconfeiteiro;

--g) Apresente o nome e a modalidade dos confeiteiros que fizeram algum curso com o nome "Bolos para casamento" com duração de 80 horas e que criaram algum doce.
SELECT confeiteiro.nome Confeiteiro_criador_boleiroPraCasamento_80horas, 
confeiteiro.especialidade Especialidade_confeiteiro
FROM confeiteiro INNER JOIN doce ON doce.idconfeiteiro=confeiteiro.id
INNER JOIN cursoconfeiteiro ON confeiteiro.id=curso.idconfeiteiro
INNER JOIN curso ON curso.id=idcurso
WHERE curso.duracao=80 AND
    UPPER(curso.nome)='BOLOS PARA CASAMENTO';

--h) Apresente o nome dos confeiteiros que fizeram algum curso da modalidade "Bolos para casamento" e criaram algum doce que contém o ingrediente "leite condensado";
SELECT confeiteiro.nome Confeiteiro_boleiroPraCasamento_criadorDoceCLeiteCondensado
FROM confeiteiro INNER JOIN cursoconfeiteiro ON confeiteiro.id=cursoconfeiteiro.idconfeiteiro
INNER JOIN curso ON curso.id=idcurso 
INNER JOIN doce ON confeiteiro.id=doce.idconfeiteiro
INNER JOIN doceingrediente ON iddoce=doce.id
INNER JOIN ingrediente ON idingrediente=ingrediente.id
WHERE UPPER(curso.nome)='BOLOS PARA CASAMENTO' AND 
    UPPER(ingrediente.nome)='LEITE CONDENSADO';

--i) Apresente a quantidade de doces cadastrados.
SELECT COUNT(nome) Quantidade_doces FROM doce;

--j) Apresente o nome de todos os cursos cadastrados com duração entre (e inclusive) 20 e 40 horas.
SELECT nome Curso_entre_20e40Horas FROM curso 
WHERE duracao BETWEEN 20 AND 40;

--k) Apresente o nome de todos so doces que possuem chocolate no nome.
SELECT nome Doce_comChocolateNoNome FROM doce
WHERE UPPER(nome) LIKE '%CHOCOLATE';