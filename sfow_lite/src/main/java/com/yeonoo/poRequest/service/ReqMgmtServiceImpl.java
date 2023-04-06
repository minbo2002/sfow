package com.yeonoo.poRequest.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yeonoo.poRequest.model.ReqMgmtDTO;
import com.yeonoo.poRequest.model.ReqMgmtDetailDTO;
import com.yeonoo.poRequest.repository.ReqMgmtRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true) // 클래스 c,u,d 
public class ReqMgmtServiceImpl implements  ReqMgmtService{
	
	private final ReqMgmtRepository reqMgmtRepository;

	//검색리스트
	@Override
	public List<ReqMgmtDTO> reqMgmtList(ReqMgmtDTO reqMgmtDTO) throws Exception {
		System.out.println("서전"+reqMgmtDTO);
		List<ReqMgmtDTO> list= reqMgmtRepository.reqMgmtList(reqMgmtDTO);
		System.out.println("서후"+list);
		return list;
	}

	//상세보기
/*	@Override
	public ReqMgmtDTO reqMgUpFrm(String in_number) throws Exception {
		return reqMgmtRepository.reqMgUpFrm(in_number);
	}
*/
	//입고관리수정
	@Override
	@Transactional //메서드 안에서는 작동성공시 자동 커밋 / 실패시 롤백처리
	public void reqMgmtUpdate(ReqMgmtDTO reqMgmtDTO) throws Exception {
		 System.out.println("서수입전"+reqMgmtDTO);
		 reqMgmtRepository.reqMgmtUp(reqMgmtDTO);
		 System.out.println("서수입후"+reqMgmtDTO);
	}
	//입고관리입력
	@Override
	@Transactional
	public void reqMgmtInsert(ReqMgmtDTO reqMgmtIn) throws Exception {
		
		reqMgmtRepository.reqMgmtInsert(reqMgmtIn);
	}
	
	//입고관리삭제-수정
	@Override
	@Transactional 
	public void reqMgmtDelete(String in_number) throws Exception {
		reqMgmtRepository.reqMgmtDelete(in_number);
	}
	
	//입고관리세부항목보기
	@Override
	public List<ReqMgmtDetailDTO> reqMgmtDetail(ReqMgmtDetailDTO reqMgmtDetailDTO) throws Exception {
		System.out.println("세부서전"+reqMgmtDetailDTO);
		List<ReqMgmtDetailDTO> detail = reqMgmtRepository.reqMgmtDetail(reqMgmtDetailDTO);
		System.out.println("세부서후"+detail);
		return detail;
	}

	//세부항목수정
	@Override
	@Transactional
	public void reqMgDetailUpdate(ReqMgmtDetailDTO reqMgmtDetailDTO) throws Exception {
		System.out.println("세수서전"+reqMgmtDetailDTO);
		reqMgmtRepository.reqMgDetailUpdate(reqMgmtDetailDTO);		
		System.out.println("세수서후"+reqMgmtDetailDTO);
	}

	//세부항목입력
	@Override
	public void reqMgDetailInsert(ReqMgmtDetailDTO reqMgmtDetailDTO) throws Exception {
		System.out.println("서전"+reqMgmtDetailDTO);
		reqMgmtRepository.reqMgDetailInsert(reqMgmtDetailDTO);	
		System.out.println("서후"+reqMgmtDetailDTO);
	}


}
