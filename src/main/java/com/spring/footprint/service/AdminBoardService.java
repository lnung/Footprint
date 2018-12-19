package com.spring.footprint.service;

import com.spring.footprint.domain.AdminBoard;

public interface AdminBoardService {
	public void writeAdminBoard(AdminBoard adminBoard) throws Exception;
	public AdminBoard showAdminContent(int no) throws Exception;	
	public void updateAdminCount(int no) throws Exception;
	public void updateAdminBoard(AdminBoard adminBoard) throws Exception;
	public int totalAdminCount() throws Exception;
	public AdminBoardListVO getAdminBoardList(String pageNo) throws Exception;
}
