package com.spring.footprint.service;

import com.spring.footprint.domain.MemberTipBoard;

public interface MemberTipBoardService {
	public void writeMemberTipBoard(MemberTipBoard memberTipBoard) throws Exception;
	public MemberTipBoard showMemberTipContent(int no) throws Exception;	
	public void updateMemberTipCount(int no) throws Exception;
	public void updateMemberTipBoard(MemberTipBoard memberTipBoard) throws Exception;
	public int totalMemberTipCount() throws Exception;
	public MemberTipBoardListVO getMemberTipBoardList(String pageNo) throws Exception;
}
