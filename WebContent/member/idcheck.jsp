<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.member.dao.*"%>
<%
    String id=request.getParameter("id");
    if(id==null)
    	id="";
    MemberDAO dao=new MemberDAO();
    int count=dao.idcheck(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function ok()
{
	opener.join_frm.id.value=document.frm.id.value;
	self.close();
}
</script>
</head>
<body>
   <center>
    <table border=0 width=300>
     <tr>
      <td>
      <form method=post action="idcheck.jsp" name=frm>
       ID:<input type=text name=id size=12 value=<%=id==null?"":id %>>
       <input type=submit value="�ߺ�üũ">
       </form>
      </td>
     </tr>
     <tr>
      <td>
       <%
          if(count==0)
          {
       %>
            <font color=red>
            <%=id %>��(��) ��� �����մϴ�
            </font>
       <%
          }
          else
          {
       %>
            <font color=blue>
            <%=id %>��(��) �̹� ������Դϴ�
            </font>
       <% 
          }
       %>
      </td>
     </tr>
     <%
        if(count==0)
        {
     %>
     <tr>
      <td align=center>
       <input type=button value="Ȯ��" onclick="ok()">
      </td>
     </tr>
     <%
        }
     %>
    </table>
   </center>
</body>
</html>




