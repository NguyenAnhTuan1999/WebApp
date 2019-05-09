package com.mywebapp.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "BookshelfActionServlet", urlPatterns = "/bookshelf-action")
public class BookshelfActionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        int c =  Integer.parseInt(request.getParameter("c"));
//        boolean act = Boolean.parseBoolean(request.getParameter("act"));
//        System.out.println(c + " " + act);
        request.getRequestDispatcher("/WEB-INF/views/bookshelfAction.jsp").forward(request, response);
    }
}
