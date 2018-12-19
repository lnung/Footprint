package com.spring.footprint.service;

import com.spring.footprint.domain.AdminTipBoard;

public interface AdminTipBoardService {
	public void writeAdminTipBoard(AdminTipBoard adminTipBoard) throws Exception;
	public AdminTipBoard showAdminTipContent(int no) throws Exception;	
	public void updateAdminTipCount(int no) throws Exception;
	public void updateAdminTipBoard(AdminTipBoard adminTipBoard) throws Exception;
	public int totalAdminTipCount() throws Exception;
	public AdminTipBoardListVO getAdminTipBoardList(String pageNo) throws Exception;
}
