<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.*" %>
<%@ page import="dao.impl.*" %>
<%@ page import="utils.ChuanHoa" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Danh sách lương</title>
    <link rel="icon" type="image/png" href="<c:url value="/template/admin/icons/money.ico"/>"/>
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
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="<c:url value="/Home-Admin"/>">Trang quản trị</a></li>
            <li class="breadcrumb-item"><a href="<c:url value="/Danh-sach-luong"/>">Danh sách lương </a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title" style="float: left;width: 50%;">Danh sách lương </h3>

                <form class="form-search" action="<c:url value="/views/admin/Salary/SearchSalary.jsp"/>" method="get">
                    <input class="search-input form-control form-control-sm" type="text" placeholder="Search" name="ten" required>
                    <input type="submit" value="Tìm kiếm" class="btn btn-info" style="height: 30.38px;line-height: 14.38px;">
                </form>

                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                        <tr style="text-align: center;">
                            <th>ID Luong</th>
                                <th>Ten Nhan Vien</th>
                                <th>Chuc vu</th>
                                <th>Luong can ban(VND)</th>
                                <th>Phu cap(VND)</th>
                                <th>Bac Luong</th>
                                <th>Luong thang(VND)</th>
                                <th>Ngày nhận lương</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            String text = request.getParameter("ten");
                            for(SalaryModel item : SalaryDao.searchIDNhanVienByTen(text)) {
                                DecimalFormat formatter = new DecimalFormat("###,###,###");
                        %>
                                <tr>
                                    <td><%=item.getIdLuong()%></td>
                                    <td><%=EmployeeDao.showInfoById(item.getIdEmployee()).getTenNhanVien()%></td>
                                    <td><%=ChucVuDao.nameChucVu(item.getIdChucVu())%></td>
                                    <td><%=formatter.format(EmployeeDao.showInfoById(item.getIdEmployee()).getLuongCB()) %></td>
                                    <td><%=formatter.format(item.getPhuCap())%></td>
                                    <td><%=ChucVuDao.ChucVuInfo(item.getIdChucVu()).getBacLuong()%></td>
                                    <%
                                        double salary = EmployeeDao.showInfoById(item.getIdEmployee()).getLuongCB()*ChucVuDao.ChucVuInfo(item.getIdChucVu()).getBacLuong()+item.getPhuCap();
                                    %>
                                    <td><%=formatter.format(salary)%></td>
                                    <td><%=ChuanHoa.tachChuoi(String.valueOf(item.getNgayNhanLuong()), "-", "-")%></td>
                                </tr>
                        <%  } %>
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
<script type="text/javascript" src="<c:url value="/template/admin/js/plugins/pace.min.js" />"></script>
</body>
</html>
