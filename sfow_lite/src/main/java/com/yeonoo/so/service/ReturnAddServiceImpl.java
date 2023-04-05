package com.yeonoo.so.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeonoo.so.domain.ReturnAdd;
import com.yeonoo.so.repository.ReturnAddRepository;

@Service
public class ReturnAddServiceImpl implements ReturnAddService {

	@Autowired
	ReturnAddRepository returnAddRepository;
	
	public List<ReturnAdd> getReturnAdd() throws Exception{
		return returnAddRepository.getReturnAdd();
	}
	
	//날짜로 반품조회
	public List<ReturnAdd> getReturnAddByDate(String return_date) throws Exception{
		 return returnAddRepository.getReturnAddByDate(return_date);
	}
	
}
