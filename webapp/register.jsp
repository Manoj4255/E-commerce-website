<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration - ChromaCart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }
        header {
            background-color: #232f3e; /* Amazon-like header color */
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        h1 {
            margin: 0;
            font-size: 24px;
        }
        .auth-box {
            background-color: #37475a; /* Darker shade for auth box */
            border-radius: 4px;
            padding: 10px;
            font-size: 14px;
        }
        .auth-box a {
            color: #ff9900; /* Amazon orange for links */
            text-decoration: none;
        }
        .container {
            max-width: 400px;
            margin: 20px auto; /* Center the container */
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        h2 {
            color: #333;
            text-align: center;
        }
        .form-section {
            margin: 20px 0; /* Space between sections */
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9; /* Light background for form */
        }
        form {
            margin: 0; /* Remove margin to align with the form section */
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box; /* Ensures padding is included in the width */
        }
        input[type="submit"] {
            background-color: #ff9900; /* Amazon's signature orange */
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #e68a00; /* Darker orange on hover */
        }
        .error-message {
            color: red;
            text-align: center;
            margin: 10px 0;
        }
        .login-link {
            text-align: center;
            margin-top: 20px;
        }
        .login-link a {
            color: #0073e6; /* Amazon-like blue for links */
            text-decoration: none;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <h1>ChromaCart</h1>
        <div class="auth-box">
            <a href="login.jsp">Login</a> | <a href="register.jsp">Sign Up</a>
        </div>
    </header>
    
    <div class="container">
        <h2>User Registration</h2>

        <% String error = request.getParameter("error"); %>
        <% if ("true".equals(error)) { %>
            <p class="error-message">Registration failed. Please try again.</p>
        <% } %>

        <div class="form-section">
            <form action="user" method="post" onsubmit="return validateForm();">
                <input type="hidden" name="action" value="register"/>
                <label for="username">Username:</label>
                <input type="text" name="username" required/>

                <label for="password">Password:</label>
                <input type="password" name="password" required/>

                <label for="email">Email:</label>
                <input type="email" name="email" required/>

                <input type="submit" value="Register"/>
            </form>
        </div>

        <div class="login-link">
            <p>Already have an account? <a href="login.jsp">Login here.</a></p>
        </div>
    </div>

    <script>
        function validateForm() {
            var password = document.getElementsByName("password")[0].value;
            return true; // Modify if confirm password logic is added
        }
    </script>
</body>
</html>
