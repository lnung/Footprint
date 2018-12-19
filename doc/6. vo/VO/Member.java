package com.spring.ssss;

public class Member {
	private String id;
	private String password;
	private String name;
	private String birth;
	private String address;
	private String email;
	private int admin;
	
	public Member() {}
	
	public Member(String id, String password, String name, String birth, String address, String email, int admin) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.address = address;
		this.email = email;
		this.admin = admin;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", birth=" + birth + ", address="
				+ address + ", email=" + email + ", admin=" + admin + "]";
	}
}
