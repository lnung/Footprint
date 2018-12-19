package com.spring.footprint.service;

import java.util.List;

import com.spring.footprint.domain.Search;

public interface SearchService {
	public void insertWord(String word) throws Exception;
	public void updateCount(String word) throws Exception;	
	public List<Search> getBestWord() throws Exception;
	
	// Board 전체보기
	public List<Search> searchMemberTipBoard()  throws Exception;
	public List<Search> searchAdminTipBoard()  throws Exception;
	public List<Search> searchMemberBoard()  throws Exception;
	public List<Search> searchAdminBoard()  throws Exception;
}
