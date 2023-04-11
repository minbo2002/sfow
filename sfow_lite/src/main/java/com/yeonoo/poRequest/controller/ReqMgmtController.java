package com.yeonoo.poRequest.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.poRequest.model.ModalVO;
import com.yeonoo.poRequest.model.ReqMgmtDTO;
import com.yeonoo.poRequest.model.ReqMgmtDetailDTO;
import com.yeonoo.poRequest.service.ReqMgmtService;
import com.yeonoo.poRequest.service.ReqService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ReqMgmtController {
	
	private final ReqMgmtService reqMgmtService;
	
	@GetMapping("/reqM")
	public String req1() {
		return "poRequest/reqMgmt";
	}
	
	@GetMapping("/reqModal")
	public String modalGrid01() {
		return "poRequest/modalGrid01";
	}
	
	@GetMapping("/reqModalPR")
	public String modalGridPR() {
		return "poRequest/modalGridPR";
	}
	
	@GetMapping("/reqDetailModal")
	public String modalDetailGrid() {
		return "poRequest/modalDetailGrid";
	}
	@GetMapping("/reqDetailWH")
	public String modalGridWH() {
		return "poRequest/modalGridWH";
	}
	
	
	//입고관리-검색리스트
	@GetMapping("/searchPoIn")
	@ResponseBody
	public List<ReqMgmtDTO> reqMgmt(ReqMgmtDTO reqMgmtDTO) throws Exception {
	
		//System.out.println("컨전"+reqMgmtDTO);
		List<ReqMgmtDTO> reqMgmtList=reqMgmtService.reqMgmtList(reqMgmtDTO);
		//System.out.println("컨후"+reqMgmtList);
		//model.addAttribute("reqMgmtList", reqMgmtList);
		
		return reqMgmtList;
	}

	//입고관리수정
	@PostMapping("/reqMgUp")
	@ResponseBody
	public List<ReqMgmtDTO> reqMgmtUp(@RequestBody List<ReqMgmtDTO> reqMgmtDTO, HttpServletRequest request ) throws Exception {
		System.out.println("컨수입전"+reqMgmtDTO);
		 //HttpServletRequest request
		 //HttpSession session = request.getSession();
		 //User user = (User) session.getAttribute("loginUser");
		 //reqMgmtDTO.setUser_id(user.getId());
		Iterator<ReqMgmtDTO> iterator = reqMgmtDTO.iterator();
		while(iterator.hasNext()) {
			ReqMgmtDTO reqMgmtUp =iterator.next();
			reqMgmtService.reqMgmtUpdate(reqMgmtUp);
			System.out.println("컨수입후"+reqMgmtUp);
		}
		return reqMgmtDTO;
	
		
	}
	
	//입고관리입력
	@PostMapping("/reqMgIn")
	@ResponseBody
	public List<ReqMgmtDTO> reqMgmtIn(@RequestBody List<ReqMgmtDTO> reqMgmtDTO) throws Exception{
		
		Iterator<ReqMgmtDTO> iterator = reqMgmtDTO.iterator();
				
				while(iterator.hasNext()) {
					ReqMgmtDTO reqMgmtIn =iterator.next();
					reqMgmtService.reqMgmtInsert(reqMgmtIn);
				}
		return reqMgmtDTO;
	}
	//입고관리삭제-수정(여러개수정가능)
	@PutMapping("/reqMgDel")
	@ResponseBody
	public List<ReqMgmtDTO> reqMgmtDel(@RequestBody List<ReqMgmtDTO> reqMgmtDTO) throws Exception{
		//System.out.println("컨입삭전"+reqMgmtDTO);
		 Iterator<ReqMgmtDTO> iterator = reqMgmtDTO.iterator();
	      
	      while(iterator.hasNext()) {
	    	  ReqMgmtDTO reqMgmtDel = iterator.next();
	    	  reqMgmtService.reqMgmtDelete(reqMgmtDel.getIn_number());
	    	  

	      }
		return reqMgmtDTO;

	}

	
	//입고관리 세부항목보기
	@GetMapping("/reqMgDetail")
	@ResponseBody
	public List<ReqMgmtDetailDTO> reqMamt2(String in_number) throws Exception {
		//System.out.println("세리컨전"+in_number);
		List<ReqMgmtDetailDTO> reqMgmtDetail=reqMgmtService.reqMgmtDetail(in_number);
		//System.out.println("세리컨후"+reqMgmtDetail);
		//model.addAttribute("reqMgmtDetail", reqMgmtDetail);
		
		return reqMgmtDetail;
	}
	//세부항목수정
	@PostMapping("/reqMgDetailUp")
	@ResponseBody
	public void reqMgDetailUpdate(@RequestBody ReqMgmtDetailDTO reqMgmtDetailDTO) throws Exception{
		//System.out.println("세수컨전"+reqMgmtDetailDTO);
		reqMgmtService.reqMgDetailUpdate(reqMgmtDetailDTO);
		//System.out.println("세수컨후"+reqMgmtDetailDTO);
		
	}
	//세부항목입력 reqMgDeIn
	@PostMapping("/reqMgDetailIn")
	@ResponseBody
	public List<ReqMgmtDetailDTO> reqMgDetailInsert(@RequestBody List<ReqMgmtDetailDTO> reqMgmtDetailDTO) throws Exception {
		//System.out.println("컨전"+reqMgmtDetailDTO);
		 Iterator<ReqMgmtDetailDTO> iterator = reqMgmtDetailDTO.iterator();
	      
	      while(iterator.hasNext()) {
	    	  ReqMgmtDetailDTO reqMgmtDetailIn = iterator.next();
	    	  reqMgmtService.reqMgDetailInsert(reqMgmtDetailIn);

	      }
	      //System.out.println("컨후"+reqMgmtDetailDTO);
		return reqMgmtDetailDTO;
		
	}

	
	//modal(list)
	//modal-구매발주(구매발주번호,구매발주담당자, 비고 /회사코드)
	@GetMapping("/reqPO")
	@ResponseBody
	public List<ModalVO> reqPO(ModalVO modalVO) throws Exception{
		List<ModalVO> reqPO=reqMgmtService.reqPO(modalVO);
		return reqPO;
		
	}
	
	//modal-거래처코드(번호,코드,이름)
	@GetMapping("/reqCCMList")
	@ResponseBody
	public List<ModalVO> reqCCMList() throws Exception{
		List<ModalVO> reqPO=reqMgmtService.reqCCMList();
		System.out.println("거컨후"+reqPO);
		return reqPO;
	}
/*	public List<Map<String, Object>> reqCCMList() throws Exception{
		List<Map<String, Object>> reqPO=reqMgmtService.reqCCMList();
		System.out.println("거컨후"+reqPO);
		return reqPO;
	}
	
	*/
	//검색
	@GetMapping("/reqCCM")
	@ResponseBody
	public List<ModalVO> reqCCM(ModalVO modalVO) throws Exception{
		System.out.println("거컨검전"+modalVO);
		List<ModalVO> reqPOCCM=reqMgmtService.reqCCM(modalVO);
		System.out.println("거컨검후"+reqPOCCM);
		return reqPOCCM;
	}
	
	//----------------------------------------
	//modalDetail(list)
	//modal-상세보기
	@GetMapping("/reqDetailM")
	@ResponseBody
	public List<ModalVO> reqDetailM() throws Exception{
		List<ModalVO> reqPOCCM=reqMgmtService.reqDetailM();
		System.out.println("세모후"+reqPOCCM);
		return reqPOCCM;
	}
	
	//modal-창고코드(창고코드,창고명)
	@GetMapping("/reqWHList")
	@ResponseBody
	public List<ModalVO> reqWHCode(){
		List<ModalVO> reqWH=reqMgmtService.reqWHCode();
		System.out.println("창고컨후"+reqWH);
		return reqWH;
	}


}
