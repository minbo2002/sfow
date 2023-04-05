package com.yeonoo.so.service;

import java.util.List;
import com.yeonoo.so.domain.ShipOut;
import com.yeonoo.so.domain.ItemShipOutDTO;
import com.yeonoo.so.domain.LotShipOutDTO;
import com.yeonoo.so.domain.SearchDTO;

public interface ShipOutService {

	List<ShipOut> getList(SearchDTO searchDTO);
	
	int updateStatus(String outCode);
	
	int writeShipOut(ShipOut elements);
	
	ItemShipOutDTO selectItem(String outCode);
	
	LotShipOutDTO selectLot(String itemCode);
}
