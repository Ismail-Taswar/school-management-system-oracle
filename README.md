# School Management System (Oracle Forms, Reports & APEX)

A desktop + web school management system built as a university course project.
Covers admissions, students, classes, exams, results,
fees, expenses, attendance, routines, employees, and role-based users — with
 printable reports.

## Tech Stack

- **Oracle Forms Builder** (10g/11g) — data-entry modules (`.fmb` sources + `.fmx` runtime)
- **Oracle Reports Builder** — printable reports (`.rdf`)
- **Oracle APEX** — web modules (app export `Apex/f37592_*.sql`, table script, functions, procedures, triggers, views)
- **Oracle Database** — schema via SQL table scripts; local DB data backup included

## Modules

| Area | Forms |
|------|-------|
| Students | ADMISSION, RE_ADMISSION, STUDENT, SECTION |
| Academics | CLASS, CLASS_D, SUBJECT, SHIFT, ROUTINE, EXAM, EXAM_CATEGORY, EXAM_TYPE, RESULT |
| Finance | FEE_TYPE, FEE_AMOUNT, FEE_MD, EXPENSE_TYPE |
| Attendance | ATTENDANCE_E, ATTENDANCE_MD |
| HR | DEPARTMENT, DESIGNATION, EMPLOYEE |
| System | LOGIN_PAGE, HOMEPAGE, USER_INFO, USER_TYPE, USER_STATUS, USER_ACCESSS_PRIVILEGE, FORM_INFORMATION |

Reports include admission forms, class-wise results and attendance, exam
routines, employee lists, and BI Publisher / HTML-CSS report variants under
`Reports/` and `Apex/Reports/`.

## Repository Layout

```
Forms/           .fmb sources + .fmx runtime modules
Reports/         .rdf report definitions
Apex/            APEX app exports, SQL scripts (tables, functions, procedures, triggers, views)
Documents/       ERD (xlsx), full table scripts, report queries
Databackup/      Oracle data backups
Menu/            Forms menus (.mmb/.mmx)
Object_Library/  shared Forms object library (.olb)
Icons/, Images/  UI assets
```

## How to Run

1. Create a schema in Oracle DB and run `Documents/Table_Script_School.txt`
   (plus `Common_Table_Script_School.txt`), then `Documents/DB_Function.txt`,
   `DB_Procedure.txt`, `DB_View.txt`.
2. Open `.fmb` files in Oracle Forms Builder, connect to the schema, and compile
   (Ctrl+Shift+K, then Ctrl+T) to regenerate `.fmx`.
3. For the APEX side: run `Apex/Apex_TableScript_Cloud.txt`, then import
   `Apex/f37592_Class.sql` into an APEX workspace.
4. `Databackup/` contains DB export dumps for restoring sample data (IMPDP).

## Author

Ismail Taswar ([@Ismail-Taswar](https://github.com/Ismail-Taswar)) — educational project.
