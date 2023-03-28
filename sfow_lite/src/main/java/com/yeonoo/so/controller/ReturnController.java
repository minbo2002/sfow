package com.yeonoo.so.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReturnController {
	
	@GetMapping("/so/returnMain")
	public String ReturnMain() {
		
		return "/so/returnMain";
	}
	
	
}
