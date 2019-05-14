<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.*" %>
<%@ page import="dao.impl.*" %>
<%@page import="utils.ChuanHoa"%>
<%@page import="java.text.DecimalFormat"%>
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
                                int first = 0;
                                int pages = 1;
                                int items = 10;
                                // lấy giá trị trang
                                if(request.getParameter("pages") != null){
                                    pages = Integer.parseInt(request.getParameter("pages"));
                                }
                                // lấy ra tổng số nhân viên
                                int count = new SalaryDao().count();
                                if(count > items){
                                    first = (pages-1)*10;
                                }
                                else {
                                    items = count;
                                }
                            %>
                            <%
                                for(SalaryModel item : SalaryDao.getLuong(first, items)) {
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

                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <%
                                int back = 0;
                                if(pages == 0 || pages == 1){
                                    back = 1; // luôn là trang 1
                                }
                                else{
                                    back = pages-1;
                                }
                            %>
                            <li class="page-item">
                                <a class="page-link" href="<c:url value="/Danh-sach-luong"/>?pages=<%=back%>" aria-label="Previous" title="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <%
                                int num = 0;
                                if((count/items) % 2 == 0){
                                    num = count/items;
                                }
                                else{
                                    num = count/items + 1;
                                }
                            %>
                            <%
                                for(int i = 1; i <= num; i++){
                            %>
                            <li class="page-item"><a class="page-link" href="<c:url value="/Danh-sach-luong"/>?pages=<%=i%>"><%=i%></a></li>
                            <%
                                }
                            %>
                            <%
                                int next = 0;
                                //Nếu total lẻ
                                if (count % 2 != 0) {
                                    if (pages == (count / items) + 1) {
                                        next = pages;//Khong next
                                    } else {
                                        next = pages + 1;//Co next
                                    }
                                } else {
                                    //Nếu total chẵn nhỏ hơn fullpage
                                    //Và không fullPage thì thêm 1
                                    if (count < (num * items) + items && count != num * items) {
                                        if (pages == (count / items) + 1) {
                                            next = pages;//Khong next
                                        } else {
                                            next = pages + 1;//Co next
                                        }
                                    } else {
                                        //Nếu fullPage đến trang cuối dừng
                                        //Chưa tới trang cuối thì được next
                                        if (pages == (count / items)) {
                                            next = pages;//Khong next
                                        } else {
                                            next = pages + 1;//Co next
                                        }
                                    }
                                }
                            %>
                            <li class="page-item">
                                <a class="page-link" href="<c:url value="/Danh-sach-luong"/>?pages=<%=next%>" aria-label="Next" title="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
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
