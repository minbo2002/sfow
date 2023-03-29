package com.yeonoo.so.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.yeonoo.so.domain.ShipOut;
import com.yeonoo.so.repository.ShipOutRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ShipOutServiceImpl implements ShipOutService {
	
	private final ShipOutRepository shipOutRepository;
	
	@Override
	public List<ShipOut> getList() {
		
		return shipOutRepository.getList();
	}

	@Override
	public int updateStatus(String outCode) {
		
		return shipOutRepository.updateStatus(outCode);
	}

}
