<%-- 
    Document   : newtopic
    Created on : Jun 12, 2014, 9:52:11 AM
    Author     : Welcomes
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                padding:80px 0px;
            }
        </style>
    </head>
    <body>
        <form action="teacher-post" method="post">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-body" style="text-align: center">
                        <h5 style="font-weight:bold"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp; TẠO CHỦ ĐỀ MỚI</h5>
                    </div>
                </div>
                <div class="panel panel-body" style="background:#d8d8dc">
                    <div class="form-group">
                        <div class="col-md-12" >
                            <label>Tiêu đề</label>
                        </div>
                        <div class="col-md-12" >
                            <input type="text" name="title" class="form-control" id="inputEmail3" >
                        </div>
                    </div>    
                    <div class="form-group">
                        <div class="col-md-12" >
                            <label>Tên rút gọn</label>
                        </div>
                        <div class="col-md-12" >
                            <input type="text" name="short_title" class="form-control" id="inputEmail3" >
                        </div>
                    </div>    
                    <div class="form-group">
                        <div class="col-md-12" >
                            <label>Danh mục</label>
                        </div>
                        <div class="col-md-12">
                            <select  class="form-control" name="category_id">
                                <c:forEach items="${list_cat}" var="val" >
                                    <option value="${val.categoryID}" >${val.categoryName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>   
                    <div class="form-group">
                        <div class="col-md-12" >
                            <label>Nôi dung</label>
                        </div>
                        <div class="col-md-12" >
                            <textarea class="form-control" name="content" rows="5"></textarea>
                        </div>
                    </div>  
                    <div class="form-group">
                        <div class="col-md-12" >
                            <button type="submit" class="btn btn-primary" style="margin-top:10px" value="add-post" name="action">Tạo chủ đề mới</button>
                            <button type="reset" class="btn btn-warning" style="margin-top:10px" name="action">Làm lại</button>
                        </div>
                    </div>  
                    <div class="form-group">
                        <div class="col-md-12" style="margin-top:5px">
                            <div class="alert alert-warning">
                                <label>
                                    Thông Báo
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
