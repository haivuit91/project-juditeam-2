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
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3><span class="glyphicon glyphicon-plus"></span> &nbsp;Thêm mới địa phương</h3>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" action="/project1/dpmanage" method="post">
                        <!-- TÊN XÃ -->

                        <div class="form-group">
                            <div class="col-sm-2" >
                                <label class="label label-primary" style="padding: 5px;font-size:13px">Mã ĐP</label>
                            </div>
                            <div class="col-sm-10" >
                                <input type="text" name="maDP" value=""  class="form-control" id="inputEmail3">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2" >
                                <label class="label label-primary" style="padding: 5px;font-size:13px">Tên ĐP</label>
                            </div>
                            <div class="col-sm-10" >
                                <input type="text" name="tenDP" value=""  class="form-control" id="inputEmail3">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2" >
                                <label class="label label-primary" style="padding: 5px;font-size:13px">Số điện thoại</label>
                            </div>
                            <div class="col-sm-10" >
                                <input type="text" name="SDT" value=""  class="form-control" id="inputEmail3">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2" >
                                <label class="label label-primary" style="padding: 5px;font-size:13px">Nơi nhận</label>
                            </div>
                            <div class="col-sm-10" >
                                <input type="text" name="noiNhan" value=""  class="form-control" id="inputEmail3">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2" >
                                <label class="label label-primary" style="padding: 5px;font-size:13px">Diện tích</label>
                            </div>
                            <div class="col-sm-10" >
                                <input type="text" name="dienTich" value=""  class="form-control" id="inputEmail3">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2" >
                                <label class="label label-primary" style="padding: 5px;font-size:13px">Số dân</label>
                            </div>
                            <div class="col-sm-10" >
                                <input type="text" name="soDan" value=""  class="form-control" id="inputEmail3">
                            </div>
                        </div>                                     
                        <div class="form-group">
                            <div class="col-sm-6 col-sm-offset-6" >
                                <input type="submit" value="Thêm mới" name="submit" class="btn btn-primary"/>
                                &nbsp;
                                <button type="reset" class="btn btn-warning">Clear</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="../js/bootstrap.js" type="text/javascript"></script>
        <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
    </body>
</html>
