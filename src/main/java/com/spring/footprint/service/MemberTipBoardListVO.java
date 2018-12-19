package com.spring.footprint.service;

import java.util.List;

import com.spring.footprint.domain.MemberTipBoard;
import com.spring.footprint.model.PagingBean;


public class MemberTipBoardListVO {
	private List<MemberTipBoard> list;
	private PagingBean pagingBean;	//page 정보가 담겨있다
	public MemberTipBoardListVO(List<MemberTipBoard> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public MemberTipBoardListVO() {}
	
	public List<MemberTipBoard> getList() {
		return list;
	}
	public void setList(List<MemberTipBoard> list) {
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
