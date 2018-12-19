package com.spring.footprint.dao;

import com.spring.footprint.domain.Member;

public interface MemberDao {
	public void registerMember(Member member) throws Exception;
	public void updateMember(Member member) throws Exception;	
	public Member login(Member member) throws Exception;
	public Object idcheck(String id) throws Exception;
	public Member selectByid(String id) throws Exception;
	
}
