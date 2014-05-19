<%@page contentType="text/html" pageEncoding="gb2312"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>用户登录</title>
    </head>
    <body>
        <script language="JavaScript">
            function NoSpace(){
                if(document.all.userName.value==""){
                    alert("用户名不能为空！");
                    return false;
                }
                if(document.all.userPassword.value==""){
                    alert("口令不能为空");
                    return false;
                }
                return true;
            }
        </script>
        <div align="center">
        <form action="checklog.jsp" method="POST" onsubmit="return NoSpace()">
            用户名：<input type="text" name="userName" value="" size="20" />
            <br>&nbsp;
            口令：<input type="password" name="userPassword" value="" size="21" /><br>
            <input type="submit" value="确定" />
        </form></div>
    </body>
</html>