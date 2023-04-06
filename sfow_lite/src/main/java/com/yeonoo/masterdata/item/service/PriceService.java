package com.yeonoo.masterdata.item.service;

import java.util.List;

import com.yeonoo.masterdata.item.domain.PriceDTO;




public interface PriceService {

	// 전체 반제품조회
	public List<PriceDTO> priceList(PriceDTO dto);
	

}
