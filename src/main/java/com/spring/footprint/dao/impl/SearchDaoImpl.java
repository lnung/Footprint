package com.spring.footprint.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.footprint.dao.SearchDao;
import com.spring.footprint.domain.Search;

@Repository("searchDaoImpl")
public class SearchDaoImpl implements SearchDao{
	
	@Resource
	private SqlSession sqlSession;

	@Override
	public void insertWord(String word) throws Exception {
		sqlSession.insert("SearchMapper.insertWord", word);
	}

	@Override
	public void updateCount(String word) throws Exception {
		sqlSession.update("SearchMapper.updateCount", word);
	}

	@Override
	public List<Search> getBestWord() throws Exception {
		return sqlSession.selectList("SearchMapper.getBestWord");
	}

	@Override
	public List<Search> searchMemberTipBoard() throws Exception {
		return sqlSession.selectList("SearchMapper.searchMemberTipBoard");
	}

	@Override
	public List<Search> searchAdminTipBoard() throws Exception {
		return sqlSession.selectList("SearchMapper.searchAdminTipBoard");
	}

	@Override
	public List<Search> searchMemberBoard() throws Exception {
		return sqlSession.selectList("SearchMapper.searchMemberBoard");
	}

	@Override
	public List<Search> searchAdminBoard() throws Exception {
		return sqlSession.selectList("SearchMapper.searchAdminBoard");
	}

}
