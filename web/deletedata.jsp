<%@page contentType="text/html" pageEncoding="gb2312"%>
<%@page import="java.sql.*,DataBean.DoDB,DataBean.UserCheck"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>删除记录</title>
    </head>
    <body>
        <jsp:useBean id="db" class="DataBean.DoDB"/>
        <jsp:useBean id="user" scope="session" class="DataBean.UserCheck"/>
        <%
           
            request.setCharacterEncoding("gb2312");
            String sql="delete from users where username='"+request.getParameter("username")+"'";
            String rel=db.doUpdate(sql);
            db.close();
            if(rel.isEmpty())
                //db.doUpdate方法返回空字符串说明更新操作成功完成
                response.sendRedirect("viewdata.jsp");
            else
                out.println("无法将数据存入数据库："+rel);//操作无法完成，输出出错信息
        %>
    </body>
</html>
