package com.movie.dao;
import java.util.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.*;
import java.net.*;

public class MovieManager {

	
	public static void main(String[] args){
		MovieManager m = new MovieManager();
		m.movieAllData();
	}
	public List<MovieDTO> movieAllData(){
		List<MovieDTO> list = new ArrayList<MovieDTO>();
		try {
			Document doc = Jsoup.connect("http://www.cgv.co.kr/movies/").get();//����������
			//System.out.println(doc);
			Elements titleElem=doc.select("div.box-contents strong.title");
			Elements imageElem=doc.select("div.box-image a span.thumb-image img");
			Elements gradeElem=doc.select("div.box-image a span.thumb-image span");
			Elements percentElem=doc.select("div.box-contents div.score strong.percent span");
			Elements likeElem=doc.select("div.box-contents span.like span.count strong i");
			Elements starElem=doc.select("div.box-contents span.percent");
			Elements dayElem=doc.select("div.box-contents span.txt-info strong");
			Elements rankElem=doc.select("div.box-image strong.rank");
			
			
			for(int i=0;i<percentElem.size();i++){
				//��Ʈ�� �� ���۸�: ����Ƽ���� ���� 81.1% 2016.03.24 ���� 24,348 74% http://img.cgv.co.kr/Movie/Thumbnail/Poster/000078/78391/78391_185.jpg No.1 12�� �̻�
				
				Element telem=titleElem.get(i);
				Element pelem=percentElem.get(i);
				Element delem=dayElem.get(i);
				Element lelem=likeElem.get(i);
				Element selem=starElem.get(i);
				Element ielem=imageElem.get(i);
				String img=ielem.attr("src");	//�Ӽ��� ����
				Element relem=rankElem.get(i);
				Element gelem=gradeElem.get(i);
				//System.out.println(telem.text() +" "+pelem.text()+" "+delem.text()+" "+lelem.text()+" "+selem.text()+" "+img+" "+relem.text()+" "+gelem.text());
				MovieDTO d=new MovieDTO();
				d.setNo(i+1);
				d.setTitle(telem.text());
				d.setReserve(Double.parseDouble(pelem.text().substring(0, pelem.text().lastIndexOf('%'))));//%������ �ڸ���
				d.setImage(img);
				d.setLike(Integer.parseInt(lelem.text().replace(",", "")));
				d.setRegdate(delem.text().substring(0, delem.text().indexOf("����")));
				d.setStar(Integer.parseInt(selem.text().substring(0, selem.text().lastIndexOf('%'))));
				d.setRank(Integer.parseInt(relem.text().substring(3)));
				d.setGrade(gelem.text());
				list.add(d);
				
			}
		} catch (Exception e) {
			
			System.out.println("moiveAllData>>"+e.getMessage());
		}
		return list;
	}
	public MovieDTO movieDetail(int no){
		MovieDTO d=new MovieDTO();
		List<MovieDTO> list= movieAllData();
		d=list.get(no-1);
		
		return d;
	}
	public List<String> movieRank(){
		List<String> list = new ArrayList<String>();
			
		try{
			Document doc = Jsoup.connect("http://movie.naver.com/movie/sdb/rank/rmovie.nhn").get();
			Elements elems=doc.select("td.title div.tit3");
			for(int i=0;i<10;i++){
				Element elem=elems.get(i);
				list.add(elem.text());
			}
			
			
		}catch(Exception e){
			System.out.println("MVRank>> "+e.getMessage());
		}
		return list;
	}
	
	public List<String> movieReserve(){
		List<String> list = new ArrayList<String>();
			
		try{
			Document doc = Jsoup.connect("http://movie.naver.com/movie/sdb/rank/rreserve.nhn").get();
			Elements elems=doc.select("td.title div.tit4");
			for(int i=0;i<10;i++){
				Element elem=elems.get(i);
				list.add(elem.text());
			}
			
			
		}catch(Exception e){
			System.out.println("MVRS>> "+e.getMessage());
		}
		return list;
	}
	
	public List<String> movieBoxoffice(){
		List<String> list = new ArrayList<String>();
			
		try{
			Document doc = Jsoup.connect("http://movie.naver.com/movie/sdb/rank/rboxoffice.nhn").get();
			Elements elems=doc.select("td.title div.tit1");
			for(int i=0;i<10;i++){
				Element elem=elems.get(i);
				list.add(elem.text());
			}
			
			
		}catch(Exception e){
			System.out.println("MVBO>> "+e.getMessage());
		}
		return list;
	}
}
