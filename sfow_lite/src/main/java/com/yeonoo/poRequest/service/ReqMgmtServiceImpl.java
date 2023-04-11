package com.yeonoo.poRequest.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yeonoo.poRequest.model.ModalVO;
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

	//입고관리수정
	@Override
	@Transactional //메서드 안에서는 작동성공시 자동 커밋 / 실패시 롤백처리
	public int reqMgmtUpdate(ReqMgmtDTO reqMgmtDTO) throws Exception {
		 System.out.println("서수입전"+reqMgmtDTO);
		 int cnt=reqMgmtRepository.reqMgmtUp(reqMgmtDTO);
		 
		 System.out.println("서수입후"+cnt);
		return cnt;
		
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
	public List<ReqMgmtDetailDTO> reqMgmtDetail(String in_number) throws Exception {
		System.out.println("세리서전"+in_number);
		List<ReqMgmtDetailDTO> detail = reqMgmtRepository.reqMgmtDetail(in_number);
		System.out.println("세리서후"+detail);
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


	//modalList
	//발주
	@Override
	public List<ModalVO> reqPO(ModalVO modalVO) throws Exception {
		List<ModalVO> reqPOList=reqMgmtRepository.reqPO(modalVO);
		return reqPOList;
	}
	//거래처
	@Override
	//public List<Map<String, Object>> reqCCMList() {
	public List<ModalVO> reqCCMList() {
		List<ModalVO> list=reqMgmtRepository.reqCCMList();
		return list;
	}
	//검색
	@Override
	public List<ModalVO> reqCCM(ModalVO modalVO) throws Exception {
		List<ModalVO> reqCCMList=reqMgmtRepository.reqCCM(modalVO);
		return reqCCMList;
	}
	//세부항목모달
	@Override
	@Transactional
	public List<ModalVO> reqDetailM() {
		List<ModalVO> reqModalDetail=reqMgmtRepository.reqDetailM();
		return reqModalDetail;
	}

	//창고모달
	@Override
	public List<ModalVO> reqWHCode() {
		List<ModalVO> reqWH=reqMgmtRepository.reqWHCode();
		System.out.println("창고서후"+reqWH);
		return reqWH;
	}



}
