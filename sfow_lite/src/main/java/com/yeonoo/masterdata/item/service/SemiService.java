package com.yeonoo.masterdata.item.service;

import java.util.List;
import java.util.Map;

import com.yeonoo.masterdata.item.domain.SemiDTO;


public interface SemiService {

	// 전체 반제품조회
	public List<SemiDTO> semiList( SemiDTO dto);
	
	// 반제품 등록
	public int insertSemi(SemiDTO elements);

	// 반제품 정보 수정
	public int updateSemi(SemiDTO elements);

	// 반제품 삭제(상태업데이트)
	public int deleteSemi(String itemCode);
	
	// 거래처 모달 데이터처리
	public List<Map<String, Object>> getModalClient();
}
