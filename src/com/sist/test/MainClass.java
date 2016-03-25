package com.sist.test;

import java.sql.Connection;

public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        try
        {
        	Context c=new Context();
        	MyDataSource ds=(MyDataSource)c.lookup("jdbc/oracle");
        	Connection conn=ds.getConnection();
        }catch(Exception ex){}
	}

}
