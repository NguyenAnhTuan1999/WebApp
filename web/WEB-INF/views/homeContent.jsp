<%@ page import="com.mywebapp.beans.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mywebapp.utils.DBUtils" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.mywebapp.utils.MyUtils" %>
<%@ page contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<section class="body-page">
    <div class="hot-book-title">
        <a href="#"><i class="fab fa-hotjar"></i>Hot</a>
    </div>
    <div class="hot-book-content">
        <!--First hot book-->
        <%
            Connection conn = MyUtils.getStoredConnection(request);
            ArrayList<Book> books = DBUtils.getHotBooks(conn);

            int i = -1;
            for (int j = 0; j < 2; j++) {
        %>

        <%i++;%>

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

            <%i++;%>

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

            <%i++;%>

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

            <%i++;%>

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