<%-- 
    Document   : home
eated on : Jun 12, 2014, 7:14:09 AM
    Author     : Welcomes
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ</title>
        <script src="js/script.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>

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

                    <a class="navbar-brand" href="/project2/index">TRA CỨU THÔNG TIN</a><br>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="/project2/index">Trang chủ</a></li>
                        <li>
                            <c:if test="${current_user == null}">
                                <a href="/project2/authen?action=login-logout">Đăng nhập|Đăng ký</a>
                            </c:if>
                            <c:if test="${current_user != null}">
                                <a href="/project2/authen?action=logout">Thoát</a>
                            </c:if>
                        </li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </div>
        <!--Content Seacher-->
        <!--Content Information-->
        <div class="container">
            <div class="row">
                <%@include file="admin/manage-post.jsp" %>
            </div>
        </div>
        <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
