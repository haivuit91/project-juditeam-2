<%-- 
    Document   : attach
    Created on : Jun 21, 2014, 8:05:37 AM
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

        <div class="col-md-6 col-md-offset-3 panel panel-heading" style="text-align: center;font-weight: bold;text-transform: uppercase;background: #269abc">
            Đình kèm tệp
        </div>
        <div class="col-md-6 col-md-offset-3" style="border:2px solid #269abc">
            <div class="col-md-12 panel panel-body">
                <div class="col-md-10">
                    <input type="file" name="link" value="" class="form-control" id="inputEmail3" style="margin-top:10px" />
                </div>
                <div class="col-md-2"style="margin-top:10px" >
                    <a href="#" class="btn btn-danger">Xóa</a>
                </div>
                <div class="col-md-10">
                    <input type="file" name="link" value="" class="form-control" id="inputEmail3" style="margin-top:10px" />
                </div>
                <div class="col-md-2"style="margin-top:10px" >
                    <a href="#" class="btn btn-danger">Xóa</a>
                </div>
                <div class="col-md-10">
                    <input type="file" name="link" value="" class="form-control" id="inputEmail3" style="margin-top:10px" />
                </div>
                <div class="col-md-2"style="margin-top:10px" >
                    <a href="#" class="btn btn-danger">Xóa</a>
                </div>

            </div>

            <div class="col-md-4 col-md-offset-8 panel panel-body">
                <button type="submit"class="btn bg-primary"data-toggle="modal" data-target="#myModal">
                    Thêm
                </button>
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>

                            <div class="col-md-12 alert alert-info" style="font-weight: bold;text-align: center">
                                Tiêu đề
                            </div>
                            <div class="col-md-12 alert alert-success">
                                <input type="text" name="link" value="" class="form-control" id="inputEmail3" style="margin-top:10px" />
                                <input type="file" name="link" value="" class="form-control" id="inputEmail3" style="margin-top:10px" />
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary">Tải lên</button>
                            </div>
                        </div>
                    </div>
                </div>





                <button type="submit"class="btn bg-danger">Xong</button>
            </div>

        </div>



        <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
