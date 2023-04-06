package com.yeonoo.poRequest.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yeonoo.poRequest.model.ReqDetailVO;
import com.yeonoo.poRequest.model.ReqVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ReqRepositoryImpl implements ReqRepository{
	
	private final SqlSessionTemplate sqlSession;

	@Override
	public int reqUpdate(ReqVO reqVO) throws Exception {
		int cnt =sqlSession.update("mapper.req.reqUpdate",reqVO);
		return cnt;
	}

	@Override
	public void reqDel(String request_number) throws Exception {
		sqlSession.update("mapper.req.reqDel",request_number);
	}

	@Override
	public List<ReqVO> reqOrder(ReqVO reqVO) throws Exception {
		if(reqVO.getRequest_number()==null 
	            &&reqVO.getRequest_type()==null 
	            &&reqVO.getRequest_date()==null
	            &&reqVO.getRequest_empid()==null) {
			List<ReqVO> allList=sqlSession.selectList("mapper.req.reqOrder");
			return allList;
		}else {
			List<ReqVO> list= sqlSession.selectList("mapper.req.reqSelect",reqVO);
            System.out.println("list"+list);
            return list;
		}
	}
	
	@Override
	public List<ReqDetailVO> reqOrderDetail(String request_number) throws Exception {
		return sqlSession.selectList("mapper.req.reqOrderDetail",request_number);
	}

	@Override
	public int reqDetailUpdate(ReqDetailVO reqDetailVO) throws Exception {
		System.out.println("repo");
		int cnt =sqlSession.update("mapper.req.reqDetailUpdate",reqDetailVO);
		return cnt;
	}

	@Override
	public void reqInsert(ReqVO req) throws Exception {
		System.out.println("insert repo");
		sqlSession.insert("mapper.req.reqInsert",req);
		System.out.println("insert repo3");
		
	}

	@Override
	public void reqDetailInsert(ReqDetailVO reqD) throws Exception {
		System.out.println("insert repo reqD");
		sqlSession.insert("mapper.req.reqDetailInsert",reqD);
		System.out.println("insert repo reqD");
		
	}


}
