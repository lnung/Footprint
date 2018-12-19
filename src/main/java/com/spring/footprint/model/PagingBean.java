package com.spring.footprint.model;
/*
 * ����¡ ó���� ���� ����Ͻ� Ŭ���� 
 * @author kosta-00-kangsa-001
 *
 */
public class PagingBean {
	/*
	 * ���� ������
	 */
	private int nowPage = 1;
	/*
	 * �������� ������ �Խù� �� 
	 */
	private int numberOfContentsPerPage = CommonConstants.CONTENT_NUMBER_PER_PAGE;
	private int numberOfContentsPerPageByNotice = CommonConstants.CONTENT_NUMBER_PER_PAGE_BY_NOTICE;
	/*
	 * ������ �׷�� ������ �� 
	 */
	private int numberOfPageGroup = CommonConstants.PAGEGROUP_NUMBER_PER_PAGE;
	/*
	 * ���� db�� ����� �� �Խù� �� 
	 */
	private int totalContents;

	/*	 
	 * db�κ��� ��ü �Խù� ���� �޾ƿ���, ���� �������� client �κ��� �޾� ���� 
	 * @param totalContents
	 * @param nowPage
	 */
	 
	public PagingBean(int totalContents, int nowPage){
		this.totalContents = totalContents;
		this.nowPage = nowPage;
	}
	/*
	 * db�κ��� �Խù� �� �޾ƿ��� , ù�������� ���� 
	 * @param totalContents
	 */
	public PagingBean(int totalContents){
		this.totalContents = totalContents;		
	}
	/*
	 * ���� ������ ����
	 * @return
	 */
	public int getNowPage(){
		return nowPage;
	}

	public int getTotalPage(){
		int num = this.totalContents % this.numberOfContentsPerPage;
		int totalPage = 0;
		if(num == 0){
			totalPage = this.totalContents / this.numberOfContentsPerPage;
		}else{
			totalPage = this.totalContents / this.numberOfContentsPerPage + 1;
		}
		return totalPage;
	}

	public int getTotalPageGroup(){
		int num=this.getTotalPage() % this.numberOfPageGroup;
		int totalPageGroup = 0;
		if(num == 0){
			totalPageGroup = this.getTotalPage() / this.numberOfPageGroup;
		}else{
			totalPageGroup = this.getTotalPage() / this.numberOfPageGroup+1;
		}
		return totalPageGroup;
	}

	public int getNowPageGroup(){
		int num=this.nowPage % this.numberOfPageGroup;
		int nowPageGroup = 0;
		if(num == 0){
			nowPageGroup = this.nowPage / this.numberOfPageGroup;
		}else{
			nowPageGroup = this.nowPage / this.numberOfPageGroup + 1;
		}
		return nowPageGroup;
	}

	public int getStartPageOfPageGroup() {
		int num = this.numberOfPageGroup * (this.getNowPageGroup()-1) + 1;
		return num;
	}

	public int getEndPageOfPageGroup() {
		int num = this.getNowPageGroup() * this.numberOfPageGroup;
		if(this.getTotalPage() < num){
			num = this.getTotalPage();
		}
		return num;
	}

	public boolean isPreviousPageGroup(){
		boolean flag = false;
		if(this.getNowPageGroup() > 1){
			flag = true;
		}
		return flag;
	}

	public boolean isNextPageGroup(){
		boolean flag = false;
		if(this.getNowPageGroup() < this.getTotalPageGroup()){
			flag = true;
		}
		
		return flag;
	}	
	
	////////////////////////////////////////////////
	
	public int getTotalPageByNotice(){
		int num = this.totalContents % this.numberOfContentsPerPageByNotice;
		int totalPage = 0;
		if(num == 0){
			totalPage = this.totalContents / this.numberOfContentsPerPageByNotice;
		}else{
			totalPage = this.totalContents / this.numberOfContentsPerPageByNotice + 1;
		}
		return totalPage;
	}

	public int getTotalPageGroupByNotice(){
		int num=this.getTotalPageByNotice() % this.numberOfPageGroup;
		int totalPageGroup = 0;
		if(num == 0){
			totalPageGroup = this.getTotalPageByNotice() / this.numberOfPageGroup;
		}else{
			totalPageGroup = this.getTotalPageByNotice() / this.numberOfPageGroup+1;
		}
		return totalPageGroup;
	}

	public int getNowPageGroupByNotice(){
		int num=this.nowPage % this.numberOfPageGroup;
		int nowPageGroup = 0;
		if(num == 0){
			nowPageGroup = this.nowPage / this.numberOfPageGroup;
		}else{
			nowPageGroup = this.nowPage / this.numberOfPageGroup + 1;
		}
		return nowPageGroup;
	}

	public int getStartPageOfPageGroupByNotice() {
		int num = this.numberOfPageGroup * (this.getNowPageGroupByNotice()-1) + 1;
		return num;
	}

	public int getEndPageOfPageGroupByNotice() {
		int num = this.getNowPageGroupByNotice() * this.numberOfPageGroup;
		if(this.getTotalPageByNotice() < num){
			num = this.getTotalPageByNotice();
		}
		return num;
	}

	public boolean isPreviousPageGroupByNotice(){
		boolean flag = false;
		if(this.getNowPageGroupByNotice() > 1){
			flag = true;
		}
		return flag;
	}

	public boolean isNextPageGroupByNotice(){
		boolean flag = false;
		if(this.getNowPageGroupByNotice() < this.getTotalPageGroupByNotice()){
			flag = true;
		}
		
		return flag;
	}	
}
