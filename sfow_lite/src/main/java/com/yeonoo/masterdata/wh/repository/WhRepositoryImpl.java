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
	public String getAreaList(String st) throws DataAccessException {
		String list =sqlSession.selectOne("mapper.warehouse.AreaList",st);
		
		return list;
	}

	public List<WH> getsearchWH(WH searchwh) throws DataAccessException{
		List<WH> list =	sqlSession.selectList("mapper.warehouse.searchWH",searchwh);
		
		return list;
	}


	public List<WH> getwharea(WH wharea) throws DataAccessException {
		List<WH> list =	sqlSession.selectList("mapper.warehouse.wharea",wharea);
		
		return list;
	}
	
	//저장버튼 insert
	public int insertWH(WH wh) throws DataAccessException {
		int cnt = sqlSession.insert("mapper.warehouse.insertWH", wh);
		
		return cnt;
	}

	public int deleteWH(WH wh) throws DataAccessException {
		int cnt = sqlSession.delete("mapper.warehouse.deleteWH", wh);
		
		return cnt;
	}

	public int updateWH(WH wh) throws DataAccessException {
		int  cnt = sqlSession.update("mapper.warehouse.updateWH", wh);
		
		return cnt;
	}

	
		
}
