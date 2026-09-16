<%@ page import="java.util.List" %>
<%@ page import="com.studentregistration.dao.StudentDAO" %>
<%@ page import="com.studentregistration.model.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Student> students = null;
    String error = null;
    try {
        students = new StudentDAO().getAllStudents();
    } catch (Exception e) {
        error = "Unable to retrieve students: " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Students</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<main class="container">
    <div class="card table-card">
        <div class="table-heading">
            <div>
                <h2>Registered Students</h2>
                <p class="muted">Student records retrieved from MySQL.</p>
            </div>
            <a class="button small" href="students.jsp">Refresh</a>
        </div>

        <% if (error != null) { %>
            <div class="alert error"><%= error %></div>
        <% } else if (students == null || students.isEmpty()) { %>
            <div class="empty">No students have been registered yet.</div>
        <% } else { %>
            <div class="table-wrap">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Course</th>
                        <th>Gender</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (Student student : students) { %>
                        <tr>
                            <td><%= student.getId() %></td>
                            <td><%= student.getName() %></td>
                            <td><%= student.getEmail() %></td>
                            <td><%= student.getPhone() %></td>
                            <td><%= student.getCourse() %></td>
                            <td><%= student.getGender() %></td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        <% } %>
    </div>
</main>
</body>
</html>
