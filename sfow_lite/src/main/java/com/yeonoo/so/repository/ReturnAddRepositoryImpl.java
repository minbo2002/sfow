package com.yeonoo.so.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

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
	
	//삭제
	public void deleteByReturnNumber(String returnNumber) throws DataAccessException{
		sqlSession.delete("so_return.deleteByReturnNumber", returnNumber);
    }
	
	//저장
	public void insertReturnAdd(Map<String, Object> data) {
		sqlSession.insert("so_return.insertReturnAdd", data);
	}
	
	
	//수정
	public void updateReturnAdd(Map<String, Object> data) {
		sqlSession.update("so_return.updateReturnAdd", data);
	}
	
	//회사 조회
	public List<Map<String, String>> getClient() throws DataAccessException{
	    List<Map<String, String>> result = sqlSession.selectList("so_return.getClient");
	    System.out.println("Result from sqlSession: " + result);
	    return result;
	}
	
}
