package com.spring.ssss;

public class MemberBoard {
	private String location;
	private String content;
	private String img;
	private String wDate; //w_date
	
	private Member member;
	private Nation nation;
	
	public MemberBoard() {}

	public MemberBoard(String location, String content, String img, String wDate, Member member, Nation nation) {
		super();
		this.location = location;
		this.content = content;
		this.img = img;
		this.wDate = wDate;
		this.member = member;
		this.nation = nation;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Nation getNation() {
		return nation;
	}

	public void setNation(Nation nation) {
		this.nation = nation;
	}

	@Override
	public String toString() {
		return "MemberBoard [location=" + location + ", content=" + content + ", img=" + img + ", wDate=" + wDate
				+ ", member=" + member + ", nation=" + nation + "]";
	}
}
