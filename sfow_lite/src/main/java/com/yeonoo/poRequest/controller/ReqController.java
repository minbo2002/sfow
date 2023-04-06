package com.yeonoo.poRequest.controller;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.poRequest.model.ReqDetailVO;
import com.yeonoo.poRequest.model.ReqVO;
import com.yeonoo.poRequest.service.ReqService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ReqController {
	
	private final ReqService reqService;
	
	@RequestMapping("/req1")
	public String reqOrder() {
		return "poRequest/req";
	}
	
	@GetMapping("/reqSearch")
	@ResponseBody
	public List<ReqVO> reqOrder(
	        @RequestParam(required = false) String request_number,
	        @RequestParam(required = false) String request_type,
	        @RequestParam(required = false) String request_date,
	        @RequestParam(required = false) String request_empid
	) throws Exception {
	    ReqVO reqVO = new ReqVO();
	    reqVO.setRequest_number(request_number);
	    reqVO.setRequest_type(request_type);
	    reqVO.setRequest_date(request_date);
	    reqVO.setRequest_empid(request_empid);
	    System.out.println("reqVO: " + reqVO);
	    List<ReqVO> reqOrder = reqService.reqOrder(reqVO);
	    return reqOrder;
	}
	
	
	@PutMapping("/reqUpdate")
	@ResponseBody
	public int reqUpdate(@RequestBody ReqVO reqVO)throws Exception {
		System.out.println("수정완료"+reqVO);
		int cnt =reqService.reqUpdate(reqVO);
		return cnt;
	}
	
	@PutMapping("/reqDel")
	@ResponseBody
	public List<ReqVO> reqDel(@RequestBody List<ReqVO> reqVO)throws Exception {
		
		Iterator<ReqVO> iterator = reqVO.iterator();
		while(iterator.hasNext()) {
			ReqVO reqDel = iterator.next();
			reqService.reqDel(reqDel.getRequest_number());
         }
		return reqVO;
	}
		
/*
	@GetMapping("/reqDetail")
	@ResponseBody
	public List<ReqDetailVO> reqOrderDetail(String request_number) throws Exception {
		
		List<ReqDetailVO> reqOrderDetail = reqService.reqOrderDetail(request_number);
		//model.addAttribute("reqOrderDetail", reqOrderDetail);
		
		return reqOrderDetail;
		
	}
*/
	
	@GetMapping("/reqDetail")
	@ResponseBody
	public List<ReqDetailVO> reqOrderDetail(
			@RequestParam(required = false) String request_number
			) throws Exception {
		ReqDetailVO reqDetailVO = new ReqDetailVO();
	    reqDetailVO.setRequest_number(request_number);
		List<ReqDetailVO> reqOrderDetail = reqService.reqOrderDetail(request_number);
		//model.addAttribute("reqOrderDetail", reqOrderDetail);
		System.out.println("reqOrderDetail"+reqOrderDetail);
		return reqOrderDetail;
		
	}
	
	@PutMapping("/reqDetailUpdate")
	@ResponseBody
	public int reqDetailUpdate(@RequestBody ReqDetailVO reqDetailVO)throws Exception {
		System.out.println("수정완료"+reqDetailVO);
		int cnt =reqService.reqDetailUpdate(reqDetailVO);
		return cnt;
	}
	

	@PostMapping("/reqInsert")
	@ResponseBody
	public List<ReqVO> reqInsert(@RequestBody List<ReqVO> reqVO)throws Exception {
		
		Iterator<ReqVO> iterator = reqVO.iterator();
		while(iterator.hasNext()) {
			ReqVO req = iterator.next();
			reqService.reqInsert(req);
			System.out.println("insert cont");
         }
		return reqVO;
	}

	
	@PostMapping("/reqDetailInsert")
	@ResponseBody
	public List<ReqDetailVO> reqDetailInsert(@RequestBody List<ReqDetailVO> reqDetailVO)throws Exception {
		
		Iterator<ReqDetailVO> iterator = reqDetailVO.iterator();
		while(iterator.hasNext()) {
			ReqDetailVO reqD = iterator.next();
			reqService.reqDetailInsert(reqD);
			System.out.println("insert cont Detail");
         }
		return reqDetailVO;
	}
	
}
