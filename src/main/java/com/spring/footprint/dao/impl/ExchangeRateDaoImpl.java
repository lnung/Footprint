package com.spring.footprint.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.footprint.dao.ExchangeRateDao;
import com.spring.footprint.domain.ExchangeRate;

@Repository("exchangeRateDaoImpl")
public class ExchangeRateDaoImpl implements ExchangeRateDao {

	@Resource
	private SqlSession sqlSession;
	
	@Override
	public List<ExchangeRate> getExchangeRate(String country) throws Exception {
		return sqlSession.selectList("ExchangeRateMapper.getExchangeRate", country);
	}

	@Override
	public int insertExchangeRate(ExchangeRate exchangeRate) throws Exception {
		return sqlSession.insert("ExchangeRateMapper.insertExchangeRate", exchangeRate);
	}
}
