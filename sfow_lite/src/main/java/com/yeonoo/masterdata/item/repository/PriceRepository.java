package com.yeonoo.masterdata.item.repository;

import java.util.List;

import com.yeonoo.masterdata.item.domain.PriceDTO;

public interface PriceRepository {

	
	// 전체 조회
	public List<PriceDTO> priceList(PriceDTO dto);

	
	

}
