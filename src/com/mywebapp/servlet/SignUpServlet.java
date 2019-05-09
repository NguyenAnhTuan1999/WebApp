package com.mywebapp.servlet;

import com.mywebapp.utils.DBUtils;
import com.mywebapp.utils.MyUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

import static com.mywebapp.servlet.LoginServlet.currentServlet;

@WebServlet(name = "SignUpServlet",urlPatterns = {"/sign-up"})
public class SignUpServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection conn = MyUtils.getStoredConnection(request);
        String displayName = request.getParameter("displayName");
        String userName = request.getParameter("userName");
        String pass = request.getParameter("pass");

        if (DBUtils.isAccountExist(conn, userName)) {
            String mes = "Tên tài khoản đã tồn tại";
            request.setAttribute("signUpNotif", mes + "<script>$(\"#createAccountWindow\").css(\"display\", \"block\");</script>");
            this.getServletContext().getRequestDispatcher(currentServlet).forward(request, response);
        } else {
            DBUtils.addUserAccount(conn, displayName, userName, pass);
            request.setAttribute("signUpNotif",  "<script>alert(\"Đăng kí thành công\");</script>");
            this.getServletContext().getRequestDispatcher(currentServlet).forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request,response);
    }
}
