package com.yeonoo.masterdata.item.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;

import com.yeonoo.masterdata.item.domain.SemiDTO;


public interface SemiService {

	// 전체 반제품조회
	public List<SemiDTO> semiList( SemiDTO dto);
	
	// 반제품 등록
	public int insertSemi(SemiDTO elements);

	// 반제품 정보 수정
	public int updateSemi(SemiDTO dto);

	// 반제품 삭제
	public void deleteSemi(String itemCode);
}
