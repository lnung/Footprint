package com.spring.footprint.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.footprint.dao.MemberDao;
import com.spring.footprint.domain.Member;
import com.spring.footprint.service.MemberService;

@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService{

	@Resource
	private MemberDao memberDao;

	@Override
	public void registerMember(Member member) throws Exception {
		memberDao.registerMember(member);
	}

	@Override
	public void updateMember(Member member) throws Exception {
		memberDao.updateMember(member);
	}

	@Override
	public Member login(Member member) throws Exception {
		return memberDao.login(member);
	}

	@Override
	public boolean idcheck(String id) throws Exception {
		boolean result = false;
		if(memberDao.idcheck(id) != null)
			result = true;
		return result;
	}

	@Override
	public Member selectByid(String id) throws Exception {
		return memberDao.selectByid(id);
	}
}
