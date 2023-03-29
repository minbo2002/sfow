package com.yeonoo.poRequest.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeonoo.poRequest.domain.FMpr;
import com.yeonoo.poRequest.repository.FMprRepository;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class FMprServiceImpl implements FMprService{

	@Autowired
	FMprRepository fMprRepository;
	

	//전체 목록 조회(검색)
	@Override
	public List<FMpr> getFMprAllList(FMpr fMpr) throws Exception {
		return fMprRepository.getFMprAllList(fMpr);
	}

	//수정하기
	public int updateFMpr(FMpr fMpr) throws Exception{
		return fMprRepository.updateFMpr(fMpr);
	}

}
