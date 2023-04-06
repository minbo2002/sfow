package com.yeonoo.poRequest.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.poRequest.model.ReqMgmtDTO;
import com.yeonoo.poRequest.model.ReqMgmtDetailDTO;
import com.yeonoo.poRequest.service.ReqMgmtService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ReqMgmtController {
	
	private final ReqMgmtService reqMgmtService;
	
	@GetMapping("/reqM")
	public String req1() {
		return "poRequest/reqMgmt";
	}
	//입고관리-검색리스트
	@GetMapping("/searchPoIn")
	@ResponseBody
	public List<ReqMgmtDTO> reqMgmt(ReqMgmtDTO reqMgmtDTO, HttpServletRequest request) throws Exception {
		/*
		SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strIn_date = request.getParameter("in_date");
		Date in_date = sdf.parse(strIn_date);
		*/
		System.out.println("컨전"+reqMgmtDTO);
		List<ReqMgmtDTO> reqMgmtList=reqMgmtService.reqMgmtList(reqMgmtDTO);
		System.out.println("컨후"+reqMgmtList);
		//model.addAttribute("reqMgmtList", reqMgmtList);
		
		return reqMgmtList;
	}
	
	//수정-입고관리 보기
/*	@GetMapping("/reqMgUp")
	@ResponseBody
	public ReqMgmtDTO reqMgmtUpFrm(@RequestParam("in_number") String in_number) throws Exception {
		ReqMgmtDTO reqMgUp=reqMgmtService.reqMgUpFrm(in_number);
		return reqMgUp;	
	}
*/	
	//입고관리수정(1개씩만)
	@PostMapping("/reqMgUp")
	@ResponseBody
	public void reqMgmtUp(@RequestBody ReqMgmtDTO reqMgmtDTO, HttpServletRequest request ) throws Exception {
		System.out.println("컨수입전"+reqMgmtDTO);
		 //HttpServletRequest request
		 //HttpSession session = request.getSession();
		 //User user = (User) session.getAttribute("loginUser");
		 //reqMgmtDTO.setUser_id(user.getId());
		
			reqMgmtService.reqMgmtUpdate(reqMgmtDTO);
			System.out.println("컨수입후"+reqMgmtDTO);
	
		
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
		System.out.println("컨입삭전"+reqMgmtDTO);
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
	public List<ReqMgmtDetailDTO> reqMamt2(ReqMgmtDetailDTO reqMgmtDetailDTO) throws Exception {
		System.out.println("세부컨전"+reqMgmtDetailDTO);
		List<ReqMgmtDetailDTO> reqMgmtDetail=reqMgmtService.reqMgmtDetail(reqMgmtDetailDTO);
		System.out.println("세부컨후"+reqMgmtDetail);
		//model.addAttribute("reqMgmtDetail", reqMgmtDetail);
		
		return reqMgmtDetail;
	}
	//세부항목수정
	@PostMapping("/reqMgDetailUp")
	@ResponseBody
	public void reqMgDetailUpdate(@RequestBody ReqMgmtDetailDTO reqMgmtDetailDTO) throws Exception{
		System.out.println("세수컨전"+reqMgmtDetailDTO);
		reqMgmtService.reqMgDetailUpdate(reqMgmtDetailDTO);
		System.out.println("세수컨후"+reqMgmtDetailDTO);
		
	}
	//세부항목입력 reqMgDeIn
	@PostMapping("/reqMgDetailIn")
	@ResponseBody
	public List<ReqMgmtDetailDTO> reqMgDetailInsert(@RequestBody List<ReqMgmtDetailDTO> reqMgmtDetailDTO) throws Exception {
		System.out.println("컨전"+reqMgmtDetailDTO);
		 Iterator<ReqMgmtDetailDTO> iterator = reqMgmtDetailDTO.iterator();
	      
	      while(iterator.hasNext()) {
	    	  ReqMgmtDetailDTO reqMgmtDetailIn = iterator.next();
	    	  reqMgmtService.reqMgDetailInsert(reqMgmtDetailIn);

	      }
	      System.out.println("컨후"+reqMgmtDetailDTO);
		return reqMgmtDetailDTO;
		
	}
	
	
	
	
	
	

}
