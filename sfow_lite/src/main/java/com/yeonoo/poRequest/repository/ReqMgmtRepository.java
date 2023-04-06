package com.yeonoo.poRequest.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.yeonoo.poRequest.model.ReqMgmtDTO;
import com.yeonoo.poRequest.model.ReqMgmtDetailDTO;



public interface ReqMgmtRepository {
	//검색리스트
	public List<ReqMgmtDTO> reqMgmtList(ReqMgmtDTO reqMgmtDTO) throws DataAccessException;
	//상세보기
	//public ReqMgmtDTO reqMgUpFrm(String in_number) throws DataAccessException;
	//입고관리수정
	public void reqMgmtUp(ReqMgmtDTO reqMgmtDTO) throws DataAccessException;
	//입고관리입력
	public void reqMgmtInsert(ReqMgmtDTO reqMgmtIn) throws DataAccessException;
	//입고관리삭제-수정
	public void reqMgmtDelete(String in_number) throws DataAccessException;
	//입고관리세부항목보기
	public List<ReqMgmtDetailDTO> reqMgmtDetail(ReqMgmtDetailDTO reqMgmtDetailDTO) throws DataAccessException;
	//세부항목수정
	public void reqMgDetailUpdate(ReqMgmtDetailDTO reqMgmtDetailDTO) throws DataAccessException;
	//세부항목입력
	public void reqMgDetailInsert(ReqMgmtDetailDTO reqMgmtDetailDTO) throws DataAccessException;
}
