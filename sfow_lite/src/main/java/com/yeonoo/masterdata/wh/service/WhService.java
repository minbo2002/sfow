package com.yeonoo.masterdata.wh.service;

import java.util.List;

import com.yeonoo.masterdata.wh.domain.WH;


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

	public void updateWH(WH rowData) throws Exception ;
		
	
	
}
