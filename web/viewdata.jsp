<%@page contentType="text/html" pageEncoding="gb2312"%>
<%@page import="java.sql.*,DataBean.DoDB,DataBean.UserCheck"%>
<jsp:useBean id="db" class="DataBean.DoDB"/>
<jsp:useBean id="user" scope="session" class="DataBean.UserCheck"/>
<html>
    <head>
        <meta  http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>管理数据库</title>
    </head>
    <script language="JavaScript">
        function dodelete(username){
            //显示删除确认提示对话框，在用户确认删除时，跳转到删除页面
            if(confirm("确认删除用户:"+username)==true){
                //每条记录的username为关键字，所以将其作为删除参数
                window.location="deletedata.jsp?username="+username;
            }
        }
    </script>
    <body><div align="center">
    <%
        response.setHeader("Expires", "0");
         if(!user.isPassed()){
                //如果用户没有登录，跳转到登录页面
                response.sendRedirect("http://localhost:8080/chapter04BeanDB/");
            
            }
        
      
        ResultSet rs = db.doQuery("select * from admins");//返回数据库用户信息
        out.println("当前系统用户信息如下：<br>");
        out.println("<table border=1><thead><tr>");
        out.println("<th>用户名</th><th>口令</th><th>编辑</th><th>删除</th></tr></thead>");
        out.println("<tbody>");
        String un, pwd, str;
        while (rs.next()) {
            un = rs.getString("username");
            pwd = rs.getString("password");
            out.println("<tr><td>");
            out.println(un);
            out.println("</td><td>");
            out.println(pwd);
            out.println("</td><td>");
            str = "<a href=editdata.jsp?username=" + un + "&password=" + pwd + ">编辑</a>";
            out.println(str);
            out.println("</td><td>");
            str = "<input type=button value=删除 onclick=dodelete('" + un + "') />";
            out.println(str);
            out.println("</td></tr>");
        }
        out.println("</tbody></table>");
        db.close();
    %>
    <hr>
    <a href="adddata.jsp">添加记录</a>
    <a href="deletedata.jsp">删除记录</a>
    <a href="editdata.jsp">编辑记录</a>
     <a href="upload.jsp">上传文件</a>
    </div></body>
</html>
