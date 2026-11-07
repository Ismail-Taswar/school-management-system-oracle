sys as sysdba

drop user sc_ddd56a cascade ;

create      user sc_ddd56a
identified  by   123
quota       unlimited on users ;

grant dba
to    sc_ddd56a ;

conn sc_ddd56a/123



--===============
--user_type Table
--===============

drop table user_type cascade constraint ;

create table user_type
(
user_type_ID             number,
user_type_name           varchar2(100) constraint user_type_user_type_name_nn not null
                                       constraint user_type_user_type_name_uk unique  ,
user_type_description    varchar2(250),
action_user              varchar2(100) default user,
action_date_time         date          default sysdate
) ;

alter table user_type
add         constraint user_type_user_type_id_pk primary key(user_type_id) ;

begin ;
insert into user_type (user_type_id, user_type_name) 
values (1, 'Admin') ;

insert into user_type (user_type_id, user_type_name)
values (2, 'Moderator') ;

insert into user_type (user_type_id, user_type_name)
values (3, 'Student') ;

insert into user_type (user_type_id, user_type_name)
values (4, 'Writer') ;

insert into user_type (user_type_id, user_type_name)
values (5, 'Reader') ;

insert into user_type (user_type_id, user_type_name)
values (6, 'Subscriber') ;

insert into user_type (user_type_id, user_type_name)
values (7, 'Guest') ;

insert into user_type (user_type_id, user_type_name)
values (8, 'Teacher') ;

insert into user_type (user_type_id, user_type_name)
values (9, 'Contributor') ;

insert into user_type (user_type_id, user_type_name)
values (10, 'Curator') ;

insert into user_type (user_type_id, user_type_name)
values (11, 'Mentor') ;

insert into user_type (user_type_id, user_type_name)
values (12, 'Learner') ;
end ;

--===============
--user_info table
--===============

drop table user_info cascade constraint ;

create table user_info
(
user_info_id             number,
user_type_id             number,
username                 varchar2(100) constraint user_info_username_nn not null
                                       constraint user_info_username_uk unique  ,
password                 varchar2(100) constraint user_info_password_nn not null,
user_image               blob,
action_user              varchar2(100) default user,
action_date_time         date          default sysdate
) ;

alter table user_info
add         constraint user_info_user_info_id_pk primary key(user_info_id) ;

alter table user_info
add         constraint user_info_user_type_id_fk foreign key(user_type_id)
references  user_type(user_type_id) ;


begin
insert into user_info (user_info_id, user_type_id, username, password)
values (1, 1, 'admin', 'admin') ;

insert into user_info (user_info_id, user_type_id,   username, password)
values (2, 2, 'mod', 'mod') ;

insert into user_info (user_info_id, user_type_id,  username, password)
values (3, 3,  'stu', 'stu') ;

insert into user_info (user_info_id, user_type_id,  username, password)
values (4, 4,'writ', 'writ') ;

insert into user_info (user_info_id, user_type_id,   username, password)
values (5, 5,  'rdr', 'rdr') ;

insert into user_info (user_info_id, user_type_id,   username, password)
values (6, 6,'sub', 'sub') ;

insert into user_info (user_info_id, user_type_id,   username, password)
values (7, 7, 'gst', 'gst') ;

insert into user_info (user_info_id, user_type_id,   username, password)
values (8, 8,  'rviwr', 'rviwr') ;

insert into user_info (user_info_id, user_type_id,   username, password)
values (9, 9,  'cntrbtr', 'cntrbtr') ;

insert into user_info (user_info_id, user_type_id,   username, password)
values (10, 10, 'crtr', 'crtr') ;

insert into user_info (user_info_id, user_type_id,   username, password)
values (11, 11,  'mntr', 'mntr') ;

insert into user_info (user_info_id, user_type_id,   username, password)
values (12, 12, 'lrnr', 'lrnr') ;

end ;


--==================
--department table
--==================

drop table department cascade constraint ;

create table department
(
department_id          number,
department_name        varchar2(100) constraint department_department_name_nn not null
                                     constraint department_department_name_uk unique,
department_description varchar2(250),
action_user            varchar2(100) default user,
action_date_time       date default sysdate
) ;

alter table department 
add         constraint department_department_id_pk primary key(department_id) ;

