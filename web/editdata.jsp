<%@page contentType="text/html" pageEncoding="gb2312"%>
<%@page import="java.sql.*,DataBean.UserCheck"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>�޸ļ�¼</title>
    </head>
    <body>
        <jsp:useBean id="user" scope="session" class="DataBean.UserCheck"/>
        <%
            if(!user.isPassed()){
                //����û�û�е�¼����ת����¼ҳ��
                response.sendRedirect("http://localhost:8080/chapter04BeanDB/");
            
            }
            request.setCharacterEncoding("gb2312");
        %>
        <div align="center">
        <form action="saveedit.jsp" method="POST">
            �û�����<input type="text" name="username" 
                       value="<%=request.getParameter("username")%>" size="20" />
            <br>&nbsp;
            ���<input type="password" name="password"
                       value="<%=request.getParameter("password")%>" size="21" /><br>
            <input type="hidden" name="oldusername"
                       value="<%=request.getParameter("username")%>" />
            <input type="submit" value="����" />
            <input type="button" value="ȡ��" onclick="window.location='viewdata.jsp'" />
        </form></div>
    </body>
</html>
