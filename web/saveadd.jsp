<%@page contentType="text/html" pageEncoding="gb2312"%>
<%@page import="java.sql.*,DataBean.DoDB,DataBean.UserCheck"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>保存添加的记录</title>
    </head>
    <body>
        <jsp:useBean id="db" class="DataBean.DoDB"/>
        <jsp:useBean id="user" scope="session" class="DataBean.UserCheck"/>
        <%
            
            request.setCharacterEncoding("gb2312");
            String sql="insert into users values('" + request.getParameter("username")
                    +"','"+request.getParameter("password")+"')";
            String rel=db.doUpdate(sql);
            db.close();
            if(rel.isEmpty())
                response.sendRedirect("index.jsp");
            else
                out.println("用户名已存在！");
        %>
    </body>
</html>
