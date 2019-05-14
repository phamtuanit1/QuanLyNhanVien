<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.*" %>
<%@ page import="dao.impl.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Danh sách phòng ban</title>
    <link rel="icon" type="image/png" href="<c:url value="/template/admin/icons/home.ico"/>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/template/admin/css/main.css"/>"/>
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" type="text/css" href="<c:url value="/template/admin/css/tuan.css"/>"/>
</head>
<body class="app sidebar-mini rtl">
<div class="pace-activity"></div>
<!-- Navbar-->
<%@include file="/common/header.jsp"%>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>

<%@include file="/common/menu.jsp"%>

<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-home"></i> Trang quản trị</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="<c:url value="/Home-Admin"/>"><i class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item"><a href="<c:url value="/Danh-sach-phong"/>">Danh sách phòng ban</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Danh sách phòng ban</h3>

                <%
                    String capNhatPhong = (String) session.getAttribute("capnhatphong");
                    String themPhong = (String) session.getAttribute("themphong");
                    String xoaPhong = (String) session.getAttribute("xoaphong");
                %>
                <%
                    if(themPhong != null){ %>
                        <div class = "show-err"><%=themPhong%></div>
                <%
                    session.removeAttribute("themphong");
                    }
                %>
                <%
                    if(capNhatPhong != null){ %>
                <div class = "show-err"><%=capNhatPhong%></div>
                <%
                        session.removeAttribute("capnhatphong");
                    }
                %>
                <%
                    if(xoaPhong != null){ %>
                <div class = "show-err"><%=xoaPhong%></div>
                <%
                        session.removeAttribute("xoaphong");
                    }
                %>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr style="text-align: center;">
                                <th>ID phòng ban</th>
                                <th>Tên phòng ban</th>
                                <th>Số nhân viên</th>
                                <th>Hoạt động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for(DepartmentModel room : new DepartmentDao().show()){
                            %>
                            <tr style="text-align: center;">
                                <td><%=room.getIdPhong()%></td>
                                <td><%=room.getTenPhong()%></td>
                                <td><%=DepartmentDao.CountEmpInRoom(room.getIdPhong())%></td>
                                <td>
                                    <a href="<c:url value="/Thong-tin-nhan-vien-theo-phong"/>?idPhong=<%=room.getIdPhong()%>" title="Xem danh sách nhân viên phòng" class="btn btn-success"><i
                                            class="fa fa-eye"></i></a>
                                    <a href="<c:url value="/views/admin/Department/UpdateDepartment.jsp"/>?idUpdateRoom=<%=room.getIdPhong()%>" title="Sửa thông tin" class="btn btn-warning" style="margin:0 10px;"><i class="fa fa-edit"></i></a>
                                    <a href="<c:url value="/Delete-Room"/>?idDeleteRoom=<%=room.getIdPhong()%>" title="Xóa phòng ban" class="btn btn-danger btn-delete">
                                        <i class="fa fa-trash"></i></a>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<script type="text/javascript" src="<c:url value="/template/admin/js/jquery-3.2.1.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/template/admin/js/popper.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/template/admin/js/bootstrap.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/template/admin/js/main.js" />"></script>
<script type="text/javascript" src="<c:url value="/template/admin/js/tuan.js" />"></script>
<!-- The javascript plugin to display page loading on top-->
<script type="text/javascript" src="<c:url value="/template/admin/js/plugins/pace.min.js" />"></script>
</body>
</html>