begin
Insert into DEPARTMENT (DEPARTMENT_ID,DEPARTMENT_NAME,  DEPARTMENT_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (1,'Bangla',null,'SC_DDD56',to_date('29-NOV-23','DD-MON-RR'));
Insert into DEPARTMENT (DEPARTMENT_ID,DEPARTMENT_NAME,  DEPARTMENT_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (2,'English',null,'SC_DDD56',to_date('29-NOV-23','DD-MON-RR'));
Insert into DEPARTMENT (DEPARTMENT_ID,DEPARTMENT_NAME,  DEPARTMENT_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (3,'Math',null,'SC_DDD56',to_date('29-NOV-23','DD-MON-RR'));
Insert into DEPARTMENT (DEPARTMENT_ID,DEPARTMENT_NAME,  DEPARTMENT_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (4,'Science',null,'SC_DDD56',to_date('29-NOV-23','DD-MON-RR'));
end ;


--=================
--designation table
--=================

drop table designation cascade constraint ;

create table designation
(
designation_id            number,
designation_name          varchar2(100) constraint designation_designation_name_nn not null
                                        constraint desigantion_designation_name_uk unique,
designation_description   varchar2(250),
action_user               varchar2(100) default user,
action_date_time          date          default sysdate
) ;

alter table designation
add         constraint designation_designation_id_pk primary key(designation_id) ;

begin
Insert into DESIGNATION (DESIGNATION_ID,DESIGNATION_NAME,DESIGNATION_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (1,'Teacher',null,'SC_DDD56',to_date('29-NOV-23','DD-MON-RR'));
Insert into DESIGNATION (DESIGNATION_ID,DESIGNATION_NAME,DESIGNATION_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (2,'Asst. Teacher',null,'SC_DDD56',to_date('29-NOV-23','DD-MON-RR'));
Insert into DESIGNATION (DESIGNATION_ID,DESIGNATION_NAME,DESIGNATION_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (3,'Accountant',null,'SC_DDD56',to_date('29-NOV-23','DD-MON-RR'));
Insert into DESIGNATION (DESIGNATION_ID,DESIGNATION_NAME,DESIGNATION_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (4,'Staff',null,'SC_DDD56',to_date('29-NOV-23','DD-MON-RR'));
Insert into DESIGNATION (DESIGNATION_ID,DESIGNATION_NAME,DESIGNATION_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (5,'Headmaster',null,'SC_DDD56',to_date('29-NOV-23','DD-MON-RR'));
end ;


--==============
--employee table
--==============

drop table employee cascade constraint ;

create table employee
(
employee_id          number,
department_id        number,
designation_id       number,      
first_name           varchar2(100)  constraint employee_first_name_nn not null,
last_name            varchar2(100)  constraint employee_last_name_nn not null,
father_name          varchar2(100),
mother_name          varchar2(100),
present_address      varchar2(350),
permanent_address    varchar2(350),
salary               number         constraint employee_salary_ck check(salary between 1000 and 50000),
join_date            date           default sysdate,
NID                  number         constraint employee_nid_uk unique,
email                varchar2(350)  constraint employee_email_uk unique,
cell_number          varchar2(100)  constraint employee_cell_number_uk unique,
date_of_birth        date,
gender               varchar2(100),
religion             varchar2(100),
nationality          varchar2(100),
blood_group          varchar2(100),
employee_image       blob,
action_user          varchar2(100) default user,
action_date_time     date          default sysdate
) ;

alter table employee
add         constraint employee_employee_id_pk primary key(employee_id) ;

alter table employee
add         constraint employee_designation_id_fk foreign key(designation_id)
references  designation(designation_id) ;

alter table employee
add         constraint employee_department_id_fk foreign key(department_id)
references  department(department_id) ;

begin
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (14,1,1,'Sadia','Akter','Abdul','Rahima','Mirpur Dhaka','Mirpur Dhaka',50000,to_date('20-JAN-20','DD-MON-RR'),199011,'sadia.akter12@gmail.com','+8801712345671',to_date('19-FEB-01','DD-MON-RR'),'Female','Islam','Bangladeshi','B+','a',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (15,1,1,'Tasnim','Akter','Jamil','Karima','Shyamoli Dhaka','Shyamoli Dhaka',45000,to_date('13-MAR-21','DD-MON-RR'),199113,'tasnim.akter12@gmail.com','+8801812345672',to_date('11-APR-90','DD-MON-RR'),'Female','Islam','Bangladeshi','O+','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (13,1,1,'AAAA','AAAA','AAA',null,'sssss','ddddaaaa',null,null,null,null,null,null,'Others',null,'Non-Bangladeshi',null,'israt',to_date('31-DEC-23','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (16,1,1,'Nurul','Amin','Abdulla','Jaima','Jatrabari Dhaka','Jatrabari Dhaka',40000,to_date('23-FEB-20','DD-MON-RR'),199114,'nurul.amin12@gmail.com','+8801912345673',to_date('12-MAY-91','DD-MON-RR'),'Male','Islam','Bangladeshi','AB+','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (17,1,1,'Taslima','Akter','Arman','Shammi','Uttara Dhaka','Uttara Dhaka',35000,to_date('20-SEP-23','DD-MON-RR'),199115,'taslima.akter12@gmail.com','+8801612345674',to_date('19-JUN-95','DD-MON-RR'),'Female','Islam','Bangladeshi','A+','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (18,1,1,'Sakib','Hossain','Amir','Ramisa','Mohammadpur Dhaka','Mohammadpur Dhaka',30000,to_date('15-AUG-20','DD-MON-RR'),199116,'sakib.hossain12@gmail.com','+8801312345675',to_date('01-JAN-94','DD-MON-RR'),'Male','Islam','Bangladeshi','B-','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (19,2,2,'Sadiaa','Akter','Hamza','Kohinur','Badda Dhaka','Badda Dhaka',25000,to_date('10-JUL-23','DD-MON-RR'),199117,'sadiaa.akter12@gmail.com','+8801412345676',to_date('28-DEC-02','DD-MON-RR'),'Female','Islam','Bangladeshi','O-','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (20,2,2,'Taasnim','Akter','Sulaiman','Fahmida','Khilkhet Dhaka','Khilkhet Dhaka',20000,to_date('12-DEC-22','DD-MON-RR'),199118,'taasnim.akter12@gmail.com','+8801512345677',to_date('30-NOV-99','DD-MON-RR'),'Female','Islam','Bangladeshi','AB-','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (21,2,2,'Taaslima','Akter','Jakariya','Afreen','Khilgaon Dhaka','Khilgaon Dhaka',45000,to_date('04-MAY-20','DD-MON-RR'),199119,'taaslima.akter12@gmail.com','+880191234579',to_date('05-OCT-99','DD-MON-RR'),'Female','Islam','Bangladeshi','A-','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (22,2,2,'Rakib','Hossain','Zahid','Nurunnahar','Shahbagh Dhaka','Shahbagh Dhaka',20000,to_date('07-MAR-20','DD-MON-RR'),199122,'rakib.hossain12@gmail.com','+8801212345618',to_date('03-SEP-91','DD-MON-RR'),'Male','Islam','Bangladeshi','A+','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (23,2,2,'Saaima','Akter','Faruk','Tahmina','Malibagh Dhaka','Malibagh Dhaka',15000,to_date('15-NOV-22','DD-MON-RR'),199132,'saimaa.akter12@gmail.com','+880131245628',to_date('12-AUG-96','DD-MON-RR'),'Female','Islam','Bangladeshi','B-','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (24,3,3,'Nabila','Islam','Zahir','Afroza','Dhanmondi Dhaka','Dhanmondi Dhaka',50000,to_date('13-JAN-21','DD-MON-RR'),199142,'nabila.islam12@gmail.com','+880141234638',to_date('26-FEB-98','DD-MON-RR'),'Female','Islam','Bangladeshi','AB+','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (25,3,3,'Fahim','Molla','Eyakub','Sefali','Gulshan Dhaka','Gulshan Dhaka',5000,to_date('23-MAR-23','DD-MON-RR'),199152,'fahim.mollaa12@gmail.com','+880151234548',to_date('11-NOV-92','DD-MON-RR'),'Male','Islam','Bangladeshi','O-','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (26,3,3,'Sadia','Akter','Abdul','Rahima','Mirpur Dhaka','Mirpur Dhaka',50000,to_date('20-JAN-20','DD-MON-RR'),199162,'sadia.akter23@gmail.com','+8801712345658',to_date('19-FEB-01','DD-MON-RR'),'Female','Islam','Bangladeshi','B+','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (27,3,3,'Tasnim','Akter','Jamil','Karima','Shyamoli Dhaka','Shyamoli Dhaka',45000,to_date('13-MAR-21','DD-MON-RR'),199172,'tasnim.akter23@gmail.com','+8801812345668',to_date('11-APR-90','DD-MON-RR'),'Female','Islam','Bangladeshi','O+','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (28,3,3,'Nurul','Amin','Abdulla','Jaima','Jatrabari Dhaka','Jatrabari Dhaka',40000,to_date('23-FEB-20','DD-MON-RR'),199182,'nurul.amin23@gmail.com','+8801912345688',to_date('12-MAY-91','DD-MON-RR'),'Male','Islam','Bangladeshi','AB+','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (29,1,1,'Taslima','Akter','Arman','Shammi','Uttara Dhaka','Uttara Dhaka',35000,to_date('20-SEP-23','DD-MON-RR'),199192,'taslima.akter23@gmail.com','+8801612345698',to_date('19-JUN-95','DD-MON-RR'),'Female','Islam','Bangladeshi','A+','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (30,1,1,'Sakib','Hossain','Amir','Ramisa','Mohammadpur Dhaka','Mohammadpur Dhaka',30000,to_date('15-AUG-20','DD-MON-RR'),199212,'sakib.hossain23@gmail.com','+8801312345178',to_date('01-JAN-94','DD-MON-RR'),'Male','Islam','Bangladeshi','B-','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (31,1,1,'Sadiaa','Akter','Hamza','Kohinur','Badda Dhaka','Badda Dhaka',25000,to_date('10-JUL-23','DD-MON-RR'),199312,'sadiaa.akter34@gmail.com','+8801412345278',to_date('28-DEC-02','DD-MON-RR'),'Female','Islam','Bangladeshi','O-','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (32,1,1,'Taasnim','Akter','Sulaiman','Fahmida','Khilkhet Dhaka','Khilkhet Dhaka',20000,to_date('12-DEC-22','DD-MON-RR'),199412,'taasnim.akter34@gmail.com','+8801512345378',to_date('30-NOV-99','DD-MON-RR'),'Female','Islam','Bangladeshi','AB-','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (33,1,1,'Taaslima','Akter','Jakariya','Afreen','Khilgaon Dhaka','Khilgaon Dhaka',45000,to_date('04-MAY-20','DD-MON-RR'),199512,'taaslima.akter34@gmail.com','+880191234478',to_date('05-OCT-99','DD-MON-RR'),'Female','Islam','Bangladeshi','A-','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (34,1,1,'Rakib','Hossain','Zahid','Nurunnahar','Shahbagh Dhaka','Shahbagh Dhaka',20000,to_date('07-MAR-20','DD-MON-RR'),199612,'rakib.hossain3@gmail.com','+8801212345578',to_date('03-SEP-91','DD-MON-RR'),'Male','Islam','Bangladeshi','A+','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (35,2,2,'Saaima','Akter','Faruk','Tahmina','Malibagh Dhaka','Malibagh Dhaka',15000,to_date('15-NOV-22','DD-MON-RR'),199712,'saimaa.akter3@gmail.com','+880131245778',to_date('12-AUG-96','DD-MON-RR'),'Female','Islam','Bangladeshi','B-','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (36,2,2,'Nabila','Islam','Zahir','Afroza','Dhanmondi Dhaka','Dhanmondi Dhaka',50000,to_date('13-JAN-21','DD-MON-RR'),199812,'nabila.islam3@gmail.com','+880141234878',to_date('26-FEB-98','DD-MON-RR'),'Female','Islam','Bangladeshi','AB+','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (37,2,2,'Fahim','Molla','Eyakub','Sefali','Gulshan Dhaka','Gulshan Dhaka',5000,to_date('23-MAR-23','DD-MON-RR'),119192,'fahim.mollaa3@gmail.com','+880151234978',to_date('11-NOV-92','DD-MON-RR'),'Male','Islam','Bangladeshi','O-','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (38,2,2,'Sadia','Akter','Abdul','Rahima','Mirpur Dhaka','Mirpur Dhaka',50000,to_date('20-JAN-20','DD-MON-RR'),129212,'sadia.akter3@gmail.com','+8801712341678',to_date('19-FEB-01','DD-MON-RR'),'Female','Islam','Bangladeshi','B+','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (39,2,2,'Tasnim','Akter','Jamil','Karima','Shyamoli Dhaka','Shyamoli Dhaka',45000,to_date('13-MAR-21','DD-MON-RR'),139312,'tasnim.akter3@gmail.com','+8801812342678',to_date('11-APR-90','DD-MON-RR'),'Female','Islam','Bangladeshi','O+','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (40,3,3,'Nurul','Amin','Abdulla','Jaima','Jatrabari Dhaka','Jatrabari Dhaka',40000,to_date('23-FEB-20','DD-MON-RR'),149412,'nurul.amin3@gmail.com','+8801912343678',to_date('12-MAY-91','DD-MON-RR'),'Male','Islam','Bangladeshi','AB+','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (41,3,3,'Taslima','Akter','Arman','Shammi','Uttara Dhaka','Uttara Dhaka',35000,to_date('20-SEP-23','DD-MON-RR'),159512,'taslima.akter3@gmail.com','+8801612344678',to_date('19-JUN-95','DD-MON-RR'),'Female','Islam','Bangladeshi','A+','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (42,3,3,'Sakib','Hossain','Amir','Ramisa','Mohammadpur Dhaka','Mohammadpur Dhaka',30000,to_date('15-AUG-20','DD-MON-RR'),169612,'sakib.hossain3@gmail.com','+8801312346678',to_date('01-JAN-94','DD-MON-RR'),'Male','Islam','Bangladeshi','B-','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (43,3,3,'Sadiaa','Akter','Hamza','Kohinur','Badda Dhaka','Badda Dhaka',25000,to_date('10-JUL-23','DD-MON-RR'),179712,'sadiaa.akter3@gmail.com','+8801412347678',to_date('28-DEC-02','DD-MON-RR'),'Female','Islam','Bangladeshi','O-','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (44,3,3,'Taasnim','Akter','Sulaiman','Fahmida','Khilkhet Dhaka','Khilkhet Dhaka',20000,to_date('12-DEC-22','DD-MON-RR'),189812,'taasnim.akter3@gmail.com','+8801512348678',to_date('30-NOV-99','DD-MON-RR'),'Female','Islam','Bangladeshi','AB-','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (45,1,1,'Taaslima','Akter','Jakariya','Afreen','Khilgaon Dhaka','Khilgaon Dhaka',45000,to_date('04-MAY-20','DD-MON-RR'),199912,'taaslima.akter4@gmail.com','+880191239578',to_date('05-OCT-99','DD-MON-RR'),'Female','Islam','Bangladeshi','A-','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (46,1,1,'Rakib','Hossain','Zahid','Nurunnahar','Shahbagh Dhaka','Shahbagh Dhaka',20000,to_date('07-MAR-20','DD-MON-RR'),191112,'rakib.hossain4@gmail.com','+8801212315678',to_date('03-SEP-91','DD-MON-RR'),'Male','Islam','Bangladeshi','A+','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (47,1,1,'Saaima','Akter','Faruk','Tahmina','Malibagh Dhaka','Malibagh Dhaka',15000,to_date('15-NOV-22','DD-MON-RR'),192112,'saimaa.akter4@gmail.com','+880131225678',to_date('12-AUG-96','DD-MON-RR'),'Female','Islam','Bangladeshi','B-','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (48,2,2,'Nabila','Islam','Zahir','Afroza','Dhanmondi Dhaka','Dhanmondi Dhaka',50000,to_date('13-JAN-21','DD-MON-RR'),193112,'nabila.islam4@gmail.com','+880141244678',to_date('26-FEB-98','DD-MON-RR'),'Female','Islam','Bangladeshi','AB+','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (49,1,1,'Fahim','Molla','Eyakub','Sefali','Gulshan Dhaka','Gulshan Dhaka',5000,to_date('23-MAR-23','DD-MON-RR'),194112,'fahim.mollaa4@gmail.com','+880151254578',to_date('11-NOV-92','DD-MON-RR'),'Male','Islam','Bangladeshi','O-','SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (1,2,2,'Sadia','Akter','Abdul','Rahima','Mirpur Dhaka','Mirpur Dhaka',50000,to_date('20-JAN-20','DD-MON-RR'),1990123456789012,'sadia.akter@gmail.com','+8801712345678',to_date('19-FEB-01','DD-MON-RR'),'Female','Islam','Bangladeshi','B+','israt',to_date('29-NOV-23','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (2,3,1,'Tasnim','Akter','Jamil','Karima','Shyamoli Dhaka','Shyamoli Dhaka',45000,to_date('13-MAR-21','DD-MON-RR'),1991123456789012,'tasnim.akter@gmail.com','+8801812345678',to_date('11-APR-90','DD-MON-RR'),'Female','Islam','Bangladeshi','O+','SC_DDD56',to_date('29-NOV-23','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (3,3,3,'Nurul','Amin','Abdulla','Jaima','Jatrabari Dhaka','Jatrabari Dhaka',40000,to_date('23-FEB-20','DD-MON-RR'),1992123456789012,'nurul.amin@gmail.com','+8801912345678',to_date('12-MAY-91','DD-MON-RR'),'Male','Islam','Bangladeshi','AB+','SC_DDD56',to_date('29-NOV-23','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (4,2,2,'Taslima','Akter','Arman','Shammi','aaaaaaa',null,35000,to_date('20-SEP-23','DD-MON-RR'),1993123456789013,'taslima.akter@gmail.com','+8801612345678',to_date('19-JUN-95','DD-MON-RR'),'Female','Islam','Bangladeshi','A+','a',to_date('29-NOV-23','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (5,3,3,'Sakib','Hossain','Amir','Ramisa','Mohammadpur Dhaka','Mohammadpur Dhaka',30000,to_date('15-AUG-20','DD-MON-RR'),1994123456789012,'sakib.hossain@gmail.com','+8801312345678',to_date('01-JAN-94','DD-MON-RR'),'Male','Islam','Bangladeshi','B-','SC_DDD56',to_date('29-NOV-23','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (6,2,1,'Sadiaa','Akter','Hamza','Kohinur','Badda Dhaka','Badda Dhaka',25000,to_date('10-JUL-23','DD-MON-RR'),199513456789012,'sadiaa.akter@gmail.com','+8801412345678',to_date('28-DEC-02','DD-MON-RR'),'Female','Islam','Bangladeshi','O-','SC_DDD56',to_date('29-NOV-23','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (7,1,2,'Taasnim','Akter','Sulaiman','Fahmida','Khilkhet Dhaka','Khilkhet Dhaka',20000,to_date('12-DEC-22','DD-MON-RR'),199613456789012,'taasnim.akter@gmail.com','+8801512345678',to_date('30-NOV-99','DD-MON-RR'),'Female','Islam','Bangladeshi','AB-','SC_DDD56',to_date('29-NOV-23','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (8,3,3,'Taaslima','Akter','Jakariya','Afreen','Khilgaon Dhaka','Khilgaon Dhaka',45000,to_date('04-MAY-20','DD-MON-RR'),200112356789012,'taaslima.akter@gmail.com','+880191234578',to_date('05-OCT-99','DD-MON-RR'),'Female','Islam','Bangladeshi','A-','SC_DDD56',to_date('29-NOV-23','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (9,2,1,'Rakib','Hossain','Zahid','Nurunnahar','Shahbagh Dhaka','Shahbagh Dhaka',20000,to_date('07-MAR-20','DD-MON-RR'),1997123456789012,'rakib.hossain@gmail.com','+8801212345678',to_date('03-SEP-91','DD-MON-RR'),'Male','Islam','Non-Bangladeshi','A+',null,to_date('29-NOV-23','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (10,1,2,'Saaima','Akter','Faruk','Tahmina','Malibagh Dhaka','Malibagh Dhaka',15000,to_date('15-NOV-22','DD-MON-RR'),19981456789012,'saimaa.akter@gmail.com','+880131245678',to_date('12-AUG-96','DD-MON-RR'),'Female','Islam','Bangladeshi','B-','israt',to_date('29-NOV-23','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (11,2,3,'Nabila','Islam','Zahir','Afroza','Dhanmondi Dhaka','Dhanmondi Dhaka',50000,to_date('13-JAN-21','DD-MON-RR'),1999123456789012,'nabila.islam@gmail.com','+880141234678',to_date('26-FEB-98','DD-MON-RR'),'Female','Islam','Bangladeshi','AB+','SC_DDD56',to_date('29-NOV-23','DD-MON-RR'));
Insert into EMPLOYEE (EMPLOYEE_ID,DEPARTMENT_ID,DESIGNATION_ID,FIRST_NAME,LAST_NAME,FATHER_NAME,MOTHER_NAME,PRESENT_ADDRESS,PERMANENT_ADDRESS,SALARY,JOIN_DATE,NID,EMAIL,CELL_NUMBER,DATE_OF_BIRTH,GENDER,RELIGION,NATIONALITY,BLOOD_GROUP,ACTION_USER,ACTION_DATE_TIME) values (12,1,2,'Fahim','Molla','Eyakub','Sefali','Gulshan Dhaka','Gulshan Dhaka',5000,to_date('23-MAR-23','DD-MON-RR'),2000123456789012,'fahim.mollaa@gmail.com','+880151234578',to_date('11-NOV-92','DD-MON-RR'),'Male','Islam','Bangladeshi','O-','SC_DDD56',to_date('29-NOV-23','DD-MON-RR'));
end ;

-- exam_Category table

drop table exam_Category cascade constraints ;

create table exam_Category
(
 exam_Category_ID             number,
 exam_Category_name           varchar2(100)  constraint exam_Category_exam_Category_name_uk unique
                                             constraint exam_Category_exam_Category_name_nn not null,
 exam_category_description    varchar2(250),
 action_user                  varchar2(100)    default user,
 action_date_time             date            default sysdate
) ;

alter table exam_Category
add   constraint exam_Category_exam_Category_id_pk primary key (exam_Category_id) ;

begin
Insert into EXAM_CATEGORY (EXAM_CATEGORY_ID,EXAM_CATEGORY_NAME,EXAM_CATEGORY_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (1,'Half Yearly','This is Half Yearly Exam','a',to_date('05-DEC-23','DD-MON-RR'));
Insert into EXAM_CATEGORY (EXAM_CATEGORY_ID,EXAM_CATEGORY_NAME,EXAM_CATEGORY_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (2,'Yearly','This is Yearly Exam',null,to_date('05-DEC-23','DD-MON-RR'));
end ;

-- exam_type table

drop table exam_type cascade constraints ;

create table Exam_Type
(
 Exam_Type_ID          number,
 Exam_Type_name        varchar2(100) constraint exam_type_exam_type_name_uk unique
                                     constraint exam_type_exam_type_name_nn not null,
 exam_type_description varchar2(250),
 action_user           varchar2(100)    default user,
 action_date_time      date            default sysdate  
) ;

alter table Exam_Type
add   constraint Exam_Type_Exam_Type_id_pk primary key (Exam_Type_id) ;

begin
Insert into EXAM_TYPE (EXAM_TYPE_ID,EXAM_TYPE_NAME,EXAM_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (1,'Class test','This is Class test.','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into EXAM_TYPE (EXAM_TYPE_ID,EXAM_TYPE_NAME,EXAM_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (2,'Written','This is Written exam.','israt',to_date('19-JAN-24','DD-MON-RR'));
end ;

--class table

drop table class cascade constraints ;

create table class
(
 Class_ID          number,
 Class_Name        varchar2(100) constraint class_class_name_nn not null
                                 constraint class_class_name_uk unique,
 class_description varchar2(250),
 action_user       varchar2(100)    default user,
 action_date_time date            default sysdate
) ;

alter table class
add   constraint class_class_id_pk primary key(class_id) ;

begin 
Insert into CLASS (CLASS_ID,CLASS_NAME,CLASS_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (3,'Class 1','This is class One','SC_DDD56',to_date('12-FEB-24','DD-MON-RR'));
Insert into CLASS (CLASS_ID,CLASS_NAME,CLASS_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (1,'Class 5','This is class Five','a',to_date('03-DEC-23','DD-MON-RR'));
Insert into CLASS (CLASS_ID,CLASS_NAME,CLASS_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (2,'Class 6','This is class Six','a',to_date('03-DEC-23','DD-MON-RR'));
end ;

--section table

drop table section cascade constraints ;

create table section
(
 section_ID          number,
 section_Name        varchar2(100)   constraint section_section_name_nn not null
                                     constraint section_section_name_uk unique,
 section_description varchar2(250),
 action_user         varchar2(100)    default user,
 action_date_time    date            default sysdate
);


alter table section
add   constraint section_section_id_pk primary key(section_id) ;

begin
Insert into SECTION (SECTION_ID,SECTION_NAME,SECTION_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (1,'A','Section A','a',to_date('17-JAN-24','DD-MON-RR'));
Insert into SECTION (SECTION_ID,SECTION_NAME,SECTION_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (2,'B','Section B','a',to_date('17-JAN-24','DD-MON-RR'));
end ;

--subject table

drop table subject cascade constraints ;

create table subject
(
 subject_ID          number,
 subject_Name        varchar2(100)   constraint subject_subject_name_nn not null
                                     constraint subject_subject_name_uk unique,
 subject_description varchar2(250),
 action_user         varchar2(100)    default user,
 action_date_time    date            default sysdate
);


alter table subject
add   constraint subject_subject_id_pk primary key(subject_id) ;


begin
Insert into SUBJECT (SUBJECT_ID,SUBJECT_NAME,SUBJECT_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (4,'Bangla',null,null,to_date('14-JAN-24','DD-MON-RR'));
Insert into SUBJECT (SUBJECT_ID,SUBJECT_NAME,SUBJECT_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (1,'English',null,'SC_DDD56',to_date('14-JAN-24','DD-MON-RR'));
Insert into SUBJECT (SUBJECT_ID,SUBJECT_NAME,SUBJECT_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (2,'Math',null,'SC_DDD56',to_date('14-JAN-24','DD-MON-RR'));
Insert into SUBJECT (SUBJECT_ID,SUBJECT_NAME,SUBJECT_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (3,'Physics',null,'SC_DDD56',to_date('14-JAN-24','DD-MON-RR'));
Insert into SUBJECT (SUBJECT_ID,SUBJECT_NAME,SUBJECT_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (5,'Science',null,'SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
end ;

--class_info table

drop table class_info cascade constraint ;

create table class_info
(
class_info_id      number,
class_id           number,
subject_id           number CONSTRAINT class_info_subject_ID_NN Not null,
action_user          varchar2(100) default user,
action_date_time     date default sysdate
) ;
    
alter table class_info
add constraints  class_info_class_info_id_pk primary key(class_info_id) ;

alter table class_info
add constraints  class_info_class_id_fk foreign key(class_id)
references class(class_id) ;

alter table class_info
add constraints  class_info_subject_id_fk foreign key(subject_id)
references subject(subject_id) ;

ALTER TABLE class_info
ADD CONSTRAINT class_info_CLASS_ID_subject_ID_uk UNIQUE (class_id, subject_id);

begin
Insert into CLASS_INFO (CLASS_INFO_ID,CLASS_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (9,2,4,'a',to_date('18-FEB-24','DD-MON-RR'));
Insert into CLASS_INFO (CLASS_INFO_ID,CLASS_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (10,2,5,'a',to_date('18-FEB-24','DD-MON-RR'));
Insert into CLASS_INFO (CLASS_INFO_ID,CLASS_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (12,1,4,'a',to_date('18-FEB-24','DD-MON-RR'));
Insert into CLASS_INFO (CLASS_INFO_ID,CLASS_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (4,1,1,null,to_date('20-JAN-24','DD-MON-RR'));
Insert into CLASS_INFO (CLASS_INFO_ID,CLASS_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (5,1,3,null,to_date('20-JAN-24','DD-MON-RR'));
Insert into CLASS_INFO (CLASS_INFO_ID,CLASS_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (6,2,2,'a',to_date('06-FEB-24','DD-MON-RR'));
Insert into CLASS_INFO (CLASS_INFO_ID,CLASS_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (7,2,1,'a',to_date('06-FEB-24','DD-MON-RR'));
Insert into CLASS_INFO (CLASS_INFO_ID,CLASS_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (19,3,5,null,to_date('21-APR-24','DD-MON-RR'));
Insert into CLASS_INFO (CLASS_INFO_ID,CLASS_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (13,3,1,null,to_date('21-APR-24','DD-MON-RR'));
Insert into CLASS_INFO (CLASS_INFO_ID,CLASS_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (14,3,3,null,to_date('21-APR-24','DD-MON-RR'));
Insert into CLASS_INFO (CLASS_INFO_ID,CLASS_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (15,1,5,null,to_date('21-APR-24','DD-MON-RR'));
Insert into CLASS_INFO (CLASS_INFO_ID,CLASS_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (18,1,2,null,to_date('21-APR-24','DD-MON-RR'));
end ;

--class_d_Table

drop table class_D cascade constraints ;

create table Class_D
(
 Class_d_ID          Number,
 Detailed_Class_Name varchar2(100) constraint class_d_Detailed_Class_Name_uk unique
                                   constraint class_d_Detailed_Class_Name_nn not null ,
 Class_ID            Number,
 Section_id          Number,
 Subject_id          Number,
 Action_User         Varchar2(100) Default User,
 Action_Date_Time    Date Default Sysdate
) ;

alter table class_d
add constraint class_d_class_d_id_pk primary key(class_d_id) ;

alter table class_d
add  constraint class_d_class_id_fk foreign key(class_id)
references  class(class_id) ; 

alter table class_d
add  constraint class_d_section_id_fk foreign key(section_id)
references  section(section_id) ; 

alter table class_d
add  constraint class_d_subject_id_fk foreign key(subject_id)
references  subject(subject_id) ; 

begin
Insert into CLASS_D (CLASS_D_ID,DETAILED_CLASS_NAME,CLASS_ID,SECTION_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (3,'Class 5-A-Bangla',1,1,4,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into CLASS_D (CLASS_D_ID,DETAILED_CLASS_NAME,CLASS_ID,SECTION_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (4,'Class 6-B-Math',2,2,2,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into CLASS_D (CLASS_D_ID,DETAILED_CLASS_NAME,CLASS_ID,SECTION_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (5,'Class 6-B-English',2,2,1,'a',to_date('09-FEB-24','DD-MON-RR'));
Insert into CLASS_D (CLASS_D_ID,DETAILED_CLASS_NAME,CLASS_ID,SECTION_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (7,'Class 6-A-Bangla',2,1,4,'a',to_date('09-FEB-24','DD-MON-RR'));
Insert into CLASS_D (CLASS_D_ID,DETAILED_CLASS_NAME,CLASS_ID,SECTION_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (8,'Class 6-B-Bangla',2,2,4,'a',to_date('09-FEB-24','DD-MON-RR'));
Insert into CLASS_D (CLASS_D_ID,DETAILED_CLASS_NAME,CLASS_ID,SECTION_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (10,'Class 6-B-Science',2,2,5,'a',to_date('09-FEB-24','DD-MON-RR'));
Insert into CLASS_D (CLASS_D_ID,DETAILED_CLASS_NAME,CLASS_ID,SECTION_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (12,'Class 5-A-English',1,1,1,'a',to_date('09-FEB-24','DD-MON-RR'));
Insert into CLASS_D (CLASS_D_ID,DETAILED_CLASS_NAME,CLASS_ID,SECTION_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (13,'Class 5-A-Math',1,1,2,'a',to_date('09-FEB-24','DD-MON-RR'));
Insert into CLASS_D (CLASS_D_ID,DETAILED_CLASS_NAME,CLASS_ID,SECTION_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (14,'Class 5-A-Science',1,1,5,'a',to_date('09-FEB-24','DD-MON-RR'));
Insert into CLASS_D (CLASS_D_ID,DETAILED_CLASS_NAME,CLASS_ID,SECTION_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (15,'Class 5-B-Science',1,2,5,'a',to_date('09-FEB-24','DD-MON-RR'));
Insert into CLASS_D (CLASS_D_ID,DETAILED_CLASS_NAME,CLASS_ID,SECTION_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (6,'Class 5-B-English',1,2,1,'SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into CLASS_D (CLASS_D_ID,DETAILED_CLASS_NAME,CLASS_ID,SECTION_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (9,'Class 6-A-English',2,1,1,'SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into CLASS_D (CLASS_D_ID,DETAILED_CLASS_NAME,CLASS_ID,SECTION_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (11,'Class 6-A-Math',2,1,2,'SC_DDD56',to_date('09-FEB-24','DD-MON-RR'));
Insert into CLASS_D (CLASS_D_ID,DETAILED_CLASS_NAME,CLASS_ID,SECTION_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (1,'Class 5-B-Physics',1,2,3,'a',to_date('17-JAN-24','DD-MON-RR'));
Insert into CLASS_D (CLASS_D_ID,DETAILED_CLASS_NAME,CLASS_ID,SECTION_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (2,'Class 6-A-Science',2,1,5,'a',to_date('17-JAN-24','DD-MON-RR'));
Insert into CLASS_D (CLASS_D_ID,DETAILED_CLASS_NAME,CLASS_ID,SECTION_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (18,'Class 5-A-Physics',1,1,3,'A',to_date('21-APR-24','DD-MON-RR'));
Insert into CLASS_D (CLASS_D_ID,DETAILED_CLASS_NAME,CLASS_ID,SECTION_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (19,'Class 1-B-Physics',3,2,3,'A',to_date('21-APR-24','DD-MON-RR'));
Insert into CLASS_D (CLASS_D_ID,DETAILED_CLASS_NAME,CLASS_ID,SECTION_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (17,'Class 5-B-Bangla',1,2,4,'A',to_date('21-APR-24','DD-MON-RR'));
end ;


--fee_type table

drop table fee_type cascade constraints ;

create table Fee_Type
(
 Fee_Type_ID          number,
 Fee_type_name        varchar2(100)   constraint fee_type_fee_type_name_nn not null
                                      constraint fee_type_fee_type_name_uk unique,
 fee_type_description varchar2(250),
 action_user          varchar2(100)    default user,
 action_date_time     date            default sysdate
) ;

alter table fee_type
add   constraint fee_type_fee_type_id_pk primary key(fee_type_id) ;

begin
Insert into FEE_TYPE (FEE_TYPE_ID,FEE_TYPE_NAME,FEE_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (1,'Admission','This is Admission fee.','israt',to_date('05-DEC-23','DD-MON-RR'));
Insert into FEE_TYPE (FEE_TYPE_ID,FEE_TYPE_NAME,FEE_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (3,'Yearly Exam','This is Yearly Exam fee.','SC_DDD56',to_date('05-DEC-23','DD-MON-RR'));
Insert into FEE_TYPE (FEE_TYPE_ID,FEE_TYPE_NAME,FEE_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (2,'Half Yearly Exam','This is Half Yearly Exam fee.','SC_DDD56',to_date('26-FEB-24','DD-MON-RR'));
Insert into FEE_TYPE (FEE_TYPE_ID,FEE_TYPE_NAME,FEE_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (4,'January',null,'SC_DDD56A',to_date('20-MAR-24','DD-MON-RR'));
Insert into FEE_TYPE (FEE_TYPE_ID,FEE_TYPE_NAME,FEE_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (5,'February',null,'SC_DDD56A',to_date('20-MAR-24','DD-MON-RR'));
Insert into FEE_TYPE (FEE_TYPE_ID,FEE_TYPE_NAME,FEE_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (6,'March',null,'SC_DDD56A',to_date('20-MAR-24','DD-MON-RR'));
Insert into FEE_TYPE (FEE_TYPE_ID,FEE_TYPE_NAME,FEE_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (7,'April',null,'SC_DDD56A',to_date('20-MAR-24','DD-MON-RR'));
Insert into FEE_TYPE (FEE_TYPE_ID,FEE_TYPE_NAME,FEE_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (8,'May',null,'SC_DDD56A',to_date('20-MAR-24','DD-MON-RR'));
Insert into FEE_TYPE (FEE_TYPE_ID,FEE_TYPE_NAME,FEE_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (9,'June',null,'SC_DDD56A',to_date('20-MAR-24','DD-MON-RR'));
Insert into FEE_TYPE (FEE_TYPE_ID,FEE_TYPE_NAME,FEE_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (10,'July',null,'SC_DDD56A',to_date('20-MAR-24','DD-MON-RR'));
Insert into FEE_TYPE (FEE_TYPE_ID,FEE_TYPE_NAME,FEE_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (11,'August',null,'SC_DDD56A',to_date('20-MAR-24','DD-MON-RR'));
Insert into FEE_TYPE (FEE_TYPE_ID,FEE_TYPE_NAME,FEE_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (12,'September',null,'SC_DDD56A',to_date('20-MAR-24','DD-MON-RR'));
Insert into FEE_TYPE (FEE_TYPE_ID,FEE_TYPE_NAME,FEE_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (13,'October',null,'SC_DDD56A',to_date('20-MAR-24','DD-MON-RR'));
Insert into FEE_TYPE (FEE_TYPE_ID,FEE_TYPE_NAME,FEE_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (14,'November',null,'SC_DDD56A',to_date('20-MAR-24','DD-MON-RR'));
Insert into FEE_TYPE (FEE_TYPE_ID,FEE_TYPE_NAME,FEE_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (15,'December',null,'SC_DDD56A',to_date('20-MAR-24','DD-MON-RR'));
Insert into FEE_TYPE (FEE_TYPE_ID,FEE_TYPE_NAME,FEE_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (16,'Library Fee',null,'SC_DDD56A',to_date('20-MAR-24','DD-MON-RR'));
Insert into FEE_TYPE (FEE_TYPE_ID,FEE_TYPE_NAME,FEE_TYPE_DESCRIPTION,ACTION_USER,ACTION_DATE_TIME) values (17,'Lab Fee',null,'SC_DDD56A',to_date('20-MAR-24','DD-MON-RR'));
end ;

--fee_amount Table

drop table fee_amount cascade constraint ;

create table fee_amount 
(
 Fee_Amount_Id    Number,
 Fee_Type_ID      Number,
 Class_ID         Number,
 Fee_Amount       Number,
 Action_User      Varchar2(100) Default User,
 Action_Date_Time Date          Default Sysdate
) ;

alter table fee_amount
add   constraint fee_amount_fee_amount_id_pk primary key(fee_amount_id) ;

alter table fee_amount
add   constraint fee_amount_fee_type_id_fk foreign key (fee_type_id)
references fee_type(fee_type_id) ;

alter table fee_amount
add   constraint fee_amount_class_id_fk foreign key (class_id)
references class(class_id) ;

begin
Insert into FEE_AMOUNT (FEE_AMOUNT_ID,FEE_TYPE_ID,CLASS_ID,FEE_NAME,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME) values (1,1,2,'Admission',5000,null,to_date('14-JAN-24','DD-MON-RR'));
Insert into FEE_AMOUNT (FEE_AMOUNT_ID,FEE_TYPE_ID,CLASS_ID,FEE_NAME,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME) values (4,1,2,'Library Fee',1900,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into FEE_AMOUNT (FEE_AMOUNT_ID,FEE_TYPE_ID,CLASS_ID,FEE_NAME,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME) values (2,1,1,'Admission',4500,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into FEE_AMOUNT (FEE_AMOUNT_ID,FEE_TYPE_ID,CLASS_ID,FEE_NAME,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME) values (3,1,1,'Library fee',1800,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into FEE_AMOUNT (FEE_AMOUNT_ID,FEE_TYPE_ID,CLASS_ID,FEE_NAME,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME) values (5,2,1,'School Fees',1500,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into FEE_AMOUNT (FEE_AMOUNT_ID,FEE_TYPE_ID,CLASS_ID,FEE_NAME,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME) values (6,2,2,'School Fees',2000,'a',to_date('19-JAN-24','DD-MON-RR'));
Insert into FEE_AMOUNT (FEE_AMOUNT_ID,FEE_TYPE_ID,CLASS_ID,FEE_NAME,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME) values (7,3,1,'Exam Fees',500,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into FEE_AMOUNT (FEE_AMOUNT_ID,FEE_TYPE_ID,CLASS_ID,FEE_NAME,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME) values (8,3,2,'Exam Fees',500,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into FEE_AMOUNT (FEE_AMOUNT_ID,FEE_TYPE_ID,CLASS_ID,FEE_NAME,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME) values (9,1,1,'Lab Fees',500,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into FEE_AMOUNT (FEE_AMOUNT_ID,FEE_TYPE_ID,CLASS_ID,FEE_NAME,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME) values (10,1,2,'Lab Fees',500,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into FEE_AMOUNT (FEE_AMOUNT_ID,FEE_TYPE_ID,CLASS_ID,FEE_NAME,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME) values (11,null,1,'Admission Form',800,'l',to_date('03-MAR-24','DD-MON-RR'));
Insert into FEE_AMOUNT (FEE_AMOUNT_ID,FEE_TYPE_ID,CLASS_ID,FEE_NAME,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME) values (12,null,2,'Admission Form',900,'l',to_date('03-MAR-24','DD-MON-RR'));
end ;

--Student Table

drop table student cascade constraint ;

create table student
(
student_id             number,
first_name             varchar2(100)  constraint student_first_name_nn not null,
last_name              varchar2(100),
date_of_birth          date,
gender                 varchar2(100),
religion               varchar2(100),
blood_group            varchar2(5),
Birth_reg_number       number         constraint student_Birth_reg_number_uk unique,
fathers_name           varchar2(100),
Fathers_Signature      blob,
Fathers_Cell_Number    varchar2(100),
mothers_name           varchar2(100),
mothers_Signature      blob,
mothers_Cell_Number    varchar2(100),
Guardians_Name         Varchar2(100),
Guardians_Signature    BLOB,
Guardians_Cell_Number  varchar2(100),
Relation_with_Guardian Varchar2(100),
class_id                number,
section_id              number,
roll_number             number,
previous_class          number,
previous_school         varchar2(250),
present_address         varchar2(350),
permanent_address       varchar2(350),
student_image           blob,
admission_date          date default sysdate,
action_user          varchar2(100) default user,
action_date_time     date          default sysdate
) ;


alter table student
add constraint student_student_id_pk primary key(student_id) ;

alter table student 
add  constraint student_class_id_fk foreign key(class_id)
references  class(class_id) ; 

alter table student 
add  constraint student_section_id_fk foreign key(section_id)
references  section(section_id) ; 

begin
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (78,'AHMED','SHARIF',to_date('20-DEC-98','DD-MON-RR'),'Male','Islam','A-',1122222222222,'aa','11','ss','22','qq','33','ww',1,1,1,null,null,'sssss','aaa',to_date('16-JAN-24','DD-MON-RR'),'a',to_date('16-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (79,'ABUL','HASAN',to_date('10-OCT-00','DD-MON-RR'),null,'Hinduism','AB-',22222222,'SHIFUL','01234567891','SAPLA','01236547891',null,null,'son',1,1,2,null,null,'aaa','AAA',to_date('16-JAN-24','DD-MON-RR'),'a',to_date('16-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (13,'AKASHA','islam',null,null,null,null,12222,null,null,null,null,null,null,null,2,2,1,null,null,null,null,null,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (15,'FARIA','jahyan',null,null,null,null,1111111111111,null,null,null,null,null,null,null,2,1,3,null,null,null,null,null,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (16,'ISLAM','HOSSAIN',null,null,null,null,1233342,null,null,null,null,null,null,null,2,2,13,null,null,null,null,null,'a',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (20,'RAFIA','binte islam',null,null,'Others',null,11111,null,null,null,null,null,null,null,1,1,3,null,null,null,null,null,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (21,'RAFIA','JAHAN',to_date('10-FEB-08','DD-MON-RR'),null,'Islam','O+',210363592,'MD SOHEL','01963807841','KONOK ISLAM','01947283532165',null,null,null,2,2,4,5,'dhaka','dhaka','dhaka',to_date('13-JAN-24','DD-MON-RR'),'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (22,'JANNAT','ISLAM',to_date('06-JUL-08','DD-MON-RR'),'Female','Hinduism','B+',4785896,null,null,null,null,null,null,null,1,2,4,null,null,'ghulshan','ghulshan',to_date('16-DEC-24','DD-MON-RR'),'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (23,'NAJMUL','SHARIF',to_date('19-JAN-00','DD-MON-RR'),'Male','Islam','A-',57416465,'SHIHAB SHARIF','01111111111',null,null,null,null,null,2,1,4,null,null,'Dhaka','Gopalgonj',to_date('20-JAN-23','DD-MON-RR'),'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (80,'Fariya','Jannat',to_date('27-SEP-18','DD-MON-RR'),'Female','Islam','AB+',252,'SHIFUL','01956987455','SALMA  AKHTER','01236547894',null,null,'s0n',2,2,1,null,null,'Dhaka','Norshingdhi',to_date('19-JAN-24','DD-MON-RR'),'a',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (81,'Imran','hossain',to_date('02-SEP-18','DD-MON-RR'),'Male','Islam','B-',78952,'SOHID ISLAM','78945612301','NAIMA ISLAM','12365498701',null,null,'son',2,2,2,null,null,'Dhaka','Nilphamari',to_date('19-JAN-24','DD-MON-RR'),'a',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (82,'Bakr','Islam',to_date('18-JUN-17','DD-MON-RR'),'Male','Hinduism','A-',12365,'NAHIYAN JAMAN','98745632102','SUMI JAHAN','01236547890',null,null,'son',1,1,3,null,null,'Dhaka','Mridha bari',to_date('19-JAN-24','DD-MON-RR'),'a',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (83,'Hasnain','Sordar',to_date('18-FEB-16','DD-MON-RR'),'Male','Islam','B+',7984,'RAHI JAMAN','01236547893','SAYMA JAMAN','78965412301',null,null,'son',2,2,3,null,null,'Dhaka','Jungle bari',to_date('19-JAN-24','DD-MON-RR'),'a',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (84,'Asma','Begum',to_date('01-FEB-17','DD-MON-RR'),'Female','Christianism','A-',632145,'MAHIR ISLAM','01233654879','RAFISA ISLAM','01236547891',null,null,'Giirl',1,1,1,null,null,'Dhaka','Puran dhaka',to_date('19-JAN-24','DD-MON-RR'),'a',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (85,'Rakib','Islam',to_date('01-FEB-14','DD-MON-RR'),'Male','Buddhism','A-',6789,'FIHA ISLAM','01236547890','LUBNA JAMAN','78965412301',null,null,'son',1,1,2,null,null,'Dhaka','Chadpur',to_date('19-JAN-24','DD-MON-RR'),'a',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (86,'Sadbin','Rahman',to_date('27-SEP-14','DD-MON-RR'),'Male','Christianism','O-',51219,'MANIK MIAH','96325874101','DILARA ISLAM','01478523698',null,null,'son',1,2,1,null,null,'Dhaka','Dhaka',to_date('19-JAN-24','DD-MON-RR'),'a',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (10,'Sara','Begum',to_date('04-JUL-18','DD-MON-RR'),'Female','Islam','O-',31025,'ABID ISLAM','14785236901','RIFA   JAHAN','96325874101',null,null,'Girl',1,1,7,null,null,'Dhaka','Dhaka',to_date('19-JAN-24','DD-MON-RR'),'a',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (11,'Sakib','Chowdury',null,null,null,null,271829,null,null,null,null,null,null,null,1,1,8,null,null,null,'Dhaka',to_date('19-JAN-24','DD-MON-RR'),'a',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (12,'Safin','Islam',to_date('27-FEB-18','DD-MON-RR'),'Male','Islam','A-',30162125,null,null,null,null,null,null,null,2,1,2,null,null,null,'Dhaka',to_date('19-JAN-24','DD-MON-RR'),'a',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (17,'Ayman','Sadik',null,null,null,null,3519654,null,null,null,null,null,null,null,2,1,1,null,null,null,null,to_date('19-JAN-24','DD-MON-RR'),'SC_DDD56',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (18,'Raisa','Islam',null,null,null,null,178945,null,null,null,null,null,null,null,2,1,2,null,null,null,null,to_date('19-JAN-24','DD-MON-RR'),'SC_DDD56',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (19,'Tabassum','Sara',null,null,null,null,3569874,null,null,null,null,null,null,null,2,1,3,null,null,null,null,to_date('19-JAN-24','DD-MON-RR'),'SC_DDD56',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (27,'SUMAIYA','AKTER',to_date('08-DEC-99','DD-MON-RR'),'Female','Islam','A+',44204204,null,null,null,null,null,null,null,2,2,4,null,null,null,null,null,'a',to_date('29-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (87,'Sara','Begum',to_date('04-JUL-18','DD-MON-RR'),'Female','Islam','O-',1420420,'ABID ISLAM','14785236901','RIFA   JAHAN','96325874101',null,null,'Girl',1,1,45,null,null,'Dhaka','Dhaka',to_date('19-JAN-24','DD-MON-RR'),'a',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (24,'BAYEJID','Sharif',null,null,null,null,780550,null,null,null,null,null,null,null,1,2,1,null,null,null,null,to_date('19-JAN-24','DD-MON-RR'),'a',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (25,'jobayer','Sharif',null,null,null,null,32145687,null,null,null,null,null,null,null,1,2,2,null,null,null,null,to_date('19-JAN-24','DD-MON-RR'),'SC_DDD56',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (26,'mahir','Islam',null,null,null,null,1254896370,null,null,null,null,null,null,null,1,2,3,null,null,null,null,to_date('19-JAN-24','DD-MON-RR'),'SC_DDD56',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (28,'NURJAHAN','AKTER',to_date('02-FEB-11','DD-MON-RR'),'female',null,null,123456,'TOFAZZAL HOSSAIN','1852041621','BILKIS BEGUM',null,'TOFFAZZAL HOSSAIN',null,'Daughter',1,1,4,null,null,'Dhaka,Mirpur1',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (29,'MARIAM','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,23456,'POLASH AHMED','1852041622','ROKEYA AKTER',null,'POLASH AHMED',null,'Daughter',1,1,5,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (30,'AFIA','KHATUN',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,223456,'Mohammad Ali Khan','1852041623','Fatima Begum',null,'Mohammad Ali Khan',null,'Daughter',1,1,6,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (31,'RABIA','KHATUN',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,323456,'Abdul Rahman Ahmed','1852041624','Ayesha Khan',null,'Abdul Rahman Ahmed',null,'Daughter',2,2,7,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (32,'TAMMANNA','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,423156,'Hossain Khan Islam','1852041625','Khadija Islam',null,'Hossain Khan Islam',null,'Daughter',2,2,8,null,null,'Dhaka,Harmony Street',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (33,'ABU','BAKKAR',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,523256,'Abdul Uddin Chowdhury','1852041626','Nasima Chowdhury',null,'Abdul Uddin Chowdhury',null,'Son',2,2,9,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (34,'ISMAIL','TASWAR',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,623356,'Hasan Karim','1852041627','Rahima Karim',null,'Hasan Karim',null,'Son',2,1,10,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (35,'HASNAIEN','HOSSAIN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,723456,'Farooq Aziz Miah','1852041628','Farida Jamal',null,'Farooq Aziz Miah',null,'Son',1,1,11,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (36,'NAJIUR','RAHMAN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,823456,'Abdullah Rahman Haque','1852041629','Yasmin Haque',null,'Abdullah Rahman Haque',null,'Son',1,1,12,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (37,'IMRAN','HOSSAIN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,923456,'Nurul Islam Chowdhury','1852041639','Shamima Akhtar',null,'Nurul Islam Chowdhury',null,'Son',1,1,13,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (38,'ABDUL','RAYHAN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,653156,'Shahidul Haque Miah','1852041649','Afroza Chowdhury',null,'Shahidul Haque Miah',null,'Son',2,2,14,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (39,'FARUK','HOSSAIN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,664456,'Arif Miah Farooq','1852041659','Selina Miah',null,'Arif Miah Farooq',null,'Son',2,2,15,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (40,'TRISHA RANI','KURI',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,643456,'Azizur Rahman Islam','1852041669','Sultana Akhtar',null,'Azizur Rahman Islam',null,'Daughter',2,2,16,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (41,'MOMO','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,653456,'Ismail Rahman','1852041679','Razia Rahman',null,'Ismail Rahman',null,'Daughter',2,2,17,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (42,'SETU','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,623556,'Mohammad Khan','1852041689','Shahnaz Begum',null,'Mohammad Khan',null,'Daughter',1,2,18,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (43,'RAJIYA','SULTANA',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,623656,'Bakkar Khan','1852041789','Rokeya Akter',null,'Bakkar Khan',null,'Daughter',1,2,19,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (44,'NURJAHAN','AKTER',to_date('02-FEB-11','DD-MON-RR'),'female',null,null,623756,'TOFAZZAL HOSSAIN','1852041621','BILKIS BEGUM',null,'TOFFAZZAL HOSSAIN',null,'Daughter',1,2,20,null,null,'Dhaka,Mirpur1',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (45,'MARIAM','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,623856,'POLASH AHMED','1852041622','ROKEYA AKTER',null,'POLASH AHMED',null,'Daughter',1,2,21,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (46,'AFIA','KHATUN',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,623956,'Mohammad Ali Khan','1852041623','Fatima Begum',null,'Mohammad Ali Khan',null,'Daughter',1,1,22,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (47,'RABIA','KHATUN',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,621456,'Abdul Rahman Ahmed','1852041624','Ayesha Khan',null,'Abdul Rahman Ahmed',null,'Daughter',2,1,23,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (48,'TAMMANNA','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,6235560,'Hossain Khan Islam','1852041625','Khadija Islam',null,'Hossain Khan Islam',null,'Daughter',2,1,24,null,null,'Dhaka,Harmony Street',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (49,'ABU','BAKKAR',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,6236561,'Abdul Uddin Chowdhury','1852041626','Nasima Chowdhury',null,'Abdul Uddin Chowdhury',null,'Son',2,1,25,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (50,'ISMAIL','TASWAR',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,6234562,'Hasan Karim','1852041627','Rahima Karim',null,'Hasan Karim',null,'Son',2,1,26,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (51,'HASNAIEN','HOSSAIN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,6234563,'Farooq Aziz Miah','1852041628','Farida Jamal',null,'Farooq Aziz Miah',null,'Son',1,2,27,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (52,'NAJIUR','RAHMAN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,6234564,'Abdullah Rahman Haque','1852041629','Yasmin Haque',null,'Abdullah Rahman Haque',null,'Son',1,1,28,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (53,'IMRAN','HOSSAIN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,6234565,'Nurul Islam Chowdhury','1852041639','Shamima Akhtar',null,'Nurul Islam Chowdhury',null,'Son',1,1,29,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (54,'ABDUL','RAYHAN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,6234566,'Shahidul Haque Miah','1852041649','Afroza Chowdhury',null,'Shahidul Haque Miah',null,'Son',2,1,30,null,null,'Dhaka',null,to_date('07-FEB-21','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (55,'FARUK','HOSSAIN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,6234567,'Arif Miah Farooq','1852041659','Selina Miah',null,'Arif Miah Farooq',null,'Son',2,1,31,null,null,'Dhaka',null,to_date('07-FEB-21','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (56,'TRISHA RANI','KURI',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,6234568,'Azizur Rahman Islam','1852041669','Sultana Akhtar',null,'Azizur Rahman Islam',null,'Daughter',2,1,32,null,null,'Dhaka',null,to_date('07-FEB-21','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (57,'MOMO','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,6234569,'Ismail Rahman','1852041679','Razia Rahman',null,'Ismail Rahman',null,'Daughter',1,1,33,null,null,'Dhaka',null,to_date('07-FEB-21','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (58,'SETU','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,62345,'Mohammad Khan','1852041689','Shahnaz Begum',null,'Mohammad Khan',null,'Daughter',1,1,34,null,null,'Dhaka',null,to_date('07-FEB-21','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (59,'RAJIYA','SULTANA',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,62341,'Bakkar Khan','1852041789','Rokeya Akter',null,'Bakkar Khan',null,'Daughter',1,1,35,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (60,'RAJIYA','SULTANA',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,62045,'Bakkar Khan','1852041789','Rokeya Akter',null,'Bakkar Khan',null,'Daughter',1,1,36,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (61,'NURJAHAN','AKTER',to_date('02-FEB-11','DD-MON-RR'),'female',null,null,62145,'TOFAZZAL HOSSAIN','1852041621','BILKIS BEGUM',null,'TOFFAZZAL HOSSAIN',null,'Daughter',1,1,37,null,null,'Dhaka,Mirpur1',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (62,'MARIAM','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,62245,'POLASH AHMED','1852041622','ROKEYA AKTER',null,'POLASH AHMED',null,'Daughter',1,1,38,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (63,'AFIA','KHATUN',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,61345,'Mohammad Ali Khan','1852041623','Fatima Begum',null,'Mohammad Ali Khan',null,'Daughter',1,2,39,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (64,'RABIA','KHATUN',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,62445,'Abdul Rahman Ahmed','1852041624','Ayesha Khan',null,'Abdul Rahman Ahmed',null,'Daughter',2,2,40,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (65,'TAMMANNA','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,62545,'Hossain Khan Islam','1852041625','Khadija Islam',null,'Hossain Khan Islam',null,'Daughter',2,2,41,null,null,'Dhaka,Harmony Street',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (66,'ABU','BAKKAR',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,62645,'Abdul Uddin Chowdhury','1852041626','Nasima Chowdhury',null,'Abdul Uddin Chowdhury',null,'Son',2,2,42,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (67,'ISMAIL','TASWAR',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,62745,'Hasan Karim','1852041627','Rahima Karim',null,'Hasan Karim',null,'Son',2,2,43,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (68,'HASNAIEN','HOSSAIN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,62845,'Farooq Aziz Miah','1852041628','Farida Jamal',null,'Farooq Aziz Miah',null,'Son',1,2,11,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (69,'NAJIUR','RAHMAN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,62945,'Abdullah Rahman Haque','1852041629','Yasmin Haque',null,'Abdullah Rahman Haque',null,'Son',1,2,12,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (70,'IMRAN','HOSSAIN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,6214500,'Nurul Islam Chowdhury','1852041639','Shamima Akhtar',null,'Nurul Islam Chowdhury',null,'Son',1,2,13,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (14,'Ashik','Islam',null,null,null,null,654789123,null,null,null,null,null,null,null,2,2,2,null,null,null,null,null,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (71,'ABDUL','RAYHAN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,6214501,'Shahidul Haque Miah','1852041649','Afroza Chowdhury',null,'Shahidul Haque Miah',null,'Son',2,2,14,null,null,'Dhaka',null,to_date('07-FEB-21','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (72,'FARUK','HOSSAIN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,6214502,'Arif Miah Farooq','1852041659','Selina Miah',null,'Arif Miah Farooq',null,'Son',2,2,15,null,null,'Dhaka',null,to_date('07-FEB-21','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (73,'TRISHA RANI','KURI',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,6214503,'Azizur Rahman Islam','1852041669','Sultana Akhtar',null,'Azizur Rahman Islam',null,'Daughter',2,2,16,null,null,'Dhaka',null,to_date('07-FEB-21','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (74,'MOMO','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,6214504,'Ismail Rahman','1852041679','Razia Rahman',null,'Ismail Rahman',null,'Daughter',1,2,17,null,null,'Dhaka',null,to_date('07-FEB-21','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (75,'SETU','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,6214505,'Mohammad Khan','1852041689','Shahnaz Begum',null,'Mohammad Khan',null,'Daughter',1,1,18,null,null,'Dhaka',null,to_date('07-FEB-21','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (76,'RAJIYA','SULTANA',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,6214506,'Bakkar Khan','1852041789','Rokeya Akter',null,'Bakkar Khan',null,'Daughter',1,1,19,null,null,'Dhaka',null,to_date('07-FEB-21','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into STUDENT (STUDENT_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,SECTION_ID,ROLL_NUMBER,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (77,'AFIA','FAHMIDA',to_date('02-MAR-17','DD-MON-RR'),'female',null,null,6214507,'Md Rasel','1852041789','Nury Akter',null,'Md Rasel',null,'Daughter',1,1,21,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
end ;


--Admission Table

drop table Admission cascade constraint ;

create table Admission
(
Admission_id             number,
first_name             varchar2(100)  constraint Admission_first_name_nn not null,
last_name              varchar2(100),
date_of_birth          date,
gender                 varchar2(100),
religion               varchar2(100),
blood_group            varchar2(5),
Birth_reg_number       number         constraint Admission_Birth_reg_number_uk unique,
fathers_name           varchar2(100),
Fathers_Signature      blob,
Fathers_Cell_Number    varchar2(100),
mothers_name           varchar2(100),
mothers_Signature      blob,
mothers_Cell_Number    varchar2(100),
Guardians_Name         Varchar2(100),
Guardians_Signature    BLOB,
Guardians_Cell_Number  varchar2(100),
Relation_with_Guardian Varchar2(100),
class_id                number,
previous_class          number,
previous_school         varchar2(250),
present_address         varchar2(350),
permanent_address       varchar2(350),
student_image           blob,
admission_date          date default sysdate,
action_user          varchar2(100) default user,
action_date_time     date          default sysdate
) ;


alter table Admission
add constraint Admission_Admission_id_pk primary key(Admission_id) ;

alter table Admission
add  constraint Admission_class_id_fk foreign key(class_id)
references  class(class_id) ; 

begin
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (6,'NURJAHAN','AKTER',to_date('02-FEB-11','DD-MON-RR'),'female','Islam','A+',2345678990,'TOFAZZAL HOSSAIN','1852041621','BILKIS BEGUM','01257945215','TOFFAZZAL HOSSAIN',null,'Daughter',1,null,null,'Dhaka,Mirpur1','Ghulshan',to_date('07-FEB-23','DD-MON-RR'),'a',to_date('07-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (7,'MARIAM','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female','Others','AB+',2355678990,'POLASH AHMED','1852041622','ROKEYA AKTER','01524487946','POLASH AHMED',null,'Daughter',1,4,null,'Dhaka','Katamari',to_date('07-FEB-23','DD-MON-RR'),'a',to_date('07-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (8,'AFIA','KHATUN',to_date('02-MAR-18','DD-MON-RR'),'female','Christianism','A+',2365678990,'Mohammad Ali Khan','1852041623','Fatima Begum','01254619164','Mohammad Ali Khan',null,'Daughter',1,4,null,'Dhaka','Dhaka',to_date('07-FEB-23','DD-MON-RR'),'a',to_date('07-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (9,'RABIA','KHATUN',to_date('02-MAR-18','DD-MON-RR'),'Male','Islam','A-',2375678990,'Abdul Rahman Ahmed','1852041624','Ayesha Khan','01254846167','Abdul Rahman Ahmed',null,'Daughter',2,5,null,'Dhaka','Malibagh',to_date('07-FEB-23','DD-MON-RR'),'a',to_date('07-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (10,'TAMMANNA','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female','Others','A-',2385678990,'Hossain Khan Islam','1852041625','Khadija Islam','01965546137','Hossain Khan Islam',null,'Daughter',2,5,null,'Dhaka,Harmony Street','Syllet',to_date('07-FEB-23','DD-MON-RR'),'a',to_date('07-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (11,'ABU','BAKKAR',to_date('02-MAR-18','DD-MON-RR'),'Male','Islam','A+',2395678990,'Abdul Uddin Chowdhury','1852041626','Nasima Chowdhury','01236547896','Abdul Uddin Chowdhury',null,'Son',2,5,null,'Dhaka','Ghulshan',to_date('07-FEB-23','DD-MON-RR'),'a',to_date('07-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (12,'ISMAIL','TASWAR',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,2495678990,'Hasan Karim','1852041627','Rahima Karim',null,'Hasan Karim',null,'Son',2,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('07-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (13,'HASNAIEN','HOSSAIN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,2595678990,'Farooq Aziz Miah','1852041628','Farida Jamal',null,'Farooq Aziz Miah',null,'Son',1,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('07-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (14,'NAJIUR','RAHMAN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,2695678990,'Abdullah Rahman Haque','1852041629','Yasmin Haque',null,'Abdullah Rahman Haque',null,'Son',1,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('07-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (15,'IMRAN','HOSSAIN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,2795678990,'Nurul Islam Chowdhury','1852041639','Shamima Akhtar',null,'Nurul Islam Chowdhury',null,'Son',1,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('07-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (16,'ABDUL','RAYHAN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,2895678990,'Shahidul Haque Miah','1852041649','Afroza Chowdhury',null,'Shahidul Haque Miah',null,'Son',2,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('07-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (17,'FARUK','HOSSAIN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,2995678990,'Arif Miah Farooq','1852041659','Selina Miah',null,'Arif Miah Farooq',null,'Son',2,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('07-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (18,'TRISHA RANI','KURI',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,3995678990,'Azizur Rahman Islam','1852041669','Sultana Akhtar',null,'Azizur Rahman Islam',null,'Daughter',2,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('07-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (19,'MOMO','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,4995678990,'Ismail Rahman','1852041679','Razia Rahman',null,'Ismail Rahman',null,'Daughter',1,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('07-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (20,'SETU','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,5995678990,'Mohammad Khan','1852041689','Shahnaz Begum',null,'Mohammad Khan',null,'Daughter',1,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('07-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (21,'RAJIYA','SULTANA',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,6995678990,'Bakkar Khan','1852041789','Rokeya Akter',null,'Bakkar Khan',null,'Daughter',1,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('07-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (22,'NURJAHAN','AKTER',to_date('02-FEB-11','DD-MON-RR'),'female',null,null,3345678990,'TOFAZZAL HOSSAIN','1852041621','BILKIS BEGUM',null,'TOFFAZZAL HOSSAIN',null,'Daughter',1,null,null,'Dhaka,Mirpur1',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (23,'MARIAM','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,4355678990,'POLASH AHMED','1852041622','ROKEYA AKTER',null,'POLASH AHMED',null,'Daughter',1,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (24,'AFIA','KHATUN',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,5365678990,'Mohammad Ali Khan','1852041623','Fatima Begum',null,'Mohammad Ali Khan',null,'Daughter',1,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (25,'RABIA','KHATUN',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,6375678990,'Abdul Rahman Ahmed','1852041624','Ayesha Khan',null,'Abdul Rahman Ahmed',null,'Daughter',2,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (26,'TAMMANNA','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,7385678990,'Hossain Khan Islam','1852041625','Khadija Islam',null,'Hossain Khan Islam',null,'Daughter',2,null,null,'Dhaka,Harmony Street',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (27,'ABU','BAKKAR',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,8395678990,'Abdul Uddin Chowdhury','1852041626','Nasima Chowdhury',null,'Abdul Uddin Chowdhury',null,'Son',2,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (28,'ISMAIL','TASWAR',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,9495678990,'Hasan Karim','1852041627','Rahima Karim',null,'Hasan Karim',null,'Son',2,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (29,'HASNAIEN','HOSSAIN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,2095678990,'Farooq Aziz Miah','1852041628','Farida Jamal',null,'Farooq Aziz Miah',null,'Son',1,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (30,'NAJIUR','RAHMAN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,2195678990,'Abdullah Rahman Haque','1852041629','Yasmin Haque',null,'Abdullah Rahman Haque',null,'Son',1,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (31,'IMRAN','HOSSAIN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,2795078990,'Nurul Islam Chowdhury','1852041639','Shamima Akhtar',null,'Nurul Islam Chowdhury',null,'Son',1,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (32,'ABDUL','RAYHAN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,2895670990,'Shahidul Haque Miah','1852041649','Afroza Chowdhury',null,'Shahidul Haque Miah',null,'Son',2,null,null,'Dhaka',null,to_date('07-FEB-21','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (33,'FARUK','HOSSAIN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,2995678900,'Arif Miah Farooq','1852041659','Selina Miah',null,'Arif Miah Farooq',null,'Son',2,null,null,'Dhaka',null,to_date('07-FEB-21','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (34,'TRISHA RANI','KURI',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,3995678090,'Azizur Rahman Islam','1852041669','Sultana Akhtar',null,'Azizur Rahman Islam',null,'Daughter',2,null,null,'Dhaka',null,to_date('07-FEB-21','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (35,'MOMO','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,4995670990,'Ismail Rahman','1852041679','Razia Rahman',null,'Ismail Rahman',null,'Daughter',1,null,null,'Dhaka',null,to_date('07-FEB-21','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (36,'SETU','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,5995608990,'Mohammad Khan','1852041689','Shahnaz Begum',null,'Mohammad Khan',null,'Daughter',1,null,null,'Dhaka',null,to_date('07-FEB-21','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (37,'RAJIYA','SULTANA',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,6995671990,'Bakkar Khan','1852041789','Rokeya Akter',null,'Bakkar Khan',null,'Daughter',1,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (38,'RAJIYA','SULTANA',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,69956772990,'Bakkar Khan','1852041789','Rokeya Akter',null,'Bakkar Khan',null,'Daughter',1,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (39,'NURJAHAN','AKTER',to_date('02-FEB-11','DD-MON-RR'),'female',null,null,2345673990,'TOFAZZAL HOSSAIN','1852041621','BILKIS BEGUM',null,'TOFFAZZAL HOSSAIN',null,'Daughter',1,null,null,'Dhaka,Mirpur1',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (40,'MARIAM','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,2355674990,'POLASH AHMED','1852041622','ROKEYA AKTER',null,'POLASH AHMED',null,'Daughter',1,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (41,'AFIA','KHATUN',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,2365675990,'Mohammad Ali Khan','1852041623','Fatima Begum',null,'Mohammad Ali Khan',null,'Daughter',1,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (42,'RABIA','KHATUN',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,2375676990,'Abdul Rahman Ahmed','1852041624','Ayesha Khan',null,'Abdul Rahman Ahmed',null,'Daughter',2,null,null,'Dhaka',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (43,'TAMMANNA','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female',null,null,2385679990,'Hossain Khan Islam','1852041625','Khadija Islam',null,'Hossain Khan Islam',null,'Daughter',2,null,null,'Dhaka,Harmony Street',null,to_date('07-FEB-22','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (44,'ABU','BAKKAR',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,2395178990,'Abdul Uddin Chowdhury','1852041626','Nasima Chowdhury',null,'Abdul Uddin Chowdhury',null,'Son',2,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (45,'ISMAIL','TASWAR',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,2495278990,'Hasan Karim','1852041627','Rahima Karim',null,'Hasan Karim',null,'Son',2,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (46,'HASNAIEN','HOSSAIN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,2595378990,'Farooq Aziz Miah','1852041628','Farida Jamal',null,'Farooq Aziz Miah',null,'Son',1,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (47,'NAJIUR','RAHMAN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,2695478990,'Abdullah Rahman Haque','1852041629','Yasmin Haque',null,'Abdullah Rahman Haque',null,'Son',1,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (48,'IMRAN','HOSSAIN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,2795578990,'Nurul Islam Chowdhury','1852041639','Shamima Akhtar',null,'Nurul Islam Chowdhury',null,'Son',1,null,null,'Dhaka',null,to_date('07-FEB-23','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (49,'ABDUL','RAYHAN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,2815678990,'Shahidul Haque Miah','1852041649','Afroza Chowdhury',null,'Shahidul Haque Miah',null,'Son',2,null,null,'Dhaka',null,to_date('07-FEB-21','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (50,'FARUK','HOSSAIN',to_date('02-MAR-18','DD-MON-RR'),'Male',null,null,2925678990,'Arif Miah Farooq','1852041659','Selina Miah',null,'Arif Miah Farooq',null,'Son',2,null,null,'Dhaka',null,to_date('07-FEB-21','DD-MON-RR'),'SC_DDD56',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (51,'TRISHA RANI','KURI',to_date('02-MAR-18','DD-MON-RR'),'Female','Buddhism','A-',3995608990,'Azizur Rahman Islam','1852041669','Sultana Akhtar','02654789563','Azizur Rahman Islam',null,'Daughter',2,5,null,'Dhaka','Matuail',to_date('07-FEB-21','DD-MON-RR'),'a',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (52,'MOMO','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female','Hinduism','A+',4995618990,'Ismail Rahman','1852041679','Razia Rahman','01265847965','Ismail Rahman',null,'Daughter',1,4,null,'Dhaka','Dhaka',to_date('07-FEB-21','DD-MON-RR'),'a',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (53,'SETU','AKTER',to_date('02-MAR-18','DD-MON-RR'),'female','Christianism','O-',5995628990,'Mohammad Khan','1852041689','Shahnaz Begum','01964416568','Mohammad Khan',null,'Daughter',1,4,null,'Dhaka','Rajshahi',to_date('07-FEB-21','DD-MON-RR'),'a',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (54,'RAJIYA','SULTANA',to_date('02-MAR-18','DD-MON-RR'),'female','Islam','AB+',6995638990,'Bakkar Khan','1852041789','Rokeya Akter','22542424257','Bakkar Khan',null,'Daughter',1,4,null,'Dhaka','Cumilla',to_date('07-FEB-21','DD-MON-RR'),'a',to_date('08-FEB-24','DD-MON-RR'));
Insert into ADMISSION (ADMISSION_ID,FIRST_NAME,LAST_NAME,DATE_OF_BIRTH,GENDER,RELIGION,BLOOD_GROUP,BIRTH_REG_NUMBER,FATHERS_NAME,FATHERS_CELL_NUMBER,MOTHERS_NAME,MOTHERS_CELL_NUMBER,GUARDIANS_NAME,GUARDIANS_CELL_NUMBER,RELATION_WITH_GUARDIAN,CLASS_ID,PREVIOUS_CLASS,PREVIOUS_SCHOOL,PRESENT_ADDRESS,PERMANENT_ADDRESS,ADMISSION_DATE,ACTION_USER,ACTION_DATE_TIME) values (55,'AFIA','FAHMIDA',to_date('02-MAR-17','DD-MON-RR'),'female','Hinduism','AB+',63956478990,'Md Rasel','1852041789','Nury Akter','04252010111','Md Rasel',null,'Daughter',1,4,null,'Dhaka','Dhaka',to_date('07-FEB-22','DD-MON-RR'),'a',to_date('08-FEB-24','DD-MON-RR'));
end ;


--re_Admission Table

drop table Re_Admission cascade constraint ;

create table Re_Admission 
(
 Re_Admission_id     number, 
 student_id          number, 
 Re_Admission_date   date,
 current_class_id    number, 
 current_section_id  number,
 current_roll_number number,
 new_class_id        number, 
 new_section_id      number,
 new_roll_number     number,
 action_user         varchar2(100) default user,
 action_date_time    date default sysdate
) ;


alter table Re_Admission 
add constraint Re_Admission_Re_Admission_id_pk primary key(Re_Admission_id) ;

alter table Re_Admission
add  constraint Re_Admission_student_id_fk foreign key(student_id)
references  student(student_id) ; 

alter table Re_Admission
add  constraint Re_Admission_new_class_id_fk foreign key(new_class_id)
references  class(class_id) ; 

alter table Re_Admission
add  constraint Re_Admission_new_section_id_fk foreign key(new_section_id)
references  section(section_id) ; 

begin
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (45,12,to_date('28-FEB-24','DD-MON-RR'),2,1,4,1,2,5,'a',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (46,11,to_date('28-FEB-24','DD-MON-RR'),2,2,11,1,2,12,'a',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (1,10,to_date('11-FEB-23','DD-MON-RR'),1,2,2,1,1,1,'a',to_date('11-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (2,11,to_date('11-FEB-23','DD-MON-RR'),2,1,1,2,1,2,'a',to_date('11-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (3,16,to_date('11-FEB-24','DD-MON-RR'),2,2,3,2,2,13,'a',to_date('11-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (18,45,to_date('28-FEB-24','DD-MON-RR'),1,2,21,2,1,90,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (19,25,to_date('28-FEB-24','DD-MON-RR'),1,2,2,2,2,56,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (20,35,to_date('28-FEB-24','DD-MON-RR'),1,2,11,2,2,100,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (21,30,to_date('28-FEB-24','DD-MON-RR'),1,2,6,2,2,77,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (22,28,to_date('28-FEB-24','DD-MON-RR'),1,2,4,2,2,5,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (23,84,to_date('28-FEB-24','DD-MON-RR'),1,1,1,2,2,2,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (24,85,to_date('28-FEB-24','DD-MON-RR'),1,1,2,1,1,4,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (25,36,to_date('28-FEB-24','DD-MON-RR'),1,1,12,1,1,5,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (26,37,to_date('28-FEB-24','DD-MON-RR'),1,1,13,1,1,6,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (27,63,to_date('28-FEB-24','DD-MON-RR'),1,2,39,1,2,7,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (28,86,to_date('28-FEB-24','DD-MON-RR'),1,2,1,1,2,8,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (29,87,to_date('28-FEB-24','DD-MON-RR'),1,2,45,1,1,9,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (30,75,to_date('28-FEB-24','DD-MON-RR'),1,1,18,1,1,11,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (31,20,to_date('28-FEB-24','DD-MON-RR'),1,2,3,1,1,14,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (32,20,to_date('28-FEB-24','DD-MON-RR'),1,2,16,2,2,15,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (33,22,to_date('28-FEB-24','DD-MON-RR'),1,2,4,2,1,5,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (34,86,to_date('28-FEB-24','DD-MON-RR'),1,2,33,1,2,16,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (35,86,to_date('28-FEB-24','DD-MON-RR'),1,2,44,2,1,54,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (36,37,to_date('28-FEB-24','DD-MON-RR'),1,2,22,2,2,44,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (37,85,to_date('28-FEB-24','DD-MON-RR'),1,1,33,2,2,45,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (38,13,to_date('28-FEB-24','DD-MON-RR'),1,1,1,1,1,2,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (39,13,to_date('28-FEB-24','DD-MON-RR'),1,1,2,2,2,3,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (40,15,to_date('28-FEB-24','DD-MON-RR'),1,1,3,1,2,4,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (41,12,to_date('28-FEB-24','DD-MON-RR'),1,1,2,1,2,3,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (42,12,to_date('28-FEB-24','DD-MON-RR'),1,1,3,2,1,4,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (43,11,to_date('28-FEB-24','DD-MON-RR'),1,1,9,1,1,10,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (44,11,to_date('28-FEB-24','DD-MON-RR'),1,1,10,2,2,11,'admin',to_date('28-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (4,10,to_date('27-FEB-24','DD-MON-RR'),1,1,7,2,1,8,'admin',to_date('27-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (5,11,to_date('27-FEB-24','DD-MON-RR'),1,1,8,2,2,9,'admin',to_date('27-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (6,51,to_date('27-FEB-24','DD-MON-RR'),1,1,27,2,1,28,'admin',to_date('27-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (7,52,to_date('27-FEB-24','DD-MON-RR'),1,1,28,2,2,29,'admin',to_date('27-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (8,53,to_date('27-FEB-24','DD-MON-RR'),1,2,29,2,2,30,'admin',to_date('27-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (9,57,to_date('27-FEB-24','DD-MON-RR'),1,2,33,1,2,34,'admin',to_date('27-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (10,58,to_date('27-FEB-24','DD-MON-RR'),1,2,34,2,1,35,'admin',to_date('27-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (11,57,to_date('27-FEB-24','DD-MON-RR'),1,2,34,2,1,35,'admin',to_date('27-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (12,59,to_date('27-FEB-24','DD-MON-RR'),1,1,35,2,1,36,'admin',to_date('27-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (13,60,to_date('27-FEB-24','DD-MON-RR'),1,1,36,2,2,37,'admin',to_date('27-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (14,62,to_date('27-FEB-24','DD-MON-RR'),1,1,38,2,2,39,'admin',to_date('27-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (15,69,to_date('27-FEB-24','DD-MON-RR'),1,2,12,2,1,11,'admin',to_date('27-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (16,61,to_date('27-FEB-24','DD-MON-RR'),1,2,37,2,2,38,'admin',to_date('27-FEB-24','DD-MON-RR'));
Insert into RE_ADMISSION (RE_ADMISSION_ID,STUDENT_ID,RE_ADMISSION_DATE,CURRENT_CLASS_ID,CURRENT_SECTION_ID,CURRENT_ROLL_NUMBER,NEW_CLASS_ID,NEW_SECTION_ID,NEW_ROLL_NUMBER,ACTION_USER,ACTION_DATE_TIME) values (17,77,to_date('27-FEB-24','DD-MON-RR'),1,2,21,2,2,22,'admin',to_date('27-FEB-24','DD-MON-RR'));
end ;


--attendance_e
 
drop table Attendance_E  cascade constraint ;

create table Attendance_e
(
Attendance_E_ID        Number,
Attendance_date        date default sysdate,
employee_id            number,
login	               Date,
logoff	               Date,
status                 varchar2(100),
Action_User	       Varchar2(100) default user,
Action_Date_Time       Date default sysdate
) ;

alter table Attendance_e
add constraint Attendance_E_Attendance_E_id_pk primary key(Attendance_E_id) ;

alter table Attendance_E
add   constraint Attendance_e_employee_id_fk foreign key(employee_id)
references employee(employee_id) ;

begin
Insert into ATTENDANCE_E (ATTENDANCE_E_ID,ATTENDANCE_DATE,EMPLOYEE_ID,LOGIN,LOGOFF,STATUS,ACTION_USER,ACTION_DATE_TIME) values (12,to_date('18-FEB-24','DD-MON-RR'),4,to_date('18-FEB-24','DD-MON-RR'),to_date('18-FEB-24','DD-MON-RR'),null,'a',to_date('18-FEB-24','DD-MON-RR'));
Insert into ATTENDANCE_E (ATTENDANCE_E_ID,ATTENDANCE_DATE,EMPLOYEE_ID,LOGIN,LOGOFF,STATUS,ACTION_USER,ACTION_DATE_TIME) values (1,to_date('19-JAN-24','DD-MON-RR'),3,to_date('20-JAN-24','DD-MON-RR'),null,null,'a',to_date('20-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_E (ATTENDANCE_E_ID,ATTENDANCE_DATE,EMPLOYEE_ID,LOGIN,LOGOFF,STATUS,ACTION_USER,ACTION_DATE_TIME) values (4,to_date('20-JAN-24','DD-MON-RR'),1,to_date('20-JAN-24','DD-MON-RR'),to_date('20-JAN-24','DD-MON-RR'),null,'a',to_date('20-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_E (ATTENDANCE_E_ID,ATTENDANCE_DATE,EMPLOYEE_ID,LOGIN,LOGOFF,STATUS,ACTION_USER,ACTION_DATE_TIME) values (3,to_date('18-JAN-24','DD-MON-RR'),3,to_date('20-JAN-24','DD-MON-RR'),to_date('20-JAN-24','DD-MON-RR'),null,'a',to_date('20-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_E (ATTENDANCE_E_ID,ATTENDANCE_DATE,EMPLOYEE_ID,LOGIN,LOGOFF,STATUS,ACTION_USER,ACTION_DATE_TIME) values (2,to_date('19-JAN-24','DD-MON-RR'),4,to_date('20-JAN-24','DD-MON-RR'),null,null,'a',to_date('20-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_E (ATTENDANCE_E_ID,ATTENDANCE_DATE,EMPLOYEE_ID,LOGIN,LOGOFF,STATUS,ACTION_USER,ACTION_DATE_TIME) values (8,to_date('21-JAN-24','DD-MON-RR'),1,to_date('21-JAN-24','DD-MON-RR'),to_date('21-JAN-24','DD-MON-RR'),null,'a',to_date('21-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_E (ATTENDANCE_E_ID,ATTENDANCE_DATE,EMPLOYEE_ID,LOGIN,LOGOFF,STATUS,ACTION_USER,ACTION_DATE_TIME) values (5,to_date('20-JAN-24','DD-MON-RR'),3,to_date('20-JAN-24','DD-MON-RR'),to_date('20-JAN-24','DD-MON-RR'),null,'a',to_date('20-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_E (ATTENDANCE_E_ID,ATTENDANCE_DATE,EMPLOYEE_ID,LOGIN,LOGOFF,STATUS,ACTION_USER,ACTION_DATE_TIME) values (6,to_date('21-JAN-24','DD-MON-RR'),2,to_date('21-JAN-24','DD-MON-RR'),to_date('21-JAN-24','DD-MON-RR'),null,'a',to_date('21-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_E (ATTENDANCE_E_ID,ATTENDANCE_DATE,EMPLOYEE_ID,LOGIN,LOGOFF,STATUS,ACTION_USER,ACTION_DATE_TIME) values (7,to_date('21-JAN-24','DD-MON-RR'),3,to_date('21-JAN-24','DD-MON-RR'),to_date('21-JAN-24','DD-MON-RR'),null,'a',to_date('21-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_E (ATTENDANCE_E_ID,ATTENDANCE_DATE,EMPLOYEE_ID,LOGIN,LOGOFF,STATUS,ACTION_USER,ACTION_DATE_TIME) values (9,to_date('21-JAN-24','DD-MON-RR'),4,to_date('21-JAN-24','DD-MON-RR'),null,null,'a',to_date('21-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_E (ATTENDANCE_E_ID,ATTENDANCE_DATE,EMPLOYEE_ID,LOGIN,LOGOFF,STATUS,ACTION_USER,ACTION_DATE_TIME) values (10,to_date('21-JAN-24','DD-MON-RR'),5,to_date('21-JAN-24','DD-MON-RR'),null,null,'a',to_date('21-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_E (ATTENDANCE_E_ID,ATTENDANCE_DATE,EMPLOYEE_ID,LOGIN,LOGOFF,STATUS,ACTION_USER,ACTION_DATE_TIME) values (11,to_date('21-JAN-24','DD-MON-RR'),13,to_date('21-JAN-24','DD-MON-RR'),to_date('21-JAN-24','DD-MON-RR'),null,'a',to_date('21-JAN-24','DD-MON-RR'));
end ;


--attendance_m
 
drop table Attendance_m cascade constraint ;

create table Attendance_m
(
Attendance_m_ID        Number,
Attendance_date        date default sysdate,
class_id               number,
section_id	       Number,
Action_User	       Varchar2(100) default user,
Action_Date_Time       Date default sysdate
) ;

alter table Attendance_M
add constraint Attendance_m_Attendance_m_id_pk primary key(Attendance_m_id) ;

alter table Attendance_M
add   constraint Attendance_m_class_id_fk foreign key(class_id)
references class(class_id) ;

alter table Attendance_M
add   constraint Attendance_m_section_id_fk foreign key(section_id)
references section(section_id) ;

alter table Attendance_M
add   constraint Attendance_M_Attendance_date_class_id_section_id_uk unique (Attendance_date,class_id,section_id) ;

begin
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (40,to_date('24-APR-23','DD-MON-RR'),1,1,'A',to_date('24-APR-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (33,to_date('24-APR-24','DD-MON-RR'),2,1,'APEX_PUBLIC_USER',to_date('24-APR-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (42,to_date('24-APR-24','DD-MON-RR'),1,1,'A',to_date('24-APR-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (37,to_date('24-APR-22','DD-MON-RR'),2,1,'A',to_date('24-APR-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (4,to_date('18-JAN-23','DD-MON-RR'),2,2,null,to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (5,to_date('18-JAN-24','DD-MON-RR'),2,1,null,to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (6,to_date('18-JAN-24','DD-MON-RR'),1,2,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (7,to_date('18-JAN-24','DD-MON-RR'),1,1,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (8,to_date('19-JAN-24','DD-MON-RR'),1,1,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (9,to_date('19-JAN-23','DD-MON-RR'),1,2,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (10,to_date('19-JAN-24','DD-MON-RR'),1,2,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (11,to_date('19-JAN-23','DD-MON-RR'),1,1,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (12,to_date('19-JAN-24','DD-MON-RR'),2,1,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (13,to_date('19-JAN-24','DD-MON-RR'),2,2,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (14,to_date('19-JAN-23','DD-MON-RR'),2,2,'israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (15,to_date('20-JAN-24','DD-MON-RR'),1,1,'a',to_date('20-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (16,to_date('20-JAN-24','DD-MON-RR'),2,2,'a',to_date('20-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (18,to_date('21-JAN-24','DD-MON-RR'),2,2,'admin',to_date('21-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (1,to_date('18-JAN-24','DD-MON-RR'),2,2,'SC_DDD56',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (2,to_date('18-JAN-23','DD-MON-RR'),1,1,null,to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (3,to_date('18-JAN-22','DD-MON-RR'),2,2,null,to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (19,to_date('29-JAN-24','DD-MON-RR'),2,2,'a',to_date('29-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (20,to_date('03-FEB-24','DD-MON-RR'),2,2,'a',to_date('03-FEB-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (17,to_date('20-JAN-23','DD-MON-RR'),2,1,'a',to_date('20-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (30,to_date('22-APR-24','DD-MON-RR'),2,2,'APEX_PUBLIC_USER',to_date('23-APR-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (31,to_date('22-APR-22','DD-MON-RR'),2,1,'APEX_PUBLIC_USER',to_date('23-APR-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (32,to_date('22-APR-23','DD-MON-RR'),2,2,'APEX_PUBLIC_USER',to_date('23-APR-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (25,to_date('22-APR-24','DD-MON-RR'),1,1,'APEX_PUBLIC_USER',to_date('23-APR-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (26,to_date('22-APR-23','DD-MON-RR'),2,1,'APEX_PUBLIC_USER',to_date('23-APR-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (27,to_date('22-APR-24','DD-MON-RR'),1,2,'APEX_PUBLIC_USER',to_date('23-APR-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (28,to_date('22-APR-23','DD-MON-RR'),1,1,'APEX_PUBLIC_USER',to_date('23-APR-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (29,to_date('22-APR-24','DD-MON-RR'),2,1,'APEX_PUBLIC_USER',to_date('23-APR-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (38,to_date('10-DEC-22','DD-MON-RR'),1,2,'AA',to_date('24-APR-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (39,to_date('24-APR-22','DD-MON-RR'),1,1,'A',to_date('24-APR-24','DD-MON-RR'));
Insert into ATTENDANCE_M (ATTENDANCE_M_ID,ATTENDANCE_DATE,CLASS_ID,SECTION_ID,ACTION_USER,ACTION_DATE_TIME) values (41,to_date('24-APR-21','DD-MON-RR'),1,1,'A',to_date('24-APR-24','DD-MON-RR'));
end ;

--table attendance_d

drop table Attendance_d cascade constraints ;

create table Attendance_d
(
Attendance_d_ID        Number,
Attendance_m_ID        Number,
student_id             number,
status                 varchar2(100),
Action_User	       Varchar2(100) default user,
Action_Date_Time       Date default sysdate
);

alter table Attendance_d
add constraint Attendance_d_Attendance_d_id_pk primary key(Attendance_d_id) ;

alter table Attendance_D
add   constraint Attendance_d_Attendance_m_fk foreign key(Attendance_m_id)
references Attendance_m(Attendance_m_id) ;

alter table Attendance_D
add   constraint Attendance_d_student_id_fk foreign key(student_id)
references student(student_id) ;

begin
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (1,3,13,'Absent',null,to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (2,3,14,'Present',null,to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (5,3,16,'Absent',null,to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (6,2,11,'Absent',null,to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (7,4,13,'Present',null,to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (8,4,14,'Absent',null,to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (9,4,16,'Present',null,to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (3,2,12,'Absent',null,to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (4,2,15,'Present',null,to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (10,5,11,'Present',null,to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (11,5,12,'Absent',null,to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (12,6,24,'Present','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (13,6,25,'Absent','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (14,6,26,'Present','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (15,7,17,'Present','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (16,7,18,'Absent','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (17,7,20,'Present','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (18,8,17,'Present','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (19,8,18,'Absent','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (20,8,20,'Absent','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (21,9,24,'Absent','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (22,9,25,'Present','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (23,9,26,'Present','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (24,10,19,'Present','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (25,10,10,'Present','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (26,10,22,'Present','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (27,10,11,'Present','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (28,11,11,'Absent','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (29,11,12,'Absent','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (30,11,15,'Absent','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (31,12,11,'Present','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (32,12,12,'Present','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (33,12,15,'Absent','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (34,13,13,'Present','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (35,13,14,'Absent','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (36,13,16,'Present','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (37,14,13,'Absent','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (38,14,14,'Absent','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (39,14,16,'Present','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (40,14,21,'Present','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (41,15,17,'Present','a',to_date('20-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (42,15,18,'Present','a',to_date('20-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (43,15,20,'Absent','a',to_date('20-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (44,16,13,'Present','a',to_date('20-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (45,16,14,'Absent','a',to_date('20-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (46,16,16,'Present','a',to_date('20-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (50,18,13,'Present','admin',to_date('21-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (51,18,14,'Absent','admin',to_date('21-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (52,18,16,'Present','admin',to_date('21-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (53,19,13,'Present','a',to_date('29-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (54,19,14,'Absent','a',to_date('29-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (55,19,16,'Present','a',to_date('29-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (56,20,13,'Present','a',to_date('03-FEB-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (57,20,14,'Present','a',to_date('03-FEB-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (58,20,16,'Absent','a',to_date('03-FEB-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (59,20,21,'Present','a',to_date('03-FEB-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (47,17,11,'Present','a',to_date('20-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (48,17,12,'Absent','a',to_date('20-JAN-24','DD-MON-RR'));
Insert into ATTENDANCE_D (ATTENDANCE_D_ID,ATTENDANCE_M_ID,STUDENT_ID,STATUS,ACTION_USER,ACTION_DATE_TIME) values (49,17,15,'Present','a',to_date('20-JAN-24','DD-MON-RR'));
end ;

--fee_m table

drop table fee_m cascade constraints ;

create table fee_m
(
fee_m_id       number,
student_id       number,
admission_id    number,
class_id          number,
collection_date     date default sysdate,
paid_amount         number,
due_amount         number,
sessions           number,
action_user         varchar2(100) default user,
action_date_time    date  default sysdate
) ;

alter table fee_m
add   constraint fee_m_fee_m_id_pk primary key(fee_m_id) ;

alter table fee_m
add   constraint fee_m_student_id_fk foreign key (student_id)
references student(student_id) ;

alter table fee_m
add   constraint fee_m_admission_id_fk foreign key (admission_id)
references admission(admission_id) ;

alter table fee_m
add   constraint fee_m_class_id_fk foreign key (class_id)
references class(class_id) ;

begin
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (38,85,1,to_date('27-FEB-24','DD-MON-RR'),7300,0,null,to_date('27-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (3,10,1,to_date('17-FEB-24','DD-MON-RR'),13300,50,'a',to_date('17-FEB-24','DD-MON-RR'),null,2022);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (4,10,1,to_date('17-FEB-24','DD-MON-RR'),9300,300,'a',to_date('17-FEB-24','DD-MON-RR'),null,2022);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (5,11,1,to_date('17-FEB-24','DD-MON-RR'),8000,2750,'a',to_date('17-FEB-24','DD-MON-RR'),null,2022);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (6,12,2,to_date('17-FEB-24','DD-MON-RR'),5500,0,'a',to_date('17-FEB-24','DD-MON-RR'),null,2022);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (7,13,2,to_date('17-FEB-24','DD-MON-RR'),1000,19250,'a',to_date('17-FEB-24','DD-MON-RR'),null,2022);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (8,14,2,to_date('17-FEB-24','DD-MON-RR'),3500,5900,'a',to_date('17-FEB-24','DD-MON-RR'),null,2022);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (9,15,2,to_date('17-FEB-24','DD-MON-RR'),9900,0,'a',to_date('17-FEB-24','DD-MON-RR'),null,2022);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (10,16,2,to_date('17-FEB-24','DD-MON-RR'),12000,5750,'a',to_date('17-FEB-24','DD-MON-RR'),null,2022);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (11,16,2,to_date('17-FEB-24','DD-MON-RR'),9900,5900,'a',to_date('17-FEB-24','DD-MON-RR'),null,2022);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (12,17,2,to_date('17-FEB-24','DD-MON-RR'),13400,2650,'a',to_date('17-FEB-24','DD-MON-RR'),null,2022);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (13,18,2,to_date('17-FEB-24','DD-MON-RR'),7900,0,'a',to_date('17-FEB-24','DD-MON-RR'),null,2022);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (14,19,2,to_date('17-FEB-24','DD-MON-RR'),16000,250,'a',to_date('17-FEB-24','DD-MON-RR'),null,2022);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (15,20,1,to_date('17-FEB-24','DD-MON-RR'),8300,300,'a',to_date('17-FEB-24','DD-MON-RR'),null,2022);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (16,21,2,to_date('17-FEB-24','DD-MON-RR'),11800,1050,'a',to_date('17-FEB-24','DD-MON-RR'),null,2022);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (17,22,1,to_date('17-FEB-24','DD-MON-RR'),8800,0,'a',to_date('17-FEB-24','DD-MON-RR'),null,2022);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (18,23,2,to_date('17-FEB-24','DD-MON-RR'),9900,1400,'a',to_date('17-FEB-24','DD-MON-RR'),null,2022);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (19,24,1,to_date('17-FEB-24','DD-MON-RR'),7000,750,'a',to_date('17-FEB-24','DD-MON-RR'),null,2022);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (20,25,1,to_date('17-FEB-24','DD-MON-RR'),8800,4550,'a',to_date('17-FEB-24','DD-MON-RR'),null,2022);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (21,25,1,to_date('17-FEB-24','DD-MON-RR'),8500,4550,'a',to_date('17-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (22,26,1,to_date('17-FEB-24','DD-MON-RR'),8000,0,'a',to_date('17-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (23,27,2,to_date('17-FEB-24','DD-MON-RR'),1000,12400,'a',to_date('17-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (24,28,1,to_date('17-FEB-24','DD-MON-RR'),5500,0,'a',to_date('17-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (25,29,1,to_date('17-FEB-24','DD-MON-RR'),8800,1050,'a',to_date('17-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (26,31,2,to_date('17-FEB-24','DD-MON-RR'),11000,1900,'a',to_date('17-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (27,32,2,to_date('17-FEB-24','DD-MON-RR'),9900,2150,'a',to_date('17-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (28,33,2,to_date('17-FEB-24','DD-MON-RR'),9900,0,'a',to_date('17-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (29,34,2,to_date('17-FEB-24','DD-MON-RR'),19400,150,'a',to_date('17-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (30,35,1,to_date('17-FEB-24','DD-MON-RR'),6500,1750,'a',to_date('17-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (31,37,1,to_date('17-FEB-24','DD-MON-RR'),8800,7150,'a',to_date('17-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (32,38,2,to_date('17-FEB-24','DD-MON-RR'),9900,0,'a',to_date('17-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (33,39,2,to_date('17-FEB-24','DD-MON-RR'),9400,0,'a',to_date('17-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (34,40,2,to_date('17-FEB-24','DD-MON-RR'),9900,0,'a',to_date('17-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (35,10,1,to_date('26-FEB-24','DD-MON-RR'),8800,0,'a',to_date('26-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (36,26,1,to_date('26-FEB-24','DD-MON-RR'),6500,0,'a',to_date('26-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (37,26,1,to_date('26-FEB-24','DD-MON-RR'),9000,0,'a',to_date('26-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (1,11,1,to_date('05-FEB-24','DD-MON-RR'),7750,0,null,to_date('05-FEB-24','DD-MON-RR'),null,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (2,null,1,to_date('05-FEB-24','DD-MON-RR'),10600,600,null,to_date('05-FEB-24','DD-MON-RR'),11,2023);
Insert into FEE_M (FEE_M_ID,STUDENT_ID,CLASS_ID,COLLECTION_DATE,PAID_AMOUNT,DUE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,ADMISSION_ID,SESSIONS) values (39,null,2,to_date('03-MAR-24','DD-MON-RR'),null,null,null,to_date('03-MAR-24','DD-MON-RR'),10,null);
end ;

--table fee_d 

drop table fee_d cascade constraints ;

create table fee_d
(
fee_d_id       number,
fee_m_id       number,
fee_amount_id       number,
fee_amount          number,
quantity            number,
action_user         varchar2(100) default user,
action_date_time    date  default sysdate
) ;

alter table fee_d
add   constraint fee_d_fee_d_id_pk primary key(fee_d_id) ;

alter table fee_d
add   constraint fee_d_fee_m_id_fk foreign key (fee_m_id)
references fee_m(fee_m_id) ;

alter table fee_d
add   constraint fee_m_fee_amount_id_fk foreign key (fee_amount_id)
references fee_amount(fee_amount_id) ;


begin
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (284,38,7,500,null,to_date('27-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (285,38,2,4500,'a',to_date('27-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (286,38,9,500,'a',to_date('27-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (287,38,3,1800,'a',to_date('27-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (18,3,9,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (19,3,3,1800,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (270,35,2,4500,'a',to_date('26-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (21,3,5,1500,'a',to_date('17-FEB-24','DD-MON-RR'),4);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (271,35,7,500,'a',to_date('26-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (272,35,9,500,'a',to_date('26-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (24,3,7,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (25,4,2,4500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (26,4,9,500,'a',to_date('17-FEB-24','DD-MON-RR'),2);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (27,4,3,1800,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (273,35,3,1800,'a',to_date('26-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (29,4,5,1500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (274,35,5,1500,'a',to_date('26-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (275,36,7,500,'a',to_date('26-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (32,4,7,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (33,5,2,4500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (34,5,9,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (35,5,3,1800,'a',to_date('17-FEB-24','DD-MON-RR'),0);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (279,36,2,4500,'a',to_date('26-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (37,5,5,1500,'a',to_date('17-FEB-24','DD-MON-RR'),2);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (278,36,5,1500,'a',to_date('26-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (40,5,7,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (41,6,1,5000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (43,6,4,1900,'a',to_date('17-FEB-24','DD-MON-RR'),0);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (45,6,6,2000,'a',to_date('17-FEB-24','DD-MON-RR'),0);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (283,37,5,1500,'a',to_date('26-FEB-24','DD-MON-RR'),6);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (47,6,8,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (48,7,1,5000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (49,7,10,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (50,7,4,1900,'a',to_date('17-FEB-24','DD-MON-RR'),0);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (52,7,6,2000,'a',to_date('17-FEB-24','DD-MON-RR'),5);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (54,7,8,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (55,8,1,5000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (56,8,10,500,'a',to_date('17-FEB-24','DD-MON-RR'),0);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (57,8,4,1900,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (59,8,6,2000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (61,8,8,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (62,9,1,5000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (63,9,10,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (64,9,4,1900,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (66,9,6,2000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (68,9,8,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (70,10,10,500,'a',to_date('17-FEB-24','DD-MON-RR'),0);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (71,10,4,1900,'a',to_date('17-FEB-24','DD-MON-RR'),5);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (73,10,6,2000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (75,10,8,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (76,11,1,5000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (77,11,10,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (78,11,4,1900,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (80,11,6,2000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (82,11,8,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (83,12,1,5000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (84,12,10,500,'a',to_date('17-FEB-24','DD-MON-RR'),0);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (85,12,4,1900,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (87,12,6,2000,'a',to_date('17-FEB-24','DD-MON-RR'),3);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (89,12,8,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (90,13,1,5000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (91,13,10,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (92,13,4,1900,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (94,13,6,2000,'a',to_date('17-FEB-24','DD-MON-RR'),0);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (96,13,8,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (97,14,1,5000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (98,14,10,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (99,14,4,1900,'a',to_date('17-FEB-24','DD-MON-RR'),0);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (101,14,6,2000,'a',to_date('17-FEB-24','DD-MON-RR'),5);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (103,14,8,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (104,15,2,4500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (105,15,9,500,'a',to_date('17-FEB-24','DD-MON-RR'),0);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (106,15,3,1800,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (108,15,5,1500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (111,15,7,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (112,16,1,5000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (113,16,10,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (114,16,4,1900,'a',to_date('17-FEB-24','DD-MON-RR'),2);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (116,16,6,2000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (118,16,8,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (119,17,2,4500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (120,17,9,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (121,17,3,1800,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (123,17,5,1500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (126,17,7,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (127,18,1,5000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (128,18,10,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (129,18,4,1900,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (131,18,6,2000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (133,18,8,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (134,19,2,4500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (135,19,9,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (136,19,3,1800,'a',to_date('17-FEB-24','DD-MON-RR'),0);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (138,19,5,1500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (141,19,7,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (142,20,2,4500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (143,20,9,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (144,20,3,1800,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (146,20,5,1500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (149,20,7,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (150,21,2,4500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (151,21,9,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (152,21,3,1800,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (154,21,5,1500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (157,21,7,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (162,22,5,1500,'a',to_date('17-FEB-24','DD-MON-RR'),5);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (165,22,7,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (166,23,1,5000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (167,23,10,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (168,23,4,1900,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (170,23,6,2000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (172,23,8,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (173,24,2,4500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (174,24,9,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (175,24,3,1800,'a',to_date('17-FEB-24','DD-MON-RR'),0);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (177,24,5,1500,'a',to_date('17-FEB-24','DD-MON-RR'),0);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (180,24,7,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (181,25,2,4500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (182,25,9,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (183,25,3,1800,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (185,25,5,1500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (188,25,7,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (189,26,2,4500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (190,26,9,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (191,26,3,1800,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (196,26,7,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (204,27,1,5000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (205,27,10,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (206,27,4,1900,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (208,27,6,2000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (210,27,8,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (211,28,1,5000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (212,28,10,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (213,28,4,1900,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (215,28,6,2000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (217,28,8,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (218,29,1,5000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (219,29,10,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (220,29,4,1900,'a',to_date('17-FEB-24','DD-MON-RR'),6);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (222,29,6,2000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (224,29,8,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (225,30,2,4500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (226,30,9,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (227,30,3,1800,'a',to_date('17-FEB-24','DD-MON-RR'),0);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (229,30,5,1500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (232,30,7,500,'a',to_date('17-FEB-24','DD-MON-RR'),0);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (233,31,2,4500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (234,31,9,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (235,31,3,1800,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (237,31,5,1500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (240,31,7,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (249,32,1,5000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (250,32,10,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (251,32,4,1900,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (253,32,6,2000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (255,32,8,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (256,33,1,5000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (257,33,10,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (258,33,4,1900,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (260,33,6,2000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (262,33,8,500,'a',to_date('17-FEB-24','DD-MON-RR'),0);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (263,34,1,5000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (264,34,10,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (265,34,4,1900,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (267,34,6,2000,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (269,34,8,500,'a',to_date('17-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (1,1,2,4500,null,to_date('05-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (2,1,9,500,null,to_date('05-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (3,1,3,1800,null,to_date('05-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (5,1,5,1500,null,to_date('05-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (8,1,7,500,null,to_date('05-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (9,2,2,4500,null,to_date('05-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (10,2,9,500,null,to_date('05-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (11,2,3,1800,null,to_date('05-FEB-24','DD-MON-RR'),2);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (13,2,5,1500,null,to_date('05-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (16,2,7,500,null,to_date('05-FEB-24','DD-MON-RR'),1);
Insert into FEE_D (FEE_D_ID,FEE_M_ID,FEE_AMOUNT_ID,FEE_AMOUNT,ACTION_USER,ACTION_DATE_TIME,QUANTITY) values (288,39,12,900,null,to_date('03-MAR-24','DD-MON-RR'),1);
end ;


--Routine_M_Table

drop table routine_M cascade constraint ;

create table routine_M
(
routine_m_id          number,
employee_id           number,
day_of_week           varchar2(100),
action_user           varchar2(100) default user,
action_date_time      date          default sysdate
) ;

alter table routine_m
add constraint routine_M_routine_M_id_pk primary key(routine_M_id) ;

alter table routine_M
add constraint routine_M_employee_id_fk foreign key(employee_id) 
references employee (employee_id) ;

ALTER TABLE routine_m
ADD CONSTRAINT routine_m_employee_id_day_of_week_uk UNIQUE (employee_id, day_of_week);

begin
Insert into ROUTINE_M (ROUTINE_M_ID,EMPLOYEE_ID,DAY_OF_WEEK,ACTION_USER,ACTION_DATE_TIME) values (12,2,'SUNDAY',null,to_date('21-APR-24','DD-MON-RR'));
Insert into ROUTINE_M (ROUTINE_M_ID,EMPLOYEE_ID,DAY_OF_WEEK,ACTION_USER,ACTION_DATE_TIME) values (7,6,'WEDNESDAY','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ROUTINE_M (ROUTINE_M_ID,EMPLOYEE_ID,DAY_OF_WEEK,ACTION_USER,ACTION_DATE_TIME) values (8,5,'MONDAY','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ROUTINE_M (ROUTINE_M_ID,EMPLOYEE_ID,DAY_OF_WEEK,ACTION_USER,ACTION_DATE_TIME) values (9,6,'SUNDAY','a',to_date('11-FEB-24','DD-MON-RR'));
Insert into ROUTINE_M (ROUTINE_M_ID,EMPLOYEE_ID,DAY_OF_WEEK,ACTION_USER,ACTION_DATE_TIME) values (15,7,'TUESDAY',null,to_date('21-APR-24','DD-MON-RR'));
Insert into ROUTINE_M (ROUTINE_M_ID,EMPLOYEE_ID,DAY_OF_WEEK,ACTION_USER,ACTION_DATE_TIME) values (2,4,'TUESDAY','a',to_date('17-JAN-24','DD-MON-RR'));
Insert into ROUTINE_M (ROUTINE_M_ID,EMPLOYEE_ID,DAY_OF_WEEK,ACTION_USER,ACTION_DATE_TIME) values (3,4,'WEDNESDAY','a',to_date('17-JAN-24','DD-MON-RR'));
Insert into ROUTINE_M (ROUTINE_M_ID,EMPLOYEE_ID,DAY_OF_WEEK,ACTION_USER,ACTION_DATE_TIME) values (4,5,'TUESDAY','a',to_date('17-JAN-24','DD-MON-RR'));
Insert into ROUTINE_M (ROUTINE_M_ID,EMPLOYEE_ID,DAY_OF_WEEK,ACTION_USER,ACTION_DATE_TIME) values (5,1,'MONDAY','a',to_date('17-JAN-24','DD-MON-RR'));
Insert into ROUTINE_M (ROUTINE_M_ID,EMPLOYEE_ID,DAY_OF_WEEK,ACTION_USER,ACTION_DATE_TIME) values (6,5,'THURSDAY','a',to_date('17-JAN-24','DD-MON-RR'));
Insert into ROUTINE_M (ROUTINE_M_ID,EMPLOYEE_ID,DAY_OF_WEEK,ACTION_USER,ACTION_DATE_TIME) values (14,3,'SUNDAY',null,to_date('21-APR-24','DD-MON-RR'));
end ;


--Routine_d_Table

drop table routine_d cascade constraint ;

create table routine_d
(
routine_d_id          number,
routine_m_id          number,
class_d_id            number         constraint routine_d_class_d_id_nn not null,
start_time            varchar2(100)  constraint routine_d_start_time_nn not null,
end_time              varchar2(100),
action_user           varchar2(100) default user,
action_date_time      date          default sysdate
) ;

alter table routine_d
add constraint routine_d_routine_d_id_pk primary key(routine_d_id) ;

alter table routine_d
add constraint routine_D_routine_m_id_fk foreign key(routine_m_id) 
references routine_m(routine_m_id) ;

alter table routine_d
add constraint routine_D_class_d_id_fk foreign key(class_d_id) 
references class_d(class_d_id) ;

ALTER TABLE routine_d
ADD CONSTRAINT routine_d_routine_m_id_class_d_id_uk UNIQUE (routine_m_id, class_d_id);

ALTER TABLE routine_d
ADD CONSTRAINT routine_d_routine_m_id_start_time_uk UNIQUE (routine_m_id, start_time);

begin
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (2,2,19,'12.00 PM','12.50 PM','a',to_date('17-JAN-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (14,7,3,'11.00 AM','11.50 AM','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (15,7,1,'10.00 AM','10.50 AM','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (16,7,2,'04.00 PM','04.50 PM','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (17,7,4,'03.00 PM','03.50 PM','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (18,8,3,'02.00 PM','02.50 PM','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (19,8,1,'10.00 AM','10.50 AM','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (21,8,4,'03.00 PM','03.50 PM','israt',to_date('19-JAN-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (22,9,11,'10.00 AM','10.50 AM','a',to_date('11-FEB-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (24,9,6,'12.00 PM','12.50 PM','a',to_date('11-FEB-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (1,2,2,'10.00 AM','10.50 AM',null,to_date('17-JAN-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (3,2,1,'11.00 AM','11.50 AM','a',to_date('17-JAN-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (4,3,2,'10.00 AM','10.50 AM','a',to_date('17-JAN-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (5,3,1,'11.00 AM','11.50 AM','a',to_date('17-JAN-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (6,4,2,'10.00 AM','10.50 AM',null,to_date('17-JAN-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (7,4,1,'11.00 AM','11.50 AM','a',to_date('17-JAN-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (9,5,1,'11.00 AM','11.50 AM','a',to_date('17-JAN-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (10,6,2,'10.00 AM','10.50 AM','a',to_date('17-JAN-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (25,12,2,'11.00 AM','11.50 AM',null,to_date('21-APR-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (26,14,9,'11.00 AM','11.50 AM',null,to_date('21-APR-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (27,15,17,'12.00 PM','12.50 PM',null,to_date('21-APR-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (28,15,4,'11.00 AM','11.50 AM',null,to_date('21-APR-24','DD-MON-RR'));
Insert into ROUTINE_D (ROUTINE_D_ID,ROUTINE_M_ID,CLASS_D_ID,START_TIME,END_TIME,ACTION_USER,ACTION_DATE_TIME) values (29,5,2,'10.00 AM','10.50 AM',null,to_date('21-APR-24','DD-MON-RR'));
end ;


--exam_m table

drop table exam_m cascade constraint ;

create table exam_m
(
exam_m_id         number,
exam_category_id  number,
exam_type_id      number,
sessions          Number, 
Class_ID            Number,
Section_id          Number,
action_user       varchar2(100) default user,
action_date_time  date  default sysdate
) ;

alter table exam_m
add constraint exam_m_exam_m_id_pk primary key(exam_m_id) ;

alter table exam_m
add constraint exam_m_exam_category_id_fk foreign key(exam_category_id) 
references exam_category(exam_category_id) ;

alter table exam_m
add constraint exam_m_exam_type_id_fk foreign key(exam_type_id) 
references exam_type(exam_type_id) ;

alter table exam_m
add constraint exam_m_class_id_fk foreign key(class_id) 
references class(class_id) ;

alter table exam_m
add constraint exam_m_section_id_fk foreign key(section_id) 
references section(section_id) ;

alter table exam_m
add   constraint exam_m_exam_type_ID_exam_category_ID_CLASS_ID_SECTION_ID_sessions_uk unique (class_id, section_id, exam_type_ID, exam_category_ID, sessions) ;

begin
Insert into EXAM_M (EXAM_M_ID,EXAM_CATEGORY_ID,EXAM_TYPE_ID,CLASS_ID,ACTION_USER,ACTION_DATE_TIME,SECTION_ID) values (3,1,2,2,'a',to_date('29-FEB-24','DD-MON-RR'),1);
Insert into EXAM_M (EXAM_M_ID,EXAM_CATEGORY_ID,EXAM_TYPE_ID,CLASS_ID,ACTION_USER,ACTION_DATE_TIME,SECTION_ID) values (4,2,2,2,'a',to_date('29-FEB-24','DD-MON-RR'),1);
Insert into EXAM_M (EXAM_M_ID,EXAM_CATEGORY_ID,EXAM_TYPE_ID,CLASS_ID,ACTION_USER,ACTION_DATE_TIME,SECTION_ID) values (5,1,2,1,'a',to_date('29-FEB-24','DD-MON-RR'),2);
Insert into EXAM_M (EXAM_M_ID,EXAM_CATEGORY_ID,EXAM_TYPE_ID,CLASS_ID,ACTION_USER,ACTION_DATE_TIME,SECTION_ID) values (6,2,2,1,'a',to_date('03-MAR-24','DD-MON-RR'),2);
Insert into EXAM_M (EXAM_M_ID,EXAM_CATEGORY_ID,EXAM_TYPE_ID,CLASS_ID,ACTION_USER,ACTION_DATE_TIME,SECTION_ID) values (1,1,2,1,'a',to_date('29-FEB-24','DD-MON-RR'),1);
Insert into EXAM_M (EXAM_M_ID,EXAM_CATEGORY_ID,EXAM_TYPE_ID,CLASS_ID,ACTION_USER,ACTION_DATE_TIME,SECTION_ID) values (2,2,2,1,'a',to_date('29-FEB-24','DD-MON-RR'),1);
Insert into EXAM_M (EXAM_M_ID,EXAM_CATEGORY_ID,EXAM_TYPE_ID,CLASS_ID,ACTION_USER,ACTION_DATE_TIME,SECTION_ID) values (7,1,2,2,null,to_date('03-MAR-24','DD-MON-RR'),2);
Insert into EXAM_M (EXAM_M_ID,EXAM_CATEGORY_ID,EXAM_TYPE_ID,CLASS_ID,ACTION_USER,ACTION_DATE_TIME,SECTION_ID) values (8,2,2,2,'a',to_date('03-MAR-24','DD-MON-RR'),2);
end ;


--exam_d table

drop table exam_d cascade constraint ;

create table exam_d
(
exam_d_id         number,
exam_m_id         number,
subject_id        number,
exam_date         date,
exam_time         varchar2(100),
Total_marks       number,
action_user       varchar2(100) default user,
action_date_time  date  default sysdate
) ;

alter table exam_d
add constraint exam_d_exam_d_id_pk primary key(exam_d_id) ;

alter table exam_d
add constraint exam_d_exam_m_id_fk foreign key(exam_m_id) 
references exam_m(exam_m_id) ;

alter table exam_d
add constraint exam_d_subject_id_fk foreign key(subject_id) 
references subject(subject_id) ;

alter table exam_d
add   constraint exam_d_exam_m_ID_SUBJECT_ID_UK unique (exam_m_ID, SUBJECT_ID) ;

begin
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (9,3,4,to_date('08-SEP-23','DD-MON-RR'),'09.00 am - 01.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (10,3,1,to_date('08-SEP-23','DD-MON-RR'),'09.00 am - 01.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (11,3,2,to_date('08-SEP-23','DD-MON-RR'),'09.00 am - 01.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (12,3,5,to_date('08-SEP-23','DD-MON-RR'),'09.00 am - 01.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (13,4,4,to_date('08-JUL-23','DD-MON-RR'),'09.00 am - 01.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (14,4,1,to_date('09-JUL-23','DD-MON-RR'),'09.00 am - 01.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (15,4,2,to_date('10-JUL-23','DD-MON-RR'),'09.00 am - 01.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (16,4,5,to_date('11-JUL-23','DD-MON-RR'),'09.00 am - 01.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (17,5,4,to_date('08-JUN-23','DD-MON-RR'),'09.00am - 10.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (18,5,1,to_date('09-JUN-23','DD-MON-RR'),'09.00am - 10.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (19,5,2,to_date('10-JUN-23','DD-MON-RR'),'09.00am - 10.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (20,5,3,to_date('11-JUN-23','DD-MON-RR'),'09.00am - 10.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (21,6,4,to_date('08-JUN-23','DD-MON-RR'),'09.00am - 10.00 pm','a',to_date('03-MAR-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (22,6,1,to_date('09-JUN-23','DD-MON-RR'),'09.00am - 10.00 pm','a',to_date('03-MAR-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (23,6,2,to_date('10-JUN-23','DD-MON-RR'),'09.00am - 10.00 pm','a',to_date('03-MAR-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (24,6,3,to_date('11-JUN-23','DD-MON-RR'),'09.00am - 10.00 pm','a',to_date('03-MAR-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (1,1,4,to_date('04-JUL-23','DD-MON-RR'),'09.00am - 01.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (2,1,1,to_date('05-JUL-23','DD-MON-RR'),'09.00am - 01.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (3,1,2,to_date('06-JUL-23','DD-MON-RR'),'09.00am - 01.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (4,1,3,to_date('07-JUL-23','DD-MON-RR'),'09.00am - 01.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (5,2,4,to_date('04-DEC-23','DD-MON-RR'),'09.00am - 01.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (6,2,1,to_date('05-DEC-23','DD-MON-RR'),'09.00am - 01.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (7,2,2,to_date('06-DEC-23','DD-MON-RR'),'09.00am - 01.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (8,2,3,to_date('07-DEC-23','DD-MON-RR'),'09.00am - 01.00 pm','a',to_date('29-FEB-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (25,7,4,to_date('08-JUN-23','DD-MON-RR'),'09.00am - 10.00 pm',null,to_date('03-MAR-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (26,7,1,to_date('09-JUN-23','DD-MON-RR'),'09.00am - 10.00 pm',null,to_date('03-MAR-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (27,7,2,to_date('10-JUN-23','DD-MON-RR'),'09.00am - 10.00 pm',null,to_date('03-MAR-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (28,7,5,to_date('11-JUN-23','DD-MON-RR'),'09.00am - 10.00 pm',null,to_date('03-MAR-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (29,8,4,to_date('08-JUN-23','DD-MON-RR'),'09.00am - 10.00 pm','a',to_date('03-MAR-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (30,8,1,to_date('09-JUN-23','DD-MON-RR'),'09.00am - 10.00 pm','a',to_date('03-MAR-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (31,8,2,to_date('10-JUN-23','DD-MON-RR'),'09.00am - 10.00 pm','a',to_date('03-MAR-24','DD-MON-RR'),100);
Insert into EXAM_D (EXAM_D_ID,EXAM_M_ID,SUBJECT_ID,EXAM_DATE,EXAM_TIME,ACTION_USER,ACTION_DATE_TIME,TOTAL_MARKS) values (32,8,5,to_date('11-JUN-23','DD-MON-RR'),'09.00am - 10.00 pm','a',to_date('03-MAR-24','DD-MON-RR'),100);
end ;

--result_m

drop table result_m cascade constraint ;

create table result_m
(
result_m_id        number,
exam_m_id          number,
subject_id        number,
action_user       varchar2(100) default user,
action_date_time  date default sysdate
) ;

alter table result_m
add constraint result_m_result_m_id_pk primary key(result_m_id) ;

alter table result_m
add constraint result_m_exam_m_id_fk foreign key(exam_m_id)
references  exam_m (exam_m_id) ;

alter table result_m
add constraint result_m_subject_id_fk foreign key(subject_id)
references  subject (subject_id) ;

alter table result_m
add constraint  result_m_exam_m_ID_SUBJECT_ID_UK unique (exam_m_ID, SUBJECT_ID) ;

begin
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (9,3,2,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (10,3,4,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (11,3,5,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (12,4,2,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (13,4,4,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (14,4,1,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (15,4,5,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (1,1,2,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (2,1,4,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (3,1,1,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (4,1,3,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (5,2,2,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (6,2,4,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (7,2,1,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (8,2,3,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (20,6,2,null,to_date('03-MAR-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (21,6,4,null,to_date('03-MAR-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (22,6,1,null,to_date('03-MAR-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (23,6,3,null,to_date('03-MAR-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (24,7,4,null,to_date('03-MAR-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (25,7,2,null,to_date('03-MAR-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (26,7,1,null,to_date('03-MAR-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (27,7,5,null,to_date('03-MAR-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (16,5,2,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (17,5,4,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (18,5,1,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (19,5,3,'a',to_date('29-FEB-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (28,8,2,'a',to_date('03-MAR-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (29,8,4,'a',to_date('03-MAR-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (30,8,1,'a',to_date('03-MAR-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (31,8,5,'a',to_date('03-MAR-24','DD-MON-RR'));
Insert into RESULT_M (RESULT_M_ID,EXAM_M_ID,SUBJECT_ID,ACTION_USER,ACTION_DATE_TIME) values (32,8,5,'a',to_date('03-MAR-24','DD-MON-RR'));
end ;

--result_d table

drop table result_d cascade constraint ;

create table result_d
(
result_d_id      number,
result_m_id      number,
student_id       number,
obtained_marks   number,
Absent           varchar2(100),
action_user      varchar2(100) default user,
action_date_time  date default sysdate
) ;

alter table result_d
add constraint result_d_result_d_id_pk primary key(result_d_id) ;

alter table result_d
add constraint result_d_result_m_id_fk foreign key(result_m_id)
references  result_m (result_m_id) ;

alter table result_d
add constraint result_d_student_id_fk foreign key(student_id)
references  student (student_id) ;

begin
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (41,9,69,68,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (42,9,54,57,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (43,9,55,47,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (44,9,56,77,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (45,9,57,null,'a',to_date('29-FEB-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (46,10,69,67,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (47,10,54,55,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (48,10,55,77,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (49,10,56,46,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (50,10,57,56,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (51,11,69,77,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (52,11,54,null,'a',to_date('29-FEB-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (53,11,55,null,'a',to_date('29-FEB-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (54,11,56,56,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (55,11,57,67,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (56,11,69,66,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (57,11,54,77,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (58,11,55,56,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (59,11,56,46,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (60,11,57,67,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (61,12,69,56,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (62,12,54,66,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (63,12,55,76,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (64,12,56,56,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (65,12,57,null,'a',to_date('29-FEB-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (66,13,69,56,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (67,13,54,66,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (68,13,55,70,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (69,13,56,23,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (70,13,57,30,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (71,14,69,70,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (72,14,54,56,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (73,14,55,66,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (74,14,56,46,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (75,14,57,36,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (76,15,69,60,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (77,15,54,56,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (78,15,55,45,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (79,15,56,55,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (80,15,57,23,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (1,1,78,67,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (2,1,79,50,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (3,1,82,60,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (4,1,76,55,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (5,1,75,23,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (6,2,78,null,'a',to_date('29-FEB-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (7,2,79,null,'a',to_date('29-FEB-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (8,2,82,56,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (9,2,76,70,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (10,2,75,57,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (11,3,78,70,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (12,3,79,67,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (13,3,82,57,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (14,3,76,47,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (15,3,75,57,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (16,4,78,56,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (17,4,79,70,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (18,4,82,57,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (19,4,76,67,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (20,4,75,78,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (21,5,78,67,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (22,5,79,56,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (23,5,82,48,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (24,5,76,67,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (25,5,75,null,'a',to_date('29-FEB-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (26,6,78,70,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (27,6,79,null,'a',to_date('29-FEB-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (28,6,82,23,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (29,6,76,67,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (30,6,75,76,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (31,7,78,56,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (32,7,79,67,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (33,7,82,76,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (34,7,76,77,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (35,7,75,67,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (36,8,78,77,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (37,8,79,67,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (38,8,82,null,'a',to_date('29-FEB-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (39,8,76,78,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (40,8,75,67,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (109,20,24,null,null,to_date('03-MAR-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (110,20,26,null,null,to_date('03-MAR-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (111,20,15,56,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (112,20,68,67,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (113,20,11,56,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (114,20,70,45,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (115,20,42,33,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (116,21,24,45,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (117,21,26,56,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (118,21,15,67,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (119,21,68,33,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (120,21,11,45,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (121,21,70,null,null,to_date('03-MAR-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (122,21,42,null,null,to_date('03-MAR-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (123,22,24,56,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (124,22,26,67,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (125,22,15,45,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (126,22,68,23,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (127,22,11,70,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (128,22,70,75,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (129,22,42,76,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (130,23,24,45,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (131,23,26,23,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (132,23,15,67,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (133,23,68,74,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (134,23,11,67,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (135,23,70,34,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (136,23,42,78,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (137,24,80,56,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (138,24,81,78,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (139,24,83,60,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (140,24,21,50,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (141,24,28,45,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (142,24,16,23,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (143,24,38,null,null,to_date('03-MAR-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (144,24,39,null,null,to_date('03-MAR-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (145,24,40,67,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (146,24,41,45,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (147,24,52,67,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (148,24,53,56,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (149,24,60,45,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (150,24,62,34,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (151,24,25,23,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (152,24,80,56,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (153,24,81,67,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (154,24,83,45,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (155,24,21,34,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (156,24,28,56,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (157,24,16,67,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (158,24,38,null,null,to_date('03-MAR-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (159,24,39,56,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (160,24,40,63,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (161,24,41,null,null,to_date('03-MAR-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (162,24,52,67,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (163,24,53,56,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (164,24,60,45,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (165,24,62,65,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (166,24,25,34,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (167,25,80,67,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (168,25,81,45,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (169,25,83,67,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (170,25,21,45,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (171,25,28,34,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (172,25,16,75,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (173,25,38,73,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (174,25,39,64,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (175,25,40,63,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (176,25,41,58,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (177,25,52,null,null,to_date('03-MAR-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (178,25,53,null,null,to_date('03-MAR-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (179,25,60,56,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (180,25,62,65,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (181,25,25,45,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (182,26,80,56,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (183,26,81,45,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (184,26,83,32,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (185,26,21,23,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (186,26,28,67,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (187,26,16,64,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (188,26,38,73,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (189,26,39,78,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (190,26,40,null,null,to_date('03-MAR-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (191,26,41,56,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (192,26,52,48,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (193,26,53,78,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (194,26,60,58,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (195,26,62,73,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (196,26,25,72,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (197,26,null,null,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (198,27,80,45,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (199,27,81,67,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (200,27,83,73,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (201,27,21,78,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (202,27,28,80,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (203,27,16,45,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (204,27,38,33,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (205,27,39,23,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (206,27,40,45,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (207,27,41,38,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (208,27,52,56,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (209,27,53,66,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (210,27,60,77,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (211,27,62,65,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (212,27,25,63,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (213,27,null,null,null,to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (81,16,24,null,'a',to_date('29-FEB-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (82,16,26,null,'a',to_date('29-FEB-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (83,16,15,56,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (84,16,68,70,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (85,16,11,66,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (86,16,70,23,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (87,16,42,null,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (88,17,24,66,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (89,17,26,45,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (90,17,15,23,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (91,17,68,45,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (92,17,11,67,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (93,17,70,78,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (94,17,42,80,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (95,18,24,56,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (96,18,26,60,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (97,18,15,70,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (98,18,68,56,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (99,18,11,67,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (100,18,70,78,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (101,18,42,67,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (102,19,24,55,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (103,19,26,67,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (104,19,15,45,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (105,19,68,67,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (106,19,11,78,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (107,19,70,56,'a',to_date('29-FEB-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (108,19,42,null,'a',to_date('29-FEB-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (214,28,80,67,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (215,28,81,75,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (216,28,83,45,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (217,28,21,56,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (218,28,28,45,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (219,28,16,35,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (220,28,38,null,'a',to_date('03-MAR-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (221,28,39,null,'a',to_date('03-MAR-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (222,28,40,23,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (223,28,41,67,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (224,28,52,76,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (225,28,53,80,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (226,28,60,56,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (227,28,62,60,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (228,28,25,75,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (229,28,null,null,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (230,29,80,56,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (231,29,81,80,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (232,29,83,67,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (233,29,21,45,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (234,29,28,67,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (235,29,16,34,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (236,29,38,60,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (237,29,39,70,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (238,29,40,56,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (239,29,41,78,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (240,29,52,63,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (241,29,53,54,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (242,29,60,56,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (243,29,62,49,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (244,29,25,78,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (245,29,null,null,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (246,30,80,78,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (247,30,81,45,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (248,30,83,67,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (249,30,21,56,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (250,30,28,58,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (251,30,16,78,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (252,30,38,76,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (253,30,39,57,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (254,30,40,49,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (255,30,41,48,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (256,30,52,57,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (257,30,53,59,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (258,30,60,66,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (259,30,62,49,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (260,30,25,32,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (261,30,null,null,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (262,31,80,67,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (263,31,81,48,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (264,31,83,73,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (265,31,21,73,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (266,31,28,66,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (267,31,16,63,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (268,31,38,55,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (269,31,39,49,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (270,31,40,56,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (271,31,41,60,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (272,31,52,64,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (273,31,53,null,'a',to_date('03-MAR-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (274,31,60,null,'a',to_date('03-MAR-24','DD-MON-RR'),'Yes');
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (275,31,62,56,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (276,31,25,54,'a',to_date('03-MAR-24','DD-MON-RR'),null);
Insert into RESULT_D (RESULT_D_ID,RESULT_M_ID,STUDENT_ID,OBTAINED_MARKS,ACTION_USER,ACTION_DATE_TIME,ABSENT) values (277,31,null,null,'a',to_date('03-MAR-24','DD-MON-RR'),null);
end ;


--==================
--expense_type table
--==================

drop table expense_type cascade constraint ;

create table expense_type
(
expense_type_id             number,
expense_type_name           varchar2(100) constraint expense_type_expense_type_name_nn not null
                                          constraint expense_type_expense_type_name_uk unique  ,
expense_type_description    varchar2(250),
action_user                 varchar2(100) default user,
action_date_time            date          default sysdate
) ;

alter table expense_type
add         constraint expense_type_expense_type_id_pk primary key(expense_type_id) ;


begin
Insert into Expense_Type ( Expense_Type_ID, Expense_Type_Name )
Values                    (1, 'Operating Expenses');

Insert into Expense_Type ( Expense_Type_ID, Expense_Type_Name )
Values                    (2, 'Cost of Goods Sold');

Insert into Expense_Type ( Expense_Type_ID, Expense_Type_Name )
Values                    (3, 'Marketing Expenses');

Insert into Expense_Type ( Expense_Type_ID, Expense_Type_Name )
Values                    (4, 'Travel Expenses');

Insert into Expense_Type ( Expense_Type_ID, Expense_Type_Name )
Values                    (5, 'Office Supplies Expenses');

Insert into Expense_Type ( Expense_Type_ID, Expense_Type_Name )
Values                    (6, 'Rent Expenses');

Insert into Expense_Type ( Expense_Type_ID, Expense_Type_Name )
Values                    (7, 'Utility Expenses');

Insert into Expense_Type ( Expense_Type_ID, Expense_Type_Name )
Values                    (8, 'Insurance Expenses');

Insert into Expense_Type ( Expense_Type_ID, Expense_Type_Name )
Values                    (9, 'Taxes Expenses');

Insert into Expense_Type ( Expense_Type_ID, Expense_Type_Name )
Values                    (10, 'Interest Expenses');

Insert into Expense_Type ( Expense_Type_ID, Expense_Type_Name )
Values                    (11, 'Depreciation Expenses');

Insert into Expense_Type ( Expense_Type_ID, Expense_Type_Name )
Values                    (12, 'Amortization Expenses');
end ;

--==================
--expense_m table
--==================

drop table expense_m cascade constraint ;

create table expense_m
(
expense_m_id           number,
department_id          number,
expense_date           date          constraint expense_m_expense_date_nn not null
                                     constraint expense_m_expense_date_uk unique  ,
expense_m_description  varchar2(250),
action_user            varchar2(100) default user,
action_date_time       date          default sysdate
) ;

alter table expense_m
add         constraint expense_m_expense_m_id_pk primary key(expense_m_id) ;

alter table expense_m
add         constraint expense_m_department_id_fk foreign key(department_id)
references  department(department_id) ;


begin
insert into expense_m (expense_m_id, department_id, expense_date)
values      (1, 2, to_date('02-May-2020', 'dd-Mon-rrrr')) ;

insert into expense_m (expense_m_id, department_id, expense_date)
values      (2, 1, to_date('02-Feb-2023', 'dd-Mon-rrrr')) ;

insert into expense_m (expense_m_id, department_id, expense_date)
values      (3, 4, to_date('03-Mar-2022', 'dd-Mon-rrrr')) ;

insert into expense_m (expense_m_id, department_id, expense_date)
values      (4, 3, to_date('04-Apr-2021', 'dd-Mon-rrrr')) ;

insert into expense_m (expense_m_id, department_id, expense_date)
values      (5, 1, to_date('05-May-2020', 'dd-Mon-rrrr')) ;

insert into expense_m (expense_m_id, department_id, expense_date)
values      (6, 4, to_date('06-Jun-2023', 'dd-Mon-rrrr')) ;

insert into expense_m (expense_m_id, department_id, expense_date)
values      (7, 2, to_date('07-Jul-2022', 'dd-Mon-rrrr')) ;

insert into expense_m (expense_m_id, department_id, expense_date)
values      (8, 3, to_date('08-Aug-2021', 'dd-Mon-rrrr')) ;

insert into expense_m (expense_m_id, department_id, expense_date)
values      (9, 1,to_date('09-Sep-2020', 'dd-Mon-rrrr')) ;

insert into expense_m (expense_m_id, department_id, expense_date)
values      (10,3,to_date('10-Oct-2023', 'dd-Mon-rrrr')) ;

insert into expense_m (expense_m_id, department_id, expense_date)
values      (11,1,to_date('11-Nov-2022', 'dd-Mon-rrrr')) ;

insert into expense_m (expense_m_id, department_id, expense_date)
values      (12,4,to_date('12-Dec-2021', 'dd-Mon-rrrr')) ;
end ;



--==================
--expense_d table
--==================

drop table expense_d cascade constraint ;

create table expense_d
(
expense_d_id           number,
expense_m_id           number,
expense_type_id        number        constraint expense_d_expense_type_id_nn not null ,
expense_amount         number        constraint expense_d_expense_amount_nn not null ,
payment_mode           varchar2(100) constraint expense_d_payment_made_nn not null ,
expense_by             number,
description            varchar2(250),
action_user            varchar2(100) default user,
action_date_time       date          default sysdate
) ;

alter table expense_d
add         constraint expense_d_expense_d_id_pk primary key(expense_d_id) ;

alter table expense_d
add         constraint expense_d_expense_m_id_fk foreign key(expense_m_id)
references  expense_m(expense_m_id) ;

alter table expense_d
add         constraint expense_d_expense_type_id_fk foreign key(expense_type_id)
references  expense_type(expense_type_id) ;

alter table expense_d
add         constraint expense_d_expense_by_fk foreign key(expense_by)
references  employee(employee_id) ;

begin
INSERT INTO expense_d (expense_M_id, expense_type_id, expense_amount, payment_mode, expense_by, description)
VALUES (1, 1, 1000, 'Cash', 1, 'Operating expenses for the month of January');

INSERT INTO expense_d (expense_M_id, expense_type_id, expense_amount, payment_mode, expense_by, description)
VALUES (2, 2, 2000, 'Credit Card', 2, 'Cost of goods sold for the month of February');

INSERT INTO expense_d (expense_M_id, expense_type_id, expense_amount, payment_mode, expense_by, description)
VALUES (3, 3, 3000, 'Debit Card', 3, 'Marketing expenses for the month of March');

INSERT INTO expense_d (expense_M_id, expense_type_id, expense_amount, payment_mode, expense_by, description)
VALUES (4, 4, 4000, 'Cash', 4, 'Travel expenses for the month of April');

INSERT INTO expense_d (expense_M_id, expense_type_id, expense_amount, payment_mode, expense_by, description)
VALUES (5, 5, 5000, 'Credit Card', 5, 'Office supplies expenses for the month of May');

INSERT INTO expense_d (expense_M_id ,expense_type_id, expense_amount, payment_mode, expense_by, description)
VALUES (6, 6, 6000, 'Debit Card', 6, 'Rent expenses for the month of June');

INSERT INTO expense_d (expense_M_id, expense_type_id, expense_amount, payment_mode, expense_by, description)
VALUES (7, 7, 7000, 'Cash', 7, 'Utility expenses for the month of July');

INSERT INTO expense_d (expense_M_id ,expense_type_id ,expense_amount, payment_mode ,expense_by ,description)
VALUES (8, 8, 8000, 'Credit Card', 8, 'Insurance expenses for the month of August');

INSERT INTO expense_d (expense_M_id, expense_type_id, expense_amount, payment_mode, expense_by ,description)
VALUES (9 , 9, 9000, 'Debit Card', 9, 'Taxes expenses for the month of September');

INSERT INTO expense_d (expense_M_id, expense_type_id, expense_amount, payment_mode, expense_by ,description)
VALUES (10, 10, 10000, 'Cash', 10, 'Interest expenses for the month of October');

INSERT INTO expense_d (expense_M_id, expense_type_id, expense_amount, payment_mode, expense_by ,description)
VALUES (11, 11, 11000, 'Credit Card', 11, 'Depreciation expenses for the month of November');

INSERT INTO expense_d (expense_M_id, expense_type_id, expense_amount, payment_mode, expense_by, description)
VALUES (12, 12, 12000, 'Debit Card', 12, 'Amortization expenses for the month of December');
end ;

--months table

drop table months cascade constraints ;

create table months
(
 month_id number GENERATED ALWAYS AS IDENTITY,
 month_name varchar2(100)
) ;

alter table months
add         constraint months_month_id_pk primary key(month_id) ;

begin
Insert into MONTHS (MONTH_NAME) values ('January');
Insert into MONTHS (MONTH_NAME) values ('February');
Insert into MONTHS (MONTH_NAME) values ('March');
Insert into MONTHS (MONTH_NAME) values ('April');
Insert into MONTHS (MONTH_NAME) values ('May');
Insert into MONTHS (MONTH_NAME) values ('June');
Insert into MONTHS (MONTH_NAME) values ('July');
Insert into MONTHS (MONTH_NAME) values ('August');
Insert into MONTHS (MONTH_NAME) values ('September');
Insert into MONTHS (MONTH_NAME) values ('October');
Insert into MONTHS (MONTH_NAME) values ('November');
Insert into MONTHS (MONTH_NAME) values ('December');
end ;

--fee_amount_m table

drop table fee_amount_m cascade constraints ;

create table fee_amount_m
(
 fee_amount_m_id    number,
 class_id           number constraint fee_amount_m_class_id_nn not null
                           constraint fee_amount_m_class_id_uk unique,
 fee_description    varchar2(250),
 action_user            varchar2(100) default user,
 action_date_time       date          default sysdate
) ;

alter table fee_amount_m
add         constraint fee_amount_m_fee_amount_m_id_pk primary key(fee_amount_m_id) ;

alter table fee_amount_m
add         constraint fee_amount_m_class_id_fk foreign key(class_id)
references  class(class_id) ;

begin
Insert into FEE_AMOUNT_M (FEE_AMOUNT_M_ID,CLASS_ID,ACTION_USER,ACTION_DATE_TIME,FEE_DESCRIPTION) values (1,1,'A',to_date('28-APR-24','DD-MON-RR'),null);
Insert into FEE_AMOUNT_M (FEE_AMOUNT_M_ID,CLASS_ID,ACTION_USER,ACTION_DATE_TIME,FEE_DESCRIPTION) values (2,2,'A',to_date('28-APR-24','DD-MON-RR'),null);
end ;

--fee_amount_d table

drop table fee_amount_d cascade constraints ;

create table fee_amount_d
(
 fee_amount_d_id  number,
 fee_amount_m_id  number,
 month_id         number,
 monthly_fee      number,
 bi_annual_fee    number,
 annual_fee       number,
 action_user      varchar2(100) default user,
 action_date_time date          default sysdate
) ;

alter table fee_amount_d
add         constraint fee_amount_d_fee_amount_d_id_pk primary key(fee_amount_d_id) ;

alter table fee_amount_d
add         constraint fee_amount_d_month_id_fk foreign key(month_id)
references  months(month_id) ;

alter table fee_amount_d
add         constraint fee_amount_d_fee_amount_m_fk foreign key(fee_amount_m_id)
references  fee_amount_m(fee_amount_m_id) ;

alter table fee_amount_d
add         constraint fee_amount_fee_amount_m_id_month_ID_uk unique(fee_amount_m_id, month_ID) ;

begin
Insert into FEE_AMOUNT_D (FEE_AMOUNT_D_ID,FEE_AMOUNT_M_ID,MONTH_ID,MONTHLY_FEE,BI_ANNUAL_FEE,ANNUAL_FEE,ACTION_USER,ACTION_DATE_TIME) values (1,1,1,1000,null,4000,'A',to_date('28-APR-24','DD-MON-RR'));
Insert into FEE_AMOUNT_D (FEE_AMOUNT_D_ID,FEE_AMOUNT_M_ID,MONTH_ID,MONTHLY_FEE,BI_ANNUAL_FEE,ANNUAL_FEE,ACTION_USER,ACTION_DATE_TIME) values (2,1,2,1000,null,null,'A',to_date('28-APR-24','DD-MON-RR'));
Insert into FEE_AMOUNT_D (FEE_AMOUNT_D_ID,FEE_AMOUNT_M_ID,MONTH_ID,MONTHLY_FEE,BI_ANNUAL_FEE,ANNUAL_FEE,ACTION_USER,ACTION_DATE_TIME) values (3,1,3,1000,null,null,'A',to_date('28-APR-24','DD-MON-RR'));
Insert into FEE_AMOUNT_D (FEE_AMOUNT_D_ID,FEE_AMOUNT_M_ID,MONTH_ID,MONTHLY_FEE,BI_ANNUAL_FEE,ANNUAL_FEE,ACTION_USER,ACTION_DATE_TIME) values (4,2,1,1200,null,4500,'A',to_date('28-APR-24','DD-MON-RR'));
Insert into FEE_AMOUNT_D (FEE_AMOUNT_D_ID,FEE_AMOUNT_M_ID,MONTH_ID,MONTHLY_FEE,BI_ANNUAL_FEE,ANNUAL_FEE,ACTION_USER,ACTION_DATE_TIME) values (5,2,2,1200,null,null,'A',to_date('28-APR-24','DD-MON-RR'));
Insert into FEE_AMOUNT_D (FEE_AMOUNT_D_ID,FEE_AMOUNT_M_ID,MONTH_ID,MONTHLY_FEE,BI_ANNUAL_FEE,ANNUAL_FEE,ACTION_USER,ACTION_DATE_TIME) values (6,1,4,1000,null,null,'A',to_date('28-APR-24','DD-MON-RR'));
Insert into FEE_AMOUNT_D (FEE_AMOUNT_D_ID,FEE_AMOUNT_M_ID,MONTH_ID,MONTHLY_FEE,BI_ANNUAL_FEE,ANNUAL_FEE,ACTION_USER,ACTION_DATE_TIME) values (7,1,5,1000,null,null,'A',to_date('28-APR-24','DD-MON-RR'));
Insert into FEE_AMOUNT_D (FEE_AMOUNT_D_ID,FEE_AMOUNT_M_ID,MONTH_ID,MONTHLY_FEE,BI_ANNUAL_FEE,ANNUAL_FEE,ACTION_USER,ACTION_DATE_TIME) values (8,1,6,1000,1800,null,'A',to_date('28-APR-24','DD-MON-RR'));
Insert into FEE_AMOUNT_D (FEE_AMOUNT_D_ID,FEE_AMOUNT_M_ID,MONTH_ID,MONTHLY_FEE,BI_ANNUAL_FEE,ANNUAL_FEE,ACTION_USER,ACTION_DATE_TIME) values (9,1,7,1000,null,null,'A',to_date('28-APR-24','DD-MON-RR'));
Insert into FEE_AMOUNT_D (FEE_AMOUNT_D_ID,FEE_AMOUNT_M_ID,MONTH_ID,MONTHLY_FEE,BI_ANNUAL_FEE,ANNUAL_FEE,ACTION_USER,ACTION_DATE_TIME) values (10,1,8,1000,null,null,'A',to_date('28-APR-24','DD-MON-RR'));
Insert into FEE_AMOUNT_D (FEE_AMOUNT_D_ID,FEE_AMOUNT_M_ID,MONTH_ID,MONTHLY_FEE,BI_ANNUAL_FEE,ANNUAL_FEE,ACTION_USER,ACTION_DATE_TIME) values (11,1,9,1000,null,null,'A',to_date('28-APR-24','DD-MON-RR'));
Insert into FEE_AMOUNT_D (FEE_AMOUNT_D_ID,FEE_AMOUNT_M_ID,MONTH_ID,MONTHLY_FEE,BI_ANNUAL_FEE,ANNUAL_FEE,ACTION_USER,ACTION_DATE_TIME) values (12,1,10,1000,null,null,'A',to_date('28-APR-24','DD-MON-RR'));
Insert into FEE_AMOUNT_D (FEE_AMOUNT_D_ID,FEE_AMOUNT_M_ID,MONTH_ID,MONTHLY_FEE,BI_ANNUAL_FEE,ANNUAL_FEE,ACTION_USER,ACTION_DATE_TIME) values (13,1,11,1000,1800,null,'A',to_date('28-APR-24','DD-MON-RR'));
Insert into FEE_AMOUNT_D (FEE_AMOUNT_D_ID,FEE_AMOUNT_M_ID,MONTH_ID,MONTHLY_FEE,BI_ANNUAL_FEE,ANNUAL_FEE,ACTION_USER,ACTION_DATE_TIME) values (14,1,12,1000,null,null,'A',to_date('28-APR-24','DD-MON-RR'));
end ;
 
--fee_m table

drop table fee_m cascade constraints ;

create table fee_m
(
fee_m_id       number,
student_id       number,
class_id          number,
sessions           number,
collection_date     date default sysdate,
total_amount        number,
paid_amount         number,
due_amount         number,
action_user         varchar2(100) default user,
action_date_time    date  default sysdate
) ;

alter table fee_m
add   constraint fee_m_fee_m_id_pk primary key(fee_m_id) ;

alter table fee_m
add   constraint fee_m_student_id_fk foreign key (student_id)
references student(student_id) ;

alter table fee_m
add   constraint fee_m_class_id_fk foreign key (class_id)
references class(class_id) ;


--table fee_d 

drop table fee_d cascade constraints ;

create table fee_d
(
fee_d_id         number,
fee_m_id         number,
fee_amount_d_id  number,
monthly_fee      number,
bi_annual_fee    number,
annual_fee       number,
total            number,
action_user      varchar2(100) default user,
action_date_time date  default sysdate
) ;

alter table fee_d
add   constraint fee_d_fee_d_id_pk primary key(fee_d_id) ;

alter table fee_d
add   constraint fee_d_fee_m_id_fk foreign key (fee_m_id)
references fee_m(fee_m_id) ;

alter table fee_d
add   constraint fee_m_fee_amount_id_fk foreign key (fee_amount_D_id)
references fee_amount_D(fee_amount_d_id) ;