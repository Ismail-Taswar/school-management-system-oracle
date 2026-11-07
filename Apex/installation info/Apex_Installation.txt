Copy images from apex to ords
create folder config in D:\app\apex23.2_ords_23.4\ords
install jdk



L_DBDDD56_1521 =
  (DESCRIPTION_LIST =
    (DESCRIPTION =
      (ADDRESS = (PROTOCOL = TCP)(HOST = lab1com10)(PORT = 1521))
    )
  )


DBDDD56 =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = lab1com10)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = dbddd56)
    )
  )


SQL> select instance_name from v$instance ;

INSTANCE_NAME
----------------
dbddd56sid


SQL> select name from v$database ;

NAME
---------
DBDDD56


SQL> select name from v$datafile ;

NAME
--------------------------------------------------------------------------------
D:\APP\ORACLE\ORADATA\DBDDD56\SYSTEM01.DBF
D:\APP\ORACLE\ORADATA\DBDDD56\SYSAUX01.DBF
D:\APP\ORACLE\ORADATA\DBDDD56\UNDOTBS01.DBF
D:\APP\ORACLE\ORADATA\DBDDD56\USERS01.DBF



create tablespace apex
datafile 'D:\app\oracle\oradata\DBDDD56\APEX.DBF'
size 500m
autoextend on ;


SQL> select name from v$tablespace ;

NAME
------------------------------
SYSAUX
SYSTEM
UNDOTBS1
USERS
TEMP
APEX

open cmd as administrator

D:

cd D:\app\apex23.2_ords_23.4\apex

sqlplus

sys as sysdba

1:

@apexins APEX APEX TEMP /i/

exit

D:

cd D:\app\apex23.2_ords_23.4\apex

sqlplus

@apex_rest_config

APEX_LISTENER apex123

APEX_REST_PUBLIC_USER apex123


@apxchpwd

username admin

email admin

password Apex#123

alter user APEX_LISTENER IDENTIFIED BY apex123 account unlock ;
alter user APEX_PUBLIC_USER IDENTIFIED BY apex123 account unlock ;
alter user APEX_REST_PUBLIC_USER IDENTIFIED BY apex123 account unlock ;


open cmd 



cd D:\app\apex23.2_ords_23.4\ords

java -jar ords.war --config D:\app\apex23.2_ords_23.4\ords\config install

choose 2

choose 1

host name: lab1com10
listen port: 1521
service name: dbddd56
administrator username: sys
password: sys123
tablespace: apex 
temporary tablespace: temp

option: 1

option: 1

option: 1

http port: 8080

static resources location: D:\app\apex23.2_ords_23.4\ords\images


http://localhost:8080/ords/
http://localhost:8080/ords/apex_admin

username: admin

email: admin

password: Apex#123

workspace: SCHOOL MANAGEMENT SYSTEM
user: sc_ddd56
pass: 123

create batch file for ords server

cd D:\app\apex23.2_ords_23.4\ords
d:
java -jar ords.war --config D:\app\apex23.2_ords_23.4\ords\config serve




