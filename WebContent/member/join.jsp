<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">
<script type="text/javascript">
function postfind()
{
	window.open("../member/postfind.jsp","postfind",
			"width=430,height=350,menubar=no,toolbar=no,scrollbars=yes");
}
function idcheck()
{
	window.open("../member/idcheck.jsp","idcheck",
			"width=350,height=150,menubar=no,toolbar=no,scrollbars=no");
}
</script>
</head>
<body>
  <center>
    <h3>ȸ�� ����</h3>
    <form name="join_frm" action="../member/join_ok.jsp" method="post">
    <table border=1 bordercolor="black" width=500
       cellpadding="0" cellspacing="0">
      <tr>
        <td>
         <table border=0 width=500>
           <tr height=30>
             <td width=15% align=right>ID</td>
             <td width=85% align=left>
              <input type=text name=id size=12 readonly>
              <input type="button" value="�ߺ�üũ" onclick="idcheck()">
             </td>
           </tr>
           <tr height=30>
             <td width=15% align=right>Password</td>
             <td width=85% align=left>
              <input type=password name=pwd size=12 required>
              &nbsp;���Է�
              <input type=password name=pwd1 size=12 required>
             </td>
           </tr>
           <tr height=30>
             <td width=15% align=right>�̸�</td>
             <td width=85% align=left>
              <input type=text name=name size=12 required>
             </td>
           </tr>
           <tr height=30>
             <td width=15% align=right>����</td>
             <td width=85% align=left>
              <input type=radio name=sex value=���� checked>����
              <input type=radio name=sex value=����>����
             </td>
           </tr>
           <tr height=30>
             <td width=15% align=right>�������</td>
             <td width=85% align=left>
              <input type=date name=birth size=20>
             </td>
           </tr>
           <tr height=30>
             <td width=15% align=right>��ȭ��ȣ</td>
             <td width=85% align=left>
              <select name=tel1>
                <option>010</option>
                <option>011</option>
                <option>017</option>
              </select>
              <input type=text name=tel2 size=7>-
              <input type=text name=tel3 size=7>
             </td>
           </tr>
           <tr height=30>
             <td width=15% align=right>�����ȣ</td>
             <td width=85% align=left>
              <input type=text name=post1 readonly size=5>-
              <input type=text name=post2 readonly size=5>
              <input type="button" value="�����ȣ�˻�" onclick="postfind()">
             </td>
           </tr>
           <tr height=30>
             <td width=15% align=right>�ּ�</td>
             <td width=85% align=left>
              <input type=text name=addr1 size=45 readonly>
             </td>
           </tr>
           <tr height=30>
             <td width=15% align=right>���ּ�</td>
             <td width=85% align=left>
              <input type=text name=addr2 size=45>
             </td>
           </tr>
           <tr>
             <td colspan="2" align=center>
              <input type="submit" value="����">
              <input type="button" value="���">
             </td>
           </tr>
         </table>
        </td>
      </tr>
    </table>
    </form>
  </center>
</body>
</html>






