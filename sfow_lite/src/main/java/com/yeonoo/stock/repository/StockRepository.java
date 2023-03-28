package com.yeonoo.stock.repository;

import java.util.List;

import com.yeonoo.stock.domain.Stock;

public interface StockRepository {
	
	
	public List<Stock> search();
	
	
	public void updateStock(Stock data);
}
