package com.yeonoo.poRequest.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.yeonoo.poRequest.domain.FMpi;
import com.yeonoo.poRequest.domain.FMpr;

@Repository
public class FMpiRepositoryImpl implements FMpiRepository{

	//필드
	@Autowired
	private SqlSession sqlSession;
	
	
	//전체 목록 조회
	@Override
	public List<FMpi> getFMpiAllList() throws DataAccessException {
		List<FMpi> list = sqlSession.selectList("mapper.FMpi.FMpiAllList");
		return list;
	}
	
	//수정하기
	public int updateFMpi(FMpi fMpi) throws DataAccessException {
		int cnt=sqlSession.update("mapper.FMpi.updateFMpi", fMpi);
		System.out.println("cnt="+cnt);
		return cnt;
	}
	
	
}
