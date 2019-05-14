<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Log In</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="<c:url value='template/web/images/icons/favicon.ico'/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='template/web/fonts/font-awesome-4.7.0/css/font-awesome.min.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='template/web/css/main.css' />">
    <link rel="stylesheet" type="text/css" href="<c:url value='template/admin/css/tuan.css' />">

</head>
<body>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <div class="login100-form-title" style="background-image: url(template/web/images/bg-01.jpg);">
                <span class="login100-form-title-1">Log In</span>
            </div>
            <form class="login100-form validate-form" action="Login" method="post">
                <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
                    <span class="label-input100">Username</span>
                    <input class="input100" type="text" name="username" placeholder="Tên đăng nhập">
                    <span class="focus-input100"></span>
                </div>
                <div class="wrap-input100 validate-input m-b-18" data-validate="Password is required">
                    <span class="label-input100">Password</span>
                    <input class="input100" type="password" name="password" placeholder="Mật khẩu" autocomplete="off">
                    <span class="focus-input100"></span>
                </div>
                <div class="flex-sb-m w-full p-b-30">
                    <div class="contact100-form-checkbox">
                        <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                        <label class="label-checkbox100" for="ckb1">Remember me</label>
                    </div>

                    <div class="fix-tagA">
                        <a href="#" class="txt1">Forgot Password?</a>
                    </div>
                </div>
                <div class="container-login100-form-btn">
                    <button class="login100-form-btn">Login</button>
                </div>
                <%if (session.getAttribute("err") != null) {%>
                <p id="display-err"><%=session.getAttribute("err")%></p>
                <%}session.removeAttribute("err");%>
            </form>
        </div>
    </div>
</div>
<script src="<c:url value='/template/web/js/jquery-3.2.1.min.js'/>"></script>
<script src="<c:url value='/template/web/js/main.js'/>"></script>
</body>
</html>

