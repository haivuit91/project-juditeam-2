<%-- 
    Document   : viewtopic
    Created on : Jun 12, 2014, 4:23:47 PM
    Author     : Welcomes
--%>

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
            <div class="panel panel-default">
                <div class="panel-heading"style="background:#28a4c9;color: white" >
                    <h3><span class="glyphicon glyphicon-align-left"></span> &nbsp;Tiêu đề:&nbsp;</h3>
                </div>
                <div class="panel-body">
                    <textarea class="col-md-12" style="min-height:300px; ">Không Enter</textarea>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading"style="background:#28a4c9;color: white" >
                    <h3><span class="glyphicon glyphicon-user"></span> &nbsp;BÌNH LUẬN</h3>
                </div>
                <div class="panel-body">
                    <div class="col-md-12">
                        <textarea class="col-md-12" style="min-height:100px; "></textarea>
                    </div>
                    <div class="col-md-7 col-md-offset-5">
                        <button class="btn bg-primary" style="margin-top: 5px;">Gửi</button>
                        <button class="btn bg-info" style="margin-top: 5px;">Nhập lại</button>
                    </div>
                    <!-- vong lap-->
                    <div class="col-md-12">
                        <label class="label label-primary">username</label>
                    </div>
                    <div class="col-md-12 alert alert-warning">
                        <p class="alert-link">Tôi là tôi hehe</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-group" style="text-align:center;margin-top: 15px;">
                    <!--START Nut them thong tin-->
                    <!--cHO NAY NE CON-->
                    <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#1myModal">
                        Thêm thông tin địa phương
                    </button>
                    <div class="modal fade" id="1myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3><span class="glyphicon glyphicon-plus"></span>&nbsp;THÊM THÔNG TIN ĐỊA PHƯƠNG</h3>
                                    </div>
                                    <div class="panel-body">
                                        <form class="form-horizontal" role="form" action="/project1/dpmanage" method="post">
                                            
                                            <!--Người phụ trách-->
                                            <div class="form-group">
                                                <div class="col-sm-3" >
                                                    <label class="label label-info" style="padding: 5px;font-size:13px">Loại</label>
                                                </div>
                                                <div class="col-sm-9" >
                                                    <select class="form-control" name="nguoiPhuTrach">
                                                        <option>abc</option>
                                                        <option>nguyen</option>
                                                        <option>Duy</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <!--Nội Dung-->
                                            <div class="form-group">
                                                <div class="col-sm-3" >
                                                    <label class="label label-info" style="padding: 5px;font-size:13px">Nội dung</label>
                                                </div>
                                                <div class="col-sm-9" >
                                                    <textarea class="col-md-12"style="min-height:100px"></textarea>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-sm-6 col-sm-offset-6" >
                                                    <input type="submit" value="Thêm thông tin" name="submit" class="btn btn-success"/>
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
                    <!--kET THUC NE CON-->                                   


                    <!--END Nut them thong tin-->
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-body" style="">
                    <div class="col-md-4">
                        <div class="panel-heading" style="background: #28a4c9;color:wheat">
                            <h4><span class="glyphicon glyphicon-align-left"></span> &nbsp;Bài tập</h4>
                        </div>
                        <div class="panel-body">
                            <p><label>Thong tin 1</label></p>
                            <p><label>Thong tin 1</label></p>
                            <p><label>Thong tin 1</label></p>
                            <p><label>Thong tin 1</label></p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="panel-heading" style="background: #28a4c9;color:wheat">
                            <h4><span class="glyphicon glyphicon-align-left"></span> &nbsp;Kinh nghiệm</h4>
                        </div>
                        <div class="panel-body">Than bai</div>
                    </div>
                    <div class="col-md-4">
                        <div class="panel-heading" style="background: #28a4c9;color:wheat">
                            <h4><span class="glyphicon glyphicon-align-left"></span> &nbsp;Nội dung</h4>
                        </div>
                        <div class="panel-body">Than bai</div>
                    </div>
                </div>
            </div>
        </div>

        <script src="../js/bootstrap.js" type="text/javascript"></script>
        <script src="../js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
