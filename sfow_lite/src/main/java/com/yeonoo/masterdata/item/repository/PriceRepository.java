package com.yeonoo.masterdata.item.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.yeonoo.masterdata.item.domain.ItemProduct;
import com.yeonoo.masterdata.item.domain.PriceDTO;

public interface PriceRepository {

	
	// 전체 조회
	public List<PriceDTO> priceList(PriceDTO dto);
	//거래처명 목록
	public List<PriceDTO> companycodeSelectAjax() throws DataAccessException;
	//아이템코드 목록
	public List<PriceDTO> itemcodeSelectAjax() throws DataAccessException;
	
	

}
