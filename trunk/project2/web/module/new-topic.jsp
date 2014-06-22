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
        <form action="post" name="newtopic" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
            <div class="col-md-8">
                <div class="panel panel-default">
                    <div class="panel-body" style="text-align: center">
                        <h5 style="font-weight:bold"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp; THÊM BÀI VIẾT</h5>
                    </div>
                </div>
                <div class="panel panel-body" style="background:#d8d8dc">
                    <div class="form-group">
                        <div class="col-md-12" >
                            <label>Tên tiêu đề</label>
                        </div>
                        <div class="col-md-12" >
                            <input type="text" name="title" value="${current_post.title}" class="form-control" id="inputEmail3" >
                        </div>
                    </div>  
                    <div class="form-group">
                        <div class="col-md-12" >
                            <label>Tên rút gọn</label>
                        </div>
                        <div class="col-md-12" >
                            <input type="text" name="short-title" value="${current_post.shortTitle}" class="form-control" id="inputEmail3" >
                        </div>
                    </div>   
                    <div class="form-group">
                        <div class="col-md-12" >
                            <label>Danh mục</label>
                        </div>
                        <div class="col-md-12">
                            <select  class="form-control" name="category-id">
                                <c:forEach items="${list_cat}" var="val" >
                                    <option value="${val.categoryID}" ${val.categoryID== current.category.categoryID ? 'selected':''}>${val.categoryName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>   
                    <div class="form-group">
                        <div class="col-md-12" >
                            <label>Nôi dung</label>
                        </div>
                        <div class="col-md-12" >
                            <textarea class="form-control" name="content" rows="30">${current_post.content}</textarea>
                        </div>
                    </div>  
                    <div class="form-group">
                        <div class="col-md-12" >
                            <label>Liên kết</label>
                        </div>
                        <div class="col-md-12" >
                            <input type="text" name="link" value="${current_post.link}" class="form-control" id="inputEmail3" />
                        </div>
                    </div>   

                    <div class="form-group">
                        <div class="col-md-4 col-md-offset-8" >
                            <button type="submit"  value="add-topic" name="action" class="btn btn-primary" style="margin-top:10px">Tiếp tục</button>
                            <button type="reset" class="btn btn-warning" style="margin-top:10px" name="action">Làm lại</button>
                        </div>
                    </div>  
                    <div class="form-group">
                        <div class="col-md-12" style="margin-top:5px">
                            <div class="alert alert-warning">
                                <label>
                                    ${msgResult}
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 alert-info" style="position: fixed; margin-left: 780px">
                <center>
                    <img class="img-thumbnail" style="width:300px;height:300px; margin-top: 18px" src="image/post/EGxI2I2y.png">                
                </center>
                <input type="file" name="file" class="btn btn-default" style="margin-top:10px; width: 308px"/>
                <input type="text" value="${url_image}" class="form-control" style="margin-top: 5px" placeholder="Link ảnh"/>
                <div class="col-md-4 col-md-offset-8" style="margin-top: 10px;margin-bottom: 10px;margin-left: 220px">
                    <button type="submit" name="action" value="up-load" class="btn bg-primary">Tải lên</button>
                </div>
            </div>
        </form>
    </body>
</html>
