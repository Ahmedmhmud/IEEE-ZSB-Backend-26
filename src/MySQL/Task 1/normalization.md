# The Normalization challenge

## First Normal Form (1NF)
### First of all: What we need to start with is the multi-valued attribute and solve the composite attribute issue.
#### How to solve it? By separating it in a new entity for it, and removing address attribute and adding its components.

### So the result is in the 1st normal form like this:
#### Student_Grade_Report (Student_ID, Student_Name, City, Street, Zip, Course_Title, Instructor_Name, Instructor_Dept, Dept_Building, Grade)
#### Student_Phone (Student_ID, Phone_Number)
##### Note: Adding Student ID attribute for proper primary key.

## Second Normal Form (2NF)
### What we need to do here is separate all the info of the student so that non-key attributes depend on the whole key only.
#### We solve it by moving student data into its own table and keeping only Student_ID in the grade report.

### So the result is in the 2nd normal form like this:
#### Student (Student_ID, Student_Name, City, Street, Zip)
#### Student_Grade_Report (Student_ID, Course_Title, Instructor_Name, Instructor_Dept, Dept_Building, Grade)
#### Student_Phone (Student_ID, Phone_Number)

## Third Normal Form (3NF)
### Now we remove transitive dependency, because Dept_Building is depending on Instructor_Dept.
#### We solve it by separating department data into its own table and keeping only Instructor_Dept in the grade report.

### So the result is in the 3rd normal form like this:
#### Department (Instructor_Dept, Dept_Building)
#### Student (Student_ID, Student_Name, City, Street, Zip)
#### Student_Grade_Report (Student_ID, Course_Title, Instructor_Name, Instructor_Dept, Grade)
#### Student_Phone (Student_ID, Phone_Number)

