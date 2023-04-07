package com.yeonoo.so.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.yeonoo.so.domain.ReturnAdd;

public interface ReturnAddService {
	
	//전체 반품조회
	public List<ReturnAdd> getReturnAdd() throws Exception;
	
	//날짜로 반품조회
	public List<ReturnAdd> getReturnAddByDate(String return_date) throws Exception;
	
	//행 삭제
    public void deleteReturnAdd(String returnNumber) throws Exception;
    
    //저장
    void saveCreateRows(List<Map<String, Object>> createRows) throws Exception;
    
    //수정
    void saveUpdateRows(List<Map<String, Object>> updateRows) throws Exception;
    
    //회사 조회
	public List<Map<String, String>> getClient() throws Exception;
    
}
