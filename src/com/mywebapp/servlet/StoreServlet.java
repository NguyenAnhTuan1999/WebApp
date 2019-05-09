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

@WebServlet(name = "StoreServlet", urlPatterns = {"/store"})
public class StoreServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        LoginServlet.currentUrl = request.getRequestURL().toString();
        LoginServlet.currentServlet = request.getServletPath();

        this.getServletContext().getRequestDispatcher("/WEB-INF/views/storeView.jsp").forward(request, response);
    }
}
