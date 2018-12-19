package com.spring.footprint.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.footprint.dao.MemberBoardDao;
import com.spring.footprint.domain.MemberBoard;

@Repository("memberBoardDaoImpl")
public class MemberBoardDaoImpl implements MemberBoardDao{
	
	@Resource
	private SqlSession sqlSession;

	@Override
	public int writeMemberBoard(MemberBoard memberBoard) throws Exception {
		int result = sqlSession.insert("MemberBoardMapper.writeMemberBoard", memberBoard);
		return result;
	}

	@Override
	public List<MemberBoard> showMemberBoard(MemberBoard memberBoard) throws Exception {
		return sqlSession.selectList("MemberBoardMapper.showMemberBoard", memberBoard);
	}

	@Override
	public void deleteMemberBoard(MemberBoard memberBoard) throws Exception {
		sqlSession.delete("MemberBoardMapper.deleteMemberBoard", memberBoard);
	}

	@Override
	public void updateMemberBoard(MemberBoard memberBoard) throws Exception {
		sqlSession.update("MemberBoardMapper.updateMemberBoard", memberBoard);
	}

	@Override
	public List<String> selectMapList(String id) throws Exception {
		return sqlSession.selectList("MemberBoardMapper.selectMapList", id);
	}
	
}
