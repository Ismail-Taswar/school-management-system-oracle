--1

create or replace function f_section_name
(
 P_section_id in section.section_id%type
)
return section.section_name%type
is
 v_section_name section.section_name%type ;
 begin
SELECT section_name
into   v_section_name
from   section
where  section_id = P_section_id ;
return v_section_name ;
end  f_section_name ;
/


select f_shift_name(CURRENT_shift_ID) current_shift_name, f_shift_name(new_shift_id) new_shift_name,
       f_class_name(current_class_id) current_class_name, f_shift_name(new_class_id) new_class_name,
      f_section_name(CURRENT_SECTION_ID) current_section_name, f_section_name(NEW_SECTION_ID) new_section_name
from   re_admission ;




--2

create or replace function f_class_name
(
 P_class_id in class.class_id%type
)
return class.class_name%type
is
 v_class_name class.class_name%type ;
 begin
SELECT class_name
into   v_class_name
from   class
where  class_id = P_class_id ;
return v_class_name ;
end  f_class_name ;
/


select f_class_name(CURRENT_class_ID) current_class_name, f_class_name(NEW_class_ID) new_class_name
from   re_admission ;


select f_shift_name(CURRENT_shift_ID) current_shift_name, f_shift_name(new_shift_id) new_shift_name,
       f_class_name(current_class_id) current_class_name, f_shift_name(new_class_id) new_class_name,
      f_section_name(CURRENT_SECTION_ID) current_section_name, f_section_name(NEW_SECTION_ID) new_section_name
from   re_admission ;


--3

--to show name from student table

create or replace function f_st_std_name
 (p_student_id   student.student_id%type)
return varchar2
is
 v_student_name   varchar2(200) ;
begin
 select first_name||' '||last_name student_name
 into   v_student_name
 from   student 
 where  student_id = p_student_id ;
return v_student_name ;
end  f_st_std_name ;
/


--4

--to show name from admission table

create or replace function f_ad_std_name
 (p_admission_id   admission.admission_id%type)
return varchar2
is
 v_student_name   varchar2(200) ;
begin
 select first_name||' '||last_name student_name
 into   v_student_name 
 from   admission
 where  admission_id = p_admission_id ;
return v_student_name  ;
end  f_ad_std_name ;
/


--5

create or replace function f_letter_grade
 (p_obtained_marks result_d.obtained_marks%type)
return varchar2
is
 v_letter_grade varchar2(100) ;
begin
 if p_obtained_marks between 80 and 100 then 
  v_letter_grade := 'A+' ;
 elsif p_obtained_marks between 70 and 79 then 
  v_letter_grade := 'A' ;
 elsif p_obtained_marks between 60 and 69 then 
  v_letter_grade := 'A-' ;
 elsif p_obtained_marks between 50 and 59 then 
  v_letter_grade := 'B-' ;
 elsif p_obtained_marks between 40 and 49 then 
  v_letter_grade := 'C' ;
 elsif p_obtained_marks between 33 and 39 then 
  v_letter_grade := 'D' ;
 elsif p_obtained_marks between 0 and 32 then 
  v_letter_grade := 'F' ;
  else  v_letter_grade := 'F' ;
 end if ;
return v_letter_grade ;
end f_letter_grade ;
/

--6

create or replace function f_grade_point
 (p_obtained_marks result_d.obtained_marks%type)
return number
is
 v_grade_point number ;
begin
 if p_obtained_marks between 80 and 100 then 
  v_grade_point := 5.00 ;
 elsif p_obtained_marks between 70 and 79 then 
  v_grade_point := 4.00 ;
 elsif p_obtained_marks between 60 and 69 then 
  v_grade_point := 3.50 ;
 elsif p_obtained_marks between 50 and 59 then 
  v_grade_point := 3.00 ;
 elsif p_obtained_marks between 40 and 49 then 
  v_grade_point := 2.00 ;
 elsif p_obtained_marks between 33 and 39 then 
  v_grade_point := 1.00 ;
 elsif p_obtained_marks between 0 and 32 then 
  v_grade_point := 0.00 ;
 else  v_grade_point := 0.00 ;
 end if ;
return V_grade_point;
end f_grade_point;
/


--7

create or replace function f_department_name
(
 P_department_id in department.department_id%type
)
return department.department_name%type
is
 v_department_name department.department_name%type ;
 begin
SELECT department_name
into   v_department_name
from   department
where  department_id = P_department_id ;
return v_department_name ;
end  f_department_name ;
/


--8

create or replace function f_subject_name
(
 P_subject_id in subject.subject_id%type
)
return subject.subject_name%type
is
 v_subject_name subject.subject_name%type ;
 begin
SELECT subject_name
into   v_subject_name
from   subject
where  subject_id = P_subject_id ;
return v_subject_name ;
end  f_subject_name ;
/


--9

create or replace function f_emp_name
 (p_employee_id   employee.employee_id%type)
return varchar2
is
 v_employee_name   varchar2(200) ;
begin
 select first_name||' '||last_name employee_name
 into   v_employee_name
 from   employee
 where  employee_id = p_employee_id ;
return v_employee_name ;
end  f_emp_name ;


-10

