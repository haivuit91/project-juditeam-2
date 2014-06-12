<%-- 
    Document   : seach-cb
    Created on : Jun 12, 2014, 8:49:21 AM
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
        <div class="jumbotron navbar-seach">
            <div class="container">
                <h3 style="text-align: center;font-size: 40px;font-weight:bold;color:white">Bạn cần tìm các bài tập toán học để ôn thi ?</h3>
                <h5 style="text-align: center;font-size: 16px;font-weight: lighter;color:white">Nếu bạn cần hãy nhập từ khóa cần tìm và chúng tôi sẽ gợi ý cho bạn!</h5>

                <div class="col-md-10 col-md-offset-1" style="text-align:center">
                    <div class="col-md-12">
                        <input type="text" class="form-control">
                    </div><!-- /input-group -->
                    <div class="col-md-1 col-md-offset-10" style="margin-top:5px">
                        <button type="button" class="btn btn-primary">Tìm kiếm </button>
                    </div>
                </div>
                <div class="col-md-1">
                    <a href="/project2/Page?p=seach-nc"  class="label label-success" style="font-size:16;padding:10px">Tìm kiếm nâng cao </a>
                </div>
            </div>
        </div>
    </body>
</html>
