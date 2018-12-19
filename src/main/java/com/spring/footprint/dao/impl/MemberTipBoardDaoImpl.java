package com.spring.footprint.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.footprint.dao.MemberTipBoardDao;
import com.spring.footprint.domain.MemberTipBoard;

@Repository("memberTipBoardDaoImpl")
public class MemberTipBoardDaoImpl implements MemberTipBoardDao{
	
	@Resource
	private SqlSession sqlSession;

	@Override
	public int writeMemberTipBoard(MemberTipBoard memberTipBoard) throws Exception {
		int result = sqlSession.insert("MemberTipBoardMapper.writeMemberTipBoard", memberTipBoard);
		return result;
	}

	@Override
	public MemberTipBoard showMemberTipContent(int no) throws Exception {
		return sqlSession.selectOne("MemberTipBoardMapper.showMemberTipContent", no);
	}

	@Override
	public void updateMemberTipCount(int no) throws Exception {
		sqlSession.update("MemberTipBoardMapper.updateMemberTipCount", no);
	}

	@Override
	public void deleteMemberTipBoard(int no) throws Exception {
		sqlSession.delete("MemberTipBoardMapper.deleteMemberTipBoard", no);
	}

	@Override
	public void updateMemberTipBoard(MemberTipBoard memberTipBoard) throws Exception {
		sqlSession.update("MemberTipBoardMapper.updateMemberTipBoard", memberTipBoard);
	}

	@Override
	public int totalMemberTipCount() throws Exception {
		int total = sqlSession.selectOne("MemberTipBoardMapper.totalMemberTipCount");
		return total;
	}

	@Override
	public List<MemberTipBoard> getMemberTipBoardList(String pageNo) throws Exception {
		return sqlSession.selectList("MemberTipBoardMapper.getMemberTipBoardList", pageNo);
	}
	
}
