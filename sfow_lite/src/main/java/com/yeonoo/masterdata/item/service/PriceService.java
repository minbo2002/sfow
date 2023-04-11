package com.yeonoo.masterdata.item.service;

import java.util.List;

import com.yeonoo.masterdata.item.domain.ItemProduct;
import com.yeonoo.masterdata.item.domain.PriceDTO;




public interface PriceService {

	// 전체 반제품조회
	public List<PriceDTO> priceList(PriceDTO dto);
	//거래처명 목록
	public List<PriceDTO> companycodeSelectAjax() throws Exception;
	//아이템코드 목록
	public List<PriceDTO> itemcodeSelectAjax() throws Exception;

}
