<%@page contentType="text/html" pageEncoding="gb2312"%>
<%@page import="java.sql.*,DataBean.DoDB,DataBean.UserCheck"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>�����޸ĵļ�¼</title>
    </head>
    <body>
        <jsp:useBean id="db" class="DataBean.DoDB"/>
        <jsp:useBean id="user" scope="session" class="DataBean.UserCheck"/>
        <%
               if(!user.isPassed()){
                //����û�û�е�¼����ת����¼ҳ��
                response.sendRedirect("http://localhost:8080/chapter04BeanDB/");
            
            }
            request.setCharacterEncoding("gb2312");
            String sql="insert into admins values('"+request.getParameter("username")
                    +"','"+request.getParameter("password")+"')'";
             
            String rel=db.doUpdate(sql);
            db.close();
            if(rel.isEmpty())
                response.sendRedirect("viewdata.jsp");
            else
                out.println("�޷������ݴ������ݿ⣺"+rel);
        %>
    </body>
</html>
