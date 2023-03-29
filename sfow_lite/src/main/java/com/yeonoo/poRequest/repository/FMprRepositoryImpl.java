package com.yeonoo.poRequest.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.yeonoo.poRequest.domain.FMpr;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class FMprRepositoryImpl implements FMprRepository {

	// 필드
	@Autowired
	private SqlSession sqlSession;

	// 전체 목록 조회
	@Override
	public List<FMpr> getFMprAllList(FMpr fMpr) throws DataAccessException {
		if(
			  fMpr.getItem_type()==null 
            &&fMpr.getClient_name()==null
            &&fMpr.getItem_code()==null ) {
			
		List<FMpr> allList = sqlSession.selectList("mapper.FMpr.FMprAllList");
		System.out.println("allList"+allList);
		return allList;
		
	}else

	{
		List<FMpr> list = sqlSession.selectList("mapper.FMpr.FMprList", fMpr);
		System.out.println("list" + list);
		return list;
	}
}

	// 수정하기
	public int updateFMpr(FMpr fMpr) throws DataAccessException {
		int cnt = sqlSession.update("mapper.FMpr.updateFMpr", fMpr);
		System.out.println("cnt=" + cnt);
		return cnt;
	}

	
}
