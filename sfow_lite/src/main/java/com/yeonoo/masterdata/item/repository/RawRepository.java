package com.yeonoo.masterdata.item.repository;

import java.util.List;
import java.util.Map;

import com.yeonoo.masterdata.item.domain.RawDTO;

public interface RawRepository {

	
	// 전체 조회
	public List<RawDTO> rawList(RawDTO dto);

	// 반제품 등록
	public int insertRaw(RawDTO dto);
	 
	// 반제품 정보 수정
	public int updateRaw(RawDTO dto);
	
	// 반제품 삭제
	public int deleteRaw(String itemCode);
	
	//거래처 모달 데이터처리
	public List<Map<String, Object>> getModalClient();
}
