package com.spring.footprint.dao;

import java.util.List;

import com.spring.footprint.domain.Search;

public interface SearchDao {
	public void insertWord(String word) throws Exception;
	public void updateCount(String word) throws Exception;	
	public List<Search> getBestWord() throws Exception;
	
	// Board ��ü����
	public List<Search> searchMemberTipBoard()  throws Exception;
	public List<Search> searchAdminTipBoard()  throws Exception;
	public List<Search> searchMemberBoard()  throws Exception;
	public List<Search> searchAdminBoard()  throws Exception;
}
