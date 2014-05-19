<%@page contentType="text/html" pageEncoding="gb2312"%>
<%@page import="java.sql.*,DataBean.DoDB,DataBean.UserCheck"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <title>验证用户登录</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("gb2312");//设置请求信息使用的字符集
        %>
        <jsp:useBean id="db" class="DataBean.DoDB"/>
        <jsp:useBean id="user" scope="session" class="DataBean.UserCheck"/>
        <jsp:setProperty name="user" property="*"/>
        <%--user保存用户登录信息，注意jsp:setProperty用*代替属性名，
         --这样可自动用同名参数给属性赋值。
         --user对象的作用范围为session ，即在整个会话期间都有效。--%>
        <%
            if(user.getUserName()!=""){
                String sql="select * from users where username = '"+user.getUserName()
                        +"' and password = '"+user.getUserPassword()+"';";
                System.out.println(user.getUserName()+"' and password = '"+user.getUserPassword());
                ResultSet rs=db.doQuery(sql);			//查询用户名和口令
                if(!rs.next()){//如果有返回记录，说明用户名和口令正确
                    user.setPassed(true);			  	//设置登录标识
                   response.sendRedirect("viewdata.jsp");//跳转到数据显示页面
                   
                }else{						//用户名和口令不正确，输入提示信息。
                    out.println("<font color=red>用户名或口令不正确，请重新登录！</font><br>");
                }
            }
            db.close();
        %>
        
        
        
        <div align="center">
        <form action="checklog.jsp" method="POST" onsubmit="return NoSpace()">
            用户名：<input type="text" name="userName"
                       value="<jsp:getProperty name='user' property='userName'/>" size="20" />
            <br>&nbsp;
            口令：<input type="password" name="userPassword"
                   value="<jsp:getProperty name='user' property='userPassword'/>" size="21"/><br>
            <input type="submit" value="确定" />
            </form></div>
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
    </body>
</html>
