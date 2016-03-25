<%@page import="java.io.File"%>
<%@page import="com.board.dao.BoardDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="com.board.dao.BoardDAO"/>
<%
    //request.setCharacterEncoding("EUC-KR"); 
    String path="c://download";
    String enctype="EUC-KR";
    int size=1024*1024*100;
    MultipartRequest mr=
    		new MultipartRequest(request,path,size,enctype,
    				new DefaultFileRenamePolicy());
    String name=mr.getParameter("name");
    String subject=mr.getParameter("subject");
    String content=mr.getParameter("content");
    String pwd=mr.getParameter("pwd");
    String filename=mr.getOriginalFileName("upload");
    BoardDTO d=new BoardDTO();
    if(filename==null)
    {
    	d.setFilename("");
    	d.setFilesize(0);
    }
    else
    {
    	File f=new File("c:\\download\\"+filename);
    	d.setFilename(filename);
    	d.setFilesize((int)f.length());
    }
    d.setName(name);
    d.setSubject(subject);
    d.setContent(content);
    d.setPwd(pwd);
    // DB연동 
    dao.boardInsert(d);
    // 이동 
    response.sendRedirect("../main/main.jsp?mode=3");
%>







