package com.yeonoo.masterdata.wh.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.yeonoo.masterdata.wh.domain.WH;


public interface WhRepository {

	
	public List<WH> getWhAllList() throws DataAccessException;

	// public void insertwhService(WH wh) throws DataAccessException;
	
	//수정하기 update
	public void updateWH(WH rowData) throws Exception;
		
	public String getAreaList(String st) throws DataAccessException;
	
}
