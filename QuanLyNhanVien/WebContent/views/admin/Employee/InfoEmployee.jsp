<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="utils.*" %>
<%@ page import="model.*" %>
<%@ page import="dao.impl.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Thông tin nhân viên</title>
    <link rel="icon" type="image/png" href="<c:url value="/template/admin/icons/eye.ico"/>"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/template/admin/css/main.css"/>"/>
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" type="text/css" href="<c:url value="/template/admin/css/tuan.css"/>"/>

    <link rel="stylesheet" type="text/css" href="<c:url value="/template/admin/vendor/mdi-font/css/material-design-iconic-font.min.css"/> " media="all"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/template/admin/vendor/mdi-font/css/material-design-iconic-font.min.css"/> " media="all"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/template/admin/vendor/select2/select2.min.css"/> " media="all"/>

    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/template/admin/vendor/datepicker/daterangepicker.css"/> " media="all"/>

    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/template/admin/css/main-form.css"/> " media="all"/>

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
            <h1><i class="fa fa-home"></i> Trang quản trị</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><a href="<c:url value="/Home-Admin"/>"><i class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item"><a href="<c:url value="/Danh-sach-nhan-vien"/>">Danh sách nhân viên </a></li>
            <li class="breadcrumb-item">Thông tin nhân viên</li>
        </ul>
    </div>

    <%
        int id = (int) session.getAttribute("idShowInfo");
        EmployeeModel employeeDao = EmployeeDao.showInfoById(id);
        session.removeAttribute("idShowInfo");
    %>

    <div class="wrapper wrapper--w680">
        <div class="card card-4">
            <div class="card-body">
                <h2 class="title">Thông tin nhân viên : <strong style="color: red"><%=ChuanHoa.formatString(employeeDao.getTenNhanVien())%> </strong> </h2>
                <form>
                    <div class="row row-space">
                        <div class="col-6" style="text-align: center;">
                            <img class="fix-images-info" src="<c:url value="/template/admin/images/"/><%=employeeDao.getFileNameImg()%> ">
                        </div>
                        <div class="col-6">
                            <div class="input-group">
                                <div class="input-group fix-input">
                                    <label class="label">ID nhân viên</label>
                                    <input class="input--style-4 fix-color-input" type="text" name="id" value="<%=id%>" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row row-space">
                        <div class="col-6">
                            <div class="input-group">
                                <label class="label" for="chungminhthu">Chứng minh thư</label>
                                <input class="input--style-4" type="text" name="chungminhthu" id="chungminhthu" value="<%=employeeDao.getChungMinhThu()%>" readonly/>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="input-group">
                                <div class="input-group">
                                    <label class="label" for="dienthoai">Điện thoại</label>
                                    <input class="input--style-4" type="text" name="sodienthoai" id="dienthoai" value="<%=employeeDao.getSoDienThoai()%>" readonly/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row row-space">
                        <div class="col-6">
                            <div class="input-group">
                                <label class="label">Ngày sinh</label>
                                <div class="input-group-icon">
                                    <input class="input--style-4" type="text" name="ngaysinh" value="<%=Convert.ConvertDateToString(employeeDao.getNgaySinh(),"dd/MM/yyyy")%>" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="input-group">
                                <label class="label fix-label" >Giới tính</label>
                                <div class="p-t-10">
                                    <% if(employeeDao.getGioiTinh().equals("Nam")){ %>
                                    <input class="input--style-4" type="text" name="gioitinh" value="Nam" readonly/>
                                    <% }else if(employeeDao.getGioiTinh().equals("Nữ")) { %>
                                    <input class="input--style-4" type="text" name="gioitinh" value="Nữ" readonly/>
                                    <% }else{ %>
                                    <input class="input--style-4" type="text" name="gioitinh" value="Không có giá trị" readonly/>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="input-group">
                        <div class="input-group">
                            <label class="label" for="diachi">Địa chỉ hiện tại</label>
                            <input class="input--style-4" type="text" name="diachi" id="diachi" value="<%=employeeDao.getDiaChi()%>" readonly>
                        </div>
                    </div>

                    <div class="input-group">
                        <div class="input-group">
                            <label class="label" for="quequan">Quê quán</label>
                            <input class="input--style-4" type="text" name="quequan" id="quequan" value="<%=employeeDao.getQueQuan()%>" readonly>
                        </div>
                    </div>

                    <div class="row row-space">
                        <div class="col-6">
                            <div class="input-group">
                                <label class="label">Email</label>
                                <input class="input--style-4" type="email" name="email" value="<%=employeeDao.getEmail()%>" readonly>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="input-group">
                                <label class="label">Lương cb</label>
                                <input class="input--style-4" type="text" name="luongcoban" value="<%=employeeDao.getLuongCB()%>" readonly>
                            </div>
                        </div>
                    </div>

                    <div class="row row-space">
                    	<div class="col-6">
                            <div class="input-group">
                                <label class="label">Chức Vụ</label>
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <input class="input--style-4" type="text" name="idphong" value="<%=ChucVuDao.nameChucVu(employeeDao.getIdChucVu())%>" readonly>
                                    <div class="select-dropdown"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="input-group">
                                <label class="label">Phòng Ban</label>
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <input class="input--style-4" type="text" name="idphong" value="<%=DepartmentDao.nameDepartment(employeeDao.getIdPhong())%>" readonly>
                                    <div class="select-dropdown"></div>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="row row-space">
                        <div class="col-6">
                            <div class="input-group">
                                <label class="label">Trình Độ</label>
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <input class="input--style-4" name="trinhdo" value="<%=employeeDao.getTrinhDo()%>" readonly>
                                    <div class="select-dropdown"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="input-group">
                                <label class="label">Ngày Vào Làm</label>
                                <div class="input-group-icon">
                                    <input type="text" class="input--style-4" name="ngayvaolam" value="<%=Convert.ConvertDateToString(employeeDao.getNgayVaoLam(),"dd/MM/yyyy")%>" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</main>

<script type="text/javascript" src="<c:url value="/template/admin/js/jquery-3.2.1.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/template/admin/js/popper.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/template/admin/js/bootstrap.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/template/admin/js/main.js" />"></script>
<script type="text/javascript" src="<c:url value="/template/admin/js/plugins/pace.min.js" />"></script>


<!-- Vendor JS-->
<script type="text/javascript" src="<c:url value="/template/admin/vendor/select2/select2.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/template/admin/vendor/datepicker/moment.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/template/admin/vendor/datepicker/daterangepicker.js" />"></script>


<!-- Main JS-->
<script type="text/javascript" src="<c:url value="/template/admin/js/global.js" />"></script>

</body>
</html>