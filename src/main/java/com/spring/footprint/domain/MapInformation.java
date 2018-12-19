package com.spring.footprint.domain;

public class MapInformation {
	private String world;
	private String nation;
	private String city;
	private double xCoordinate;		//x_coordinate
	private double yCoordinate;		//y_coordinate
	
	public MapInformation() {}

	public MapInformation(String world, String nation, String city, double xCoordinate, double yCoordinate) {
		super();
		this.world = world;
		this.nation = nation;
		this.city = city;
		this.xCoordinate = xCoordinate;
		this.yCoordinate = yCoordinate;
	}

	public MapInformation(String world, String nation, String city) {
		super();
		this.world = world;
		this.nation = nation;
		this.city = city;
	}
	
	public MapInformation(String city) {
		super();
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

	public double getxCoordinate() {
		return xCoordinate;
	}

	public void setxCoordinate(double xCoordinate) {
		this.xCoordinate = xCoordinate;
	}

	public double getyCoordinate() {
		return yCoordinate;
	}

	public void setyCoordinate(double yCoordinate) {
		this.yCoordinate = yCoordinate;
	}

	@Override
	public String toString() {
		return "MapInformation [world=" + world + ", nation=" + nation + ", city=" + city + ", xCoordinate="
				+ xCoordinate + ", yCoordinate=" + yCoordinate + "]";
	}

}
