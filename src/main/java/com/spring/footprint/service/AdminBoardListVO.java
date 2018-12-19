package com.spring.footprint.service;

import java.util.List;

import com.spring.footprint.domain.AdminBoard;
import com.spring.footprint.model.PagingBean;

public class AdminBoardListVO {
	private List<AdminBoard> list;
	private PagingBean pagingBean;	//page 정보가 담겨있다
	public AdminBoardListVO(List<AdminBoard> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public AdminBoardListVO() {}
	
	public List<AdminBoard> getList() {
		return list;
	}
	public void setList(List<AdminBoard> list) {
		this.list = list;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}	
}
