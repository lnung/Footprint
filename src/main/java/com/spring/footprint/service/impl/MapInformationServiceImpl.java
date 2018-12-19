package com.spring.footprint.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.footprint.dao.MapInformationDao;
import com.spring.footprint.domain.MapInformation;
import com.spring.footprint.service.MapInformationService;

@Service("mapInformationServiceImpl")
public class MapInformationServiceImpl implements MapInformationService{

	@Resource
	private MapInformationDao mapInformationDao;

	@Override
	public List<MapInformation> getAllMapInformation() throws Exception {
		return mapInformationDao.getAllMapInformation();
	}

	@Override
	public List<MapInformation> getWorldMapInformation() throws Exception {
		return mapInformationDao.getWorldMapInformation();
	}

	@Override
	public List<MapInformation> getNationMapInformation(String world) throws Exception {
		return mapInformationDao.getNationMapInformation(world);
	}

	@Override
	public List<MapInformation> getCityMapInformation(String nation) throws Exception {
		return mapInformationDao.getCityMapInformation(nation);
	}

	@Override
	public MapInformation getNationCoordinate(String world) throws Exception {
		return mapInformationDao.getNationCoordinate(world);
	}

	@Override
	public MapInformation getCityCoordinate(String nation) throws Exception {
		return mapInformationDao.getCityCoordinate(nation);
	}

	@Override
	public MapInformation getMapInformation(String city) throws Exception {
		return mapInformationDao.getMapInformation(city);
	}
}
