package com.yeonoo.so.service;

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
	
}
