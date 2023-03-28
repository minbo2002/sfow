package com.yeonoo.stock.service;

import java.util.List;

import com.yeonoo.stock.domain.Stock;

public interface StockService {
	
	public List<Stock> search() throws Exception;
	
	
	public void updateStock(Stock data) throws Exception;


}
