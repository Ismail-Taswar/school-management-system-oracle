/*
create or replace trigger DEPARTMENT_ID_PK_TRIG
before
insert 
on DEPARTMENT
for each row
begin
select nvl(max(to_number(DEPARTMENT_ID)), 0) + 1
into :new.DEPARTMENT_ID
from DEPARTMENT ;
end ;
/
*/


--1
create or replace trigger CLASS_INFO_ID_PK_TRIG
before
insert 
on CLASS_INFO
for each row
begin
select nvl(max(to_number(CLASS_INFO_ID)), 0) + 1
into :new.CLASS_INFO_ID
from CLASS_INFO ;
end ;
/


--2
CREATE OR REPLACE TRIGGER class_info_sub_unq
BEFORE
INSERT Or UPDATE
ON class_info
for each row
declare
 v_count number ;
BEGIN
 select count(subject_id)
 into   v_count 
 from   class_info
 where  class_id = :new.class_id 
 and    subject_id = :new.subject_id ;

IF v_count > 0 THEN
 RAISE_APPLICATION_ERROR(-20500, 'You cant insert same subject twice.') ;
END IF ;
END class_info_sub_unq ;
/

--3
create or replace trigger ROUTINE_M_ID_PK_TRIG
before
insert 
on ROUTINE_M
for each row
begin
select nvl(max(to_number(ROUTINE_M_ID)),0) + 1
into   :NEW.ROUTINE_M_ID
from   ROUTINE_M ;
end ;
/


--4
create or replace trigger ROUTINE_D_ID_PK_TRIG
before
insert 
on ROUTINE_D
for each row
begin
select nvl(max(to_number(ROUTINE_D_ID)),0) + 1
into   :NEW.ROUTINE_D_ID
from   ROUTINE_D ;
end ;
/


--5

CREATE OR REPLACE TRIGGER routine_class_slot_unq
BEFORE
INSERT
ON ROUTINE_D
for each row
declare
 v_count number ;
 v_routine_m_id routine_d.routine_m_id%type ;
BEGIN

IF    INSERTING THEN v_routine_m_id := :new.routine_m_id ;
select count(routine_d_id)
into   v_count 
from   ROUTINE_D rd, ROUTINE_M rm
where  rd.ROUTINE_M_id = rm.ROUTINE_M_id 
and    class_d_id = :new.class_d_id 
and    START_TIME = :new.START_TIME 
and    day_of_week = (select distinct(day_of_Week)
                      from   routine_m
                      where  routine_m_id = v_routine_m_id) ;
end if ;

IF v_count > 0 THEN
 RAISE_APPLICATION_ERROR(-20500, 'Class already exists in this slot in this day.') ;
END IF ;
END routine_class_slot_unq ;
/


--6
CREATE OR REPLACE TRIGGER routine_class_slot_unq2
BEFORE
INSERT
ON ROUTINE_D
for each row
declare
 v_count number ;
 v_routine_m_id routine_d.routine_m_id%type ;
BEGIN

IF    INSERTING THEN v_routine_m_id := :new.routine_m_id ;
select count(routine_d_id)
into   v_count 
from   ROUTINE_D rd, ROUTINE_M rm
where  rd.ROUTINE_M_id = rm.ROUTINE_M_id 
and    class_d_id = :new.class_d_id 
and    day_of_week = (select distinct(day_of_Week)
                      from   routine_m
                      where  routine_m_id = v_routine_m_id) ;
end if ;

IF v_count > 0 THEN
 RAISE_APPLICATION_ERROR(-20500, 'Class already exists in this day.') ;
END IF ;
END routine_class_slot_unq2 ;
/


--7
create or replace trigger EXAM_M_ID_PK_TRIG
before
insert 
on EXAM_M
for each row
begin
select nvl(max(to_number(EXAM_M_ID)), 0) + 1
into :new.EXAM_M_ID
from EXAM_M ;
end ;
/

--8
create or replace trigger EXAM_D_ID_PK_TRIG
before
insert 
on EXAM_D
for each row
begin
select nvl(max(to_number(EXAM_D_ID)), 0) + 1
into :new.EXAM_D_ID
from EXAM_D ;
end ;
/

--9
create or replace trigger marks_lesser_than_total_TRIG
before
insert or update 
on result_d
for each row
declare
 v_sub_id   number ;
 v_total_marks number ;
