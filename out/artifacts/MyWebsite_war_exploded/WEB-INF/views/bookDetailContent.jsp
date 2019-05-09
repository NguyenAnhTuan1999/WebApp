<%@ page import="java.sql.Connection" %>
<%@ page import="com.mywebapp.utils.MyUtils" %>
<%@ page import="com.mywebapp.utils.DBUtils" %>
<%@ page import="com.mywebapp.beans.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mywebapp.beans.UserAccount" %><%--
  Created by IntelliJ IDEA.
  User: cbg2
  Date: 06/05/2019
  Time: 11:03 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int code = Integer.parseInt(request.getParameter("code"));
    Connection conn = MyUtils.getStoredConnection(request);
    UserAccount user = (UserAccount) session.getAttribute("loginedUser");
    Book book = DBUtils.getBookDetail(conn, code);
    ArrayList<Book> books = DBUtils.getBookByCategory(conn, book.getCategoryCode(), code);
    int size = books.size() - 1;
    int i = 0;
%>

<script>
    var request;
    var condition;
    function sendInfo() {
        var action = $("#add-book").val();
        condition = action.includes("Thêm vào tủ sách");
        var url = "bookshelf-action?c=<%=code%>&act=" + condition;

        if (window.XMLHttpRequest) {
            request = new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            request = new ActiveXObject("Microsoft.XMLHTTP");
        }

        try {
            request.onreadystatechange = getInfo;
            request.open("GET", url, true);
            request.send();
        } catch (e) {
            alert("Unable to connect to server");
        }
    }

    function getInfo() {
        if (request.readyState == 4) {
            var val = request.responseText;

            if (condition) {
                if (val.includes("y")) {
                    $("#add-book").val("Xóa khỏi tủ sách");
                } else alert("Thêm thất bại ");
            }else {
                if (val.includes("y")) {
                    $("#add-book").val("Thêm vào tủ sách");
                } else alert("Xóa thất bại ");
            }
            // document.getElementById('ketqua').innerHTML = val;
        }
    }
</script>

<section class="body-page height">
    <div class="book-detail-body-cover">
        <section style="height: 360px">
            <div class="book-detail-float-left">
                <img class="book-detail-img" src="<%=book.getImage()%>" alt="Anh_sach" />
            </div>
            <div class="book-detail-float-right">
                <div class="book-detail-name"><%=book.getName()%></div>
                <div class="book-info-line">
                    <span>Tác giả: </span>
                    <a href="#"><%=book.getAuthor()%></a>
                </div>
                <div class="book-info-line">
                    <span>Thể loại: </span>
                    <a href="category?c=<%=book.getCategoryCode()%>&n=<%=book.getCategory()%>"><%=book.getCategory()%></a>
                </div>
                <div class="read-book">
                    <a href="<%=book.getPdfUrl()%>">Đọc</a>
                </div>
                <%
                    if (user != null) {
                        if (!DBUtils.isBookExist(conn, code, user)) {
                %>
                <form class="add-to-bookshelf">
                    <input id="add-book" type="button" value="Thêm vào tủ sách" onclick="sendInfo()">
                </form>
                <%
                        } else {
                %>
                <form class="add-to-bookshelf">
                    <input id="add-book" type="button" value="Xóa khỏi tủ sách" onclick="sendInfo()">
                </form>
                <%
                        }
                %>
                <%
                    }
                %>
                <div class="book-description">
                    <p class="book-description-title">Giới thiệu cuốn sách <%=book.getName()%> của tác giả <%=book.getAuthor()%>:</p>
                    <p>
                        <%=book.getDescripstion()%>
                    </p>
                    <p id="ketqua"></p>
                </div>
            </div>
        </section>
            <%
                for (int j = 0; j < 1; j++) {
                    if (i > size) break;
            %>
            <div class="same-category-books">
                <div class="same-category-books-title">
                    <p>Sách cùng thể loại</p>
                </div>

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
            </div>
    </div>
</section>
