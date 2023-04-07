package com.yeonoo.so.repository;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.yeonoo.so.domain.ReturnAdd;
import com.yeonoo.so.domain.ReturnDetail;

public interface ReturnDetailRepository {

	//선택한 행으로 세부항목 조회
	public List<ReturnDetail> getReturnDetail(String returnNumber) throws DataAccessException;
	
	//저장
	void insertDetailAdd(Map<String, Object> data);
	
	
	//수정
	void updateDetailAdd(Map<String, Object> data);
	
	//삭제
	void deleteReturnDetail(List<Integer> sorder);
}
