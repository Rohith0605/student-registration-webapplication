package com.studentregistration.controller;

import com.studentregistration.dao.StudentDAO;
import com.studentregistration.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.regex.Pattern;

@WebServlet("/register")
public class RegisterStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Pattern EMAIL_PATTERN =
            Pattern.compile("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$" );
    private static final Pattern PHONE_PATTERN = Pattern.compile("^[0-9]{10}$");

    private final StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = clean(request.getParameter("name"));
        String email = clean(request.getParameter("email"));
        String phone = clean(request.getParameter("phone"));
        String course = clean(request.getParameter("course"));
        String gender = clean(request.getParameter("gender"));

        String error = validate(name, email, phone, course, gender);
        if (error != null) {
            request.setAttribute("error", error);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        try {
            boolean inserted = studentDAO.insertStudent(
                    new Student(name, email, phone, course, gender));

            if (inserted) {
                request.setAttribute("success", "Student registered successfully!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Registration failed. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            if (e.getErrorCode() == 1062) {
                request.setAttribute("error", "This email address is already registered.");
            } else {
                request.setAttribute("error", "Database error: " + e.getMessage());
            }
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    private String validate(String name, String email, String phone, String course, String gender) {
        if (name.isEmpty() || email.isEmpty() || phone.isEmpty()
                || course.isEmpty() || gender.isEmpty()) {
            return "All fields are required.";
        }
        if (name.length() < 2 || name.length() > 100) {
            return "Name must contain between 2 and 100 characters.";
        }
        if (!EMAIL_PATTERN.matcher(email).matches()) {
            return "Enter a valid email address.";
        }
        if (!PHONE_PATTERN.matcher(phone).matches()) {
            return "Phone number must contain exactly 10 digits.";
        }
        if (course.length() > 100) {
            return "Course name is too long.";
        }
        return null;
    }

    private String clean(String value) {
        return value == null ? "" : value.trim();
    }
}
