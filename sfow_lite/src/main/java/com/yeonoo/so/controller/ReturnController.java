package com.yeonoo.so.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.so.domain.ReturnAdd;
import com.yeonoo.so.service.ReturnAddService;

import lombok.extern.slf4j.Slf4j;



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
	
	//전체 조회
	@RequestMapping(value="/so/getReturnAdd",
			   method=RequestMethod.POST)
	@ResponseBody
	public List<ReturnAdd> getReturn() throws Exception {
		List<ReturnAdd> returnAdd = returnAddService.getReturnAdd();
		return returnAdd;
	}
	
    //선택한 날짜에 맞춰 조회
    @GetMapping("/so/getReturnAddByDate")
    @ResponseBody
    public List<ReturnAdd> getReturnAddByDate(@RequestParam(value = "return_date", required = false) String return_date) throws Exception {
    	List<ReturnAdd> returnAddbyDate = returnAddService.getReturnAddByDate(return_date);
        if (return_date == null ||  return_date.isEmpty()) {
            returnAddbyDate = returnAddService.getReturnAdd(); // 전체 데이터 조회
            System.out.println(return_date+"date 비었음");
            System.out.println(returnAddbyDate);
        } else {
            returnAddbyDate = returnAddService.getReturnAddByDate(return_date);
            System.out.println(return_date+"date 있음");
            System.out.println(returnAddbyDate);
        }
    	
    	return returnAddbyDate;
    }
    
    
	
}



