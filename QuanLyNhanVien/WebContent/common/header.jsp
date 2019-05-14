<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="app-header"><a class="app-header__logo" href="<c:url value="/Home-Admin" />">Admin</a>
    <!-- Sidebar toggle button-->
    <a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">
        <!--Notification Menu-->

        <!-- User Menu-->
        <li class="dropdown" title="Admin" >
            <a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu">
                <i class="fa fa-user fa-lg"></i>
            </a>
            <ul class="dropdown-menu settings-menu dropdown-menu-right">
                <li><a class="dropdown-item" href="<c:url value="/views/admin/Account.jsp"/>"><i class="fa fa-sign-out fa-lg"></i> Account</a></li>
                <li><a class="dropdown-item" href="<c:url value="/LogOut"/>"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
            </ul>
        </li>
    </ul>
</header>

