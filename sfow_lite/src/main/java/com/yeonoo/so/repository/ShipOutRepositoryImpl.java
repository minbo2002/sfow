package com.yeonoo.so.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import com.yeonoo.so.domain.ShipOut;
import com.yeonoo.so.domain.ItemShipOutDTO;
import com.yeonoo.so.domain.LotShipOutDTO;
import com.yeonoo.so.domain.SearchDTO;
import com.yeonoo.so.service.ShipOutServiceImpl;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ShipOutRepositoryImpl implements ShipOutRepository {

	private final SqlSession sqlSession;
	private final Logger logger = LoggerFactory.getLogger(ShipOutRepositoryImpl.class);
	
	// 전체조회
	@Override
	public List<ShipOut> getList(SearchDTO searchDTO) {	
		logger.info("3) RepositoryImpl에서의  searchDTO : " + searchDTO);
		
		return sqlSession.selectList("mapper.shipout.getList", searchDTO);
	}

	// 삭제여부 상태변경
	@Override
	public int deleteStatus(String outCode) {
		
		return sqlSession.update("mapper.shipout.deleteStatus", outCode);
	}

	// 등록
	@Override
	public int writeShipOut(ShipOut elements) {

		return sqlSession.update("mapper.shipout.writeShipout", elements);
	}

	// 특정 출하번호의 ITEM 상세정보 조회
	@Override
	public List<ItemShipOutDTO> selectItem(String orderNumber) {
		logger.info("Item 4) orderNumber : " + orderNumber);
		return sqlSession.selectList("mapper.shipout.getOrderNumber", orderNumber);
	}

	@Override
	public LotShipOutDTO selectLot(String itemCode) {
		logger.info("4) itemCode : " + itemCode);
		return sqlSession.selectOne("mapper.shipout.getLot", itemCode);
	}

	@Override
	public int statusUpdate(String outCode) {
		
		return sqlSession.update("mapper.shipout.statusUpdate", outCode);
	}

}
