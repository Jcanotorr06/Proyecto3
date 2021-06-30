CREATE DATABASE Vacunacion
Use Vacunacion

CREATE TABLE Provincia(
    cod_prov CHAR(2)
        CONSTRAINT Provincia_cod_prov_pk PRIMARY KEY
        CONSTRAINT Provincia_cod_prov_ch
            CHECK (cod_prov LIKE '0[1-9]' OR cod_prov LIKE '1[0-3]'),
    nombre VARCHAR(25) NOT NULL
)

CREATE TABLE Distrito(
    cod_dist INT
        CONSTRAINT Distrito_cod_dist_pk PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    cod_prov CHAR(2)
        CONSTRAINT Distrito_cod_prov_fk
            FOREIGN KEY REFERENCES Provincia(cod_prov)
			on delete set null
			on update cascade
        CONSTRAINT Distrito_cod_prov_df
            DEFAULT '08'
)

CREATE TABLE Corregimiento(
    cod_cor INT
        CONSTRAINT Corregimiento_cod_corr_pk PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    cod_dist INT
        CONSTRAINT Corregimiento_cod_dist_fk
            FOREIGN Key REFERENCES Distrito(cod_dist)
			on delete set null
			on update cascade
)

CREATE TABLE Institucion(
    cod_int int IDENTITY(1000, 1)
        CONSTRAINT Institucion_cod_int_pk PRIMARY Key,
    nombre VARCHAR(25) NOT NULL
)

CREATE TABLE Colaborador(
    cedula_col CHAR(11)
        CONSTRAINT Colaborador_cedula_col_pk PRIMARY KEY
        CONSTRAINT Colaborador_cedula_col_ch
            CHECK(
                cedula_col LIKE '[1][0-3]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' OR
                cedula_col LIKE '[0][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'
                ),
    nombre VARCHAR(20),
    apellido VARCHAR(20),
    rol CHAR
        CONSTRAINT Colaborador_rol_ch
            CHECK(rol IN ('D', 'E', 'A'))
        CONSTRAINT Colaborador_rol_df
            DEFAULT 'A',
    cod_int int
        CONSTRAINT Colaborador_cod_int_fk
            FOREIGN KEY REFERENCES Institucion(cod_int)
			on delete cascade
			on update cascade
)

CREATE TABLE Centro(
    cod_cen CHAR(13)
        CONSTRAINT Centro_cod_cen_pk PRIMARY KEY
        CONSTRAINT Centro_cod_cent_ch
            CHECK(
                cod_cen LIKE 'CV-0[1-9]-ES-[0-9][0-9][0-9][0-9]' OR
                cod_cen LIKE 'CV-1[0-3]-ES-[0-9][0-9][0-9][0-9]' OR
                cod_cen LIKE 'CV-0[1-9]-HO-[0-9][0-9][0-9][0-9]' OR
                cod_cen LIKE 'CV-1[0-3]-HO-[0-9][0-9][0-9][0-9]' OR
                cod_cen LIKE 'CV-0[1-9]-CS-[0-9][0-9][0-9][0-9]' OR
                cod_cen LIKE 'CV-1[0-3]-CS-[0-9][0-9][0-9][0-9]'
                ),
    nombre VARCHAR(40),
    cod_cor INT
        CONSTRAINT Centro_cod_cor_fk
            FOREIGN KEY REFERENCES Corregimiento(cod_cor)
			on delete set null
			on update cascade
)

CREATE TABLE Centro_Colaborador(
    cod_cen CHAR(13)
        CONSTRAINT Centro_Colaborador_cod_cen_fk
            FOREIGN KEY REFERENCES Centro(cod_cen)
			on delete cascade
			on update cascade,
    cedula_col CHAR(11)
        CONSTRAINT Centro_Colaborador_cedula_col_fk
            FOREIGN KEY REFERENCES Colaborador(cedula_col)
			on delete cascade
			on update cascade,
    fecha DATE,
    CONSTRAINT Centro_Colaborador_cod_cen_cedula_col_fecha_pk
        PRIMARY KEY(cod_cen, cedula_col, fecha)
)

