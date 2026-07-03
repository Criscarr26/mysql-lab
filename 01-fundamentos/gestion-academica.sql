/*ejercicio 1*/
/*Tabla Estudiantes*/
create database estudiantes;
use estudiantes;
create table Estudiante (
    EstudianteID int primary key,
    Nombre varchar(50),
    Apellido varchar(50),
    Email varchar(100)
);

/*Tabla Curso*/
create table Curso (
    CursoID int primary key,
    NombreCurso varchar(100),
    Créditos int
);

/*Tabla Inscripción*/
create table Inscripción (
    InscripciónID int primary key,
    FechaInscripción date,
    NotaFinal decimal(4,2),
    EstudianteID int,
    CursoID int,
    foreign key (EstudianteID) references Estudiante(EstudianteID),
    foreign key (CursoID) references Curso(CursoID)
);

/*ejercicio 2*/
/*Tabla Paciente*/
create database pacientes;
use pacientes;
create table Paciente (
    PacienteID int primary key,
    Nombre varchar(50),
    Apellido varchar(50),
    FechaNacimiento date
);

/*Tabla Medico*/
create table Medico (
    MedicoID int primary key,
    Nombre varchar(50),
    Especialidad varchar(100)
);

/*Tabla Cita*/
create table Cita (
    CitaID int primary key,
    FechaCita date,
    HoraCita time,
    Diagnostico text,
    PacienteID int,
    MedicoID int,
    foreign key (PacienteID) references Paciente(PacienteID),
    foreign key (MedicoID) references Medico(MedicoID)
);

