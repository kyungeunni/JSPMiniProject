package com.board.dao;
import java.util.*;
import javax.sql.*;
import javax.naming.*;
import java.sql.*;
public class BoardDAO {
	   private Connection conn;
	   private PreparedStatement ps;
	   public void getConnection()
	   {
		   try
		   {
			   Context init=new InitialContext();
			   Context c=(Context)init.lookup("java://comp/env");
			   DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			   conn=ds.getConnection();
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
	   }
	   public void disConnection()
	   {
		   try
		   {
			   if(ps!=null) ps.close();
			   if(conn!=null) conn.close();
		   }catch(Exception ex){}
	   }
	   public List<BoardDTO> boardAllData(int page)
	   {
		   List<BoardDTO> list=
				   new ArrayList<BoardDTO>();
		   try
		   {
			   getConnection();
			   int rowSize=10;
			   int start=(page*rowSize)-(rowSize-1);
			   int end=page*rowSize;
			   // inline-view
			   String sql="SELECT no,subject,name,regdate,hit,num "
					     +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
					     +"FROM (SELECT no,subject,name,regdate,hit "
					     +"FROM databoard ORDER BY no DESC)) "
					     +"WHERE num BETWEEN "+start+" AND "+end;
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   BoardDTO d=new BoardDTO();
				   d.setNo(rs.getInt(1));
				   d.setSubject(rs.getString(2));
				   d.setName(rs.getString(3));
				   d.setRegdate(rs.getDate(4));
				   d.setHit(rs.getInt(5));
				   list.add(d);
			   }
			   rs.close();
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
		   return list;
	   }
	   /*
	    *  INSERT INTO databoard VALUES(db_no_seq.nextval,
'홍길동','파일 없음','파일무','1234',SYSDATE,0,'',0);
	    */
	   public void boardInsert(BoardDTO d)
	   {
		   try
		   {
			   getConnection();
			   String sql="INSERT INTO databoard VALUES("
					     +"db_no_seq.nextval,?,?,?,?,SYSDATE,0,?,?)";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, d.getName());
			   ps.setString(2, d.getSubject());
			   ps.setString(3, d.getContent());
			   ps.setString(4, d.getPwd());
			   ps.setString(5, d.getFilename());
			   ps.setInt(6, d.getFilesize());
			   ps.executeUpdate();
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
	   }
	   public BoardDTO boardContentData(int no,int mode)
	   {
		   BoardDTO d=new BoardDTO();
		   try
		   {
			   getConnection();
			   String sql="";
			   if(mode==1) // 조회수 
			   {
				   sql="UPDATE databoard SET "
					  +"hit=hit+1 "
					  +"WHERE no=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1, no);
				   ps.executeUpdate();
				   ps.close();
			   }
			   sql="SELECT no,name,subject,content,regdate,"
				  +"hit,filename,filesize "
				  +"FROM databoard "
				  +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   d.setNo(rs.getInt(1));
			   d.setName(rs.getString(2));
			   d.setSubject(rs.getString(3));
			   d.setContent(rs.getString(4));
			   d.setRegdate(rs.getDate(5));
			   d.setHit(rs.getInt(6));
			   d.setFilename(rs.getString(7));
			   d.setFilesize(rs.getInt(8));
			   rs.close();
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
		   return d;
	   }
	   public boolean boardDelete(int no,String pwd)
	   {
		   boolean bCheck=false;
		   try
		   {
			   getConnection();
			   String sql="SELECT pwd FROM databoard "
					     +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   String db_pwd=rs.getString(1);
			   rs.close();
			   ps.close();
			   if(db_pwd.equals(pwd))
			   {
				   bCheck=true;
				   sql="DELETE FROM databoard "
					  +"WHERE no=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1, no);
				   ps.executeUpdate();
			   }
			   else
			   {
				   bCheck=false;
			   }
			   
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
		   return bCheck;
	   }
	   public boolean boardUpdate(BoardDTO d)
	   {
		   boolean bCheck=false;
		   try
		   {
			   getConnection();
			   String sql="SELECT pwd FROM databoard "
					     +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, d.getNo());
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   String db_pwd=rs.getString(1);
			   rs.close();
			   ps.close();
			   if(db_pwd.equals(d.getPwd()))
			   {
				   bCheck=true;
				   sql="UPDATE databoard SET "
				      +"name=?,subject=?,content=?,"
					  +"filename=?,filesize=? "
				      +"WHERE no=?";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, d.getName());
				   ps.setString(2, d.getSubject());
				   ps.setString(3, d.getContent());
				   ps.setString(4, d.getFilename());
				   ps.setInt(5, d.getFilesize());
				   ps.setInt(6, d.getNo());
				   ps.executeUpdate();
			   }
			   else
			   {
				   bCheck=false;
			   }
			   
		   }catch(Exception ex)
		   {
			   System.out.println(ex.getMessage());
		   }
		   finally
		   {
			   disConnection();
		   }
		   return bCheck;
	   }
	   
}







