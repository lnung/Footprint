package com.spring.footprint.service;

import java.util.List;

import com.spring.footprint.domain.MemberBoard;

public interface MemberBoardService {
	public void writeMemberBoard(MemberBoard memberBoard) throws Exception;
	public List<MemberBoard> showMemberBoard(MemberBoard memberBoard) throws Exception;	
	public void updateMemberBoard(MemberBoard memberBoard) throws Exception;
	public List<String> selectMapList(String id) throws Exception;
}
