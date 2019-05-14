<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.UserModel" %>
<%@ page import="dao.UserDao" %>
<%
    String username = (String) session.getAttribute("username");
    String password = (String) session.getAttribute("password");
    UserModel user = UserDao.getAUser(username,password);
%>
<aside class="app-sidebar">
    <div class="app-sidebar__user">
        <img class="app-sidebar__user-avatar fixImages" src="<c:url value="/template/admin/images/"/><%=user.getImage()%>" alt="User"
                <%
                    if (user.getFullName() != null) {
                %>
             title="<%=user.getFullName()%>"
                <%}%> />

        <div>
            <%
                if (user.getFullName() != null) {
            %>
            <p class="app-sidebar__user-name" style="color: white;">
                <%=user.getFullName()%>
            </p>
            <%}%>

        </div>
    </div>
    <ul class="app-menu">
        <li>
            <a class="app-menu__item active" href="<c:url value="/Home-Admin"/>">
                <i class="app-menu__icon fa fa-pie-chart"></i>
                <span class="app-menu__label">Thống kê</span>
            </a>
        </li>
        <li class="treeview">
            <a class="app-menu__item" href="#" data-toggle="treeview">
                <i class="app-menu__icon fa fa-users"></i>
                <span class="app-menu__label">Quản lý nhân viên</span>
                <i class="treeview-indicator fa fa-angle-right"></i>
            </a>
            <ul class="treeview-menu">
                <li>
                    <a class="treeview-item" href="<c:url value="/Danh-sach-nhan-vien"/>">
                        <i class="icon fa fa-circle-o"></i> Danh sách nhân viên
                    </a>
                </li>
                <li>
                    <a class="treeview-item" href="<c:url value="/views/admin/Employee/InsertEmployee.jsp"/>">
                        <i class="icon fa fa-circle-o"></i> Thêm nhân viên
                    </a>
                </li>
            </ul>
        </li>
        <li class="treeview">
            <a class="app-menu__item" href="#" data-toggle="treeview">
                <i class="app-menu__icon fa fa-home"></i>
                <span class="app-menu__label">Quản lý phòng ban</span>
                <i class="treeview-indicator fa fa-angle-right"></i>
            </a>
            <ul class="treeview-menu">
                <li>
                    <a class="treeview-item" href="<c:url value="/Danh-sach-phong"/>">
                        <i class="icon fa fa-circle-o"></i> Danh sách phòng ban
                    </a>
                </li>
                <li>
                    <a class="treeview-item" href="<c:url value="/views/admin/Department/InsertDepartment.jsp"/>">
                        <i class="icon fa fa-circle-o"></i> Thêm phòng ban
                    </a>
                </li>
            </ul>
        </li>
        <li class="treeview">
            <a class="app-menu__item" href="#" data-toggle="treeview"><i
                    class="app-menu__icon fa fa-money"></i><span class="app-menu__label">Quản lý lương</span><i
                    class="treeview-indicator fa fa-angle-right"></i>
            </a>
            <ul class="treeview-menu">
                <li>
                    <a class="treeview-item" href="<c:url value="/Danh-sach-luong"/>">
                        <i class="icon fa fa-circle-o"></i> Danh sách lương
                    </a>
                </li>
                <li>
                    <a class="treeview-item" href="<c:url value="/views/admin/Salary/StatisticSalary.jsp"/>">
                        <i class="icon fa fa-circle-o"></i> Thống kê lương
                    </a>
                </li>
            </ul>
        </li>
    </ul>
</aside>
