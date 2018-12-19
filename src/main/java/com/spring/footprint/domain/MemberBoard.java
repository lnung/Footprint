package com.spring.footprint.domain;

public class MemberBoard {
	private String location;
	private String content;
	private String wDate;		//w_date
	private String tripDate;	//trip_date
	
	private Member member;
	private MapInformation mapInformation;		//city
	
	public MemberBoard() {}

	public MemberBoard(String location, String content, String wDate, String tripDate, Member member,
			MapInformation mapInformation) {
		super();
		this.location = location;
		this.content = content;
		this.wDate = wDate;
		this.tripDate = tripDate;
		this.member = member;
		this.mapInformation = mapInformation;
	}
	
	public MemberBoard(String location, String content, String tripDate, Member member,
			MapInformation mapInformation) {
		super();
		this.location = location;
		this.content = content;
		this.tripDate = tripDate;
		this.member = member;
		this.mapInformation = mapInformation;
	}
	
	public MemberBoard(Member member, MapInformation mapInformation) {
		super();
		this.member = member;
		this.mapInformation = mapInformation;
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

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public String getTripDate() {
		return tripDate;
	}

	public void setTripDate(String tripDate) {
		this.tripDate = tripDate;
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

	public void setMapInformation(MapInformation mapInformation) {
		this.mapInformation = mapInformation;
	}

	@Override
	public String toString() {
		return "MemberBoard [location=" + location + ", content=" + content + ", wDate=" + wDate + ", tripDate="
				+ tripDate + ", member=" + member + ", mapInformation=" + mapInformation + "]";
	}
	
}
