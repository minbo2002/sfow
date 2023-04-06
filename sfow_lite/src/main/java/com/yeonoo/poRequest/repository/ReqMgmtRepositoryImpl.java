package com.yeonoo.poRequest.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.yeonoo.poRequest.model.ReqMgmtDTO;
import com.yeonoo.poRequest.model.ReqMgmtDetailDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ReqMgmtRepositoryImpl implements ReqMgmtRepository{
	
	private final SqlSessionTemplate sqlSession;
	//검색리스트
	@Override
	public List<ReqMgmtDTO> reqMgmtList(ReqMgmtDTO reqMgmtDTO) throws DataAccessException {
		System.out.println("레전"+reqMgmtDTO);
	        	List<ReqMgmtDTO> list= sqlSession.selectList("mapper.ReqMgmt.reqMgmtList",reqMgmtDTO);
	        	System.out.println("레후"+list);
	        	//System.out.println("list"+list);
	        return list;
	        
	}
	//입고관리 보기
/*	@Override
	public ReqMgmtDTO reqMgUpFrm(String in_number) throws DataAccessException {
		return (ReqMgmtDTO)sqlSession.selectOne("mapper.ReqMgmt.reqMgDetailFrm", in_number);
	}
*/	
	//입고관리수정
	@Override
	public void reqMgmtUp(ReqMgmtDTO reqMgmtDTO) throws DataAccessException {
		System.out.println("레수입전"+reqMgmtDTO);
		sqlSession.update("mapper.ReqMgmt.reqMgmtUp",reqMgmtDTO);
		System.out.println("레수입후"+reqMgmtDTO);
	}
	//입고관리입력
	@Override
	public void reqMgmtInsert(ReqMgmtDTO reqMgmtIn) throws DataAccessException {
		sqlSession.insert("mapper.ReqMgmt.reqMgmtIn",reqMgmtIn);	
	}
	//입고관리삭제-수정
	@Override
	public void reqMgmtDelete(String in_number) throws DataAccessException {
		sqlSession.update("mapper.ReqMgmt.reqMgmtDelUp", in_number);	
	}
	//입고관리세부항목보기
	@Override
	public List<ReqMgmtDetailDTO> reqMgmtDetail(ReqMgmtDetailDTO reqMgmtDetailDTO) throws DataAccessException {
		List<ReqMgmtDetailDTO> detail = sqlSession.selectList("mapper.ReqMgmt.reqMgmtDetail",reqMgmtDetailDTO);
		return detail;
	}
	//세부항목수정
	@Override
	public void reqMgDetailUpdate(ReqMgmtDetailDTO reqMgmtDetailDTO) throws DataAccessException {
		System.out.println("세수레전"+reqMgmtDetailDTO);
		sqlSession.update("mapper.ReqMgmt.reqMgmtDetailUp", reqMgmtDetailDTO);
		System.out.println("세수레후"+reqMgmtDetailDTO);
		
	}
	//세부항목입력
	@Override
	public void reqMgDetailInsert(ReqMgmtDetailDTO reqMgmtDetailDTO) throws DataAccessException {
		System.out.println("세레전"+reqMgmtDetailDTO);
		sqlSession.insert("mapper.ReqMgmt.reqMgmtDetailIn",reqMgmtDetailDTO);
		System.out.println("세레후"+reqMgmtDetailDTO);
	}
	

}
