package com.spring.footprint.test;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.spring.footprint.domain.MapInformation;

//SqlSessionFactory를 생성하는 놈..
public class TestUtil {
	public static void printList(List<MapInformation> list){
		for(int i=0; i<list.size();i++){
			System.out.println("<"+(i+1+"> 번째 검색..."+list.get(i).toString()));
		}
	}
	
	public static SqlSessionFactory getSqlSessionFactory() throws IOException{
		Reader reader = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		SqlSessionFactory factory=new SqlSessionFactoryBuilder().build(reader);
		return factory;
	}

}
