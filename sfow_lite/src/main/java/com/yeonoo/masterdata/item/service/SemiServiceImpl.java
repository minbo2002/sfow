package com.yeonoo.masterdata.item.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yeonoo.masterdata.item.domain.SemiDTO;
import com.yeonoo.masterdata.item.repository.SemiRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class SemiServiceImpl implements SemiService{

	
	@Autowired
	SemiRepository semiRepository;
	
	// 조회하기
	@Override
	public List<SemiDTO> semiList( SemiDTO dto) {
		return semiRepository.semiList(dto);
	}
	
	// 등록하기
	@Override
	@Transactional
	public int insertSemi(SemiDTO elements) {
		
		return semiRepository.insertSemi(elements);
	}
	
	//수정하기
	@Override
	@Transactional
	public int updateSemi(SemiDTO elements) {
		return semiRepository.updateSemi(elements);
		 
		 

	}
	
	// 삭제하기(상태업데이트)
	@Override
	@Transactional
	public int deleteSemi(String itemCode) {
		return semiRepository.deleteSemi(itemCode);
	}

}
