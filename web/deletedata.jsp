<%@page contentType="text/html" pageEncoding="gb2312"%>
<%@page import="java.sql.*,DataBean.DoDB,DataBean.UserCheck"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>ɾ����¼</title>
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
                //db.doUpdate�������ؿ��ַ���˵�����²����ɹ����
                response.sendRedirect("viewdata.jsp");
            else
                out.println("�޷������ݴ������ݿ⣺"+rel);//�����޷���ɣ����������Ϣ
        %>
    </body>
</html>
