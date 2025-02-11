create database School;

create table Teacher 
(
	ID int primary key ,
	FirstName varchar(100) not null,
	lastName varchar(100) not null
);


insert into Teacher values
(1,'Ahmad','Saleh'),
(2,'Sara','Mohanad'),
(3,'Sally','Marwan'),
(4,'Joe','Doe'),
(5,'Jonh','Lee');

create table TeacherDetails
(
	ID int primary key,
	Salary decimal ,
	specialty varchar(100),
	start_date date,
	Teacher_id int unique,
	foreign key (Teacher_id) references Teacher(ID)
);

insert into TeacherDetails values
(1,400,'Math','2000-01-01',1),
(2,450,'Science','2003-08-01',2),
(3,500,'Arabic','2010-01-01',3),
(4,460,'English','2020-04-01',4),
(5,490,'History','2013-06-01',5);

create table Courses
(
	ID int primary key,
	name varchar(100) not null,
	start_Time time,
	end_Time time,
	teacher_id int unique,
	foreign key (Teacher_id) references Teacher(ID)
);

insert into Courses values
(1,'English' , '09:00' ,'10:00',4),
(2,'intro to Physics' , '08:00' ,'9:00',2),
(3,'Grammer and reading in Arabic' , '11:00' ,'12:00',3),
(4,'Calculas' , '12:00' ,'01:00',1),
(5,'Eygpt and history' , '01:00' ,'02:00',5);

create table Students 
(
	ID int primary key ,
	FirstName varchar(100) not null,
	lastName varchar(100) not null,
	age int ,
	grade varchar(100) not null,
);

insert into Students values
(1,'Ali','Mohammad',12,'7th'),
(2,'yousef','sameer',12,'7th'),
(3,'sahar','ryiad',15,'9th'),
(4,'leo','Doe',15,'9th'),
(5,'Jonh','Lee',15,'9th');

create table Student_Courses 
(
	std_id int,
	cors_id int,
	foreign key (std_id) references Students(ID),
	foreign key (cors_id) references Courses(ID),
);

insert into Student_Courses values
	(1,1),
	(1,2),
	(1,3),
	(2,3),
	(4,1),
	(5,4),
	(5,3),
	(3,5);

	select * from Teacher;
	select * from TeacherDetails;
	select * from Courses;
	select * from Students;
	select * from Student_Courses;
