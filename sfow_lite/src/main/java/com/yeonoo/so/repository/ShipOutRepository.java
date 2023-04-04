package com.yeonoo.so.repository;

import java.util.List;

import com.yeonoo.so.domain.ShipOut;
import com.yeonoo.so.domain.ShipOutDTO;

public interface ShipOutRepository {

	List<ShipOut> getList();
	
	int updateStatus(String outCode);
	
	int writeShipOut(ShipOut elements);
	
	ShipOutDTO selectOne(String outCode);
}
