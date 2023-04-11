package com.yeonoo.poRequest.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.yeonoo.poRequest.model.ModalVO;
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
	//입고관리수정
	@Override
	public int reqMgmtUp(ReqMgmtDTO reqMgmtDTO) throws DataAccessException {
		System.out.println("레수입전"+reqMgmtDTO);
		
		int cnt=sqlSession.update("mapper.ReqMgmt.reqMgmtUp",reqMgmtDTO);
		
		System.out.println("레수입후"+cnt);
		return cnt;
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
	public List<ReqMgmtDetailDTO> reqMgmtDetail(String in_number) throws DataAccessException {
		System.out.println("세리레전"+in_number);
		List<ReqMgmtDetailDTO> detail = sqlSession.selectList("mapper.ReqMgmt.reqMgmtDetail",in_number);
		System.out.println("세리레후"+detail);
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
	
	//modalList
	//발주
	@Override
	public List<ModalVO> reqPO(ModalVO modalVO) throws DataAccessException {
		List<ModalVO> reqPOList=sqlSession.selectList("mapper.ReqMgmt.reqPO", modalVO);
		
		return reqPOList;
	}
	//거래처
	@Override
	//public List<Map<String, Object>> reqCCMList() {
	public List<ModalVO> reqCCMList() {
		
		return sqlSession.selectList("mapper.ReqMgmt.reqCCMList");
	
	}
	//검색
	@Override
	public List<ModalVO> reqCCM(ModalVO modalVO) throws DataAccessException {
		System.out.println("거레전="+modalVO); 
		List<ModalVO> reqCCMList=sqlSession.selectList("mapper.ReqMgmt.reqCCM", modalVO);
		System.out.println("거레후"+reqCCMList);
		
		return reqCCMList;
	}
	//세부항목모달
	@Override
	public List<ModalVO> reqDetailM() {
		List<ModalVO> reqModalDetail =sqlSession.selectList("mapper.ReqMgmt.reqDetailModal");
		return reqModalDetail;
	}
	//창고모달
	@Override
	public List<ModalVO> reqWHCode() {
		System.out.println("창고레전");
		List<ModalVO> reqWHCode=sqlSession.selectList("mapper.ReqMgmt.reqWList");
		System.out.println("창고레후"+reqWHCode);
		return reqWHCode;
	}
	

}
