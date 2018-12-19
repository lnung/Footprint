package com.spring.footprint.dao;

import java.util.List;

import com.spring.footprint.domain.AdminTipBoard;

public interface AdminTipBoardDao {
	public int writeAdminTipBoard(AdminTipBoard adminTipBoard) throws Exception;
	public AdminTipBoard showAdminTipContent(int no) throws Exception;	
	public void updateAdminTipCount(int no) throws Exception;
	public void deleteAdminTipBoard(int no) throws Exception;
	public void updateAdminTipBoard(AdminTipBoard adminTipBoard) throws Exception;
	public int totalAdminTipCount() throws Exception;
	public List<AdminTipBoard> getAdminTipBoardList(String pageNo) throws Exception;
}
