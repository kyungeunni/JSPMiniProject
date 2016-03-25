package com.emp.dao;
import java.sql.*;
import java.util.*;
import javax.sql.*;// DataSource (DataBase�� ��� ����)
import javax.naming.*;// Context
public class DeptDAO {
   private Connection conn;
   private PreparedStatement ps;
   // �̹� ������ �÷����� �ּҰ��� ���´� 
   public void getConnection()
   {
	   try
	   {
		   // Ž���⸦ ���� 
		   Context init=new InitialContext();
		   // JNDI�� �ʱ�ȭ 
		   // C����̹��� ����
		   Context c=(Context)init.lookup("java:/comp/env");
		   // �̸� => Connection�� ��� �´� 
		   DataSource ds=(DataSource)c.lookup("jdbc/oracle");
		   // conn�� ���� (�ּ�)
		   conn=ds.getConnection();
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
   }
   // ��ȯ 
   public void disConnection()
   {
	  try
	  {
		  if(ps!=null) ps.close();
		  if(conn!=null) conn.close();
	  }catch(Exception ex){}
   }
   // ���
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




