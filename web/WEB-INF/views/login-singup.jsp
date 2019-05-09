<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script>
    $(document).ready(function () {

        $(".login-body").submit(function (e) {

            e.preventDefault();

            var userName = $('input[name=userName]').val();
            var pass = $('input[name=pass]').val();

            var mes = "";
            var loginErr = false;
            if(userName === "" && pass === "") {
                loginErr = true;
                mes = "Vui lòng điền đầy đủ tên đăng nhập và mật khẩu";
            }
            else {
                if(userName === "") {
                    loginErr = true;
                    mes = "Vui lòng điền tên đăng nhập";
                }
                if(pass === "") {
                    loginErr = true;
                    mes = "Vui lòng điền mật khẩu";
                }
            }
            if (loginErr) {
                $("#notif").html(mes);
            }
            else {
                this.submit();
            }
        });

        $(".body").submit(function (e) {

           e.preventDefault();

           var displayName = $("#display-name").val();
           var userName = $("#user-name").val();
           var pass =$("#pass").val();
           var confirmPass = $("#confirm-pass").val();

            var mes = "";
            var loginErr = false;

           if (displayName === "") {
               loginErr= true;
               mes = "Vui lòng điền tên người dùng";
           } else if (userName === "") {
               loginErr= true;
               mes = "Vui lòng điền tên tài khoản";
           } else if (pass === "") {
               loginErr= true;
               mes = "Vui lòng điền mật khẩu";
           } else if (confirmPass === "") {
               loginErr= true;
               mes = "Vui lòng điền xác nhận mật khẩu";
           }

           if (loginErr) {
               $("#sign-up-notif").html(mes);
           }else {
               if (/^\s*$/.test(displayName)) {
                   mes = "Tên người dùng phải có kí tự khác khoảng trắng";
                   $("#sign-up-notif").html(mes);
               } else if (/\s/.test(userName)) {
                   mes = "Tên tài khoản không được chứa kí tự khoảng trắng";
                   $("#sign-up-notif").html(mes);
               } else if (/\s/.test(pass)) {
                   mes = "Mật khẩu không được chứa kí tự khoảng trắng";
                   $("#sign-up-notif").html(mes);
               } else if (pass !== confirmPass) {
                   mes = "Xác nhận mật khẩu không trùng khớp";
                   $("#sign-up-notif").html(mes);
               } else this.submit();
           }
        });

    });


</script>
<div id="myModal" class="modal">
    <div id="loginWindow" class="login-window">
        <div class="login-label">
            <p>Đăng nhập</p>
            <button id="close-loginWindow" type="button"><i class="fas fa-window-close"></i></button>
        </div>
        <form class="login-body" action="login" method="post">
            <input type="text" placeholder="Tên đăng nhập" name="userName" value="${param.userName}" />
            <input type="password" placeholder="Mật khẩu" name="pass" value="${param.pass}" />
            <p id="notif" style="color: red; margin-bottom: 10px; height: 18px;">${requestScope.notif}<p>
            <div class="rememberMe">
                <input name="rememberMe" type="checkbox" value="Y">
                <p>Nhớ tài khoản của tôi</p>
            </div>
            <input id="submit-login" type="submit" value="Đăng nhập" />
            <a id="createNewAcc" href="#">Tạo tài khoản mới</a>
        </form>
    </div>

    <div id="createAccountWindow" class="create-account-window">
        <div class="label">
            <p>Đăng kí</p>
            <button id="close-createAccountWindow" type="button"><i class="fas fa-window-close"></i></button>
        </div>
        <form class="body" action="sign-up" method="post">
            <input id="display-name" type="text" placeholder="Tên người dùng" name="displayName" value="${param.displayName}"/>
            <input id="user-name" type="text" placeholder="Tên tài khoản" name="userName" value="${param.userName}"/>
            <input id="pass" type="password" placeholder="Mật khẩu" name="pass" value="${param.pass}"/>
            <input id="confirm-pass" type="password" placeholder="Nhập lại mật khẩu" style="margin-bottom: 15px;" name="confirmPass" value="${param.confirmPass}"/>
            <p id="sign-up-notif" style="color: red; margin-bottom: 10px; height: 18px;">${requestScope.signUpNotif}<p>
            <input type="submit" value="Đăng kí" />
        </form>
    </div>
</div>