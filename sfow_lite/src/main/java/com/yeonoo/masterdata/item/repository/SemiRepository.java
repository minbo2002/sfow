package com.yeonoo.masterdata.item.repository;

import java.util.List;


import com.yeonoo.masterdata.item.domain.SemiDTO;

public interface SemiRepository {

	
	// 전체 조회
	public List<SemiDTO> semiList( SemiDTO dto);

	// 반제품 등록
	public int insertSemi(SemiDTO semi);
	
	// 반제품 정보 수정
	public int updateSemi(SemiDTO dto);
	
	// 반제품 삭제(상태업데이트)
	public int deleteSemi(String itemCode);

}
