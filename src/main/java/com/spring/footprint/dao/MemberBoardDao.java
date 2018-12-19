package com.spring.footprint.dao;

import java.util.List;

import com.spring.footprint.domain.MemberBoard;

public interface MemberBoardDao {
	public int writeMemberBoard(MemberBoard memberBoard) throws Exception;
	public List<MemberBoard> showMemberBoard(MemberBoard memberBoard) throws Exception;	
	public void deleteMemberBoard(MemberBoard memberBoard) throws Exception;
	public void updateMemberBoard(MemberBoard memberBoard) throws Exception;
	public List<String> selectMapList(String id) throws Exception;
}
