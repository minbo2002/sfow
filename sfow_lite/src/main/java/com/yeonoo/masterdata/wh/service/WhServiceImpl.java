package com.yeonoo.masterdata.wh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeonoo.masterdata.wh.domain.WH;
import com.yeonoo.masterdata.wh.repository.WhRepositoryImpl;

@Service
public class WhServiceImpl implements WhService{

	@Autowired
	WhRepositoryImpl whRepository; 
	
	@Override
	public List<WH> getWhAllList() throws Exception{
		
		return whRepository.getWhAllList();
	}
	//수정하기update
	@Override
	public int updateWHform(WH wh) throws Exception {
		
		return whRepository.updateWHform(wh);
	}
	
	@Override
	public String getAreaList(String st) throws Exception {
		return whRepository.getAreaList(st);
	}
	
	@Override
	public List<WH> searchWH(WH searchwh) throws Exception {
		
		return whRepository.getsearchWH(searchwh);
	}
	@Override
	public List<WH> WHarea(WH wharea) throws Exception {
		
		return whRepository.getwharea(wharea);
	}
	
	
	
}
