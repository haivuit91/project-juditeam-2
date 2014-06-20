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
            <c:if test="${total_result != null}">
                <div class="panel-heading" style="text-align: center;color:red"> ${total_result != '0' ? total_result:' Không tìm thấy'} kết quả ${total_result == '0' ? '':'được tìm thấy'} </div>
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
                    </tr>
                </c:forEach>
            </table>
        </div>
        <!--paging seach -->
        <c:if test="${action == 'search-cb'}">
            <c:forEach begin="1" end="${total_page}" var="i">
                <c:if test="${current_page != i}">
                    <a href="search?key_search=${key_search}&action=search-cb&page=${i}" >${i}</a>
                </c:if>
                <c:if test="${current_page == i}">
                    ${i}
                </c:if>
            </c:forEach>
        </c:if>
        <!--paging default -->
        <c:if test="${action == 'load-default'}">
            <c:forEach begin="1" end="${total_page}" var="i">
                <c:if test="${current_page != i}">
                    <a href="index?page=${i}" >${i}</a>
                </c:if>
                <c:if test="${current_page == i}">
                    ${i}
                </c:if>
            </c:forEach>
        </c:if>

        <!--end paging -->

    </body>
</html>
