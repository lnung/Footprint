package com.spring.footprint.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.footprint.dao.MapInformationDao;
import com.spring.footprint.domain.MapInformation;

@Repository("mapInformationDaoImpl")
public class MapInformationDaoImpl implements MapInformationDao{
	
	@Resource
	private SqlSession sqlSession;

	@Override
	public List<MapInformation> getAllMapInformation() throws Exception {
		return sqlSession.selectList("MapInformationMapper.getAllMapInformation");
	}

	@Override
	public List<MapInformation> getWorldMapInformation() throws Exception {
		return sqlSession.selectList("MapInformationMapper.getWorldMapInformation");
	}

	@Override
	public List<MapInformation> getNationMapInformation(String world) throws Exception {
		return sqlSession.selectList("MapInformationMapper.getNationMapInformation", world);
	}
	
	@Override
	public List<MapInformation> getCityMapInformation(String nation) throws Exception {
		return sqlSession.selectList("MapInformationMapper.getCityMapInformation", nation);
	}

	@Override
	public MapInformation getNationCoordinate(String world) throws Exception {
		return sqlSession.selectOne("MapInformationMapper.getNationCoordinate", world);
	}

	@Override
	public MapInformation getCityCoordinate(String nation) throws Exception {
		return sqlSession.selectOne("MapInformationMapper.getCityCoordinate", nation);
	}
	@Override
	public MapInformation getMapInformation(String city) throws Exception{
		return sqlSession.selectOne("MapInformationMapper.getMapInformation", city);
	}
}
