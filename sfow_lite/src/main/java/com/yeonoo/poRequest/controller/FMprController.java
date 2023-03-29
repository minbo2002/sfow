package com.yeonoo.poRequest.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yeonoo.poRequest.domain.FMpr;
import com.yeonoo.poRequest.service.FMprService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FMprController  {

	private static final Logger logger = LoggerFactory.getLogger(FMprController.class);
	
	@Autowired
	FMprService fMprService;
	
	   
	   @RequestMapping("/h") //url주소고
	   public String stock() {
	      
	      return "/fieldmode/FMpr";//보여주고싶은 jsp페이지
	   }

	//화면목록페이지
	@GetMapping("/FMpr/test")
	@ResponseBody
	public List<FMpr> list() throws Exception {

		//전체목록조회
		List<FMpr> list = fMprService.getFMprAllList();
		
	
		//4.View
		return list;
	}
	
	//수정하기
	  @ResponseBody
	  @RequestMapping(value="/updateFMpr", method=RequestMethod.PUT)
	  public void updateFMpr(@RequestBody FMpr data) throws Exception {
	     System.out.println(data);
	     fMprService.updateFMpr(data);

	  }

	

}//입력처리 끝
	

	
	
    
    











