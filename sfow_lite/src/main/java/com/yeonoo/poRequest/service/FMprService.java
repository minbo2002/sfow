package com.yeonoo.poRequest.service;

import java.util.List;


import com.yeonoo.poRequest.domain.FMpr;


public interface FMprService {

	
	//전체 목록 조회
	public List<FMpr>  getFMprAllList() throws Exception;

	//수정하기
	public int updateFMpr(FMpr fMpr) throws Exception;
}