CREATE TABLE Vacuna(
    cod_vac AS (upper(left(nombre, 3))) PERSISTED
        CONSTRAINT Vacuna_cod_vac_pk PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    cant_dosis INT NOT NULL,
    TiempoEntreDosis INT
)

CREATE TABLE Paciente(
    cedula_pac CHAR(11)
        CONSTRAINT Paciente_cedula_pac_pk PRIMARY KEY
        CONSTRAINT Paciente_cedula_pac_ch
            CHECK(
                cedula_pac LIKE '[1][0-3]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' OR
                cedula_pac LIKE '[0][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'
                ),
    nombre VARCHAR(20),
    apellido VARCHAR(20),
    fecha_nac DATE
        CONSTRAINT Paciente_fech_nac_ch
            CHECK(DATEDIFF(year, GETDATE(), fecha_nac) < 110),
    cod_cor INT
        CONSTRAINT Paciente_cod_cor_fk
            FOREIGN KEY REFERENCES Corregimiento(cod_cor)
			on delete set null
			on update cascade
)

CREATE TABLE Telefono(
    cedula_pac char(11)
        CONSTRAINT Telefono_cedula_pac_fk
            FOREIGN KEY REFERENCES Paciente(cedula_pac)
			on delete cascade
			on update cascade,
    telefono varchar(9),
    CONSTRAINT Telefono_cedula_pac_telefono_pk
        PRIMARY KEY(cedula_pac, telefono)
)

CREATE TABLE Paciente_Vacuna_Centro(
    cedula_pac CHAR(11)
        CONSTRAINT Paciente_Vacuna_Centro_cedula_pac_fk
            FOREIGN KEY REFERENCES Paciente(cedula_pac)
			on delete cascade
			on update cascade,
    cod_vac VARCHAR(3)
        CONSTRAINT Paciente_Vacuna_Centro_cod_vac_fk
            FOREIGN KEY REFERENCES Vacuna(cod_vac)
			on delete cascade
			on update cascade,
    cod_cen CHAR(13)
        CONSTRAINT Paciente_Vacuna_Centro_cod_cen_fk
            FOREIGN KEY REFERENCES Centro(cod_cen)
			on delete no action
			on update no action,
    dosis INT NOT NULL,
    CONSTRAINT Paciente_Vacuna_Centro_cedula_pac_cod_vac_cod_cen_dosis_pk
        PRIMARY KEY(cedula_pac, cod_vac, cod_cen, dosis),
    fecha_cita DATE NOT NULL
        CONSTRAINT Paciente_Vacuna_Centro_fecha_cita_ch
            CHECK(DATEDIFF(day, GETDATE(), fecha_cita) >= 0),
    fecha_vacuna DATE
)


insert into Provincia
	values ('01', 'Bocas del Toro')
insert into Provincia
	values ('02', 'Coclé')
insert into Provincia
	values ('03', 'Colón')
insert into Provincia
	values ('04', 'Chiriquí')
insert into Provincia
	values ('05', 'Darién')
insert into Provincia
	values ('06', 'Herrera')
insert into Provincia
	values ('07', 'Los Santos')
insert into Provincia
	values ('08', 'Panamá')
insert into Provincia
	values ('09', 'VeraguaS')
insert into Provincia
	values ('10', 'GunaYala, Madugan, Wargan')
insert into Provincia
	values ('11', 'Emberá Wounaan')
insert into Provincia
	values ('12', 'Ngäbe-Buglé')
insert into Provincia
	values ('13', 'Panamá Oeste')

insert into Distrito
	values (12, 'Balboa', '08')
insert into Distrito
	values (03, 'Chepo', '08')
insert into Distrito
	values (25, 'Arraijan', '13')
insert into Distrito
	values (01, 'Panama', '08')
insert into Distrito
	values (20, 'Los Santos', '07')
insert into Distrito
	values (06, 'Baru', '04')
insert into Distrito
	values (10, 'Colon', '03')
