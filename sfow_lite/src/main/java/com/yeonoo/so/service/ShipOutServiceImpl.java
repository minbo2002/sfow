package com.yeonoo.so.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yeonoo.so.domain.ShipOut;
import com.yeonoo.so.repository.ShipOutRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ShipOutServiceImpl implements ShipOutService {
	
	private final ShipOutRepository shipOutRepository;
	
	@Override
	public List<ShipOut> getList() {
		
		return shipOutRepository.getList();
	}

	@Override
	@Transactional
	public int updateStatus(String outCode) {
		
		return shipOutRepository.updateStatus(outCode);
	}

	@Override
	@Transactional
	public int writeShipOut(ShipOut elements) {
		
		return shipOutRepository.writeShipOut(elements);
	}

}
