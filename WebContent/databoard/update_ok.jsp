<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.board.dao.*"%>
<%@page import="java.io.File"%>
<%@page import="com.board.dao.BoardDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<jsp:useBean id="dao" class="com.board.dao.BoardDAO"/>
<%
    //request.setCharacterEncoding("EUC-KR"); 
   
    String path="c://download";
    String enctype="EUC-KR";
    int size=1024*1024*100;
    MultipartRequest mr=
    		new MultipartRequest(request,path,size,enctype,
    				new DefaultFileRenamePolicy());
    String no=mr.getParameter("no");
    
    String strPage=mr.getParameter("page");
    String name=mr.getParameter("name");
    String subject=mr.getParameter("subject");
    String content=mr.getParameter("content");
    String pwd=mr.getParameter("pwd");
    String filename=mr.getOriginalFileName("upload");
    BoardDTO info=dao.boardContentData(Integer.parseInt(no), 2);
    BoardDTO d=new BoardDTO();
    if(filename==null)
    {
    	d.setFilename(info.getFilename());
    	d.setFilesize(info.getFilesize());
    }
    else
    {
    	File f=new File("c:\\download\\"+filename);
    	d.setFilename(filename);
    	d.setFilesize((int)f.length());
    }
    d.setNo(Integer.parseInt(no));
    d.setName(name);
    d.setSubject(subject);
    d.setContent(content);
    d.setPwd(pwd);
    // DB연동 
    boolean bCheck=dao.boardUpdate(d);
    // 이동 
    if(bCheck==true)
    {
       if(filename!=null && info.getFilesize()>0)
       {
    	   File f=new File("c:\\download\\"+info.getFilename());
    	   f.delete();
       }
       response.sendRedirect("../main/main.jsp?mode=5&no="+no+"&page="+strPage);
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
%>








