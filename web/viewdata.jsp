<%@page contentType="text/html" pageEncoding="gb2312"%>
<%@page import="java.sql.*,DataBean.DoDB,DataBean.UserCheck"%>
<jsp:useBean id="db" class="DataBean.DoDB"/>
<jsp:useBean id="user" scope="session" class="DataBean.UserCheck"/>
<html>
    <head>
        <meta  http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>�������ݿ�</title>
    </head>
    <script language="JavaScript">
        function dodelete(username){
            //��ʾɾ��ȷ����ʾ�Ի������û�ȷ��ɾ��ʱ����ת��ɾ��ҳ��
            if(confirm("ȷ��ɾ���û�:"+username)==true){
                //ÿ����¼��usernameΪ�ؼ��֣����Խ�����Ϊɾ������
                window.location="deletedata.jsp?username="+username;
            }
        }
    </script>
    <body><div align="center">
    <%
        response.setHeader("Expires", "0");
         if(!user.isPassed()){
                //����û�û�е�¼����ת����¼ҳ��
                response.sendRedirect("http://localhost:8080/chapter04BeanDB/");
            
            }
        
      
        ResultSet rs = db.doQuery("select * from admins");//�������ݿ��û���Ϣ
        out.println("��ǰϵͳ�û���Ϣ���£�<br>");
        out.println("<table border=1><thead><tr>");
        out.println("<th>�û���</th><th>����</th><th>�༭</th><th>ɾ��</th></tr></thead>");
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
            str = "<a href=editdata.jsp?username=" + un + "&password=" + pwd + ">�༭</a>";
            out.println(str);
            out.println("</td><td>");
            str = "<input type=button value=ɾ�� onclick=dodelete('" + un + "') />";
            out.println(str);
            out.println("</td></tr>");
        }
        out.println("</tbody></table>");
        db.close();
    %>
    <hr>
    <a href="adddata.jsp">��Ӽ�¼</a>
    <a href="deletedata.jsp">ɾ����¼</a>
    <a href="editdata.jsp">�༭��¼</a>
     <a href="upload.jsp">�ϴ��ļ�</a>
    </div></body>
</html>
