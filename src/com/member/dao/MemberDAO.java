package com.member.dao;
// C:\webDev\webStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPMiniProject\image
import java.util.*;
import java.sql.*;
import javax.sql.*;

import org.rosuda.REngine.Rserve.RConnection;

import javax.naming.*;
import java.io.*;
public class MemberDAO {
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
   public void saveFile()
   {
	   try
	   {
		   getConnection();
		   String sql="SELECT name,logcount "
				     +"FROM member";
		   String data="name,count\n";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   data+=rs.getString(1)+","
					+rs.getInt(2)+"\n";
		   }
		   rs.close();
		   String path="C:/webDev/webStudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/JSPMiniProject/image/log.csv";
		   File file=new File(path);
		   if(!file.exists())
			   file.createNewFile();
		   
		   FileWriter fw=new FileWriter(file);
		   fw.write(data);
		   fw.close();
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
	   finally
	   {
		   disConnection();
	   }
   }
   public String isLogin(String id,String pwd)
   {
	   String result="";
	   try
	   {
		   getConnection();
		   String sql="SELECT COUNT(*) FROM member "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   int count=rs.getInt(1);
		   rs.close();
		   ps.close();
		   if(count==0)
		   {
			   result="NOID";
		   }
		   else
		   {
			   sql="SELECT pwd,name FROM member "
				  +"WHERE id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, id);
			   rs=ps.executeQuery();
			   rs.next();
			   String db_pwd=rs.getString(1);
			   String db_name=rs.getString(2);
			   rs.close();
			   ps.close();
			   if(db_pwd.equals(pwd))
			   {
				   result=db_name;
				   sql="UPDATE member SET "
				      +"logcount=logcount+1 "
					  +"WHERE id=?";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, id);
				   ps.executeUpdate();
			   }
			   else
			   {
				   result="NOPWD";
			   }
		   }
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
	   finally
	   {
		   disConnection();
	   }
	   return result;
   }
   public static void createLogImage()
   {
	   try
	   {
		   RConnection rc=new RConnection();
		   rc.voidEval("log<-read.csv(\"C:/webDev/webStudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/JSPMiniProject/image/log.csv\",header=T,sep=\",\")");
		   rc.voidEval("png(\"C:/webDev/webStudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/JSPMiniProject/image/log.png\",width=500,height=400)");
		   rc.voidEval("barplot(log$count,names.arg=log$name,col=rainbow(15))");
		   rc.voidEval("dev.off()");
		   rc.close();
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
   }
   public List<ZipcodeDTO> postfind(String dong)
   {
	   List<ZipcodeDTO> list=
			   new ArrayList<ZipcodeDTO>();
	   try
	   {
		   getConnection();
		   String sql="SELECT zipcode,sido,gugun,dong,NVL(bunji,' ') "
				     +"FROM zipcode "
				     +"WHERE dong LIKE '%'||?||'%'";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, dong);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   ZipcodeDTO d=new ZipcodeDTO();
			   d.setZipcode(rs.getString(1));
			   d.setSido(rs.getString(2));
			   d.setGugun(rs.getString(3));
			   d.setDong(rs.getString(4));
			   d.setBunji(rs.getString(5));
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
   public int idcheck(String id)
   {
	   int count=0;
	   try
	   {
		   getConnection();
		   String sql="SELECT COUNT(*) FROM member "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
	   finally
	   {
		   disConnection();
	   }
	   return count;
   }
   public void memberJoin(MemberDTO d)
   {
	   try
	   {
		   getConnection();
		   String sql="INSERT INTO member VALUES("
				     +"?,?,?,?,?,?,?,?,?,0,SYSDATE)";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, d.getId());
		   ps.setString(2, d.getPwd());
		   ps.setString(3, d.getName());
		   ps.setString(4, d.getSex());
		   ps.setString(5, d.getBirth());
		   ps.setString(6, d.getTel());
		   ps.setString(7, d.getPost());
		   ps.setString(8, d.getAddr1());
		   ps.setString(9, d.getAddr2());
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
}









