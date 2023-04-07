package com.yeonoo.masterdata.wh.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.yeonoo.masterdata.wh.domain.WH;

@Service
public interface WhService {

	
	
	//전체 목록 조회
	
		public List<WH> getWhAllList() throws Exception;
	/*
		//insert
		public void insertwhService(WH wh) throws Exception;
	*/
		
	//수정 update

	public String getAreaList(String st) throws Exception;

	public List<WH> searchWH(WH searchwh) throws Exception;

	public List<WH> WHarea(WH wharea)throws Exception;

	public int updateWH(WH wh) throws Exception ;

	// 행 추가 등록하기 
	public int insertWH(WH wh) throws Exception ;

	public int deleteWH(WH wh) throws Exception;
		
	
	
}
