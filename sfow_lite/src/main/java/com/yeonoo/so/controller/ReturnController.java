package com.yeonoo.so.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.so.domain.ReturnAdd;
import com.yeonoo.so.service.ReturnAddService;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;



@Controller
@Slf4j
public class ReturnController {
	
	@Autowired
	ReturnAddService returnAddService;
	
	//고객반품등록 연결
	@GetMapping("/so/returnMain")
	public String ReturnMain() {
		return "/so/returnMain";
	}
	

	@GetMapping("/so/test")
	public String test(HttpServletRequest request, Model model) throws Exception {
		
		List<ReturnAdd> list = returnAddService.getReturnAdd();
		model.addAttribute("list",list);
		
		return "/so/test";
	}
	
	//반품등록 전체조회
	@RequestMapping(value="/so/getReturnAdd", 
			method = RequestMethod.POST, 
			produces="application/text;charset=utf8")
	@ResponseBody
	public String getReturnAdd() throws Exception {
		
		List<ReturnAdd> returnAdd = returnAddService.getReturnAdd();
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("test", returnAdd);
		String jsonInfo = jsonObject.toString();
		
		
		return jsonInfo;
	}
	
	
	
	
	
	
}



