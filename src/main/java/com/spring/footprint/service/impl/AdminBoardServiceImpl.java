package com.spring.footprint.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.footprint.dao.AdminBoardDao;
import com.spring.footprint.domain.AdminBoard;
import com.spring.footprint.model.PagingBean;
import com.spring.footprint.service.AdminBoardListVO;
import com.spring.footprint.service.AdminBoardService;

@Service("adminBoardServiceImpl")
public class AdminBoardServiceImpl implements AdminBoardService{

	@Resource
	private AdminBoardDao adminBoardDao;
	
	@Override
	public void writeAdminBoard(AdminBoard adminBoard) throws Exception {
		adminBoardDao.writeAdminBoard(adminBoard);		
	}

	@Override
	public AdminBoard showAdminContent(int no) throws Exception {
		return adminBoardDao.showAdminContent(no);
	}

	@Override
	public void updateAdminCount(int no) throws Exception {
		adminBoardDao.updateAdminCount(no);
	}

	@Override
	public void updateAdminBoard(AdminBoard adminBoard) throws Exception {
		adminBoardDao.updateAdminBoard(adminBoard);
	}

	@Override
	public int totalAdminCount() throws Exception {
		return adminBoardDao.totalAdminCount();
	}

	@Override
	public AdminBoardListVO getAdminBoardList(String pageNo) throws Exception {
		if(pageNo == null || pageNo == "") pageNo = "1";
		
		int total = adminBoardDao.totalAdminCount();			//��ü �Խñ��� ��� ��
		List<AdminBoard> list = adminBoardDao.getAdminBoardList(pageNo);		//Ư�� �������� �Խñ� 
		
		//PagingBean = totalCount + newPageNo ������ ������ �ִ�.
		PagingBean paging = new PagingBean(total, Integer.parseInt(pageNo));
		
		//ListVO = list + PagingBean
		AdminBoardListVO adminBoardListVO = new AdminBoardListVO(list, paging);
		
		return adminBoardListVO;
	}

}
