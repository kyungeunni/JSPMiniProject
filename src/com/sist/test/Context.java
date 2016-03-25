package com.sist.test;
import java.io.File;
import java.util.*;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import com.sun.org.apache.bcel.internal.classfile.Field;
public class Context {
    Map map=new HashMap();
    public Context()
    {
    	try
    	{
    		SAXParserFactory spf=
    				SAXParserFactory.newInstance();
    		SAXParser sp=spf.newSAXParser();
    		MyDefaultHandler m=
    				new MyDefaultHandler();
    		String path="C:\\webDev\\webStudy\\JSPMiniProject\\src\\com\\sist\\test\\server.xml";
    		sp.parse(new File(path), m);
    		map=m.map;
    	}catch(Exception ex){}
    }
    public Object lookup(String key)
    {
    	return map.get(key);
    }
}