insert into Distrito
	values (02, 'Changinola', '01')
insert into Distrito
	values (21, 'La Chorrera', '13')
insert into Distrito
	values (15, 'Las Palmas', '09')


insert into Corregimiento
	values (01, 'San Miguel', 12)
	insert into Corregimiento
	values (02, 'Ancon', 01)
	insert into Corregimiento
	values (03, 'Limones', 06)
	insert into Corregimiento
	values (04, 'Chepillo', 03)
	insert into Corregimiento
	values (12, 'Arosemena', 21)
	insert into Corregimiento
	values (13, 'Arraijan', 25)
	insert into Corregimiento
	values (14, 'Burunga', 25)
	insert into Corregimiento
	values (05, 'Las Cumbres', 01)
	insert into Corregimiento
	values (06, 'Tocumen', 01)
	insert into Corregimiento
	values (09, 'EL Chorrillo', 01)


	insert into Institucion
		values ('Ministerio de Salud')
		insert into Institucion
		values ('Caja de Seguro Social')
		insert into Institucion
		values ('Bene. Cuerpo de Bomb. RP.')
		insert into Institucion
		values ('S. Nac. de Protec. Civil')
		insert into Institucion
		values ('Cruz Roja')
		insert into Institucion
		values ('Club Activo 20-30')
		insert into Institucion
		values ('Gobiernos Municipales')
		insert into Institucion
		values ('Policia Nacional')

		insert into Colaborador
			values ('08-011-1111', 'Carlos', 'Tapia', 'D', 1001)
			insert into Colaborador
			values ('08-815-2135', 'Juan', 'Lost', 'A', 1001)
			insert into Colaborador
			values ('06-161-5453', 'Maria', 'Luz', 'E', 1000)
			insert into Colaborador
			values ('03-563-6512', 'Karla', 'Carrillo', 'E', 1006)
			insert into Colaborador
			values ('08-424-4524', 'Liz', 'Sanchez', 'D', 1005)
			insert into Colaborador
			values ('08-545-7272', 'Diego', 'Torres', 'A', 1003)
			insert into Colaborador
			values ('08-853-4243', 'Riz', 'Allen', 'D', 1005)
			insert into Colaborador
			values ('08-438-4345', 'Armando', 'Kent', 'E', 1007)
			insert into Colaborador
			values ('08-239-3793', 'Ivan', 'Stark', 'A', 1000)
			insert into Colaborador
			values ('08-073-9572', 'Raul', 'Las', 'A', 1004)

	insert into Centro
		values('CV-08-ES-6452', 'Armagedon', 2)
		insert into Centro
		values('CV-09-ES-1424', 'B. Hermanos', 6)
		insert into Centro
		values('CV-02-HO-5423', 'Nacional', 4)
		insert into Centro
		values('CV-12-ES-5634', 'Santo Tomas', 9)
		insert into Centro
		values('CV-12-CS-7630', 'Espiritu', 2)
		insert into Centro
		values('CV-03-CS-7826', 'Espino', 1)
		insert into Centro
		values('CV-03-ES-9532', 'St. Jose', 1)
		insert into Centro
		values('CV-01-HO-8375', 'Tumba', 12)
		insert into Centro
		values('CV-12-ES-2753', 'Vida', 5)
		insert into Centro
		values('CV-05-HO-6434', 'Toni', 13)

	insert into Centro_Colaborador
		values ('CV-03-CS-7826', '03-563-6512', '4/5/2008')
		insert into Centro_Colaborador
		values ('CV-01-HO-8375', '06-161-5453', '2/1/1984')
		insert into Centro_Colaborador
		values ('CV-12-ES-2753', '08-011-1111', '12/10/2015')
		insert into Centro_Colaborador
		values ('CV-05-HO-6434', '08-073-9572', '6/8/2001')
		insert into Centro_Colaborador
		values ('CV-03-CS-7826', '08-239-3793', '3/5/2006')
		insert into Centro_Colaborador
		values ('CV-03-ES-9532', '08-853-4243', '9/8/2019')
		insert into Centro_Colaborador
		values ('CV-12-CS-7630', '08-424-4524', '8/5/1999')
		insert into Centro_Colaborador
		values ('CV-12-ES-2753', '08-438-4345', '5/5/1994')
		insert into Centro_Colaborador
		values ('CV-02-HO-5423', '08-545-7272', '2/6/2010')
		insert into Centro_Colaborador
		values ('CV-01-HO-8375', '08-815-2135', '9/9/2000')

	insert into Vacuna
		values('Pfizer-BioNTech', 2, 21)
	insert into Vacuna
		values('Moderna', 2, 28)
		insert into Vacuna
		values('Johnson&Johnson', 1, 0)
		insert into Vacuna
		values('AstraZeneca', 2, 56)
		insert into Vacuna
		values('Sinopharm', 2, 21)
		insert into Vacuna
		values('Sputnik', 2, 21)

	insert into Paciente
		values('08-978-3456', 'Santiago', 'Perez', '06/11/1988', 6),
			('08-234-5678', 'Carlos', 'Gonzales', '09/22/1978', 1),
			('08-765-4321', 'Juan', 'Gutierrez', '02/19/1972', 9),
			('04-235-5578', 'Ana', 'Gonzales', '05/20/1989', 3),
			('13-233-6678', 'Melisa', 'De Leon', '08/09/1968', 12),
			('13-226-7679', 'Tobas', 'Guerrero', '06/28/1962', 14),
			('13-278-1256', 'Carlos', 'Guerra', '12/17/1981', 13),
			('04-764-2266', 'Marco', 'Perez', '07/15/1988', 3),
			('08-123-5599', 'Oneida', 'Morales', '10/20/1966', 1),
			('08-443-9902', 'Pedro', 'Fernadez', '04/14/1970', 5)

	insert into Telefono
		values ('08-978-3456', '1234-9876'),
			('08-234-5678', '6658-9897'),
			('08-234-5678', '7690-8499'),
			('08-765-4321', '1243-9911'),
			('04-235-5578', '2200-9871'),
			('13-233-6678', '0976-0012'),
			('13-226-7679', '1266-9844'),
			('13-278-1256', '1078-0908'),
			('04-764-2266', '1099-9843'),
			('08-123-5599','2960-0853'),
			('08-123-5599','9008-4065'),
			('08-443-9902', '8657-9375')



	insert into Paciente_Vacuna_Centro
		values ('08-978-3456', 'MOD', 'CV-09-ES-1424', 1, '8/26/2021', '7/26/2021')
		insert into Paciente_Vacuna_Centro
		values ('08-234-5678', 'SIN', 'CV-03-CS-7826', 1, '8/25/2021', null)
		insert into Paciente_Vacuna_Centro
		values ('08-765-4321', 'AST', 'CV-12-ES-5634', 2, '8/11/2021', '7/20/2021')
		insert into Paciente_Vacuna_Centro
		values ('04-235-5578', 'MOD', 'CV-03-CS-7826', 1, '9/25/2021', '7/25/2021')
		insert into Paciente_Vacuna_Centro
		values ('13-233-6678', 'SPU', 'CV-01-HO-8375', 2, '10/10/2021', '7/13/2021')
		insert into Paciente_Vacuna_Centro
		values ('13-226-7679', 'AST', 'CV-08-ES-6452', 2, '7/13/2021', '7/20/2021')
		insert into Paciente_Vacuna_Centro
		values ('13-278-1256', 'AST', 'CV-05-HO-6434', 2, '12/25/2021', null)
		insert into Paciente_Vacuna_Centro
		values ('04-764-2266', 'SIN', 'CV-02-HO-5423', 2, '8/4/2021', '7/30/2021')
		insert into Paciente_Vacuna_Centro
		values ('08-123-5599', 'SPU', 'CV-03-ES-9532', 1, '12/22/2021', null)
		insert into Paciente_Vacuna_Centro
		values ('08-443-9902', 'AST', 'CV-02-HO-5423', 2, '7/25/2021', '7/25/2021')

	