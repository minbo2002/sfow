package com.yeonoo.poRequest.service;

import java.util.List;

import com.yeonoo.poRequest.model.ReqMgmtDTO;
import com.yeonoo.poRequest.model.ReqMgmtDetailDTO;

public interface ReqMgmtService {
	//검색리스트
	public List<ReqMgmtDTO> reqMgmtList(ReqMgmtDTO reqMgmtDTO) throws Exception;
	//상세보기
	//public ReqMgmtDTO reqMgUpFrm(String in_number) throws Exception;
	//입고관리수정
	public void reqMgmtUpdate(ReqMgmtDTO reqMgmtDTO) throws Exception;
	//입고관리입력
	public void reqMgmtInsert(ReqMgmtDTO reqMgmtIn) throws Exception;
	//입고관리삭제-수정
	public void reqMgmtDelete(String in_number) throws Exception;
	//입고관리세부항목보기
	public List<ReqMgmtDetailDTO> reqMgmtDetail(ReqMgmtDetailDTO reqMgmtDetailDTO) throws Exception;
	//세부항목수정
	public void reqMgDetailUpdate(ReqMgmtDetailDTO reqMgmtDetailDTO) throws Exception;
	//세부항목입력
	public void reqMgDetailInsert(ReqMgmtDetailDTO reqMgmtDetailDTO) throws Exception;
	




}
