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
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <c:if test="${total_result != null}">
                <div class="panel-heading" style="text-align: center;color:red"> ${total_result != '0' ? total_result:' Không tìm thấy'} kết quả ${total_result == '0' ? '':'được tìm thấy'} </div>
            </c:if>
            <div class="panel-body" style="font-weight: bold">
                <div class="col-md-12">
                    Có 2 kết quả được tìm thấy
                </div>

            </div>
            <!-- Table -->
            <table class="col-md-12 table-hover" style="margin-top: 10px">
                <!--Kết qua 1-->
                <tr style="border-bottom: #999999 solid thin">
                    <td class="col-md-12 alert alert-info">
                        <p style="font-weight: bold"><span class="glyphicon glyphicon-fast-forward"></span> &nbsp;<a href="#">Danh muc 1</a></p>  
                    </td>
                </tr>
                <tr style="border-bottom: #222 solid thin">
                    <td class="col-md-12">
                        <p style="font-weight: bold">
                            Mô tả:
                        </p>
                        <p>
                            * Với giao diện tìm kiếm cơ bản. kết quả tìm kiếm có thể hiển thị thêm phần tóm tắt nội dung ngoài cái tiêu đề ra hiển thị giống như google hay trang web dưới này. Tức là khi gõ từ “tích phân” thì hiển thị tiêu đề và bổ sung thêm phần mô tả tóm tắt nội dung và có thêm liên kết đến trang web liên quan

                            Khi chị chạy chương trình dữ liệu từ khóa chị gõ là “tích phân” để tìm do đó chủ yếu em cập nhật nhiều có tên tích phân rồi chọn một bài mẫu để xem hiển thị chi tiết.

                            Ngoài ra giao diện chính ban đầu trang chủ chị thấy không có gì nên em bổ sung một hình ảnh hay hiển thị một nội dung lên quan đến thi tốt nghiệp
                        </p>
                    </td>
                </tr>
                <tr style="border-bottom: #222 solid thin">
                    <td class="col-md-12">
                        <p style="font-weight: bold">
                            Thời gian cập nhật :(12h22'-12/12/1012)
                        </p>
                    </td>
                </tr>
                <tr style="border-bottom: #222 solid thin">
                    <td class="col-md-12">
                        <p style="font-weight:">
                            <b>Liên kết:</b> <a href="#">dantocviet.com</a>,<a href="#">toanhoc.com</a>
                        </p>
                    </td>
                </tr>

                <!--Kết qua 2-->
                <tr style="border-bottom: #999999 solid thin">
                    <td class="col-md-12 alert alert-info">
                        <p style="font-weight: bold"><span class="glyphicon glyphicon-fast-forward"></span> &nbsp;<a href="#">Danh muc 2</a></p>  
                    </td>
                </tr>
                <tr style="border-bottom: #222 solid thin">
                    <td class="col-md-12">
                        <p style="font-weight: bold">
                            Mô tả:
                        </p>
                        <p>
                            * Với giao diện tìm kiếm cơ bản. kết quả tìm kiếm có thể hiển thị thêm phần tóm tắt nội dung ngoài cái tiêu đề ra hiển thị giống như google hay trang web dưới này. Tức là khi gõ từ “tích phân” thì hiển thị tiêu đề và bổ sung thêm phần mô tả tóm tắt nội dung và có thêm liên kết đến trang web liên quan

                            Khi chị chạy chương trình dữ liệu từ khóa chị gõ là “tích phân” để tìm do đó chủ yếu em cập nhật nhiều có tên tích phân rồi chọn một bài mẫu để xem hiển thị chi tiết.

                            Ngoài ra giao diện chính ban đầu trang chủ chị thấy không có gì nên em bổ sung một hình ảnh hay hiển thị một nội dung lên quan đến thi tốt nghiệp
                        </p>
                    </td>
                </tr>
                <tr style="border-bottom: #222 solid thin">
                    <td class="col-md-12">
                        <p style="font-weight: bold">
                            Thời gian cập nhật :(12h22'-12/12/1012)
                        </p>
                    </td>
                </tr>
                <tr style="border-bottom: #222 solid thin">
                    <td class="col-md-12">
                        <p style="font-weight:">
                            <b>Liên kết:</b> <a href="#">dantocviet.com</a>,<a href="#">toanhoc.com</a>
                        </p>
                    </td>
                </tr>




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
