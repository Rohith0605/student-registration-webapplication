package com.studentregistration.dao;

import com.studentregistration.model.Student;
import com.studentregistration.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    private static final String INSERT_SQL =
            "INSERT INTO students (name, email, phone, course, gender) VALUES (?, ?, ?, ?, ?)";

    private static final String SELECT_ALL_SQL =
            "SELECT id, name, email, phone, course, gender FROM students ORDER BY id DESC";

    public boolean insertStudent(Student student) throws SQLException {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_SQL)) {

            statement.setString(1, student.getName());
            statement.setString(2, student.getEmail());
            statement.setString(3, student.getPhone());
            statement.setString(4, student.getCourse());
            statement.setString(5, student.getGender());

            return statement.executeUpdate() == 1;
        }
    }

    public List<Student> getAllStudents() throws SQLException {
        List<Student> students = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_SQL);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                students.add(new Student(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("email"),
                        resultSet.getString("phone"),
                        resultSet.getString("course"),
                        resultSet.getString("gender")
                ));
            }
        }

        return students;
    }
}
