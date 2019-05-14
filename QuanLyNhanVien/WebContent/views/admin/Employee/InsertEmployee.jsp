<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.*" %>
<%@ page import="dao.impl.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Thêm nhân viên</title>
    <link rel="icon" type="image/png" href="<c:url value="/template/admin/icons/form.ico"/>"/>
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
            <li class="breadcrumb-item">Thêm nhân viên</li>
        </ul>
    </div>

    <% String ok = "";
        ok = (String) request.getAttribute("ok");
        if(ok != null){ %>
            <div style="color: red;margin-top: -15px;margin-bottom: 15px;text-align: center;font-size: 16px;"><%=ok%></div>
    <%    }
    %>
    <div></div>
    <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Bảng Thêm Nhân Viên</h2>
                    <form method="post" action="<c:url value="/ThemNhanVien"/>" enctype="multipart/form-data" autocomplete="off" >

                        <div class="input-group">
                            <div class="input-group">
                                <label class="label" for="hoten">Họ và tên</label>
                                <input class="input--style-4" type="text" name="tennhanvien" id="hoten" required>
                            </div>
                        </div>

                        <div class="input-group">
                            <div class="input-group">
                                <label class="label">Ảnh đại diện</label>
                                <!-- accept="image/*" cho phép up ảnh với tất cả các đuôi -->
                                <input class="input--style-4" type="file" name="image" style="line-height: 30px;padding: 7px;">
                            </div>
                        </div>

                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group">
                                    <label class="label" for="chungminhthu">Chứng minh thư</label>
                                    <input class="input--style-4" type="text" name="chungminhthu" id="chungminhthu" required/>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="input-group">
                                    <div class="input-group">
                                        <label class="label" for="dienthoai">Điện thoại</label>
                                        <input class="input--style-4" type="text" name="sodienthoai" id="dienthoai"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group">
                                    <label class="label">Ngày sinh</label>
                                    <div class="input-group-icon">
                                        <input class="input--style-4 js-datepicker" type="text" name="ngaysinh" required>
                                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="input-group">
                                    <label class="label fix-label">Giới tính</label>
                                    <div class="p-t-10">
                                        <label class="radio-container m-r-45">Nam
                                            <input type="radio" checked="checked" name="gioitinh" value="Nam">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">Nữ
                                            <input type="radio" name="gioitinh" value="Nữ">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="input-group">
                            <div class="input-group">
                                <label class="label" for="quequan">Quê quán</label>
                                <input class="input--style-4" type="text" name="quequan" id="quequan">
                            </div>
                        </div>

                        <div class="input-group">
                            <div class="input-group">
                                <label class="label" for="diachi">Địa chỉ hiện tại</label>
                                <input class="input--style-4" type="text" name="diachi" id="diachi">
                            </div>
                        </div>

                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group">
                                    <label class="label">Email</label>
                                    <input class="input--style-4" type="email" name="email">
                                </div>
                            </div>

                            <div class="col-6">
                                <div class="input-group">
                                    <label class="label">Lương cơ bản</label>
                                    <input class="input--style-4" type="text" name="luongcoban">
                                </div>
                            </div>
                        </div>

                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group">
                                    <label class="label">Phòng Ban</label>
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <select name="idphong">
                                            <%
                                                for (DepartmentModel phong : new DepartmentDao().show()){
                                            %>
                                                    <option value="<%=phong.getIdPhong()%>"><%=phong.getTenPhong()%></option>
                                            <%  }%>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="input-group">
                                    <label class="label">Chức Vụ</label>
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <select name="idchucvu">
                                            <%
                                                for (ChucVuModel chucvu : new ChucVuDao().show()){
                                            %>
                                            <option value="<%=chucvu.getIdChucVu()%>"><%=chucvu.getTenChucVu()%></option>
                                            <%}%>
                                        </select>
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
                                        <select name="trinhdo">
                                            <option selected="selected" value="Đại học">Đại học</option>
                                            <option value="Giáo sư">Giáo sư</option>
                                            <option value="Tiến sĩ">Tiến sĩ</option>
                                            <option value="Thạc sĩ">Thạc sĩ</option>
                                            <option value="Cao đẳng">Cao đẳng</option>
                                            <option value="Trung cấp">Trung cấp</option>
                                            <option value="Hết cấp 3">Hết cấp 3</option>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="input-group">
                                    <label class="label">Ngày Vào Làm</label>
                                    <div class="input-group-icon">
                                        <input class="input--style-4 js-datepicker" type="text" name="ngayvaolam" required>
                                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit" style="width: 167.88px;">Lưu</button>
                            <button class="btn btn--radius-2 btn--blue" type="reset">Làm lại</button>
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
