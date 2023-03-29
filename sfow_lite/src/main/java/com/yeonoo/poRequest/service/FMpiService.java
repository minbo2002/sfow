package com.yeonoo.poRequest.service;

import java.util.List;
import com.yeonoo.poRequest.domain.FMpi;
import com.yeonoo.poRequest.domain.FMpr;


public interface FMpiService {

	
	//전체 목록 조회
	public List<FMpi>  getFMpiAllList() throws Exception;

	//수정하기
	public int updateFMpi(FMpi fMpi) throws Exception;
}