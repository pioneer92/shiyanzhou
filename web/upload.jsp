<%-- 
    Document   : upload
    Created on : 2014-5-19, 9:58:44
    Author     : mt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table width="80%" border="1" align="center">
  <tr>
    <td align="center">
        <jsp:include page="head.jsp" flush="true"></jsp:include>
    </td>
  </tr>
  <tr>
    <td align="center">
      <form action="FileUpServlet" method="post" enctype="multipart/form-data" >
        请选择你要上传的文件：<input type="file" name="file1" /><br />
        <input type="submit" value=" 上传 ">
    </form>
    </td>
  </tr>
  <tr>
    <td align="center">
        <jsp:include page="tail.jsp" flush="true"></jsp:include>
    </td>
  </tr>
</table>
        
    </body>
</html>
