package com.spring.footprint.service;

import java.util.List;

import com.spring.footprint.domain.AdminTipBoard;
import com.spring.footprint.model.PagingBean;

public class AdminTipBoardListVO {
	private List<AdminTipBoard> list;
	private PagingBean pagingBean;	//page 정보가 담겨있다
	public AdminTipBoardListVO(List<AdminTipBoard> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public AdminTipBoardListVO() {}
	
	public List<AdminTipBoard> getList() {
		return list;
	}
	public void setList(List<AdminTipBoard> list) {
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
