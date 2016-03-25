<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.jsp.change.*,com.member.dao.*"%>
<%
    
    
    String mode=request.getParameter("mode");
    // main.jsp?mode=1
    if(mode==null)
    	mode="0";
    String jsp=JspChange.change(Integer.parseInt(mode));

    String log_jsp="";
    String id=(String)session.getAttribute("id");
    if(id==null)
    	log_jsp="../member/login.jsp";
    else
    	log_jsp="../member/logout.jsp";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
  <center>
    <table border=1 bordercolor=black width=900 height=700 cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="2" height=100 background="../image/back.jpg" align=center>
         <font size=5 color="white"><b>JSP Include & DBCP & Session</b></font>
        </td>
      </tr>
      <tr>
        <td width=200 height=500 valign="top">
         <jsp:include page="<%=log_jsp %>"></jsp:include>
         <div style="margin-top: 50px">
           <jsp:include page="menu.jsp"></jsp:include>
         </div>
        </td>
        <td width=700 height=500 style="margin-top: 15px">
          <jsp:include page="<%=jsp %>"></jsp:include>
        </td>
      </tr>
      <tr>
        <td colspan="2" height=100 align=center>
         <font size=5>
          <address>서울시 마포구 백범로 미화빌딩 (2층 C강의장)</address>
         </font>
        </td>
      </tr>
    </table>
  </center>
</body>
</html>