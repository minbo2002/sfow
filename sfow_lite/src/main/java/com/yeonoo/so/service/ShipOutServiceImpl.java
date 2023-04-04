package com.yeonoo.so.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yeonoo.so.controller.ShipOutController;
import com.yeonoo.so.domain.ShipOut;
import com.yeonoo.so.domain.ShipOutDTO;
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
	public List<ShipOut> getList() {
		
		return shipOutRepository.getList();
	}

	// 삭제여부 상태변경
	@Override
	@Transactional
	public int updateStatus(String outCode) {
		
		return shipOutRepository.updateStatus(outCode);
	}

	// 등록
	@Override
	@Transactional
	public int writeShipOut(ShipOut elements) {
		
		return shipOutRepository.writeShipOut(elements);
	}

	// 특정 출하번호의 ITEM 상세정보 조회
	@Override
	public ShipOutDTO selectOne(String outCode) {
		logger.info("3) outCode : " + outCode);
		return shipOutRepository.selectOne(outCode);
	}

}
