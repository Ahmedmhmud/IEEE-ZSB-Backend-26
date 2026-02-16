# Database Research Questions

## 1. What is the difference between a DBMS and an RDBMS?

**DBMS (Database Management System)** is a general software system that allows users to create, manage, and manipulate databases. It can store data in various formats including hierarchical, network, or file-based structures.

**RDBMS (Relational Database Management System)** is a specific type of DBMS that stores data in tables (relations) with rows and columns. The key difference is that RDBMS organizes data based on the relational model, where tables can be linked through relationships using keys (primary keys and foreign keys).

**Key Differences:**
- RDBMS uses structured tables with relationships between them, while DBMS can use various data models
- RDBMS follows ACID properties (Atomicity, Consistency, Isolation, Durability) more strictly
- RDBMS supports SQL for querying, while DBMS may use different query languages
- Examples: MySQL, PostgreSQL, Oracle (RDBMS) vs. XML databases, file systems (DBMS)

## 2. What is the difference between DDL and DML?

**DDL (Data Definition Language)** is used to define and modify the structure of database objects like tables, schemas, and indexes. It deals with the database schema and structure.

**DML (Data Manipulation Language)** is used to manipulate the actual data within the database tables. It deals with inserting, updating, deleting, and retrieving data.

**Example Commands:**

- **DDL Example:**
  ```sql
  CREATE TABLE Students (
      StudentID INT PRIMARY KEY,
      Name VARCHAR(100),
      Age INT
  );
  ```
  This command creates the structure of a table.

- **DML Example:**
  ```sql
  INSERT INTO Students (StudentID, Name, Age)
  VALUES (1, 'John Doe', 20);
  ```
  This command adds actual data into the table.

## 3. Why is Normalization important for a large system like a university database?

Normalization is crucial for a university database because it helps keep the data organized and efficient. Here's why in simple terms:

**Prevents Data Duplication:** Without normalization, you might store the same student information multiple times across different tables (like repeating student names and addresses in enrollment records, grade records, etc.). This wastes storage space and makes the database larger than necessary.

**Ensures Data Consistency:** Imagine if a student's phone number was stored in five different places. If they change their number and you only update it in one place, you'll have conflicting information. Normalization ensures each piece of information is stored in one place, so updates only need to happen once.

**Makes Updates Easier:** In a university system with thousands of students, courses, and records, updating information needs to be simple. If data is normalized, changing a professor's office number means updating just one record, not hundreds.

**Reduces Errors:** When data isn't duplicated unnecessarily, there's less chance of making mistakes or having inconsistent information. For example, you won't accidentally have the same course listed with two different credit hours in different places.

In short, for a large system like a university database with many students, courses, faculty, and departments, normalization keeps everything clean, organized, and manageable.