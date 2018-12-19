package com.spring.footprint.dao;

import java.util.List;

import com.spring.footprint.domain.AdminBoard;

public interface AdminBoardDao {
	public int writeAdminBoard(AdminBoard adminBoard) throws Exception;
	public AdminBoard showAdminContent(int no) throws Exception;	
	public void updateAdminCount(int no) throws Exception;
	public void deleteAdminBoard(int no) throws Exception;
	public void updateAdminBoard(AdminBoard adminBoard) throws Exception;
	public int totalAdminCount() throws Exception;
	public List<AdminBoard> getAdminBoardList(String pageNo) throws Exception;
}
