<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
  <center>
    <table border=0 width=200>
     <tr height=30>
      <td align=center>
       <a href="main.jsp">
       <img src="../image/home.gif" border=0></a>
      </td>
     </tr>
     <tr height=30>
      <td align=center>
       <%
         if(id==null)
         {
       %>
       <a href="main.jsp?mode=1">
       <img src="../image/join.gif" border=0></a>
       <%
         }
         else
         {
       %>
          <a href="main.jsp?mode=2">
          <img src="../image/joinup.gif" border=0></a>
       <%
         }
       %>
      </td>
     </tr>
     <%
        if(id!=null)
        {
     %>
     <tr height=30>
      <td align=center>
       <img src="../image/board.gif">
      </td>
     </tr>
     
     <tr height=30>
      <td align=center>
       <a href="main.jsp?mode=3">
       <img src="../image/databoard.gif" border=0></a>
      </td>
     </tr>
     <tr height=30>
      <td align=center>
      <a href="main.jsp?mode=7">
       <img src="../image/movie.gif" border=0></a>
      </td>
     </tr>
     <%
        }
     %>
    </table>
  </center>
</body>
</html>




