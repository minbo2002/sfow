package com.yeonoo.so.service;

import java.util.List;
import com.yeonoo.so.domain.ReturnAdd;

public interface ReturnAddService {
	
	//전체 반품조회
	public List<ReturnAdd> getReturnAdd() throws Exception;
}
