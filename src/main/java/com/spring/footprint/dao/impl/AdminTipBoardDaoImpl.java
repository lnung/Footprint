package com.spring.footprint.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.footprint.dao.AdminTipBoardDao;
import com.spring.footprint.domain.AdminTipBoard;

@Repository("adminTipBoardDaoImpl")
public class AdminTipBoardDaoImpl implements AdminTipBoardDao{
	
	@Resource
	private SqlSession sqlSession;

	@Override
	public int writeAdminTipBoard(AdminTipBoard adminTipBoard) throws Exception {
		int result = sqlSession.insert("AdminTipBoardMapper.writeAdminTipBoard", adminTipBoard);
		return result;
	}

	@Override
	public AdminTipBoard showAdminTipContent(int no) throws Exception {
		return sqlSession.selectOne("AdminTipBoardMapper.showAdminTipContent", no);
	}

	@Override
	public void updateAdminTipCount(int no) throws Exception {
		sqlSession.update("AdminTipBoardMapper.updateAdminTipCount", no);
	}

	@Override
	public void deleteAdminTipBoard(int no) throws Exception {
		sqlSession.delete("AdminTipBoardMapper.deleteAdminTipBoard", no);
	}

	@Override
	public void updateAdminTipBoard(AdminTipBoard adminTipBoard) throws Exception {
		sqlSession.update("AdminTipBoardMapper.updateAdminTipBoard", adminTipBoard);
	}

	@Override
	public int totalAdminTipCount() throws Exception {
		int total = sqlSession.selectOne("AdminTipBoardMapper.totalAdminTipCount");
		return total;
	}

	@Override
	public List<AdminTipBoard> getAdminTipBoardList(String pageNo) throws Exception {
		return sqlSession.selectList("AdminTipBoardMapper.getAdminTipBoardList", pageNo);
	}
	
}
