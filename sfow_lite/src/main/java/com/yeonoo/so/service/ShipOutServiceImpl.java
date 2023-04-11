package com.yeonoo.so.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yeonoo.so.controller.ShipOutController;
import com.yeonoo.so.domain.ShipOut;
import com.yeonoo.so.domain.ItemShipOutDTO;
import com.yeonoo.so.domain.LotShipOutDTO;
import com.yeonoo.so.domain.SearchDTO;
import com.yeonoo.so.repository.ShipOutRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ShipOutServiceImpl implements ShipOutService {

	private final ShipOutRepository shipOutRepository;
	private final Logger logger = LoggerFactory.getLogger(ShipOutServiceImpl.class);
	
	// 전체조회
	@Override
	public List<ShipOut> getList(SearchDTO searchDTO) {	
		logger.info("2) ServiceImpl에서의  searchDTO : " + searchDTO);
		
		return shipOutRepository.getList(searchDTO);
	}

	// Modal Item조회
	@Override
	public List<Map<String, Object>> getModalItem() {
		
		return shipOutRepository.getModalItem();
	}
	
	// 삭제여부 상태변경
	@Override
	@Transactional
	public int deleteStatus(String outCode) {
		
		return shipOutRepository.deleteStatus(outCode);
	}

	// 등록
	@Override
	@Transactional
	public int writeShipOut(ShipOut elements) {
		
		return shipOutRepository.writeShipOut(elements);
	}

	// 특정 출하번호의 ITEM 상세정보 조회
	@Override
	public List<ItemShipOutDTO> selectItem(String orderNumber) {
		logger.info("Item 3) orderNumber : " + orderNumber);
		return shipOutRepository.selectItem(orderNumber);
	}

	@Override
	public List<LotShipOutDTO> selectLot(String itemCode) {
		logger.info("LOT 3) itemCode : " + itemCode);
		return shipOutRepository.selectLot(itemCode);
	}

	@Override
	public int statusUpdate(String outCode) {
		
		return shipOutRepository.statusUpdate(outCode);
	}
	
	@Override
	public int updateShipOut(ShipOut elements) {
		logger.info("3) elements : " + elements);
		return shipOutRepository.updateShipOut(elements);
	}

}
