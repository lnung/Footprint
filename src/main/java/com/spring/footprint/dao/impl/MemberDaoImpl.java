package com.spring.footprint.dao.impl;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.footprint.dao.MemberDao;
import com.spring.footprint.domain.Member;

@Repository("memberDaoImpl")
public class MemberDaoImpl implements MemberDao{
	
	@Resource
	private SqlSession sqlSession;

	@Override
	public void registerMember(Member member) throws Exception {
		sqlSession.insert("MemberMapper.registerMember", member);
	}

	@Override
	public void updateMember(Member member) throws Exception {
		sqlSession.insert("MemberMapper.updateMember", member);
	}

	@Override
	public Member login(Member member) throws Exception {
		return sqlSession.selectOne("MemberMapper.login", member);
	}

	@Override
	public Object idcheck(String id) throws Exception {
		return sqlSession.selectOne("MemberMapper.idcheck", id);
	}

	@Override
	public Member selectByid(String id) throws Exception {
		return sqlSession.selectOne("MemberMapper.selectByid", id);
	}
}