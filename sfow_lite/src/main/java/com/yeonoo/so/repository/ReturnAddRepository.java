package com.yeonoo.so.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.yeonoo.so.domain.ReturnAdd;

public interface ReturnAddRepository {

	//전체 반품조회
	public List<ReturnAdd> getReturnAdd() throws DataAccessException;
	
	//날짜로 반품조회
	public List<ReturnAdd> getReturnAddByDate(String return_date) throws DataAccessException;

	//삭제
	public void deleteByReturnNumber(String returnNumber) throws DataAccessException;
	
	//저장
	void insertReturnAdd(Map<String, Object> data);
	
	
	//수정
	void updateReturnAdd(Map<String, Object> data);
	
	//회사 조회
	public List<Map<String, String>> getClient() throws DataAccessException;
}
