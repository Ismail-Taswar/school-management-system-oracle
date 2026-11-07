create or replace procedure pro_re_admission_insert
(
 p_Re_Admission_id     in re_admission.re_admission_id%type,
 p_student_id          in re_admission.student_id%type, 
 p_Re_Admission_date   in re_admission.re_admission_date%type,
 p_current_class_id    in re_admission.current_class_id%type, 
 p_current_section_id  in re_admission.current_section_id%type,
 p_current_roll_number in re_admission.current_roll_number%type,
 p_new_class_id        in re_admission.new_class_id%type, 
 p_new_section_id      in re_admission.new_section_id%type,
 p_new_roll_number     in re_admission.new_roll_number%type,
 p_action_user         in re_admission.action_user%type
)
is
begin
 insert into re_admission(Re_Admission_id, student_id, Re_Admission_date,
                          current_class_id, current_section_id, current_roll_number,
                          new_class_id, new_section_id, new_roll_number,
                          action_user)
 values(p_Re_Admission_id, p_student_id, p_Re_Admission_date, p_current_class_id,
        p_current_section_id, p_current_roll_number, p_new_class_id, p_new_section_id,
        p_new_roll_number, p_action_user);
commit ;
end ;
/


create or replace procedure pro_re_ad_update_student
(
 p_student_id          in student.student_id%type, 
 p_class_id            in student.class_id%type, 
 p_section_id          in student.section_id%type,
 p_roll_number         in student.roll_number%type,
 p_action_user         in student.action_user%type
)
is
begin
 update student
 set         class_id = p_class_id, section_id = p_section_id, roll_number = p_roll_number, action_user = p_action_user
 where  student_id = p_student_id ;
commit ;
end ;
/
