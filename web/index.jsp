<%@page contentType="text/html" pageEncoding="gb2312"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>�û���¼</title>
    </head>
    <body>
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
        <div align="center">
        <form action="checklog.jsp" method="POST" onsubmit="return NoSpace()">
            �û�����<input type="text" name="userName" value="" size="20" />
            <br>&nbsp;
            ���<input type="password" name="userPassword" value="" size="21" /><br>
            <input type="submit" value="ȷ��" />
        </form></div>
    </body>
</html>