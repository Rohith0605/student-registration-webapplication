<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Student</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<main class="container">
    <div class="card form-card">
        <h2>Student Registration</h2>
        <p class="muted">Enter the student details below.</p>

        <% if (request.getAttribute("success") != null) { %>
            <div class="alert success"><%= request.getAttribute("success") %></div>
        <% } %>
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert error"><%= request.getAttribute("error") %></div>
        <% } %>

        <form action="register" method="post" onsubmit="return validateForm()">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" maxlength="100" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" maxlength="120" required>

            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="phone" maxlength="10" pattern="[0-9]{10}" required>

            <label for="course">Course</label>
            <select id="course" name="course" required>
                <option value="">-- Select Course --</option>
                <option value="Computer Science">Computer Science</option>
                <option value="Information Technology">Information Technology</option>
                <option value="Electronics and Communication">Electronics and Communication</option>
                <option value="Electrical Engineering">Electrical Engineering</option>
                <option value="Mechanical Engineering">Mechanical Engineering</option>
            </select>

            <fieldset>
                <legend>Gender</legend>
                <label class="radio"><input type="radio" name="gender" value="Male" required> Male</label>
                <label class="radio"><input type="radio" name="gender" value="Female"> Female</label>
                <label class="radio"><input type="radio" name="gender" value="Other"> Other</label>
            </fieldset>

            <button class="button" type="submit">Register Student</button>
        </form>
    </div>
</main>
<script>
function validateForm() {
    const phone = document.getElementById('phone').value.trim();
    if (!/^\d{10}$/.test(phone)) {
        alert('Phone number must contain exactly 10 digits.');
        return false;
    }
    return true;
}
</script>
</body>
</html>
