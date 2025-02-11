CREATE TABLE Classes (
    ID INT PRIMARY KEY NOT NULL,
    code VARCHAR(255) NOT NULL,
    room_number INT NOT NULL,
    schedule datetime NOT NULL
);



CREATE TABLE Student (
    ID INT PRIMARY KEY NOT NULL,
    name NVARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    address VARCHAR(255) NOT NULL,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Classes(id)
);

CREATE TABLE Family_info (
    ID INT PRIMARY KEY NOT NULL,
    first_name NVARCHAR(255) NOT NULL,
    last_name NVARCHAR(255) NOT NULL,
    relative VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    Student_id INT UNIQUE  NOT NULL,
    FOREIGN KEY (Student_id) REFERENCES Student(id)
);

CREATE TABLE Courses (
    ID INT PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    resource VARCHAR(255) NOT NULL
);


CREATE TABLE Assignments (
    ID INT PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    due_date DATETIME NOT NULL,
    states VARCHAR(255) NOT NULL,
    Course_id INT NOT NULL,
    FOREIGN KEY (Course_id) REFERENCES Courses(id)
);

CREATE TABLE Attendance (
    ID INT PRIMARY KEY NOT NULL,
    date DATETIME NOT NULL,
    type_of_absence VARCHAR(255) NOT NULL,
    student_id INT UNIQUE NOT NULL,
    reason VARCHAR(255) NOT NULL,  
    FOREIGN KEY (student_id) REFERENCES Student(id)
);

CREATE TABLE Enrollment (
    Student_id INT NOT NULL,
    Course_id INT NOT NULL,
   
    FOREIGN KEY (Student_id) REFERENCES Student(id),
    FOREIGN KEY (Course_id) REFERENCES Courses(id)
);

CREATE TABLE Submission (
    Studentd_id INT NOT NULL,
    Assignment_id INT NOT NULL,
    
    FOREIGN KEY (Studentd_id) REFERENCES Student(id),
    FOREIGN KEY (Assignment_id) REFERENCES Assignments(id)
);


-- Insert into Classes
INSERT INTO Classes (ID, code, room_number, schedule) VALUES 
(1, 'MATH101', 101, '2025-02-15 08:00:00'),
(2, 'PHY102', 102, '2025-02-16 09:00:00'),
(3, 'CHEM103', 103, '2025-02-17 10:00:00'),
(4, 'BIO104', 104, '2025-02-18 11:00:00'),
(5, 'CS105', 105, '2025-02-19 12:00:00');

-- Insert into Student
INSERT INTO Student (ID, name, date_of_birth, address, class_id) VALUES 
(1, 'Ali Ahmed', '2005-03-15', 'Street 123, City A', 1),
(2, 'Sara Khan', '2006-07-22', 'Street 456, City B', 2),
(3, 'Omar Hassan', '2007-01-10', 'Street 789, City C', 3),
(4, 'Lina Saeed', '2004-11-05', 'Street 101, City D', 4),
(5, 'Hassan Raza', '2005-09-18', 'Street 202, City E', 5);

-- Insert into Family_info
INSERT INTO Family_info (ID, first_name, last_name, relative, phone, email, Student_id) VALUES 
(1, 'Ahmed', 'Ali', 'Father', '1234567890', 'ahmed@example.com', 1),
(2, 'Aisha', 'Khan', 'Mother', '0987654321', 'aisha@example.com', 2),
(3, 'Hassan', 'Omar', 'Brother', '1122334455', 'hassan@example.com', 3),
(4, 'Saeed', 'Lina', 'Uncle', '5566778899', 'saeed@example.com', 4),
(5, 'Raza', 'Hassan', 'Father', '6677889900', 'raza@example.com', 5);

-- Insert into Courses
INSERT INTO Courses (ID, name, description, resource) VALUES 
(1, 'Mathematics', 'Basic Math concepts', 'Book 1'),
(2, 'Physics', 'Mechanics and Optics', 'Book 2'),
(3, 'Chemistry', 'Organic and Inorganic Chemistry', 'Book 3'),
(4, 'Biology', 'Human Anatomy', 'Book 4'),
(5, 'Computer Science', 'Programming and Databases', 'Book 5');

-- Insert into Assignments
INSERT INTO Assignments (ID, name, description, due_date, states, Course_id) VALUES 
(1, 'Algebra', 'Solve 10 equations', '2025-03-01 23:59:59', 'Pending', 1),
(2, 'Newton Laws', 'Write a report', '2025-03-05 23:59:59', 'Pending', 2),
(3, 'Periodic Table', 'Memorize elements', '2025-03-10 23:59:59', 'Completed', 3),
(4, 'Cell Structure', 'Draw cell diagram', '2025-03-12 23:59:59', 'Pending', 4),
(5, 'Database Query', 'Write SQL queries', '2025-03-15 23:59:59', 'Pending', 5);

-- Insert into Attendance
INSERT INTO Attendance (ID, date, type_of_absence, student_id, reason) VALUES 
(1, '2025-02-05 08:00:00', 'Sick Leave', 1, 'Flu'),
(2, '2025-02-06 09:00:00', 'Personal', 2, 'Family emergency'),
(3, '2025-02-07 10:00:00', 'Unexcused', 3, 'Missed bus'),
(4, '2025-02-08 11:00:00', 'Medical', 4, 'Doctor appointment'),
(5, '2025-02-09 12:00:00', 'Sick Leave', 5, 'Cold');

-- Insert into Enrollment
INSERT INTO Enrollment (Student_id, Course_id) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

-- Insert into Submission
INSERT INTO Submission (Studentd_id, Assignment_id) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

Select * from Courses
where name= 'Computer Science'

alter table Student add  Email varchar(250);

INSERT INTO Student (ID, name, date_of_birth, address, class_id, Email) 
VALUES (6, 'Mohammed Ali', '2006-05-20', 'Street 303, City F', 2, 'mohammed.ali@example.com');

select student.name , Family_info.first_name 
from Student
inner join Family_info on Student.ID = Family_info.Student_id 

select Student.name, Courses.name
from student 
inner join Enrollment on Student.ID = Enrollment.Student_id
inner join Courses on Enrollment.Course_id = Courses.ID 
where Courses.name= 'Chemistry'

select Student.name, Assignments.states
from Student
right join Submission on Student.ID = Submission.Studentd_id
right join Assignments on Submission.Assignment_id = Assignments.ID
where Assignments.states = 'Completed'


SELECT Student.ID, Student.name, Attendance.date, Attendance.type_of_absence, Attendance.reason 
FROM Student
JOIN Attendance ON Student.ID = Attendance.student_id
WHERE Attendance.date BETWEEN '2025-02-04' AND '2025-02-08';
