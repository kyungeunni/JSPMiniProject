<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.board.dao.*"%>
<jsp:useBean id="dao" class="com.board.dao.BoardDAO"/>
<%
    String no=request.getParameter("no");
    String strPage=request.getParameter("page");
    BoardDTO d=dao.boardContentData(Integer.parseInt(no), 2);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="board.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.js"></script>
<script type="text/javascript">
/*
 *   selector : 내장객체 , 태그명( $('태그명')=>$('tr')) , 
                ID명 ($('#ID명')) ,
                Class명 ($('.class명'))
             $(document)
 */
$(function(){
	$('#sendBtn').click(function(){
		var name=$('#name').val();
		if(name.trim()=="")
		{
			$('#name').focus();
			$('#name').val("");
			return;
		}
		var subject=$('#subject').val();
		if(subject.trim()=="")
		{
			$('#subject').focus();
			$('#subject').val("");
			return;
		}
		var content=$('#content').val();
		if(content.trim()=="")
		{
			$('#content').focus();
			$('#content').val("");
			return;
		}
		var pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			$('#pwd').val("");
			return;
		}
		if(pwd.length>10)
		{
		  alert("비밀번호는 10자이내로 사용합니다");
		  $('#pwd').val("");
		  $('#pwd').focus();
		  return;
		}
		$('#datafrm').submit();
	});
});
</script>
<link rel="stylesheet" type="text/css" href="../databoard/table.css">
</head>
<body>
  <center>
    <h3>자료수정</h3>
    <p>
    <form method=post action="../databoard/update_ok.jsp" id="datafrm" enctype="multipart/form-data">
    
          <table id="table_content">
           <tr>
            <td width=15% align="right">이름</td>
            <td width=85% align="left">
             <input type="text" name=name size=12 id="name" value="<%=d.getName()%>">
             <input type=hidden name="no" value="<%=no%>">
             <input type=hidden name="page" value="<%=strPage%>">
            </td>
           </tr>
           <tr>
            <td width=15% align="right">제목</td>
            <td width=85% align="left">
             <input type="text" name=subject size=53 id="subject" value="<%=d.getSubject()%>">
            </td>
           </tr>
           <tr>
            <td width=15% align="right">내용</td>
            <td width=85% align="left">
             <textarea rows="10" cols="50" name=content id="content"><%=d.getContent() %></textarea>
            </td>
           </tr>
           <tr>
            <td width=15% align="right">첨부파일</td>
            <td width=85% align="left">
             <input type="file" size=30 name=upload id="upload">
            </td>
           </tr>
           <tr>
            <td width=15% align="right">비밀번호</td>
            <td width=85% align="left">
             <input type="password" size=10 name=pwd id="pwd">
            </td>
           </tr>
           <tr>
            <td colspan="2" align="center">
             <input type="button" value="수정" id="sendBtn">
             <input type="button" value="취소"
              onclick="javascript:history.back()">
            </td>
           </tr>
          </table>
        
    </form>
   </center>
</body>
</html>