begin
 select subject_id
 into   v_sub_id
 from   result_m
 where  result_m_id = :new.result_m_id ;

 select total_marks
 into   v_total_marks 
 from   exam_d 
 where  exam_m_id = (select distinct exam_m_id
                     from   result_m
                     where  result_m_Id = :new.result_m_Id)
 and    subject_id = v_sub_id ;
if :new.obtained_marks > v_total_marks then
 RAISE_APPLICATION_ERROR(-20500, 'Obtained Marks cant be greater than Total Marks.') ;
END IF ;
end marks_lesser_than_total_TRIG ;
/


--10
create or replace trigger fee_amount_D_ID_PK_TRIG
before
insert 
on fee_amount_D
for each row
begin
select nvl(max(to_number(fee_amount_D_ID)), 0) + 1
into :new.fee_amount_D_ID
from fee_amount_D ;
end ;
/


--11
create or replace trigger fee_D_ID_PK_TRIG
before
insert 
on fee_D
for each row
begin
select nvl(max(to_number(fee_D_ID)), 0) + 1
into :new.fee_D_ID
from fee_D ;
end ;
/


--12
create or replace trigger fee_d_fee_amount_d_ID_unique_TRIG
before
insert or update
on fee_D
for each row
declare
 v_student_id number ;
 v_sessions number ;
 v_fee_amount_d_ID   number ;
 v_total_marks number ;
begin
 select distinct student_id, sessions
 into   v_student_id, v_sessions
 from   fee_m
 where  fee_m_id = :new.fee_m_id ;

 select count(fee_amount_d_ID)
 into   v_fee_amount_d_ID
 from   fee_d fd, fee_m fm
 where  fd.fee_m_id = fm.fee_m_id
 and    student_id = v_student_id
 and    sessions = v_sessions
 and    fee_amount_d_ID = :NEW.fee_amount_d_ID ;

if v_fee_amount_d_ID > 0 then
 RAISE_APPLICATION_ERROR(-20500, 'Cant pay fee for same month twice.') ;
END IF ;
end fee_d_fee_amount_d_unique_TRIG ;
/


/*
CREATE OR REPLACE TRIGGER routine_class_slot_unq11
BEFORE
INSERT Or UPDATE
ON ROUTINE_D
for each row
declare
 v_count number ;
 v_routine_m_id routine_d.routine_m_id%type ;
BEGIN

IF    INSERTING THEN v_routine_m_id := :new.routine_m_id ;
select count(routine_d_id)
into   v_count 
from   ROUTINE_D rd, ROUTINE_M rm
where  rd.ROUTINE_M_id = rm.ROUTINE_M_id 
and    class_d_id = :new.class_d_id 
and    START_TIME = :new.START_TIME 
and    day_of_week = (select distinct(day_of_Week)
                      from   routine_m
                      where  routine_m_id = v_routine_m_id) ;
ELSIF UPDATING  THEN v_routine_m_id := :old.routine_m_id ;
select count(routine_d_id)
into   v_count 
from   ROUTINE_D rd, ROUTINE_M rm
where  rd.ROUTINE_M_id = rm.ROUTINE_M_id 
and    class_d_id = :new.class_d_id 
and    START_TIME = :new.START_TIME 
and    day_of_week = (select distinct(day_of_Week)
                      from   routine_m
                      where  routine_m_id = v_routine_m_id) ;
end if ;

IF v_count > 0 THEN
 RAISE_APPLICATION_ERROR(-20500, 'Class already exists in this slot in this day.') ;
END IF ;
END routine_class_slot_unq11 ;
/

select count(day_of_week||class_d_id||START_TIME)
into   v_count 
from   ROUTINE_D rd, ROUTINE_M rm
where  rd.ROUTINE_M_id = rm.ROUTINE_M_id 
and    class_d_id = :new.class_d_id 
and    START_TIME = :new.START_TIME 
group  by day_of_week||class_d_id||START_TIME ;

select count(routine_d_id)
into   v_count 
from   ROUTINE_D rd, ROUTINE_M rm
where  rd.ROUTINE_M_id = rm.ROUTINE_M_id 
and    class_d_id = :new.class_d_id 
and    START_TIME = :new.START_TIME 
and    day_of_week = (select day_of_Week
                      from   routine_m
                      where  routine_m_id = :new.routine_m_id);

*/
