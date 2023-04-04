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
    public List<Stock> searchAll() throws Exception{
    	List<Stock> result =  stockRepository.searchAll();
    	
        //return stockRepository.search();
    	System.out.println("Service result"+result);
        return result;
    }
    
    @Override
	public void updateStock(Stock data) throws Exception{
		stockRepository.updateStock(data);
		
	}
    
    @Override
	public List<Stock> searchWhStock(Stock data) throws Exception{
		List<Stock> result =  stockRepository.searchWhStock(data);
		System.out.println("스톡서비스 리저트"+result);
		return result;
	}

    @Override
	public List<Stock> searchWh() throws Exception {
    	List<Stock> result = stockRepository.searchWh();
		return result;
	}
	
	
	
}
