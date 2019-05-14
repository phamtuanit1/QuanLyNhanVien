<%--
  Created by IntelliJ IDEA.
  User: Tuan Pham
  Date: 4/18/2019
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="dao.impl.SalaryDao"%>
<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <li class="breadcrumb-item"><a href="<c:url value="/Home-Admin"/>"><i class="fa fa-home fa-lg"></i></a></li>
                <li class="breadcrumb-item"><a href="<c:url value="/Danh-sach-luong"/>">Danh sách lương </a></li>
                <li class="breadcrumb-item"><a>Thống kê lương </a></li>
            </ul>
        </div>
        <div id="tile">Tỷ lệ 1 : 100.000</div>
        <div id="chart"></div>
        
    </main>
    <script type="text/javascript" src="<c:url value="/template/admin/js/jquery-3.2.1.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/template/admin/js/popper.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/template/admin/js/bootstrap.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/template/admin/js/main.js" />"></script>
    <script type="text/javascript" src="<c:url value="/template/admin/js/plugins/apexcharts.js" />"></script>
    <script type="text/javascript">
    var options = {
        chart: {
            height: 350,
            type: 'line',
            shadow: {
                enabled: true,
                color: '#000',
                top: 18,
                left: 7,
                blur: 10,
                opacity: 1
            },
            toolbar: {
                show: false
            }
        },
        colors: ['#00e396', '#008ffb'],
        dataLabels: {
            enabled: true,
        },
        stroke: {
            curve: 'smooth'
        },
        series: [
        	<% 
        		for(int item : SalaryDao.getYear()){ %>
				{
	            	name: "Năm <%=item%>",
	                data: [
	                	<%for(int i = 1; i <= 12; i++){ %>
        					<%=SalaryDao.sumSalaryByMonth(i,item)/100000%>,
        				<%} %>
					]
	            },
    		<%}%>
        	
        ],
        title: {
            text: 'Thống kê lương của công ty theo tháng các năm',
            align: 'center'
        },
        grid: {
            borderColor: '#e7e7e7',
            row: {
                colors: ['#f3f3f3', 'transparent'],
                opacity: 0.5
            },
        },
        markers: {

            size: 11
        },
        xaxis: {
            categories: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7','Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
            title: {
                text: 'Month'
            }
        },
        yaxis: {
            title: {
                
            },
            min: 10,
            max: 400
        },
        legend: {
            position: 'top',
            horizontalAlign: 'right',
            floating: true,
            offsetY: -400,
            offsetX: -10
        }
    }
    var chart = new ApexCharts(
        document.querySelector("#chart"),
        options
    );
    chart.render();
</script>
</body>
</html>
