package com.jsp.change;

public class JspChange {
   private static String[] jsp={
		 "default.jsp",
		 "../member/join.jsp",
		 "../member/joinyes.jsp",
		 "../databoard/list.jsp",
		 "../databoard/insert.jsp",
		 "../databoard/content.jsp",
		 "../databoard/update.jsp",
		 "../movie/list.jsp",
		 "../movie/detail.jsp"
		 
   };
   public static String change(int no)
   {
	   return jsp[no];
   }
}
