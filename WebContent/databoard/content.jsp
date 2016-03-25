<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.board.dao.*"%>
<%
    String strNo=request.getParameter("no");
    String strPage=request.getParameter("page");
    BoardDAO dao=new BoardDAO();
    BoardDTO d=
    	dao.boardContentData(Integer.parseInt(strNo), 1);
    	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="board.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.js"></script>
<script type="text/javascript">
var i=0;
$(function(){
	$('#delBtn').click(function(){
		if(i==0)
		{
			$('#delTr').show();
			$('#delBtn').attr("src","../image/btn_cancel.gif");
			i=1;
		}
		else
		{
			$('#delTr').hide();
			$('#delBtn').attr("src","../image/btn_delete.gif");
			i=0;
		}
	});
	$('#delBtn1').click(function(){
		var pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#delTr').show();
			$('#pwd').focus();
			return;
		}
		$('#delfrm').submit();
	});
});
</script>
<link rel="stylesheet" type="text/css" href="../databoard/table.css">
</head>
<%--
       delete.jsp?pwd=&no=1&page=3
       
       pwd=&no=1&page=3
       
       open("delete.jsp?pwd=&no=1&page=3","GET")
       send(null) ==> GET
       
       open("delete.jsp","POST")
       send(pwd=&no=1&page=3) ==> POST
       
       pwd=&no=1&page=3 ==> pwd=""
       no=1&page=3      ==> pwd=null
       
       getParameter("pwd");
       getParameter("pwd");
       if(pwd==null || pwd.equals(""))
       
       list.jsp
       list.jsp?page = 10
 --%>
<body>
  <center>
    <h3>내용보기</h3>
    <p>
    <table id="table_content">
      <tr height=27>
        <td width=20% align=center bgcolor=#ccccff>번호</td>
        <td width=30% align=center><%=d.getNo() %></td>
        <td width=20% align=center bgcolor=#ccccff>작성일</td>
        <td width=30% align=center><%=d.getRegdate() %></td>
      </tr>
      <tr height=27>
        <td width=20% align=center bgcolor=#ccccff>이름</td>
        <td width=30% align=center><%=d.getName() %></td>
        <td width=20% align=center bgcolor=#ccccff>조회수</td>
        <td width=30% align=center><%=d.getHit() %></td>
      </tr>
      <tr height=27>
        <td width=20% align=center bgcolor=#ccccff>제목</td>
        <td width=30% align=left colspan="3"><%=d.getSubject() %></td>
      </tr>
      <%
         if(d.getFilesize()>0)
         {
      %>
      <tr height=27>
        <td width=20% align=center bgcolor=#ccccff>첨부파일</td>
        <td width=30% align=left colspan="3">
        <a href="../databoard/download.jsp?fn=<%=d.getFilename()%>"><%=d.getFilename() %></a>
        (<%=d.getFilesize() %>Bytes)</td>
      </tr>
      <%
         }
      %>
      <tr>
        <td colspan="4" align="left" valign="top" height=200>
          <pre><%=d.getContent() %></pre>
        </td>
      </tr>
      
    </table>
    <table border=0 width=500>
      <tr>
        <td align="right">
         <a href="main.jsp?mode=6&no=<%= d.getNo()%>&page=<%=strPage%>">
         <img src="../image/btn_modify.gif"></a>
         <img src="../image/btn_delete.gif" id="delBtn">
         <a href="main.jsp?mode=3&page=<%=strPage%>">
         <img src="../image/btn_list.gif" border=0></a>
        </td>
      </tr>
      <tr id="delTr" style="display:none">
        <td align="right">
        <form method=post action="../databoard/delete.jsp" id="delfrm">
                   비밀번호:<input type="password" name=pwd size=10 id="pwd">
        <input type="hidden" name=no value="<%=strNo%>">
        <input type="hidden" name=page value="<%=strPage%>">
        <input type=button value="삭제" id="delBtn1">
        </form>
        </td>
      </tr>
    </table>
  </center>
</body>
</html>








