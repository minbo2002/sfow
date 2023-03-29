package com.yeonoo.so.controller;


import java.util.Iterator;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

		List<ShipOut> shipOutList = shipOutService.getList();
		System.out.println("shipOutList = " + shipOutList);
		return shipOutList;
	}
	
	@ResponseBody
	@RequestMapping(value="useUpdate", method=RequestMethod.POST)
	public void useUpdate(@RequestBody List<ShipOut> shipout) {

		System.out.println("shipout = " + shipout);

		Iterator<ShipOut> iterator = shipout.iterator();
		while(iterator.hasNext()) {
			ShipOut elements = iterator.next();
			System.out.println("outCode = " + elements.getOutCode());
			
			shipOutService.updateStatus(elements.getOutCode());
		}
		
	}

}