create or replace function ins_attendance_md
(
 p_date        in date,
 p_class_id    in class.class_id%type, 
 p_section_id  in section.section_id%type,
 p_action_user in attendance_m.action_user%type
)
return number
is
 v_attendance_m_id attendance_m.attendance_m_id%type;
 v_attendance_d_id attendance_d.attendance_d_id%type;
begin

 select nvl(max(to_number(ATTENDANCE_M_ID)),0) + 1
 into   v_attendance_m_id
 from   ATTENDANCE_M  ;

 insert into attendance_m(attendance_m_id, attendance_date, class_id, section_id, action_user)
 values(v_attendance_m_id, p_date , p_class_id   , p_section_id , p_action_user) ;

declare

cursor c_STU_CLS --cursor cursor_name
is

SELECT student_id
from   student s
where  s.section_id = p_section_id
and    s.class_id = p_class_id
order  by student_id ; --to fill the data in preferred order, in this case, roll number

begin

for i in c_STU_CLS

loop
 select nvl(max(to_number(ATTENDANCE_D_ID)),0) + 1
 into   v_attendance_d_id
 from   ATTENDANCE_D  ;

insert into attendance_d(attendance_m_id, student_id, status, attendance_d_id, action_user)
values(                  v_attendance_m_id , i.student_id, 'Present', v_attendance_d_id, p_action_user);

EXIT WHEN c_STU_CLS%NOTFOUND;

end loop;

end;
commit ;
     return v_attendance_m_id ;
END ins_attendance_md ;
/

exec ins_attendance_md(to_date(01012022, 'DDMMRRRR'), 1, 2, 'AA' ) ;



--11

create or replace function f_exam_category_name
(
 P_exam_category_id in exam_category.exam_category_id%type
)
return exam_category.exam_category_name%type
is
 v_exam_category_name  exam_category.exam_category_name%type ;
 begin

SELECT   exam_category_name
into   v_exam_category_name
from  exam_category
where exam_category_id = P_exam_category_id ;
return v_exam_category_name ;
end f_exam_category_name ;
/


--12

create or replace function f_exam_type_name
(
 P_exam_type_id in exam_type.exam_type_id%type
)
return exam_type.exam_type_name%type
is
 v_exam_type_name   exam_type.exam_type_name%type ;
 begin
SELECT exam_type_name
into   v_exam_type_name
from  exam_type
where  exam_type_id = P_exam_type_id ;
return v_exam_type_name ;
end f_exam_type_name ;
/


--13

create or replace function ins_result_md
(
 p_exam_m_id   in result_m.exam_m_id%type,
 p_subject_id  in result_m.subject_id%type, 
 p_action_user in result_m.action_user%type
)
return number
is
 v_result_m_id result_m.result_m_id%type;
 v_result_d_id result_d.result_d_id%type;
begin

 select nvl(max(to_number(result_m_id)),0) + 1
 into   v_result_m_id 
 from   result_m ;

 insert into result_m(result_m_id, exam_m_id, subject_id, action_user)
 values(v_result_m_id, p_exam_m_id, p_subject_id, p_action_user) ;

declare

cursor c_STU_mark --cursor cursor_name
is

SELECT student_id
from   student s
where  s.section_id = (select distinct section_id
                       from   exam_m 
                       where  exam_m_id = p_exam_m_id)
and    s.class_id = (select distinct class_id
                       from   exam_m 
                       where  exam_m_id = p_exam_m_id)
order  by student_id ; --to fill the data in preferred order, in this case, roll number

begin

for i in c_STU_mark

loop
 select nvl(max(to_number(RESULT_D_ID)),0) + 1
 into   v_RESULT_d_id
 from   RESULT_D  ;

insert into result_d(result_m_id, student_id, obtained_marks, absent, result_d_id, action_user)
values(                  v_RESULT_m_id , i.student_id, null, null, v_result_d_id, p_action_user);

EXIT WHEN c_STU_mark%NOTFOUND;

end loop;

end;
commit ;
     return v_result_m_id ;
END ins_result_md ;
/


--14

create or replace function f_month_name
(
 P_month_id in months.month_id%type
)
return months.month_name%type
is
 v_month_name   months.month_name%type ;
 begin
SELECT month_name
into   v_month_name
from  months
where  month_id = P_month_id ;
return v_month_name ;
end f_month_name ;
/


--15

create or replace function f_fee_amt_month
(
 P_fee_amount_d_id in fee_amount_d.fee_amount_d_id%type
)
return months.month_name%type
is
 v_month_name   months.month_name%type ;
 begin
SELECT f_month_name(month_id)
into   v_month_name
from  fee_amount_d
where  fee_amount_d_id = P_fee_amount_d_id ;
return v_month_name ;
end f_fee_amt_month ;
/


--16
create or replace function f_total_fee_cls
(
 p_class_id  in class.class_id%type
)
return number
is
 v_total_fee number ;
begin
        select sum(nvl(MONTHLY_FEE,0)+nvl(BI_ANNUAL_FEE,0)+nvl(ANNUAL_FEE,0))
        into   v_total_fee
        from   fee_amount_d fad, fee_amount_m fam
        where  fad.fee_amount_m_id = fam.fee_amount_m_id
        and    fam.class_id = p_class_id ;
 return v_total_fee ;
end f_total_fee_cls ;
/








