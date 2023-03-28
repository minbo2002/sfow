package com.yeonoo.so.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.so.domain.ShipOut;
import com.yeonoo.so.service.ShipOutService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/shipout/")
@RequiredArgsConstructor
public class ShipOutController {

	private final ShipOutService shipOutService;
	
	@RequestMapping(value="main")
	public String main() {
		
		return "so/shipOutMain";
	}
	
	@ResponseBody
	@RequestMapping(value="list")
	public List<ShipOut> getList() {

		List<ShipOut> list = shipOutService.getList();
		System.out.println("list = " + list);
		return list;
	}
}
