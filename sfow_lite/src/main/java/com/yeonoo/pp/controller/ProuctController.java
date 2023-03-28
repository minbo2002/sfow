package com.yeonoo.pp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProuctController {
	
	@GetMapping("/product/pp")
	public String ppMain() {
		return "pp/product";
	}
	@GetMapping("/ma/bom")
	public String maBom() {
		return "pp/bom";
	}
}
