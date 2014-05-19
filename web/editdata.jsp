<%@page contentType="text/html" pageEncoding="gb2312"%>
<%@page import="java.sql.*,DataBean.UserCheck"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>修改记录</title>
    </head>
    <body>
        <jsp:useBean id="user" scope="session" class="DataBean.UserCheck"/>
        <%
            if(!user.isPassed()){
                //如果用户没有登录，跳转到登录页面
                response.sendRedirect("http://localhost:8080/chapter04BeanDB/");
            
            }
            request.setCharacterEncoding("gb2312");
        %>
        <div align="center">
        <form action="saveedit.jsp" method="POST">
            用户名：<input type="text" name="username" 
                       value="<%=request.getParameter("username")%>" size="20" />
            <br>&nbsp;
            口令：<input type="password" name="password"
                       value="<%=request.getParameter("password")%>" size="21" /><br>
            <input type="hidden" name="oldusername"
                       value="<%=request.getParameter("username")%>" />
            <input type="submit" value="保存" />
            <input type="button" value="取消" onclick="window.location='viewdata.jsp'" />
        </form></div>
    </body>
</html>
