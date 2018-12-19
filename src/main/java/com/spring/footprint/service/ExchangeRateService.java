package com.spring.footprint.service;

import java.util.List;

import com.spring.footprint.domain.ExchangeRate;

public interface ExchangeRateService {
	public List<ExchangeRate> getExchangeRate(String country) throws Exception;
	public int insertExchangeRate(ExchangeRate exchangeRate) throws Exception;
}
