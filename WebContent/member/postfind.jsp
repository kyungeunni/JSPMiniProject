<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.member.dao.*"%>
<%
     request.setCharacterEncoding("EUC-KR");
     String dong=request.getParameter("dong");
     MemberDAO dao=new MemberDAO();
     List<ZipcodeDTO> list=null;
     if(dong!=null)
     {
    	 list=dao.postfind(dong);
     }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
th,td{
	font-family: 맑은 고딕;
	font-size: 9pt
}
a{
    text-decoration: none;
    color: black;
}
a:HOVER {
	text-decoration: underline;
	color: #ccccff;
}
</style>
<script type="text/javascript">
function postfind()
{
	 var f=document.frm; // $('#frm')
	 if(f.dong.value=="")
	 {
		 f.dong.focus();
		 return;
	 }
	 f.submit();
}
function ok(zip,addr)
{
	opener.join_frm.post1.value=zip.substring(0,3);
	opener.join_frm.post2.value=zip.substring(4,7);
	opener.join_frm.addr1.value=addr;
	self.close();
}
</script>
</head>
<body>
  <center>
    <table border=0 width=430>
      <tr>
       <td align=left>
   <form method=post action="postfind.jsp" name=frm>
       입력:<input type=text name=dong size=13>
       <input type=button value="우편번호 검색" onclick="postfind()">
   </form>
       </td>
      </tr>
    </table>
    <%
      if(list!=null && list.size()>0)
      {
    %>
    <table border=0 width=430>
     <tr bgcolor=#ccccff>
      <th width=30%>우편번호</th>
      <th width=70%>주소</th>
     </tr>
     <%
         for(ZipcodeDTO d:list)
         {
        	 String zip=d.getZipcode();
        	 String addr=d.getSido()+" "
        			    +d.getGugun()+" "
        			    +d.getDong()+" "
        			    +d.getBunji();
     %>
             <tr>
              <td width=30% align=center><%=zip %></td>
              <td width=70% align=left>
              <a href="javascript:ok('<%=zip%>','<%=addr%>')"><%=addr %></a>
              </td>
             </tr>
     <%
         }
     %>
    </table>
    <%
      }
      else 
      {
    %>
    <table border=0 width=430>
     <tr>
      <td align=center>
       <font color=red>검색한 결과가 없습니다</font>
      </td>
     </tr>
    </table>
    <%
      }
    %>
  </center>
</body>
</html>





