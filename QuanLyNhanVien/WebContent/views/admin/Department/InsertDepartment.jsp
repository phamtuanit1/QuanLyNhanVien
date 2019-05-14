<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Thêm phòng ban</title>
    <link rel="icon" type="image/png" href="<c:url value="/template/admin/icons/form.ico"/>"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/template/admin/css/main.css"/>"/>
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value="/template/admin/css/tuan.css"/>"/>
</head>
<body class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="/common/header.jsp"%>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>

<%@include file="/common/menu.jsp"%>

<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-edit"></i> Trang quản trị </h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="<c:url value="/Home-Admin"/>"><i class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item"><a href="<c:url value="/Danh-sach-phong"/>">Danh sách phòng ban</a></li>
            <li class="breadcrumb-item">Thêm phòng ban</li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Bảng thêm phòng ban</h3>
                <%
                    String themPhong = (String) session.getAttribute("themphong");
                    if(themPhong != null){ %>
                <div class = "show-err"><%=themPhong%></div>
                <%
                        session.removeAttribute("themphong");
                    }
                %>
                <div class="tile-body">
                    <form action="<c:url value="/Insert-Room"/>" method="post" autocomplete="off">
                        <div class="form-group">
                            <label class="control-label" for="name_room">Tên phòng ban</label>
                            <input class="form-control" id="name_room" type="text" placeholder="Tên phòng ban" name="tenphong" required="required">
                        </div>
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue btn btn-primary" type="submit" style="width: 72.19px;">Lưu</button>
                            <button class="btn btn--radius-2 btn--blue btn btn-primary" type="reset">Làm lại</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>
<script type="text/javascript" src="<c:url value="/template/admin/js/jquery-3.2.1.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/template/admin/js/popper.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/template/admin/js/bootstrap.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/template/admin/js/main.js" />"></script>
<script type="text/javascript" src="<c:url value="/template/admin/js/plugins/pace.min.js" />"></script>
</body>
</html>
