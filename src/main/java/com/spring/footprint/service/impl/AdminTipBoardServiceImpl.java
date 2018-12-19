package com.spring.footprint.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.footprint.dao.AdminTipBoardDao;
import com.spring.footprint.domain.AdminTipBoard;
import com.spring.footprint.model.PagingBean;
import com.spring.footprint.service.AdminTipBoardListVO;
import com.spring.footprint.service.AdminTipBoardService;

@Service("adminTipBoardServiceImpl")
public class AdminTipBoardServiceImpl implements AdminTipBoardService{

	@Resource
	private AdminTipBoardDao adminTipBoardDao;

	@Override
	public void writeAdminTipBoard(AdminTipBoard adminTipBoard) throws Exception {
		adminTipBoardDao.writeAdminTipBoard(adminTipBoard);
	}

	@Override
	public AdminTipBoard showAdminTipContent(int no) throws Exception {
		return adminTipBoardDao.showAdminTipContent(no);
	}

	@Override
	public void updateAdminTipCount(int no) throws Exception {
		adminTipBoardDao.updateAdminTipCount(no);
	}

	@Override
	public void updateAdminTipBoard(AdminTipBoard adminTipBoard) throws Exception {
		adminTipBoardDao.updateAdminTipBoard(adminTipBoard);
	}

	@Override
	public int totalAdminTipCount() throws Exception {
		return adminTipBoardDao.totalAdminTipCount();
	}

	@Override
	public AdminTipBoardListVO getAdminTipBoardList(String pageNo) throws Exception {
		if(pageNo == null || pageNo == "") pageNo = "1";
		
		int total = adminTipBoardDao.totalAdminTipCount();			//��ü �Խñ��� ��� ��
		List<AdminTipBoard> list = adminTipBoardDao.getAdminTipBoardList(pageNo);		//Ư�� �������� �Խñ� 
		
		//PagingBean = totalCount + newPageNo ������ ������ �ִ�.
		PagingBean paging = new PagingBean(total, Integer.parseInt(pageNo));
		
		//ListVO = list + PagingBean
		AdminTipBoardListVO adminTipBoardListVO = new AdminTipBoardListVO(list, paging);
		
		return adminTipBoardListVO;
	}	

}
