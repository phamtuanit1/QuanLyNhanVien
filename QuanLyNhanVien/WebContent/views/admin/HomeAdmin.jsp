<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.*" %>
<%@ page import="dao.impl.*" %>
<%@ page import="utils.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Home Admin</title>
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
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item"><a href="<c:url value="/Home-Admin"/>">Trang quản trị</a></li>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-6 col-lg-3">
                <div class="widget-small primary coloured-icon"><i class="icon fa fa-user fa-3x"></i>
                    <div class="info">
                        <h4>Người dùng</h4>
                        <p><b><%=UserDao.countUser(2)%></b></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <a class="fix-tagA" href="<c:url value="/views/admin/Account.jsp"/>">
                    <div class="widget-small primary coloured-icon"><i class="icon fa fa-cog fa-3x"></i>
                        <div class="info">
                            <h4>Quản trị</h4>
                            <p><b><%=UserDao.countUser(1)%></b></p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-6 col-lg-3">
                <a class="fix-tagA" href="<c:url value="Danh-sach-nhan-vien"/>">
                    <div class="widget-small info coloured-icon"><i class="icon fa fa-users fa-3x"></i>
                        <div class="info">
                            <h4>Nhân viên</h4>
                            <p><b><%=new EmployeeDao().show().size()%></b></p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-6 col-lg-3">
                <a class="fix-tagA" href="<c:url value="/Danh-sach-phong"/>">
                    <div class="widget-small warning coloured-icon"><i class="icon fa fa-home fa-3x"></i>
                        <div class="info">
                            <h4>Phòng ban</h4>
                            <p><b><%=new DepartmentDao().show().size()%></b></p>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="tile" style="height: 500px;">
                    <h3 class="tile-title" style="text-align: center;">Biểu đồ thống kê số nhân viên trong từng phòng</h3>
                    <div class="embed-responsive embed-responsive-16by9" style="height: 500px;left: -5px;">
                        <div class="embed-responsive-item" id="my-chart"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="tile" style="height: 500px;">
                    <h3 class="tile-title" style="text-align: center;">Biểu đồ thống kê tổng lương từng phòng</h3>
                    <div class="embed-responsive embed-responsive-16by9" style="height: 500px;left: -5px;">
                        <div class="embed-responsive-item" id="my-chart1"></div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script type="text/javascript" src="<c:url value="/template/admin/js/jquery-3.2.1.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/template/admin/js/plugins/apexcharts.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/template/admin/js/popper.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/template/admin/js/bootstrap.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/template/admin/js/main.js" />"></script>
    <script type="text/javascript" src="<c:url value="/template/admin/js/tuan.js" />"></script>
    <script type="text/javascript" src="<c:url value="/template/admin/js/plugins/pace.min.js" />"></script>
    <!-- biểu đồ-->
    <script type="text/javascript">
        $(document).ready(function() {
            var options = {
                chart: {
                    width: 500,
                    type: 'donut'
                },
                labels: [
                    <% for(DepartmentModel phong : new DepartmentDao().show()) { %>
                        '<%=phong.getTenPhong()%>',
                    <%}%>
                ],
                series: [
                    <% for(DepartmentModel phong : new DepartmentDao().show()) { %>
                        <%=DepartmentDao.CountEmpInRoom(phong.getIdPhong())%>,
                    <%}%>
                ],
                responsive: [{
                    breakpoint: 480,
                    options: {
                        chart: {
                            width: 200
                        },
                        legend: {
                            position: 'bottom'
                        }
                    }
                }]
            };
            var chart = new ApexCharts(
                document.querySelector("#my-chart"),
                options
            );
            chart.render();

            var options = {
                chart: {
                    width: 500,
                    type: 'pie'
                },
                labels: [
                    <% for(DepartmentModel phong : new DepartmentDao().show()) { %>
                        '<%=phong.getTenPhong()%>',
                    <%}%>
                ],
                series: [
                    <% for(DepartmentModel phong : new DepartmentDao().show()) { %>
                        <%=SalaryDao.SalaryByRoom(phong.getIdPhong())%>,
                    <%}%>
                ],
                responsive: [{
                    breakpoint: 480,
                    options: {
                        chart: {
                            width: 200
                        },
                        legend: {
                            position: 'bottom'
                        }
                    }
                }]
            };
            var chart = new ApexCharts(
                document.querySelector("#my-chart1"),
                options
            );
            chart.render();
        });
    </script>
</body>
</html>

