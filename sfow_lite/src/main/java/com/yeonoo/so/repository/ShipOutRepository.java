package com.yeonoo.so.repository;

import java.util.List;

import com.yeonoo.so.domain.ShipOut;

public interface ShipOutRepository {

	List<ShipOut> getList();
	
	int updateStatus(String outCode);
}
