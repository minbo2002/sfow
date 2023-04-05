package com.yeonoo.so.repository;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.yeonoo.so.domain.ReturnAdd;

@Repository
public class ReturnAddRepositoryImpl implements ReturnAddRepository {

	@Autowired
	private SqlSession sqlSession;
	
	//전체 반품조회
	public List<ReturnAdd> getReturnAdd() throws DataAccessException{
		List<ReturnAdd> list = sqlSession.selectList("so_return.getReturnAdd");
		return list;
	}

	//날짜로 반품조회
	public List<ReturnAdd> getReturnAddByDate(String return_date) throws DataAccessException{
		 List<ReturnAdd> list = sqlSession.selectList("so_return.getReturnAddByDate", return_date);
		return list;
	}

}
