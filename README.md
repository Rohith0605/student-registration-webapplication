# Student Registration Web Application

A college-lab Student Registration Web Application built with HTML Frames, JSP, Java Servlet, JDBC and MySQL.

## Features

- HTML Frames based interface
- Student registration form
- Client-side and server-side validation
- Servlet processing
- JDBC + MySQL database connectivity
- Student insertion and retrieval
- View all registered students
- Success and error messages

## Technology

- HTML5 / CSS3
- JSP
- Java Servlet API (`javax.servlet`, suitable for Tomcat 9)
- JDBC
- MySQL
- Apache Tomcat 9+

## Project structure

```text
student-registration-webapplication/
├── README.md
├── database/
│   └── student_registration.sql
└── src/main/
    ├── java/com/studentregistration/
    │   ├── controller/RegisterStudentServlet.java
    │   ├── dao/StudentDAO.java
    │   ├── model/Student.java
    │   └── util/DBConnection.java
    └── webapp/
        ├── index.html
        ├── header.html
        ├── menu.html
        ├── home.html
        ├── register.jsp
        ├── students.jsp
        ├── css/style.css
        └── WEB-INF/web.xml
```

## Database setup

1. Start MySQL.
2. Run `database/student_registration.sql` in MySQL Workbench or the MySQL command line.
3. Open `DBConnection.java` and change the username/password if your MySQL credentials differ.

## Run with Tomcat

1. Create/import the project as a Dynamic Web Project in Eclipse, IntelliJ IDEA, or another Java IDE.
2. Add MySQL Connector/J to the project/server classpath.
3. Deploy to Apache Tomcat 9.
4. Open:

`http://localhost:8080/student-registration-webapplication/`

> If your server uses Tomcat 10/10.1+, change the imports from `javax.servlet.*` to `jakarta.servlet.*` and use the corresponding Jakarta Servlet API.
