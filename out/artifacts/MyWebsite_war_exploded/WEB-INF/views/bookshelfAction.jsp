<%@ page import="com.mywebapp.utils.DBUtils" %>
<%@ page import="com.mywebapp.utils.MyUtils" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.mywebapp.beans.UserAccount" %><%--
  Created by IntelliJ IDEA.
  User: cbg2
  Date: 09/05/2019
  Time: 11:17 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Connection conn = MyUtils.getStoredConnection(request);
    int code =  Integer.parseInt(request.getParameter("c"));
    boolean condition = Boolean.parseBoolean(request.getParameter("act"));
    UserAccount user = (UserAccount) session.getAttribute("loginedUser");

    if ((DBUtils.changeBookshelf(conn, code, condition, user))) {
        out.print("y");
    } else {
        out.print("n");
    }
//    out.print(100);
%>
