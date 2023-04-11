package com.yeonoo.masterdata.item.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yeonoo.masterdata.item.domain.RawDTO;
import com.yeonoo.masterdata.item.repository.RawRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class RawServiceImpl implements RawService{

	
	@Autowired
	RawRepository rawRepository;
	
	// 조회하기
	@Override
	public List<RawDTO> rawList(RawDTO dto) {
		return rawRepository.rawList(dto);
	}
	
	// 등록하기
	@Override
	@Transactional
	public int insertRaw(RawDTO elements) {
		return rawRepository.insertRaw(elements);
	}
	
	//수정하기
	@Override
	@Transactional
	public int updateRaw(RawDTO dto) {
		return rawRepository.updateRaw(dto);
		 
		 

	}
	//삭제하기
	@Override
	@Transactional
	public int deleteRaw(String itemCode) {
		return rawRepository.deleteRaw(itemCode);
	}

}
