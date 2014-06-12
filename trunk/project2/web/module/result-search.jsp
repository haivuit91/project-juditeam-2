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
            <div class="panel-heading" style="text-align: center;color:red"> ${result_search.size()!= '0' ? result_search.size():'Không tìm thấy'} kết quả  cho từ khóa ${key_search}</div>
            <div class="panel-body" style="font-weight: bold">
                <div class="col-md-9">Tất cả chủ đề</div>
                <div class="col-md-3">Cập nhật mới nhất</div>
            </div>

            <!-- Table -->
            <table class="table">
                <c:forEach items="${result_search}" var="val" >
                    <tr>
                        <td class="col-md-9">
                            <p><a href="#">${val.title}</a></p>
                            <p>Danh mục: ${val.getCategory().categoryName}</p>
                        </td>
                        <td class="col-md-3"> ${val.datePost}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
