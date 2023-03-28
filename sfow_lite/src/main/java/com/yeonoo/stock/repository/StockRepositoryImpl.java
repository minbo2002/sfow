package com.yeonoo.stock.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yeonoo.stock.domain.Stock;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class StockRepositoryImpl implements StockRepository{
	
	private final SqlSession sqlSession;
	
//	@Autowired
//	private StockRepositoryImpl(SqlSession sqlSession) {
//		this.sqlSession=sqlSession;
//		
//	}
	
	@Override
	public List<Stock> search() {
        // 데이터베이스에서 검색 결과를 가져오는 로직을 구현한다.

        // 여기서는 더미 데이터를 사용한다.
     
        List<Stock> result=sqlSession.selectList("mapper.stock.allStockList");
        
        System.out.println("result repositoryImpl"+result);
        return result;
    }

	@Override
	public void updateStock(Stock data) {
		sqlSession.update("mapper.stock.updateStock", data);
		
	}
}
