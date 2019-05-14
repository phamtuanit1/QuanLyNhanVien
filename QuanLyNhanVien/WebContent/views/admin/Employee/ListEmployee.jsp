<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.*" %>
<%@ page import="dao.impl.*" %>
<%@ page import="utils.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Danh sách nhân viên</title>
    <link rel="icon" type="image/png" href="<c:url value='/template/admin/icons/home.ico'/>"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<c:url value="/template/admin/css/main.css"/>"/>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value="/template/admin/css/tuan.css"/>"/>
</head>
<body class="app sidebar-mini rtl">
    <div class="pace-activity"></div>
    <!-- Navbar-->
    <%@include file="/common/header.jsp"%>
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <!-- Sidebar menu-->
    <%@include file="/common/menu.jsp"%>

    <main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-home"></i> Trang quản trị </h1>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item"><a href="<c:url value="/Home-Admin"/>"><i class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item"><a href="<c:url value="/Danh-sach-nhan-vien"/>">Danh sách nhân viên </a></li>
        </ul>
    </div>

    <%
        String themNhanVien = (String) session.getAttribute("themNhanVien");
        String xoaNhanVien = (String) session.getAttribute("xoaNhanVien");
        String thongTinNhanVien = (String) session.getAttribute("thongTinNhanVien");
        String capNhatNhanVien = (String) session.getAttribute("capNhatNhanVien");
    %>
    <% if(themNhanVien != null){ %> <div style="color: red;margin-top: -15px;margin-bottom: 15px;text-align: center;font-size: 16px;"><%=themNhanVien%></div> <%} session.removeAttribute("themNhanVien");%>
    <% if(xoaNhanVien != null){ %> <div style="color: red;margin-top: -15px;margin-bottom: 15px;text-align: center;font-size: 16px;"><%=xoaNhanVien%></div> <%} session.removeAttribute("xoaNhanVien");%>
    <% if(thongTinNhanVien != null){ %> <div style="color: red;margin-top: -15px;margin-bottom: 15px;text-align: center;font-size: 16px;"><%=thongTinNhanVien%></div> <%} session.removeAttribute("thongTinNhanVien");%>
    <% if(capNhatNhanVien != null){ %> <div style="color: red;margin-top: -15px;margin-bottom: 15px;text-align: center;font-size: 16px;"><%=capNhatNhanVien%></div> <%} session.removeAttribute("capNhatNhanVien");%>

    <%
        int first = 0;
        int pages = 1;
        int items = 10;
        // lấy giá trị trang
        if(request.getParameter("pages") != null){
            pages = Integer.parseInt(request.getParameter("pages"));
        }
        // lấy ra tổng số nhân viên
        int count = new EmployeeDao().count();
        if(count > items){
            first = (pages-1)*10;
        }
        else {
            items = count;
        }
    %>
    <div class="row">

            <div class="col-md-12" style="position: relative;">
                <div class="tile">
                    <h3 class="tile-title" style="float: left;">Danh sách nhân viên</h3>
                    <form action="<c:url value="/views/admin/Employee/SearchEmployee.jsp"/>" method="get" class="form-search">
                        <input name="ten" type="text" placeholder="Nhập tên cần tìm kiếm" class="search-input form-control form-control-sm" required >
                        <input type="submit" value="Tìm kiếm" class="btn btn-info" style="height: 30.38px;line-height: 14.38px;">
                    </form>
                    <div style="clear: both;"></div>
                    <table class="table table-bordered" id="sampleTable">
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
                            for(EmployeeModel employee : EmployeeDao.getNhanVien(first,items)){
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
                                <a href="<c:url value="/Show-Info"/>?idInfo=<%=employee.getId()%>" title="Xem thông tin nhân viên" class="btn btn-success"><i class="fa fa-eye"></i></a>
                                <a href="<c:url value="/views/admin/Employee/UpdateEmployee.jsp"/>?idUpdate=<%=employee.getId()%>" title="Sửa thông tin" class="btn btn-warning"><i class="fa fa-edit"></i></a>
                                <a href="<c:url value="delete-employee"/>?id=<%=employee.getId()%>" title="Xóa nhân viên" class="btn btn-danger btn-delete"><i class="fa fa-trash"></i></a>
                            </td>
                        </tr>
                        <%}%>
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
                                <a class="page-link" href="<c:url value="/Danh-sach-nhan-vien"/>?pages=<%=back%>" aria-label="Previous" title="Previous">
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
                                    <li class="page-item"><a class="page-link" href="<c:url value="/Danh-sach-nhan-vien"/>?pages=<%=i%>"><%=i%></a></li>
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
                                <a class="page-link" href="<c:url value="/Danh-sach-nhan-vien"/>?pages=<%=next%>" aria-label="Next" title="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </main>
    <script type="text/javascript" src="<c:url value="/template/admin/js/jquery-3.2.1.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/template/admin/js/popper.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/template/admin/js/bootstrap.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/template/admin/js/main.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/template/admin/js/tuan.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/template/admin/js/plugins/pace.min.js"/>"></script>
</body>
</html>
