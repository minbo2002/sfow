package com.yeonoo.so.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.yeonoo.so.domain.ReturnAdd;

public interface ReturnAddService {
	
	//전체 반품조회
	public List<ReturnAdd> getReturnAdd() throws Exception;
	
	//날짜로 반품조회
	public List<ReturnAdd> getReturnAddByDate(String return_date) throws Exception;

}
