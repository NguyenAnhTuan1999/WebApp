<%--
  Created by IntelliJ IDEA.
  User: cbg2
  Date: 09/05/2019
  Time: 7:39 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
        // Get the modal
        var modal = document.getElementById('myModal');

        // Get the button that opens the modal
        var btn = document.getElementById("login-btn");

        // Get the <span> element that closes the modal
        var span = document.getElementById('close-loginWindow');

        // When the user clicks the button, open the modal
        btn.onclick = function () {
            modal.style.display = "block";
            $("#createAccountWindow").css("display", "none");
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        $("#createNewAcc").click(function () {
            $("#createAccountWindow").css("display", "block");
        });

        $("#close-createAccountWindow").click(function () {
            $("#createAccountWindow").css("display", "none");
        });
    });

</script>
