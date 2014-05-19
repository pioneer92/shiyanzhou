<%-- 
    Document   : head
    Created on : 2014-5-19, 10:48:02
    Author     : mt
--%>

<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"  pageEncoding="UTF-8">
        <title>MT website</title>
    </head>
    <body>
        <table width="80%" border="0" align="center">
  <tr>
    <td align="center">
        <jsp:include page="head.jsp" flush="true"></jsp:include>
    </td>
  </tr>
  <tr>
    <td align="center">
        <jsp:include page="index.jsp" flush="true"></jsp:include>
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
