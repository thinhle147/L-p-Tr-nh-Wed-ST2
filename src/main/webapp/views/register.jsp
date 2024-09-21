<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #e9f7ef;
        }
        .card {
            border-radius: 1.5rem;
            background: linear-gradient(135deg, #fefefe 30%, #d5f5e3);
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
        }
        .form-control {
            border-radius: 2rem;
            padding: 10px;
        }
        .btn-custom {
            background-color: #1abc9c;
            border: none;
            color: white;
            border-radius: 2rem;
            padding: 10px 15px;
            font-size: 1rem;
            font-weight: bold;
        }
        .btn-custom:hover {
            background-color: #16a085;
        }
        .form-label {
            color: #333;
            font-weight: bold;
        }
        .alert {
            border-radius: 0.5rem;
            font-weight: bold;
        }
    </style>
</head>
<body>
<section class="vh-100">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-7 col-lg-5 col-xl-4">
                <div class="card">
                    <div class="card-body p-4">

                        <h3 class="mb-4 text-center">Create an Account</h3>

                        <form action="http://localhost:8080/ltwedst2/register" method="post">

                            <!-- Alert if needed -->
                            <c:if test="${alert != null}">
                                <div class="alert alert-danger" role="alert">
                                        ${alert}
                                </div>
                            </c:if>

                            <!-- Full Name input -->
                            <div class="form-outline mb-3">
                                <label class="form-label" for="fullname">Full Name</label>
                                <input type="text" id="fullname" name="fullname" class="form-control" placeholder="Enter your full name" required />
                            </div>

                            <!-- Email input -->
                            <div class="form-outline mb-3">
                                <label class="form-label" for="email">Email</label>
                                <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required />
                            </div>

                            <!-- Username input -->
                            <div class="form-outline mb-3">
                                <label class="form-label" for="username">Username</label>
                                <input type="text" id="username" name="username" class="form-control" placeholder="Enter your username" required />
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-3">
                                <label class="form-label" for="password">Password</label>
                                <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required />
                            </div>

                            <!-- Confirm Password input -->
                            <div class="form-outline mb-3">
                                <label class="form-label" for="psw_confirm">Confirm Password</label>
                                <input type="password" id="psw_confirm" name="psw_confirm" class="form-control" placeholder="Confirm your password" required />
                            </div>

                            <!-- Submit button -->
                            <button class="btn btn-custom btn-lg btn-block" type="submit">Sign Up</button>

                            <hr class="my-4">

                            <!-- Login link -->
                            <div class="text-center">
                                <p class="small fw-bold">Already have an account? <a href="./login" class="link-primary">Login</a></p>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
