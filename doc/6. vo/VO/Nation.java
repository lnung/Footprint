package com.spring.ssss;

public class Nation {
	private String world;
	private String nation;
	private String city;
	
	public Nation() {}
	
	public Nation(String world, String nation, String city) {
		super();
		this.world = world;
		this.nation = nation;
		this.city = city;
	}

	public String getWorld() {
		return world;
	}

	public void setWorld(String world) {
		this.world = world;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return "Nation [world=" + world + ", nation=" + nation + ", city=" + city + "]";
	}
}
