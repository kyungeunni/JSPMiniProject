<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#id').val("");
	$('#pwd').val("");
	$('#id').focus();
	
	$('#logBtn').click(function(){
		var id=$('#id').val();
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		var pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			return;
		}
		$('#logfrm').submit();
	});
});
</script>
</head>
<body>
  <center>
  <form method=post action="../member/login_ok.jsp" id="logfrm">
   <table border=0 width=200>
    <tr>
      <td align="right" width=30%>ID</td>
      <td align="left" width=70%>
       <input type=text name=id size=20 id="id">
      </td>
    </tr>
    <tr>
      <td align="right" width=30%>PW</td>
      <td align="left" width=70%>
       <input type=password name=pwd size=20 id="pwd">
      </td>
    </tr>
    <tr>
      <td align="right" colspan="2">
       <input type=button value="로그인" id="logBtn">
      </td>
    </tr>
   </table>
   </form>
  </center>
</body>
</html>


