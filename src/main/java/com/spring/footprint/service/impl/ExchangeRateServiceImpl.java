package com.spring.footprint.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.footprint.dao.ExchangeRateDao;
import com.spring.footprint.domain.ExchangeRate;
import com.spring.footprint.service.ExchangeRateService;

@Service("ExchangeRateServiceImpl")
public class ExchangeRateServiceImpl implements ExchangeRateService{

	@Resource
	private ExchangeRateDao exchangeRateDao;
	
	@Override
	public List<ExchangeRate> getExchangeRate(String country) throws Exception {
		if(country == null || country == "") {
			country = "¹Ì±¹";
		}
		return exchangeRateDao.getExchangeRate(country);
	}

	@Override
	public int insertExchangeRate(ExchangeRate exchangeRate) throws Exception {

		return exchangeRateDao.insertExchangeRate(exchangeRate);
	}
}
