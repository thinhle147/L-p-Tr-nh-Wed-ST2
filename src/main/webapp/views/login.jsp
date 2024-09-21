<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(45deg, #2196F3, #E91E63);
            font-family: 'Roboto', sans-serif;
        }
        .login-container {
            width: 400px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            padding: 20px;
        }
        .login-header {
            text-align: center;
            font-size: 24px;
            font-weight: 500;
            margin-bottom: 20px;
        }
        .input-field input[type="text"],
        .input-field input[type="password"] {
            border-bottom: 2px solid #e91e63;
        }
        .btn {
            width: 100%;
            background: #e91e63;
        }
        .forgot-password {
            text-align: right;
        }
        .social-icons a {
            color: #2196F3;
            margin: 0 10px;
            font-size: 24px;
        }
        .footer {
            margin-top: 20px;
            text-align: center;
        }
        .footer p {
            font-size: 12px;
        }
        .footer a {
            color: #e91e63;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <div class="login-header">Sign In</div>

        <form action="http://localhost:8080/ltwedst2/login" method="post">
            <!-- Alert Script -->
            <script>
                window.onload = function() {
                    var alertMessage = "${alert}";
                    if (alertMessage) {
                        M.toast({html: alertMessage, classes: 'rounded'}); // Hiển thị thông báo Materialize Toast
                    }
                }
            </script>

            <!-- Username input -->
            <div class="input-field">
                <input id="username" name="uname" type="text" class="validate" required>
                <label for="username">Username</label>
            </div>

            <!-- Password input -->
            <div class="input-field">
                <input id="password" name="psw" type="password" class="validate" required>
                <label for="password">Password</label>
            </div>

            <div class="forgot-password">
                <a href="./resetpassword">Forgot password?</a>
            </div>

            <!-- Login Button -->
            <div class="input-field">
                <button class="btn waves-effect waves-light" type="submit">Login</button>
            </div>

            <!-- Sign Up Link -->
            <div class="footer">
                <p>Don't have an account? <a href="./register">Register here</a></p>
            </div>
        </form>

        <!-- Social Media Icons -->
        <div class="social-icons center-align">
            <a href="#"><i class="material-icons">facebook</i></a>
            <a href="#"><i class="material-icons">twitter</i></a>
            <a href="#"><i class="material-icons">google</i></a>
            <a href="#"><i class="material-icons">linkedin</i></a>
        </div>

        <div class="footer">
            <p>Copyright © 2024. All rights reserved.</p>
        </div>
    </div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
