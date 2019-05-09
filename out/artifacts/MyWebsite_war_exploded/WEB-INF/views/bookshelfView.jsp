<%--
  Created by IntelliJ IDEA.
  User: cbg2
  Date: 09/05/2019
  Time: 9:27 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8" />
    <meta name="author" content="Nguyen Anh Tuan" />
    <title>My Website</title>
    <link rel="shortcut icon" type="image/x-icon" href="Resources/Images/book16x16.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./Resources/MyCss/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>

        $(document).ready(function () {
            $("#login-btn").click(function () {
                $("#loginWindow").css("display", "block");
                $("#home-page").fadeTo(200,1);
            });

            $("#close-loginWindow").click(function () {
                $("#loginWindow").css("display", "none");
            });

            $("#createNewAcc").click(function () {
                $("#createAccountWindow").css("display", "block");
            });

            $("#close-createAccountWindow").click(function () {
                $("#createAccountWindow").css("display", "none");
            });

            $(document).mouseup(function (e) {
                // Đối tượng container chứa popup
                var container = $("#loginWindow");

                // Nếu click bên ngoài đối tượng container thì ẩn nó đi
                if (!container.is(e.target) && container.has(e.target).length === 0) {
                    container.hide();
                }
            });

            $(document).mouseup(function (e) {
                // Đối tượng container chứa popup
                var container = $("#createAccountWindow");

                // Nếu click bên ngoài đối tượng container thì ẩn nó đi
                if (!container.is(e.target) && container.has(e.target).length === 0) {
                    container.hide();
                }
            });
        });
    </script>
</head>
<body>
<jsp:include page="login-singup.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="bookshelfContent.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
