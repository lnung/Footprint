package com.spring.footprint.domain;

public class Member {
	private String id;
	private String password;
	private String name;
	private String birth;
	private String addressApi;			//address_api
	private String addressInput;		//address_input
	private String email;
	private int admin;
	
	public Member() {}

	public Member(String id, String password, String name, String birth, String addressApi, String addressInput,
			String email, int admin) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.addressApi = addressApi;
		this.addressInput = addressInput;
		this.email = email;
		this.admin = admin;
	}

	public Member(String id) {
		super();
		this.id = id;
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

	public String getAddressApi() {
		return addressApi;
	}

	public void setAddressApi(String addressApi) {
		this.addressApi = addressApi;
	}

	public String getAddressInput() {
		return addressInput;
	}

	public void setAddressInput(String addressInput) {
		this.addressInput = addressInput;
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
		return "Member [id=" + id + ", password=" + password + ", name=" + name + ", birth=" + birth + ", addressApi="
				+ addressApi + ", addressInput=" + addressInput + ", email=" + email + ", admin=" + admin + "]";
	}
}
