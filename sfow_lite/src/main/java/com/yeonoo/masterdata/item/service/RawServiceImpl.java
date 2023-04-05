package com.yeonoo.masterdata.item.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeonoo.masterdata.item.domain.RawDTO;
import com.yeonoo.masterdata.item.repository.RawRepository;

@Service
public class RawServiceImpl implements RawService{

	
	@Autowired
	RawRepository rawRepository;
	
	// 조회하기
	@Override
	public List<RawDTO> rawList() {
		return rawRepository.rawList();
	}
	
	// 등록하기
	@Override
	public int insertRaw(RawDTO dto) {
		return 0;
	}
	
	//수정하기
	@Override
	public int updateRaw(RawDTO dto) {
		return rawRepository.updateRaw(dto);
		 
		 

	}

	@Override
	public void deleteRaw(String itemCode) {
		
	}

}
