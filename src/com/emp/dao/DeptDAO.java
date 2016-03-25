package com.emp.dao;
import java.sql.*;
import java.util.*;
import javax.sql.*;// DataSource (DataBase의 모든 정보)
import javax.naming.*;// Context
public class DeptDAO {
   private Connection conn;
   private PreparedStatement ps;
   // 이미 생성된 컬렉션의 주소값을 얻어온다 
   public void getConnection()
   {
	   try
	   {
		   // 탐색기를 연다 
		   Context init=new InitialContext();
		   // JNDI의 초기화 
		   // C드라이버에 접근
		   Context c=(Context)init.lookup("java:/comp/env");
		   // 이름 => Connection을 얻어 온다 
		   DataSource ds=(DataSource)c.lookup("jdbc/oracle");
		   // conn에 저장 (주소)
		   conn=ds.getConnection();
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
   }
   // 반환 
   public void disConnection()
   {
	  try
	  {
		  if(ps!=null) ps.close();
		  if(conn!=null) conn.close();
	  }catch(Exception ex){}
   }
   // 목록
   public List<DeptDTO> deptAllData()
   {
	   List<DeptDTO> list=new ArrayList<DeptDTO>();
	   try
	   {
		   getConnection();
		   String sql="SELECT * FROM dept";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   DeptDTO d=new DeptDTO();
			   d.setDeptno(rs.getInt(1));
			   d.setDname(rs.getString(2));
			   d.setLoc(rs.getString(3));
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
}




