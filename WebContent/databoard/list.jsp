<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.board.dao.*"%>
<jsp:useBean id="dao" class="com.board.dao.BoardDAO"/>
<%
    String strPage=request.getParameter("page");
    if(strPage==null)
    	strPage="1";
    int curpage=Integer.parseInt(strPage);
    List<BoardDTO> list=dao.boardAllData(curpage);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../databoard/table.css">
</head>
<body>
  <center>
    <h3>자료실</h3>
    <table width=600 border=0>
      <tr>
       <td align=left>
        <a href="main.jsp?mode=4">등록</a>
       </td>
      </tr>
    </table>
    <table id="table_content">
      <tr>
        <th width=10%>번호</th>
        <th width=45%>제목</th>
        <th width=15%>이름</th>
        <th width=20%>작성일</th>
        <th width=10%>조회수</th>
      </tr>
      <%
         for(BoardDTO d:list)
         {
      %>
            <tr class="dataTr">
              <td width=10% class="tdcenter"><%=d.getNo() %></td>
              <td width=45% class="tdleft">
                <a href="main.jsp?mode=5&no=<%=d.getNo()%>&page=<%=curpage%>"><%=d.getSubject() %></a>
              </td>
              <td width=15% class="tdcenter"><%=d.getName() %></td>
              <td width=20% class="tdcenter"><%=d.getRegdate().toString() %></td>
              <td width=10% class="tdcenter"><%=d.getHit() %></td>
            </tr>
      <%
         }
      %>
    </table>
  </center>
</body>
</html>


