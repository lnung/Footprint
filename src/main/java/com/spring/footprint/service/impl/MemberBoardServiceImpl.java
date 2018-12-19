package com.spring.footprint.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.footprint.dao.MemberBoardDao;
import com.spring.footprint.domain.MemberBoard;
import com.spring.footprint.service.MemberBoardService;

@Service("memberBoardServiceImpl")
public class MemberBoardServiceImpl implements MemberBoardService{

	@Resource
	private MemberBoardDao memberBoardDao;

	@Override
	public void writeMemberBoard(MemberBoard memberBoard) throws Exception {
		memberBoardDao.writeMemberBoard(memberBoard);
	}

	@Override
	public List<MemberBoard> showMemberBoard(MemberBoard memberBoard) throws Exception {
		return memberBoardDao.showMemberBoard(memberBoard);
	}

	@Override
	public void updateMemberBoard(MemberBoard memberBoard) throws Exception {
		memberBoardDao.updateMemberBoard(memberBoard);
	}

	@Override
	public List<String> selectMapList(String id) throws Exception {
		return memberBoardDao.selectMapList(id);
	}
	
}
