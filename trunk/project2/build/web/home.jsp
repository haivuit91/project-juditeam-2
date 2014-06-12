<%-- 
    Document   : home
    Created on : Jun 12, 2014, 7:14:09 AM
    Author     : Welcomes
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ</title>
    </head>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <style>

    </style>
    <body>
        <!--Header-->
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="#">TRA CỨU THÔNG TIN</a><br>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="home.jsp">Trang chủ</a></li>
                        <li><a href="/project2/Page?p=new-toppic">Tạo mới</a></li>
                        <li><a href="/project2/Page?p=login-logout">Đăng nhập|Đăng ký</a></li>
                        <li><a href="#contact">Thoát</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>

        </div>
        <!--Content Seacher-->
        <c:if test="${p == 'login' || p == null}">
            <%@include file="module/seach-cb.jsp" %>
        </c:if>
        <c:if test="${p == 'seach-nc'}">
            <%@include file="module/seach-nc.jsp" %>
            <div class="container">
                <%@include file="module/result-seacher.jsp" %>
            </div>
            </c:if>

        <!--Content Information-->
        <div class="container">
            <div class="row">
                <c:if test="${p == 'new-toppic' }">
                    <%@include file="module/newtopic.jsp" %>
                </c:if>     
                <c:if test="${p == 'login-logout' }">
                    <%@include file="module/login-logout.jsp" %>
                </c:if>     
                <c:if test="${p == 'login' || p == null}">
                    <%@include file="module/result-seacher.jsp" %>
                </c:if>
            </div>
        </div>





        <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>