<%-- 
    Document   : manage-slide
    Created on : Jun 12, 2014, 4:56:51 PM
    Author     : Welcomes
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <div class="alert alert-danger" style="text-align: center;margin-top: 40px"><b>QUẢN LÝ BÀI VIẾT </b></div>
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">
                <a href="postmanage?action=new-topic" class="btn btn-primary btn-sm">
                    Thêm bài viết
                </a>               
                <div class="row">
                    <div class="col-lg-5 col-lg-push-6">
                        <form action="postmanage" name="search">
                            <div class="col-md-11">
                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                            <span class="glyphicon glyphicon-search"></span>
                                            <span class="caret"></span></button>
                                    </div><!-- /btn-group -->
                                    <input type="text" value="${key_search}" name="key-search" class="form-control" placeholder="Nhập từ khóa muốn tìm...">
                                </div><!-- /input-group -->
                            </div><!-- /input-group -->
                            <div class="col-md-1">
                                <button  type="submit" name="action" value="search" class="btn btn-primary">Tìm kiếm </button>
                            </div>
                        </form>
                    </div><!-- /.col-lg-6 -->
                </div><!-- /.row -->
            </div>
            <table class="col-md-12 table-hover">
                <tr style="font-weight: bold;text-transform: uppercase">
                    <td class="col-md-3">Tiêu đề</td>
                    <td class="col-md-2">Ngày đăng</td>
                    <td class="col-md-2">Danh mục</td>
                    <td class="col-md-3">Liên kết</td>
                    <td class="col-md-2">Thao tác</td>
                </tr>
                <c:forEach items="${list_post}" var="item">
                    <tr style="border-bottom:#E8E6E7 solid thin">
                        <td class="col-md-3">${item.title}</td>
                        <td class="col-md-2">${item.datePost}</td>
                        <td class="col-md-2">${item.getCategory().categoryName}</td>
                        <td class="col-md-3">${item.link == null ? '#':item.link }</td>
                        <td class="col-md-2">
                            <a  class="btn btn-warning" href="postmanage?action=del&id=${item.postID}">Xóa</a>
                            <a class="btn btn-primary" href="postmanage?action=${item.isActive() ? "disable":"enable"}&id=${item.postID}">${item.isActive() ? "Ẩn":"Hiện"}</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <!-- paging for search-->
            <div class="col-md-12 alert alert-info" style="text-align: center; background:white" >
                <c:forEach begin="1" end="${total_page}" var="i">
                    <c:if test="${current_page != i}">
                        <a   class="label label-primary" href="postmanage?action=${key_search == null ? 'load':'search'}${key_search == null ? '':'&key-search='}${key_search}&page=${i}">${i}</a>
                    </c:if>
                    <c:if test="${current_page == i}">
                        <b class="label label-warning">${i}</b>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
