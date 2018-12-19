package com.spring.footprint.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.footprint.dao.MemberTipBoardDao;
import com.spring.footprint.domain.MemberTipBoard;
import com.spring.footprint.model.PagingBean;
import com.spring.footprint.service.MemberTipBoardListVO;
import com.spring.footprint.service.MemberTipBoardService;

@Service("memberTipBoardServiceImpl")
public class MemberTipBoardServiceImpl implements MemberTipBoardService{

	@Resource
	private MemberTipBoardDao memberTipBoardDao;

	@Override
	public void writeMemberTipBoard(MemberTipBoard memberTipBoard) throws Exception {
		memberTipBoardDao.writeMemberTipBoard(memberTipBoard);
	}

	@Override
	public MemberTipBoard showMemberTipContent(int no) throws Exception {
		return memberTipBoardDao.showMemberTipContent(no);
	}

	@Override
	public void updateMemberTipCount(int no) throws Exception {
		memberTipBoardDao.updateMemberTipCount(no);
	}

	@Override
	public void updateMemberTipBoard(MemberTipBoard memberTipBoard) throws Exception {
		memberTipBoardDao.updateMemberTipBoard(memberTipBoard);
	}

	@Override
	public int totalMemberTipCount() throws Exception {
		return memberTipBoardDao.totalMemberTipCount();
	}

	@Override
	public MemberTipBoardListVO getMemberTipBoardList(String pageNo) throws Exception {
		if(pageNo == null || pageNo == "") pageNo = "1";
		
		int total = memberTipBoardDao.totalMemberTipCount();			//��ü �Խñ��� ��� ��
		List<MemberTipBoard> list = memberTipBoardDao.getMemberTipBoardList(pageNo);		//Ư�� �������� �Խñ� 
		
		//PagingBean = totalCount + newPageNo ������ ������ �ִ�.
		PagingBean paging = new PagingBean(total, Integer.parseInt(pageNo));
		
		//ListVO = list + PagingBean
		MemberTipBoardListVO memberTipBoardListVO = new MemberTipBoardListVO(list, paging);
		
		return memberTipBoardListVO;
	}
}
