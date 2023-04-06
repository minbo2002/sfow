package com.yeonoo.masterdata.item.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yeonoo.masterdata.item.domain.PriceDTO;
import com.yeonoo.masterdata.item.repository.PriceRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class PriceServiceImpl implements PriceService{

	
	@Autowired
	PriceRepository priceRepository;
	
	// 조회하기
	@Override
	public List<PriceDTO> priceList( PriceDTO dto) {
		return priceRepository.priceList(dto);
	}
	


}
