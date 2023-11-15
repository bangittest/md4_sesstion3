create database quanlysinhvien;
use quanlysinhvien;


create table class(
	classID int not null primary key auto_increment,
    className varchar(60),
    startDate datetime default(current_date()) default(current_time()) not null,
    status bit
);

insert into class(className,status)values('A',1);
insert into class(className,status)values('B',1);
insert into class(className,startDate,status)values('B','2023-12-15 00:38:21',1);
insert into class(className,startDate,status)values('E','2023-12-22 00:38:10',1);

create table student(
	studentID int not null primary key auto_increment,
    studentName varchar(30) not null,
    address varchar(50),
    phone varchar(20),
    status bit,
    classID int not null,
    foreign key(classID)references class(classID)
);

insert into student(studentName,address,phone,status,classID)values('Lop 519A','Ha noi','0968783032',1,1);
insert into student(studentName,address,phone,status,classID)values('java','Ha noi','0968783032',1,2);
insert into student(studentName,address,phone,status,classID)values('js','Ha noi','0968783032',1,3);
insert into student(studentName,address,phone,status,classID)values('js','Ha noi','0968783032',1,4);


create table subject(
subID int not null primary key auto_increment,
subName varchar(30) not null,
creadit tinyint not null default(1) check(creadit>=1),
status bit default(1)
);

insert into subject(subName,creadit)values('jack','9');
insert into subject(subName,creadit)values('hong hanh','4');
insert into subject(subName,creadit)values('jack ma','3');
insert into subject(subName,creadit)values('jack ma','3');

select * from subject;



create table mark(
	markID int not null primary key auto_increment,
    subID int not null unique key,
    foreign key(subID)references subject(subID),
    studentID int not null unique key,
    foreign key(studentID)references student(studentID),
    mark float default(0) check(mark between 0 and 100),
    examTimes tinyint default(1)
);

insert into mark(subID,studentID)values(1,1);
insert into mark(subID,studentID,mark)values(2,2,60);
insert into mark(subID,studentID,mark)values(3,3,80);
insert into mark(subID,studentID,mark)values(4,4,20);




select studentID, studentName, className 
from student 
join class on student.classID=class.classID;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A';

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId;

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'jack';

-- SELECT *
-- FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
-- WHERE Sub.SubName like '%j%';
-- bai1
select * from student
join mark on student.studentID=mark.studentID join subject on mark.subID=subject.subID
where subject.subName like '%j%';

select * from class where month(startDate)=12;
use quanlysinhvien;
-- • Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from subject where creadit>=3 and creadit<=5;

select * from student where studentName='Lop 519A';
update student
join class on student.classID=class.classID 
set class.classID=7 
where student.studentName='Lop 519A';

SELECT Student.StudentId, Student.StudentName, Subject.SubName, Mark.Mark
FROM Student Student join Mark Mark on Student.StudentId = Mark.StudentId join Subject Subject on Mark.SubId = Subject.SubId  
ORDER BY mark DESC ,subName ASC;











SELECT *
FROM subject
WHERE creadit < 10;