package com.spring.footprint.service;

import com.spring.footprint.domain.Member;

public interface MemberService {
	public void registerMember(Member member) throws Exception;
	public void updateMember(Member member) throws Exception;	
	public Member login(Member member) throws Exception;
	public boolean idcheck(String id) throws Exception;
	public Member selectByid(String id) throws Exception;
}
