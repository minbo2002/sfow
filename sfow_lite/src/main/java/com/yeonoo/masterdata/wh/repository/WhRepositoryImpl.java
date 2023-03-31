package com.yeonoo.masterdata.wh.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.yeonoo.masterdata.wh.domain.WH;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class WhRepositoryImpl implements WhRepository {

	@Autowired
	private SqlSession sqlSession;
	
	//전체목록조회
	@Override
	public List<WH> getWhAllList() throws DataAccessException{
		
		List<WH> list =	sqlSession.selectList("mapper.warehouse.whAllList");
		
		return list;
	}

	@Override
	public int updateWHform(WH wh) throws DataAccessException {
		int cnt= sqlSession.update("mapper.warehouse.updateWH",wh);
		
		System.out.println("cnt"+cnt);
		
		return cnt;
	}
	@Override
	public String getAreaList(String st) throws DataAccessException {
		String list =sqlSession.selectOne("mapper.warehouse.AreaList",st);
		return list;
	}

	public List<WH> getsearchWH(WH searchwh) throws DataAccessException{
		
		List<WH> list =	sqlSession.selectList("mapper.warehouse.searchWH",searchwh);
		
		return list;
	}


	public List<WH> getwharea(WH wharea) {
		List<WH> list =	sqlSession.selectList("mapper.warehouse.wharea",wharea);
		return list;
	}

	/*
	@Override
	public void insertwhService(WH wh) throws DataAccessException{
		
		
		sqlSession.insert("mapper.warehouse.insertwh", wh);
	}
	
	
	*/
	
}
