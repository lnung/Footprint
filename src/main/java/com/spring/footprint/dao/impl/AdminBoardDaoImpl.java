package com.spring.footprint.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.footprint.dao.AdminBoardDao;
import com.spring.footprint.domain.AdminBoard;

@Repository("adminBoardDaoImpl")
public class AdminBoardDaoImpl implements AdminBoardDao{
	
	@Resource
	private SqlSession sqlSession;
	
	@Override
	public int writeAdminBoard(AdminBoard adminBoard) throws Exception {
		int result = sqlSession.insert("AdminBoardMapper.registerMember", adminBoard);
		return result;
	}

	@Override
	public AdminBoard showAdminContent(int no) throws Exception {
		return sqlSession.selectOne("AdminBoardMapper.showAdminContent", no);
	}

	@Override
	public void updateAdminCount(int no) throws Exception {
		sqlSession.update("AdminBoardMapper.updateAdminCount", no);
	}

	@Override
	public void deleteAdminBoard(int no) throws Exception {
		sqlSession.delete("AdminBoardMapper.deleteAdminBoard", no);		
	}

	@Override
	public void updateAdminBoard(AdminBoard adminBoard) throws Exception {
		sqlSession.update("AdminBoardMapper.updateAdminBoard", adminBoard);
	}

	@Override
	public int totalAdminCount() throws Exception {
		int total = sqlSession.selectOne("AdminBoardMapper.totalAdminCount");
		return total;
	}

	@Override
	public List<AdminBoard> getAdminBoardList(String pageNo) throws Exception {
		return sqlSession.selectList("AdminBoardMapper.getAdminBoardList", pageNo);
	}

}
