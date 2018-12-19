package com.spring.footprint.domain;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class AdminTipBoard {
	private int no;
	private String title;
	private String content;
	private int count;
	private String wDate; // w_date
	private String[] img;
	private String orgfilename;
	private String newfilename;
	
	private Member member;
	private MapInformation mapInformation;
	
	//upload 파일의 정보를 담는 필드를 선언...
	private MultipartFile uploadFile;

	
	
	public AdminTipBoard() {}
	
	public AdminTipBoard(int no, String title, String content, int count, String wDate, String[] img, String orgfilename,
			String newfilename, Member member, MapInformation mapInformation) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.count = count;
		this.wDate = wDate;
		this.img = img;
		this.orgfilename = orgfilename;
		this.newfilename = newfilename;
		this.member = member;
		this.mapInformation = mapInformation;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public String[] getImg() {
		return img;
	}

	public void setImg(String[] img) {
		this.img = img;
	}

	public String getOrgfilename() {
		return orgfilename;
	}

	public void setOrgfilename(String orgfilename) {
		this.orgfilename = orgfilename;
	}

	public String getNewfilename() {
		return newfilename;
	}

	public void setNewfilename(String newfilename) {
		this.newfilename = newfilename;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public MapInformation getMapInformation() {
		return mapInformation;
	}

	public void setNation(MapInformation mapInformation) {
		this.mapInformation = mapInformation;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	@Override
	public String toString() {
		return "ReviewBoard [no=" + no + ", title=" + title + ", content=" + content + ", count=" + count + ", wDate="
				+ wDate + ", img=" + Arrays.toString(img) + ", orgfilename=" + orgfilename + ", newfilename="
				+ newfilename + ", member=" + member + ", mapInformation=" + mapInformation + ", uploadFile=" + uploadFile + "]";
	}
}
