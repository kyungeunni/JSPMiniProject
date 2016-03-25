<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*,com.board.dao.*"%>
<jsp:useBean id="dao" class="com.board.dao.BoardDAO"/>
<%
    String pwd=request.getParameter("pwd");
    String no=request.getParameter("no");
    String strPage=request.getParameter("page");
    
    // no=>filename,filesize
    BoardDTO d=dao.boardContentData(Integer.parseInt(no), 2);
    // delete (db,file)
    boolean bCheck=
       dao.boardDelete(Integer.parseInt(no), pwd);
    if(bCheck==true)
    {
    	if(d.getFilesize()>0)
    	{
    		File file=new File("c:\\download\\"+d.getFilename());
    		file.delete();
    		// rm -rf ==> -rmr
    	}
    	response.sendRedirect("../main/main.jsp?mode=3&page="+strPage);
    }
    else
    {
%>
       <script>
       alert("비밀번호가 틀립니다");
       history.back();
       </script>
<%
    }
    // 이동 
%>








