<%@ page import="java.sql.Connection" %>
<%@ page import="com.mywebapp.utils.MyUtils" %>
<%@ page import="com.mywebapp.beans.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mywebapp.utils.DBUtils" %><%--
  Created by IntelliJ IDEA.
  User: cbg2
  Date: 06/05/2019
  Time: 2:42 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Connection conn = MyUtils.getStoredConnection(request);
    String input = request.getParameter("q");
    ArrayList<Book> books = DBUtils.findBookByName(conn, input);
%>
<section class="body-page">
    <div class="hot-book-title">
        <p>Kết quả tìm kiếm cho từ khóa: <%=input%></p>
    </div>
    <div class="hot-book-content">
<%
    int size = books.size() - 1;
    int i = -1;
    for (int j = 0; j < 2; j++) {
        i++;
        if (i > size) break;
%>
        <div class="card-book mr-40">
            <div class="book-image">
                <img src="<%=books.get(i).getImage()%>" />
            </div>
            <div class="book-info">
                <p class="book-name"><%=books.get(i).getName()%></p>
                <p class="book-author"><%=books.get(i).getAuthor()%></p>
            </div>
            <div class="card-book-options">
                <div class="read-link">
                    <a href="<%=books.get(i).getPdfUrl()%>">Đọc</a>
                </div>
                <div class="detail-link">
                    <a href="book-detail?code=<%=books.get(i).getCode()%>">Chi tiết</a>
                </div>
            </div>
        </div>

            <%
                i++;
                if (i > size) break;
            %>

        <div class="card-book mr-40">
            <div class="book-image">
                <img src="<%=books.get(i).getImage()%>" />
            </div>
            <div class="book-info">
                <p class="book-name"><%=books.get(i).getName()%></p>
                <p class="book-author"><%=books.get(i).getAuthor()%></p>
            </div>
            <div class="card-book-options">
                <div class="read-link">
                    <a href="<%=books.get(i).getPdfUrl()%>">Đọc</a>
                </div>
                <div class="detail-link">
                    <a href="book-detail?code=<%=books.get(i).getCode()%>">Chi tiết</a>
                </div>
            </div>
        </div>

            <%
                i++;
                if (i > size) break;
            %>

        <div class="card-book mr-40">
            <div class="book-image">
                <img src="<%=books.get(i).getImage()%>" />
            </div>
            <div class="book-info">
                <p class="book-name"><%=books.get(i).getName()%></p>
                <p class="book-author"><%=books.get(i).getAuthor()%></p>
            </div>
            <div class="card-book-options">
                <div class="read-link">
                    <a href="<%=books.get(i).getPdfUrl()%>">Đọc</a>
                </div>
                <div class="detail-link">
                    <a href="book-detail?code=<%=books.get(i).getCode()%>">Chi tiết</a>
                </div>
            </div>
        </div>

            <%
                i++;
                if (i > size) break;
            %>

        <div class="card-book">
            <div class="book-image">
                <img src="<%=books.get(i).getImage()%>" />
            </div>
            <div class="book-info">
                <p class="book-name"><%=books.get(i).getName()%></p>
                <p class="book-author"><%=books.get(i).getAuthor()%></p>
            </div>
            <div class="card-book-options">
                <div class="read-link">
                    <a href="<%=books.get(i).getPdfUrl()%>">Đọc</a>
                </div>
                <div class="detail-link">
                    <a href="book-detail?code=<%=books.get(i).getCode()%>">Chi tiết</a>
                </div>
            </div>
        </div>
            <%
            }
        %>
</section>
