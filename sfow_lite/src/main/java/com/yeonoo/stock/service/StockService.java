package com.yeonoo.stock.service;

import java.util.List;

import com.yeonoo.stock.domain.Stock;

public interface StockService {
	
	public List<Stock> searchAll() throws Exception;
	
	
	public void updateStock(Stock data) throws Exception;


	public List<Stock> searchWhStock(Stock data)  throws Exception;


}
