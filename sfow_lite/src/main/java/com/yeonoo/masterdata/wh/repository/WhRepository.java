package com.yeonoo.masterdata.wh.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.yeonoo.masterdata.wh.domain.WH;


public interface WhRepository {

	//전체목록 가져오기
	public List<WH> getWhAllList() throws DataAccessException;

	//수정하기
	public int updateWH(WH wh) throws DataAccessException;
	
	//구역 정보 가져오기
	public String getAreaList(String st) throws DataAccessException;

	//새로운 데이터 입력하기 
	public int insertWH(WH wh) throws DataAccessException ;

	
}
