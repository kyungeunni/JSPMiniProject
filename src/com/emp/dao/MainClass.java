package com.emp.dao;
import java.util.*;
public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        DeptDAO dao=new DeptDAO();
        List<DeptDTO> list=dao.deptAllData();
        for(DeptDTO d:list)
        {
        	System.out.println(d.getDeptno()+" "
        			+d.getDname()+" "
        			+d.getLoc());
        }
	}

}
