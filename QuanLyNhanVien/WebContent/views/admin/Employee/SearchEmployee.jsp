<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.*" %>
<%@ page import="dao.impl.*" %>
<%@ page import="utils.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Tìm kiếm nhân viên</title>
    <link rel="icon" type="image/png" href="<c:url value="/template/admin/icons/search.ico"/>"/>
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
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><a href="<c:url value="/Home-Admin"/>"><i class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item"><a href="<c:url value="/Danh-sach-nhan-vien"/>">Danh sách nhân viên </a></li>
            <li class="breadcrumb-item">Tìm kiếm nhân viên</li>
        </ul>
    </div>
    <div class="tile-body">
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <form action="<c:url value="/views/admin/Employee/SearchEmployee.jsp"/>" method="get" class="form-search">
                        <input name="ten" type="text" placeholder="Nhập tên cần tìm kiếm" class="search-input form-control form-control-sm" required >
                        <input type="submit" value="Tìm kiếm" class="btn btn-info" style="height: 30.38px;line-height: 14.38px;">
                    </form>
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Ảnh đại diện</th>
                            <th>Tên nhân viên</th>
                            <th>Giới tính</th>
                            <th>Chức vụ</th>
                            <th>Phòng ban</th>
                            <th>Ngày vào làm</th>
                            <th>Hoạt động</th>
                        </tr>
                        </thead>
                        <tbody>

                        <%
                            String name = request.getParameter("ten");
                            for(EmployeeModel employee : EmployeeDao.searchByName(name)){
                        %>
                        <tr class="fix-td">
                            <td><%=employee.getId()%></td>
                            <td><img class="fix-images" src="<c:url value="/template/admin/images/"/><%=employee.getFileNameImg()%>"></td>
                            <td><%=ChuanHoa.formatString(employee.getTenNhanVien())%></td>
                            <td><%=employee.getGioiTinh()%></td>
                            <td><%=ChucVuDao.nameChucVu(employee.getIdChucVu())%></td>
                           	<td><%=DepartmentDao.nameDepartment(employee.getIdPhong())%></td>
                            <td><%=Convert.ConvertDateToString(employee.getNgayVaoLam(),"dd-MM-yyyy")%></td>
                            <td>
                                <a href="<c:url value="/Show-Info"/>?idInfo=<%=employee.getId()%>" title="Xem thông tin nhân viên" class="btn btn-success"><i
                                        class="fa fa-eye"></i></a>
                                <a href="<c:url value="/views/admin/Employee/UpdateEmployee.jsp"/>?idUpdate=<%=employee.getId()%>" title="Sửa thông tin" class="btn btn-warning"><i
                                        class="fa fa-edit"></i></a>
                                <a href="<c:url value="/delete-employee"/>?id=<%=employee.getId()%>" title="Xóa nhân viên" class="btn btn-danger btn-delete">
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
<!-- Page specific javascripts-->
<!-- Data table plugin-->
<script type="text/javascript" src="<c:url value="/template/admin/js/plugins/jquery.dataTables.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/template/admin/js/plugins/dataTables.bootstrap.min.js" />"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
<!-- Google analytics script-->
<script type="text/javascript">
    if(document.location.hostname == 'pratikborsadiya.in') {
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-72504830-1', 'auto');
        ga('send', 'pageview');
    }
</script>
</body>
</html>
