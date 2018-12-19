package com.spring.footprint.service;

import java.util.List;

import com.spring.footprint.domain.MapInformation;

public interface MapInformationService {
	public List<MapInformation> getAllMapInformation() throws Exception;
	public List<MapInformation> getWorldMapInformation() throws Exception;
	public List<MapInformation> getNationMapInformation(String world) throws Exception;
	public List<MapInformation> getCityMapInformation(String nation) throws Exception;
	public MapInformation getNationCoordinate(String world) throws Exception;
	public MapInformation getCityCoordinate(String nation) throws Exception;
	public MapInformation getMapInformation(String city) throws Exception;
}
