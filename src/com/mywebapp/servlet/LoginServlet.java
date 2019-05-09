package com.mywebapp.servlet;

import com.mywebapp.beans.UserAccount;
import com.mywebapp.utils.DBUtils;
import com.mywebapp.utils.MyUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public static String currentUrl = "";
    public static String currentServlet = "";
 
    public LoginServlet() {
        super();
    }
 
    // Hiển thị trang Login.
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
//        // Forward tới trang /WEB-INF/views/loginView.jsp
//        // (Người dùng không thể truy cập trực tiếp
//        // vào các trang JSP đặt trong thư mục WEB-INF).
//        RequestDispatcher dispatcher //
//                = this.getServletContext().getRequestDispatcher("/WEB-INF/views/homeView.jsp");
// 
//        dispatcher.forward(request, response);
        //response.sendRedirect(request.getContextPath() + "/");
 
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userName = request.getParameter("userName");
        String pass = request.getParameter("pass");
        String rememberMe = request.getParameter("rememberMe");

        Connection conn = MyUtils.getStoredConnection(request);

        UserAccount user = null;
        try {
            user = DBUtils.findUser(conn, userName, pass);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if(user != null) {
            // Luu thong tin nguoi dung vao Session
            HttpSession session = request.getSession();
            MyUtils.storeLoginedUser(session, user);

            // Nếu người dùng chọn tính năng "Remember me"
            if ("Y".equals(rememberMe)) {
                MyUtils.storeUserCookie(response, user);
            }
            // Ngược lại xóa Cookie
            else {
                MyUtils.deleteUserCookie(response);
            }

            response.sendRedirect(currentUrl);
            System.out.println(currentUrl);
            //System.out.println(request.getSession().getAttribute("currentUrl").toString());
            //response.sendRedirect(session.getAttribute("currentUrl").toString());
            //this.getServletContext().getRequestDispatcher("/WEB-INF/views/homeView.jsp").forward(request, response);
        }
        else {
            String mes = "Tài khoản truy cập không hợp lệ";
            request.setAttribute("notif", mes + "<script>$(\"#myModal\").css(\"display\", \"block\");</script>");
            this.getServletContext().getRequestDispatcher(currentServlet).forward(request, response);
        }
        
//        String mes = "";
//        boolean loginErr = false;
//        if(userName.isEmpty() && pass.isEmpty()) {
//            loginErr = true;
//            mes = "Vui lòng điền đầy đủ tên đăng nhập và mật khẩu";
//        }
//        else {
//            if(userName.isEmpty()) {
//                loginErr = true;
//                mes = "Vui lòng điền tên đăng nhập";
//            }
//            if(pass.isEmpty()) {
//                loginErr = true;
//                mes = "Vui lòng điền mật khẩu";
//            }
//        }
//
//        UserAccount user = null;
//        if(!loginErr) {
//
//        	Connection conn = MyUtils.getStoredConnection(request);
//
//            try {
//                user = DBUtils.findUser(conn, userName, pass);
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//
//            if(user != null) {
//            	// Luu thong tin nguoi dung vao Session
//                HttpSession session = request.getSession();
//                MyUtils.storeLoginedUser(session, user);
//
//                // Nếu người dùng chọn tính năng "Remember me"
//                if ("Y".equals(rememberMe)) {
//                    MyUtils.storeUserCookie(response, user);
//                }
//                // Ngược lại xóa Cookie
//                else {
//                    MyUtils.deleteUserCookie(response);
//                }
//
//                response.sendRedirect(currentUrl);
//                //System.out.println(request.getSession().getAttribute("currentUrl").toString());
//                //response.sendRedirect(session.getAttribute("currentUrl").toString());
//                //this.getServletContext().getRequestDispatcher("/WEB-INF/views/homeView.jsp").forward(request, response);
//            }
//            else {
//                mes = "Tài khoản truy cập không hợp lệ";
//                request.setAttribute("notif", mes + "<script>$(\"#loginWindow\").css(\"display\", \"block\");</script>");
//                this.getServletContext().getRequestDispatcher(currentServlet).forward(request, response);
//            }
//        }
//        else {
//            request.setAttribute("notif", mes + "<script>$(\"#loginWindow\").css(\"display\", \"block\");</script>");
//            this.getServletContext().getRequestDispatcher(currentServlet).forward(request, response);
//        }
    }
 
}