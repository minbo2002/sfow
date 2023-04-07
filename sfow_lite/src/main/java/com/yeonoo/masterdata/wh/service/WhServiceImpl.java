package com.yeonoo.masterdata.wh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.yeonoo.masterdata.wh.domain.WH;
import com.yeonoo.masterdata.wh.repository.WhRepository;
import com.yeonoo.masterdata.wh.repository.WhRepositoryImpl;

@Service
public class WhServiceImpl implements WhService {

	@Autowired
	private WhRepositoryImpl whRepository; 
	
	@Override
	public List<WH> getWhAllList() throws Exception{
		
		return whRepository.getWhAllList();
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
	
	//수정하기update
	@Override
	public void updateWH(WH rowData) throws Exception {
		
		return;
	}
	//insert 등록
	public int insertWH(WH wh) throws Exception{
		
		int cnt = whRepository.insertWH(wh);
		return cnt;
		
	}
	//체크된 행 삭제하기 (수정)
	public int deleteWH(WH wh) throws Exception {
		int cnt =whRepository.deleteWH(wh);
		return cnt;
	}
	
}
