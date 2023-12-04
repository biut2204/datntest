<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Latform - Login and Register Form Templates</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="../../../resources/dist/vendor/bootstrap-4.5.3/css/bootstrap.min.css" type="text/css">
    <!-- Material design icons -->
    <link rel="stylesheet" href="../../../resources/dist/icons/material-design-icons/css/mdi.min.css" type="text/css">
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300&display=swap" rel="stylesheet">
    <!-- Latform styles -->
    <link rel="stylesheet" href="../../../resources/dist/css/latform-style-1.min.css" type="text/css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="form-wrapper">
    <div class="container">
        <div class="card">
            <div class="card-body">
                <div class="logo">
                    <img src="../../../resources/dist/images/logo-colorful.png" alt="logo">
                </div>
                <div class="my-5 text-center">
                    <h3 class="font-weight-bold mb-3">Reset Password</h3>
                    <p class="text-muted">Nhập và gửi địa chỉ email để đặt lại mật khẩu của bạn.</p>
                    <%--                    <label style="color: red">${tb==1?"Email không khớp với bất kỳ tài khoản nào đã đăng ký":""}</label>--%>
                </div>

                <c:forEach items="${listTK}" var="list">
                    <input type="hidden" value="${list.email}">
                </c:forEach>
                <form action="/guiemail" method="post">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <div class="form-icon-wrapper">
                            <input type="email" class="form-control" id="email" placeholder="Enter email" autofocus
                                   required name="email">
                            <i class="form-icon-left mdi mdi-email"></i>
                        </div>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary btn-block">Gửi</button>
                    </div>
                </form>
                <p class="text-center">Bạn có thể <a href="/login">đăng nhập</a> .</p>
            </div>
        </div>
    </div>
</div>
<!-- Jquery -->
<script src="../../../resources/dist/vendor/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../../../resources/dist/vendor/bootstrap-4.5.3/js/bootstrap.min.js"></script>
<!-- Latform scripts -->
<script src="../../../resources/dist/js/latform.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var hiddenEmails = document.querySelectorAll('input[type="hidden"]');
        var emailInput = document.getElementById('email');
        var sendButton = document.querySelector('.btn-primary');

        sendButton.addEventListener('click', function (event) {
            var enteredEmail = emailInput.value;
            var emailMatched = false;

            var emailFormat = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailFormat.test(enteredEmail)) {
                // Show warning for invalid email format
                Swal.fire({
                    icon: 'warning',
                    html: '<div class="swal-text">Địa chỉ email không hợp lệ</div>',
                    allowOutsideClick: true
                });
                setTimeout(() => {
                    Swal.close();
                }, 1500);
                event.preventDefault(); // Prevent form submission for invalid email format
                return;
            }

            hiddenEmails.forEach(function (hiddenEmail) {
                if (hiddenEmail.value === enteredEmail) {
                    emailMatched = true;
                }
            });

            if (!emailMatched) {
                Swal.fire({
                    icon: 'warning',
                    html: '<div class="swal-text">Email không khớp với bất kỳ tài khoản nào đã đăng ký</div>',
                    allowOutsideClick: true
                });
                setTimeout(() => {
                    Swal.close();
                }, 1500);
                event.preventDefault(); // Ngăn chặn form được gửi đi nếu email không khớp
            }
        });
    });
</script>
</body>
</html>
