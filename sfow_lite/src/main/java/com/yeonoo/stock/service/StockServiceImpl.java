package com.yeonoo.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeonoo.stock.domain.Stock;
import com.yeonoo.stock.repository.StockRepositoryImpl;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StockServiceImpl implements StockService {

    private final StockRepositoryImpl stockRepository;

    @Override
    public List<Stock> search() {
    	List<Stock> result =  stockRepository.search();
    	
        //return stockRepository.search();
    	System.out.println("Service result"+result);
        return result;
    }

	public void updateStock(Stock data) {
		stockRepository.updateStock(data);
		
	}
	
	
	
}
