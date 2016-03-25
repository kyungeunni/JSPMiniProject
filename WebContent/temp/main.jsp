<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.emp.dao.*,java.util.*"%>
<%
	DeptDAO dao=new DeptDAO();
	List<DeptDTO> list=dao.deptAllData();
	for(DeptDTO d:list)
	{
		System.out.println(d.getDeptno()+" "
				+d.getDname()+" "
				+d.getLoc());
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>