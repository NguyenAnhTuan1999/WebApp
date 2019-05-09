<%@ page import="com.mywebapp.beans.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mywebapp.utils.NumberFormat" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.mywebapp.utils.MyUtils" %>
<%@ page import="com.mywebapp.utils.DBUtils" %>
<%--
  Created by IntelliJ IDEA.
  User: cbg2
  Date: 02/05/2019
  Time: 5:03 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<section class="body-page">
    <div class="hot-book-title">
        <a href="#"><i class="fab fa-hotjar"></i>Bán chạy</a>
    </div>

    <div class="hot-book-content">

        <%
            Connection conn = MyUtils.getStoredConnection(request);
            ArrayList<Book> books = DBUtils.getBestSellingBooks(conn);
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
                <p class="price"><%=NumberFormat.formatCurrency(books.get(i).getPrice())%></p>
            </div>
            <div class="card-book-options">
                <div class="cart-plus">
                    <a><i class="fas fa-cart-plus"></i></a>
                </div>
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
                <p class="price"><%=NumberFormat.formatCurrency(books.get(i).getPrice())%></p>
            </div>
            <div class="card-book-options">
                <div class="cart-plus">
                    <i class="fas fa-cart-plus"></i>
                </div>
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
                <p class="price"><%=NumberFormat.formatCurrency(books.get(i).getPrice())%></p>
            </div>
            <div class="card-book-options">
                <div class="cart-plus">
                    <i class="fas fa-cart-plus"></i>
                </div>
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
                <p class="price"><%=NumberFormat.formatCurrency(books.get(i).getPrice())%></p>
            </div>
            <div class="card-book-options">
                <div class="cart-plus">
                    <i class="fas fa-cart-plus"></i>
                </div>
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
    </div>
</section>
