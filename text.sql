-- CREACION DE LAS TABLAS RELACIONALES
create table Gerente(
idGerente number not null,
descGerente varchar2(50) not null,
fechaRetgistro TIMESTAMP ,
constraint pk_gerente primary key(idGerente)
);

create table Condicion(
idCondicion number not null,
descCondicion varchar2(50) not null,
fechaRegistro TIMESTAMP ,
constraint pk_condicion primary key(idCondicion)
);

create table Provincia(
idProvincia number not null,
descProvincia varchar2(50) not null,
fechaRegistro TIMESTAMP ,
constraint pk_provincia primary key(idProvincia)
);

create table Distrito(
idDistrito number not null,
idProvincia number not null,
descDistrito varchar2(50) ,
fechaRegistro TIMESTAMP ,
CONSTRAINT pk_distrito PRIMARY KEY (idDistrito),
    CONSTRAINT fk_distrito_provincia FOREIGN KEY (idProvincia)
        REFERENCES Provincia(idProvincia)
);

create table Hospital(
idHospital number not null,
idDistrito number not null,
Nombre varchar2(50) not null,
Antiguedad number not null,
Area number(5,2) not null,
idGerente number not null,
idCondicion number not null,
fechaRegistro TIMESTAMP,
CONSTRAINT pk_hospital PRIMARY KEY (idHospital),
    CONSTRAINT fk_hospital_distrito FOREIGN KEY (idDistrito)
        REFERENCES Distrito(idDistrito),
    CONSTRAINT fk_hospital_gerente FOREIGN KEY (idGerente)
        REFERENCES Gerente(idGerente),
    CONSTRAINT fk_hospital_condicion FOREIGN KEY (idCondicion)
        REFERENCES Condicion(idCondicion)
);
