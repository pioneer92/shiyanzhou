<%@page contentType="text/html" pageEncoding="gb2312"%>
<%@page import="java.sql.*,DataBean.DoDB,DataBean.UserCheck"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>��֤�û���¼</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("gb2312");//����������Ϣʹ�õ��ַ���
        %>
        <jsp:useBean id="db" class="DataBean.DoDB"/>
        <jsp:useBean id="user" scope="session" class="DataBean.UserCheck"/>
        <jsp:setProperty name="user" property="*"/>
        <%--user�����û���¼��Ϣ��ע��jsp:setProperty��*������������
         --�������Զ���ͬ�����������Ը�ֵ��
         --user��������÷�ΧΪsession �����������Ự�ڼ䶼��Ч��--%>
        <%
            if(user.getUserName()!=""){
                String sql="select * from users where username = '"+user.getUserName()
                        +"' and password = '"+user.getUserPassword()+"';";
                System.out.println(user.getUserName()+"' and password = '"+user.getUserPassword());
                ResultSet rs=db.doQuery(sql);			//��ѯ�û����Ϳ���
                if(!rs.next()){//����з��ؼ�¼��˵���û����Ϳ�����ȷ
                    user.setPassed(true);			  	//���õ�¼��ʶ
                   response.sendRedirect("viewdata.jsp");//��ת��������ʾҳ��
                   
                }else{						//�û����Ϳ����ȷ��������ʾ��Ϣ��
                    out.println("<font color=red>�û���������ȷ�������µ�¼��</font><br>");
                }
            }
            db.close();
        %>
        
        
        
        <div align="center">
        <form action="checklog.jsp" method="POST" onsubmit="return NoSpace()">
            �û�����<input type="text" name="userName"
                       value="<jsp:getProperty name='user' property='userName'/>" size="20" />
            <br>&nbsp;
            ���<input type="password" name="userPassword"
                   value="<jsp:getProperty name='user' property='userPassword'/>" size="21"/><br>
            <input type="submit" value="ȷ��" />
            </form></div>
         <script language="JavaScript">
            function NoSpace(){
                if(document.all.userName.value==""){
                    alert("�û�������Ϊ�գ�");
                    return false;
                }
                if(document.all.userPassword.value==""){
                    alert("�����Ϊ��");
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
