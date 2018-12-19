package com.spring.footprint.dao;

import java.util.List;

import com.spring.footprint.domain.MemberTipBoard;

public interface MemberTipBoardDao {
	public int writeMemberTipBoard(MemberTipBoard memberTipBoard) throws Exception;
	public MemberTipBoard showMemberTipContent(int no) throws Exception;	
	public void updateMemberTipCount(int no) throws Exception;
	public void deleteMemberTipBoard(int no) throws Exception;
	public void updateMemberTipBoard(MemberTipBoard memberTipBoard) throws Exception;
	public int totalMemberTipCount() throws Exception;
	public List<MemberTipBoard> getMemberTipBoardList(String pageNo) throws Exception;
}
