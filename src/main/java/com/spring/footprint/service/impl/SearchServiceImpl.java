package com.spring.footprint.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.footprint.dao.SearchDao;
import com.spring.footprint.domain.Search;
import com.spring.footprint.service.SearchService;

@Service("searchServiceImpl")
public class SearchServiceImpl implements SearchService{

	@Resource
	private SearchDao searchDao;

	@Override
	public void insertWord(String word) throws Exception {
		searchDao.insertWord(word);
	}

	@Override
	public void updateCount(String word) throws Exception {
		searchDao.updateCount(word);	
	}

	@Override
	public List<Search> getBestWord() throws Exception {
		return searchDao.getBestWord();
	}

	@Override
	public List<Search> searchMemberTipBoard() throws Exception {
		return searchDao.searchMemberTipBoard();
	}

	@Override
	public List<Search> searchAdminTipBoard() throws Exception {
		return searchDao.searchAdminTipBoard();
	}

	@Override
	public List<Search> searchMemberBoard() throws Exception {
		return searchDao.searchMemberBoard();
	}

	@Override
	public List<Search> searchAdminBoard() throws Exception {
		return searchDao.searchAdminBoard();
	}

}
