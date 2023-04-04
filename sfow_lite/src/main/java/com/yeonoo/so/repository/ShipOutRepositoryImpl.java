package com.yeonoo.so.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import com.yeonoo.so.domain.ShipOut;
import com.yeonoo.so.domain.ItemShipOutDTO;
import com.yeonoo.so.domain.LotShipOutDTO;
import com.yeonoo.so.service.ShipOutServiceImpl;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ShipOutRepositoryImpl implements ShipOutRepository {

	private final SqlSession sqlSession;
	private final Logger logger = LoggerFactory.getLogger(ShipOutRepositoryImpl.class);
	
	// 전체조회
	@Override
	public List<ShipOut> getList() {
		
		return sqlSession.selectList("mapper.shipout.getList");
	}

	// 삭제여부 상태변경
	@Override
	public int updateStatus(String outCode) {
		
		return sqlSession.update("mapper.shipout.updateStatus", outCode);
	}

	// 등록
	@Override
	public int writeShipOut(ShipOut elements) {

		return sqlSession.update("mapper.shipout.writeShipout", elements);
	}

	// 특정 출하번호의 ITEM 상세정보 조회
	@Override
	public ItemShipOutDTO selectItem(String outCode) {
		logger.info("4) outCode : " + outCode);
		return sqlSession.selectOne("mapper.shipout.selectItem", outCode);
	}

	@Override
	public LotShipOutDTO selectLot(String itemCode) {
		logger.info("4) itemCode : " + itemCode);
		return sqlSession.selectOne("mapper.shipout.selectLot", itemCode);
	}

}
