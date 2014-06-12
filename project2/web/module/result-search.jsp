<%-- 
    Document   : result-seacher
    Created on : Jun 12, 2014, 8:03:46 AM
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
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <c:if test="${result_search != null}">
                <div class="panel-heading" style="text-align: center;color:red"> ${result_search.size()!= '0' ? result_search.size():'Không tìm thấy'} kết quả  cho từ khóa ${key_search}</div>
            </c:if>
            <div class="panel-body" style="font-weight: bold">
                <div class="col-md-9">Tất cả chủ đề</div>
                <div class="col-md-3">Cập nhật mới nhất</div>
            </div>

            <!-- Table -->
            <table class="table">
                <c:forEach items="${result_search}" var="val" >
                    <tr>
                        <td class="col-md-9">
                            <p><a href="/project2/detail?action=view&id=${val.postID}">${val.title}</a></p>
                            <p>Danh mục: ${val.getCategory().categoryName}</p>
                        </td>
                        <td class="col-md-3"> ${val.datePost}</td>
                        <td>
                            <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#1myModal">
                                Thêm thông tin
                            </button>
                            <div class="modal fade" id="1myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="col-lg-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h3><span class="glyphicon glyphicon-th"></span>&nbsp;Thêm thông tin</h3>
                                            </div>
                                            <div class="panel-body">
                                                <form class="form-horizontal" role="form" action="/project2/teacher-post" method="post">
                                                    <!--chưa đinh dang-->
                                                    <input type="text" name="post_id" value="${val.postID}">
                                                    <div class="form-group">
                                                        <div class="col-sm-3" >
                                                            <label class="label label-info" style="padding: 5px;font-size:13px">Loại</label>
                                                        </div>
                                                        <div class="col-sm-9" >
                                                            <select class="form-control" name="type">
                                                                <option value="kinh_nghiem">Kinh nghiệm</option>
                                                                <option value="bai_tap">Bài tập</option>
                                                                <option value="huong_dan">Hướng dẫn</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!--Nội Dung-->
                                                    <div class="form-group">
                                                        <div class="col-sm-3" >
                                                            <label class="label label-info" style="padding: 5px;font-size:13px">Nội dung</label>
                                                        </div>
                                                        <div class="col-sm-9" >
                                                            <input type="text" name="content" value=""  class="form-control" id="inputEmail3">
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-6 col-sm-offset-6" >
                                                            <button type="submit" value="add-info" name="action" class="btn btn-success">Thêm thông tin</button>
                                                            &nbsp;
                                                            <button type="reset" class="btn btn-warning">Clear</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
