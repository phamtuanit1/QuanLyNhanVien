<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.*" %>
<%@ page import="dao.impl.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Cập nhật phòng ban</title>
    <link rel="icon" type="image/png" href="<c:url value="/template/admin/icons/edit.ico"/>"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<c:url value="/template/admin/css/main.css"/>"/>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value="/template/admin/css/tuan.css"/>"/>
</head>
<body class="app sidebar-mini rtl">
<!-- Navbar-->
<%@include file="/common/header.jsp" %>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>

<%@include file="/common/menu.jsp"%>

<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-home"></i>Trang quản trị</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="<c:url value="/Home-Admin"/>"><i class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item"><a href="<c:url value="/Danh-sach-phong"/>">Danh sách phòng ban</a></li>
            <li class="breadcrumb-item">Cập nhật phòng ban</li>
        </ul>
    </div>

    <%
        int idPhong = Integer.parseInt(request.getParameter("idUpdateRoom"));
        DepartmentModel phong = DepartmentDao.thongTinPhongTheoId(idPhong);
    %>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Bảng cập nhật phòng ban</h3>
                <div class="tile-body">
                    <form class="row" action="<c:url value="/Update-room"/>" method="post" autocomplete="off">
                        <div class="form-group col-md-4">
                            <label class="control-label">ID phòng</label>
                            <input style="color: red;text-align: center;" class="form-control" type="text" name="idphong" value="<%=idPhong%>" readonly>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="control-label">Tên phòng</label>
                            <input class="form-control" type="text" placeholder="Nhập tên phòng" name="tenphong" value="<%=phong.getTenPhong()%>" required>
                        </div>
                        <div class="form-group col-md-4 align-self-end">
                            <div class="p-t-15">
                                <button class="btn btn--radius-2 btn--blue btn btn-primary" type="submit">Cập nhật</button>
                            </div>
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
