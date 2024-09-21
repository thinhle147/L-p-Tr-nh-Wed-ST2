<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reset Password</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            border: none;
            border-radius: 1rem;
            background-color: #ffffff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        .form-control {
            border-radius: 2rem;
            padding: 10px;
        }
        .btn-custom {
            border-radius: 2rem;
            background-color: #1abc9c;
            border: none;
            color: #fff;
            padding: 10px 20px;
            font-size: 1rem;
            font-weight: bold;
        }
        .btn-custom:hover {
            background-color: #16a085;
        }
        .form-label {
            font-weight: 600;
            color: #333;
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

                        <h3 class="mb-4 text-center">Reset Password</h3>

                        <form id="passwordForm" action="http://localhost:8080/ltwedst2/resetpassword" method="post">

                            <!-- Alert if needed -->
                            <c:if test="${alert != null}">
                                <div class="alert alert-danger" role="alert">
                                        ${alert}
                                </div>
                            </c:if>

                            <!-- Username input -->
                            <div class="form-outline mb-3">
                                <label class="form-label" for="username">Username</label>
                                <input type="text" id="username" name="username" class="form-control" placeholder="Enter your username" required />
                            </div>

                            <!-- Email input -->
                            <div class="form-outline mb-3">
                                <label class="form-label" for="email">Email</label>
                                <input type="email" id="email" name="email" class="form-control" placeholder="Enter your registered email" required />
                            </div>

                            <!-- New Password input -->
                            <div class="form-outline mb-3">
                                <label class="form-label" for="new_psw">New Password</label>
                                <input type="password" id="new_psw" name="new_psw" class="form-control" placeholder="Enter new password" required />
                            </div>

                            <!-- Confirm New Password input -->
                            <div class="form-outline mb-3">
                                <label class="form-label" for="confirm_new_psw">Confirm New Password</label>
                                <input type="password" id="confirm_new_psw" name="confirm_new_psw" class="form-control" placeholder="Confirm new password" required />
                            </div>
                            <p id="error-message" style="color:red; display:none;">Passwords do not match!</p>

                            <!-- Submit button -->
                            <button class="btn btn-custom btn-lg btn-block" type="submit">Submit</button>

                            <hr class="my-4">

                            <!-- Back to login link -->
                            <div class="text-center">
                                <p class="small fw-bold">Remember your password? <a href="./login" class="link-primary">Login</a></p>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    document.getElementById('passwordForm').addEventListener('submit', function(event) {
        var newPassword = document.getElementById('new_psw').value;
        var confirmPassword = document.getElementById('confirm_new_psw').value;
        var errorMessage = document.getElementById('error-message');

        if (newPassword !== confirmPassword) {
            event.preventDefault(); // Ngăn form submit
            errorMessage.style.display = 'block'; // Hiển thị thông báo lỗi
        } else {
            errorMessage.style.display = 'none'; // Ẩn thông báo lỗi nếu mật khẩu khớp
            // Form sẽ submit nếu mật khẩu khớp
        }
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
