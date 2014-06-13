<%-- 
    Document   : viewtopic
    Created on : Jun 12, 2014, 4:23:47 PM
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
    </head>
    <body>
        <div class="col-md-8">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading" style="background:#28a4c9;color: white" >
                        <h3><span class="glyphicon glyphicon-align-left"></span> ${current_post.title} </h3>
                    </div>
                    <div class="panel-body">
                        <textarea class="col-md-12" style="min-height:300px; ">${current_post.content}</textarea>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-group" style="text-align:center;margin-top: 15px;">
                            <!--START Nut them thong tin-->
                            <!--cHO NAY NE CON-->
                            <c:if test="${current_user.userID == current_post.getUser().userID}">
                                <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#1myModal">
                                    Thêm thông tin
                                </button>
                            </c:if>
                            <c:if test="${current_user.userID != current_post.getUser().userID}">
                                Bạn không có quền thêm thông tin cho bài viết này!
                            </c:if>
                            <form action="teacher-post" name="info" method="post">
                                <div class="modal fade" id="1myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="col-lg-12">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h3><span class="glyphicon glyphicon-plus"></span>&nbsp;THÊM THÔNG TIN</h3>
                                                </div>
                                                <input type="text" name="post_id" style="display: none" value="${current_post.postID}"/>
                                                <div class="panel-body">
                                                    <!--Người phụ trách-->
                                                    <div class="form-group">
                                                        <div class="col-sm-3" >
                                                            <label class="label label-info" style="padding: 5px;font-size:13px">Loại</label>
                                                        </div>
                                                        <div class="col-sm-9" >
                                                            <select class="form-control" name="type">
                                                                <option value="bai_tap">Bài tập</option>
                                                                <option value="huong_dan">Hướng dẫn</option>
                                                                <option value="kinh_nghiem">Kinh nghiệm</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!--Nội Dung-->
                                                    <div class="form-group">
                                                        <div class="col-sm-3" >
                                                            <label class="label label-info" style="margin-top: 5px;font-size:13px">Nội dung</label>
                                                        </div>
                                                        <div class="col-sm-9" >
                                                            <textarea name="content" class="col-md-12" style="min-height:100px;margin-top: 10px"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-6 col-sm-offset-6" >
                                                            <button value="add-info" name="action" class="btn btn-success" style="margin-top: 5px">Thêm</button>
                                                            &nbsp;
                                                            <button type="reset" class="btn btn-warning">Clear</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!--kET THUC NE CON-->                                   
                            <!--END Nut them thong tin-->
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-6" style="background:#28a4c9;padding: 5px;color:wheat">
                             NGƯỜI POST:&nbsp;
                            <label>
                                ${current_post.user.userName}
                            </label>
                        </div>
                        <div class="col-md-6" style="background:#28a4c9;padding: 5px;color:wheat">
                            NGÀY POST:&nbsp;
                            <label>
                                ${current_post.datePost}
                            </label>
                        </div>
                    </div>                           
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body" style="">
                                <div class="col-md-4">
                                    <div class="panel-heading" style="background: #28a4c9;color:wheat">
                                        <h4><span class="glyphicon glyphicon-align-left"></span> &nbsp;Bài tập</h4>
                                    </div>
                                    <div class="panel-body">
                                        <c:forEach items="${current_post.getBaiTapList()}" var="val">
                                            <p><label>${val.baiTap}</label></p>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="panel-heading" style="background: #28a4c9;color:wheat">
                                        <h4><span class="glyphicon glyphicon-align-left"></span> &nbsp;Kinh nghiệm</h4>
                                    </div>
                                    <div class="panel-body">
                                        <c:forEach items="${current_post.getKinhNghiemList()}" var="val">
                                            <p><label>${val.kinhNghiem}</label></p>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="panel-heading" style="background: #28a4c9;color:wheat">
                                        <h4><span class="glyphicon glyphicon-align-left"></span> &nbsp;Hướng dẫn</h4>
                                    </div>
                                    <div class="panel-body">
                                        <c:forEach items="${current_post.getHuongDanList()}" var="val">
                                            <p><label>${val.huongDan}</label></p>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--BINH LUAN-->
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading" style="background:#28a4c9;color: white" >
                    <h3><span class="glyphicon glyphicon-user"></span> BÌNH LUẬN </h3>
                </div>
                <c:if test="${current_user == null}">
                    Bạn phải đăng nhập
                </c:if>
                <c:if test="${current_user != null}">
                    <form action="detail" name="comment" method="post">
                        <input type="text" name="post_id"   style="display: none"  value="${current_post.postID}"/>
                        <div class="panel-body">
                            <div class="col-md-12">
                                <textarea name="content" class="col-md-12" style="min-height:100px; "></textarea>
                            </div>
                            <div class="col-md-7 col-md-offset-5">
                                <button name="action" value="add-comment" class="btn bg-primary" style="margin-top: 5px;">Gửi</button>
                                <button class="btn bg-info" style="margin-top: 5px;">Nhập lại</button>
                            </div>
                            <!-- vong lap-->
                            <c:forEach items="${current_post.getCommentList()}" var="val">
                                <div class="col-md-12">
                                    <label class="label label-primary">${val.user.userName}</label>
                                </div>
                                <div class="col-md-12 alert alert-warning">
                                    <p class="alert-link">${val.content}</p>
                                </div>
                            </c:forEach>
                        </div>
                    </form>
                </c:if>
            </div>
        </div>
        <script src="../js/bootstrap.js" type="text/javascript"></script>
        <script src="../js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
