package com.spring.footprint.dao;

import java.util.List;

import com.spring.footprint.domain.ExchangeRate;

public interface ExchangeRateDao {
	public List<ExchangeRate> getExchangeRate(String country) throws Exception;
	public int insertExchangeRate(ExchangeRate exchangeRate) throws Exception;
}
