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

-- REGISTRO EN LAS TABLAS
--------------------------------------------------------
INSERT INTO Gerente (idGerente, descGerente, fechaRetgistro) 
VALUES (1, 'Arnny', CURRENT_TIMESTAMP);

INSERT INTO Gerente (idGerente, descGerente, fechaRetgistro) 
VALUES (2, 'Jesus', CURRENT_TIMESTAMP);
--------------------------------------------------------
INSERT INTO Condicion (idCondicion, descCondicion, fechaRegistro) 
VALUES (1, 'Condicionuno', CURRENT_TIMESTAMP);
INSERT INTO Condicion (idCondicion, descCondicion, fechaRegistro) 
VALUES (2, 'Condiciondos', CURRENT_TIMESTAMP);

--------------------------------------------------------
INSERT INTO Provincia (idProvincia, descProvincia, fechaRegistro) 
VALUES (1, 'Lima', CURRENT_TIMESTAMP);
INSERT INTO Provincia (idProvincia, descProvincia, fechaRegistro) 
VALUES (2, 'Callao', CURRENT_TIMESTAMP);

--------------------------------------------------------
INSERT INTO Distrito (idDistrito, idProvincia, descDistrito, fechaRegistro) 
VALUES (1, 1, 'Brenia', CURRENT_TIMESTAMP);
INSERT INTO Distrito (idDistrito, idProvincia, descDistrito, fechaRegistro) 
VALUES (2, 2, 'Bellavista', CURRENT_TIMESTAMP);

--------------------------------------------------------
INSERT INTO Hospital (idHospital, idDistrito, Nombre, Antiguedad, Area, idGerente, idCondicion, fechaRegistro) 
VALUES (1, '2', 'Hospital Nacional Ana', 10, 90.50, 2, 1, CURRENT_TIMESTAMP);

INSERT INTO Hospital (idHospital, idDistrito, Nombre, Antiguedad, Area, idGerente, idCondicion, fechaRegistro) 
VALUES (2, '2', 'Hospital Privado Bellavista', 10, 90.50, 2, 1, CURRENT_TIMESTAMP);

INSERT INTO Hospital (idHospital, idDistrito, Nombre, Antiguedad, Area, idGerente, idCondicion, fechaRegistro) 
VALUES (3, '1', 'Hospital Nacional ate', 10, 90.50, 2, 1, CURRENT_TIMESTAMP);