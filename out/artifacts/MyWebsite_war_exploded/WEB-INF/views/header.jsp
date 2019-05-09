<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <header>
        <nav class="top-menu">
            <div class="left-top-menu">
                <div class="page-logo mr-40">
                    <a href="${pageContext.request.contextPath}/"><i class="fas fa-book-open"></i></a>
                </div>
                <form class="search-box mr-40" action="search">
                    <input class="text-input none-shadow-border" type="search" placeholder="Nhập tên sách, tên tác giả..." name="q" />
                    <button type="submit" class="search-btn"><i class="fas fa-search"></i></button>
                </form>
            </div>
            <div class="right-top-menu">
                <ul class="root-menu">
                    <li class="category">
                        <a href="#" class="category-title mr-40">Danh mục<i class="fas fa-angle-down"></i></a>
                        <nav class="category-list">
                            <a href="category?c=1&n=Truyện tranh">Truyện tranh</a>
                            <a href="category?c=2&n=Văn học">Văn học</a>
                            <a href="category?c=3&n=Tiểu thuyết">Tiểu thuyết</a>
                            <a href="category?c=4&n=Kiếm hiệp">Kiếm hiệp</a>
                            <a href="category?c=5&n=Ngôn tình">Ngôn tình</a>
                            <a href="category?c=6&n=Khoa học">Khoa học</a>
                            <a href="category?c=7&n=Nhật kí">Nhật kí</a>
                        </nav>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/store" class="mr-40">Cửa hàng sách<i class="fas fa-store"></i></a></li>
                    <%                     
                		if (session.getAttribute("loginedUser") == null) {
            		%>
                    <li class="login">
                        <a href="#" id="login-btn">Đăng nhập<i class="fas fa-sign-in-alt"></i></a>
                    </li>
			        <% } else { %>
			            <li class="profile">
                        <img class="avatar" src="./Resources/Images/avatar.png" />
                        <a href="#" class="user-name"><p>${loginedUser.displayName}</p><i class="fas fa-angle-down"></i></a>
                        <nav class="user-list-options">
                            <a href="#">Trang cá nhân</a>
                            <a href="bookshelf">Tủ sách</a>
                            <a href="#">Quản lý đơn hàng</a>
                            <a href="${pageContext.request.contextPath}/logout">Đăng suất</a>
                        </nav>
                    </li>
			        <% } %>

                </ul>
            </div>

        </nav>
    </header>