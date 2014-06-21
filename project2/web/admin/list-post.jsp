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
        <div class="alert alert-danger" style="text-align: center"><b>QUẢN LÝ BÀI VIẾT </b></div>
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
            <table>
                <tr>
                    <td>Tiêu đề</td>
                    <td>Liên kết</td>
                    <td>Ngày đăng</td>
                    <td>Danh mục</td>
                    <td colspan="2">Thao tác</td>
                </tr>
                <c:forEach items="${list_post}" var="item">
                    <tr>
                        <td>${item.title}</td>
                        <td>${item.link == null ? '#':item.link }</td>
                        <td>${item.datePost}</td>
                        <td>${item.getCategory().categoryName}</td>
                        <td><a href="postmanage?action=del&id=${item.postID}">Xóa</a></td>
                        <td><a href="postmanage?action=${item.isActive() ? "disable":"enable"}&id=${item.postID}">${item.isActive() ? "Ẩn":"Hiện"}</a></td>
                    </tr>
                </c:forEach>
            </table>
            <!-- paging for search-->
            <c:forEach begin="1" end="${total_page}" var="i">
                <c:if test="${current_page != i}">
                    <a href="postmanage?action=${key_search == null ? 'load':'search'}${key_search == null ? '':'&key-search='}${key_search}&page=${i}">${i}</a>
                </c:if>
                <c:if test="${current_page == i}">
                    ${i}
                </c:if>
            </c:forEach>
        </div>
    </body>
</html>
