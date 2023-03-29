package com.yeonoo.so.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.yeonoo.so.domain.ShipOut;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ShipOutRepositoryImpl implements ShipOutRepository {

	private final SqlSession sqlSession;
	
	@Override
	public List<ShipOut> getList() {
		
		return sqlSession.selectList("mapper.shipout.getList");
	}

	@Override
	public int updateStatus(String outCode) {
		
		return sqlSession.update("mapper.shipout.updateStatus", outCode);
	}

}
