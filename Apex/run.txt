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

----------------------------------------------------------------------
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
 total            number,
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