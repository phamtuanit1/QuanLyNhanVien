<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Account</title>
    <link rel="icon" type="image/png" href="<c:url value="/template/admin/icons/form.ico"/>"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<c:url value="/template/admin/css/main.css"/>"/>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value="/template/admin/css/tuan.css"/>"/>
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
</head>
<body class="app sidebar-mini rtl">
	<!-- Navbar-->
	<%@include file="/common/header.jsp"%>
	
	<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
	
	<!-- Sidebar menu-->
	<%@include file="/common/menu.jsp"%>
	
	<%
	    String userName = (String) session.getAttribute("username");
	    String pass = (String) session.getAttribute("password");
	    UserModel userModel = UserDao.getAUser(userName,pass);
	%>
	<main class="app-content">
	    <div class="row user">
	        <div class="col-md-12">
	            <div class="profile">
	                <div class="info"><img class="user-img" src="<c:url value="/template/admin/images/"/><%=userModel.getImage()%>">
	                    <h4><%=userModel.getFullName()%></h4>
	                    <p>Java Developer</p>
	                </div>
	                <div class="cover-image"></div>
	            </div>
	        </div>
	        <div class="col-md-3">
	            <div class="tile p-0">
	                <ul class="nav flex-column nav-tabs user-tabs">
	                    <li class="nav-item"><a class="nav-link active" href="#user-timeline" data-toggle="tab">Timeline</a></li>
	                    <li class="nav-item"><a class="nav-link" href="#user-settings" data-toggle="tab">Settings</a></li>
	                </ul>
	            </div>
	        </div>
	        <div class="col-md-9">
	            <div class="tab-content">
	                <div class="tab-pane active" id="user-timeline">
	                    <div class="timeline-post">
	                        <div class="post-media"><a href="#"><img style="width: 48px;height: 48px;" src="<c:url value="/template/admin/images/"/><%=userModel.getImage()%>"></a>
	                            <div class="content">
	                                <h5><a href="<c:url value="Account.jsp"/>"><%=userModel.getFullName()%></a></h5>
	                                <p class="text-muted"><small>2 January at 9:30</small></p>
	                            </div>
	                        </div>
	                        <div class="post-content">
	                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,	quis tion ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non	proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
	                        </div>
	
	                    </div>
	                </div>
	
	                <div class="tab-pane fade" id="user-settings">
	                    <div class="tile user-settings">
	                        <h4 class="line-head">Settings</h4>
	                        <form>
	                            <div class="row mb-4">
	                                <div class="col-md-4">
	                                    <label>First Name</label>
	                                    <input class="form-control" type="text">
	                                </div>
	                                <div class="col-md-4">
	                                    <label>Last Name</label>
	                                    <input class="form-control" type="text">
	                                </div>
	                            </div>
	                            <div class="row">
	                                <div class="col-md-8 mb-4">
	                                    <label>Email</label>
	                                    <input class="form-control" type="text">
	                                </div>
	                                <div class="clearfix"></div>
	                                <div class="col-md-8 mb-4">
	                                    <label>Mobile No</label>
	                                    <input class="form-control" type="text">
	                                </div>
	                                <div class="clearfix"></div>
	                                <div class="col-md-8 mb-4">
	                                    <label>Office Phone</label>
	                                    <input class="form-control" type="text">
	                                </div>
	                                <div class="clearfix"></div>
	                                <div class="col-md-8 mb-4">
	                                    <label>Home Phone</label>
	                                    <input class="form-control" type="text">
	                                </div>
	                            </div>
	                            <div class="row mb-10">
	                                <div class="col-md-12">
	                                    <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i> Save</button>
	                                </div>
	                            </div>
	                        </form>
	                    </div>
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
