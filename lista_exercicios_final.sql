create table ingrediente(
	id int, 
	primary key(id), 
	nome varchar, 
	peso float -- peso em gramas
);

insert into ingrediente values(1, 'chocolate', 10);
insert into ingrediente values(2, 'leite condensado', 20);
insert into ingrediente values(3, 'açúcar', 30);

create table instituicao(
	id int, 
	primary key(id), 
	nome varchar
);

insert into instituicao values(1, 'Mundo dos Doces');
insert into instituicao values(2, 'Doces mania');

create table curso(
	id int, 
	primary key(id), 
	nome varchar, 
	modalidade varchar, 
	duracao int, --tempo em horas
	idinstituicao int references instituicao(id)
);

insert into curso values(1,'Bolos para casamento', 'Bolos em camadas', 30, 1);
insert into curso values(2,'Tortas para festas', 'Tortas doces', 50, 2);
insert into curso values(3,'Sobremesas para casamento', 'Sobremesas', 40, 2);

create table confeiteiro(
	id int, 
	primary key(id), 
	nome varchar, 
	especialidade varchar
);

insert into confeiteiro values(1, 'Jorge Amado', 'Bolos');
insert into confeiteiro values(2, 'Jorge Paulo Ramos', 'Tortas');
insert into confeiteiro values(3, 'Jorge Ricardo', 'Docinhos de festa');

create table doce(
	id int, 
	primary key(id), 
	nome varchar, 
	pesomedio float, 
	valor float,
	idconfeiteiro int references confeiteiro(id)
);

insert into doce values(1, 'Trufado de natal', 20, 137, 1);
insert into doce values(2, 'Floresta negra ', 10, 320, 2);

create table doceingrediente(
	id int, 
	primary key(id), 
	iddoce int references doce(id), 
	idingrediente int references ingrediente(id)
);

insert into doceingrediente values(1, 1, 1);
insert into doceingrediente values(2, 1, 2);

insert into doceingrediente values(3, 2, 2);
insert into doceingrediente values(4, 2, 3);

create table cursoconfeiteiro(
	id int, 
	primary key(id), 
	idcurso int references curso(id), 
	idconfeiteiro int references confeiteiro(id)
);

insert into cursoconfeiteiro values(1, 1, 1);
insert into cursoconfeiteiro values(2, 2, 2);
insert into cursoconfeiteiro values(3, 3, 3);