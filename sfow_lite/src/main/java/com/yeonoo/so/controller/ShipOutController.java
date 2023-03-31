package com.yeonoo.so.controller;

import java.util.Iterator;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	private final Logger logger = LoggerFactory.getLogger(ShipOutController.class);
	
	@RequestMapping(value="main")
	public String main() {
		
		return "so/shipOutMain";
	}
	
	/*-------------------------------------------------------------------------------------*/
	
	@ResponseBody
	@RequestMapping(value="list")
	public List<ShipOut> getList() {

		List<ShipOut> shipOutList = shipOutService.getList();

		logger.info("shipOutList = " + shipOutList);
		
		return shipOutList;
	}
	
	/*-------------------------------------------------------------------------------------*/

	/* 
	// 삭제여부 상태 업데이트
	@ResponseBody
	@PostMapping("useUpdate")
	public List<Map<String, Object>> useUpdate(@RequestBody List<Map<String, Object>> shipout) {

		System.out.println("shipout = " + shipout);

		return shipout;
	}
	*/

	
	/* @RequestBody 요청						 @ResponseBody 응답
	   JSON 요청 --> HTTP 메시지 컨터버 --> 객체            객체 --> HTTP 메시지 컨터버 --> JSON 응답
	*/
	// 삭제여부 상태 업데이트
	@ResponseBody
	@RequestMapping(value="statusUpdate", method=RequestMethod.POST)
	public List<ShipOut> useUpdate(@RequestBody List<ShipOut> shipout) {

		logger.info("상태변경을 위한 shipout 정보 = " + shipout);

		Iterator<ShipOut> iterator = shipout.iterator();
		
		while(iterator.hasNext()) {
			
			ShipOut elements = iterator.next();
			logger.info("출하코드 outCode = " + elements.getOutCode());

			shipOutService.updateStatus(elements.getOutCode());
		}
		
		return shipout;
	}
	
	/*-------------------------------------------------------------------------------------*/

	@ResponseBody
	@RequestMapping(value="write", method=RequestMethod.POST)
	public List<ShipOut> shipOutWrite(@RequestBody List<ShipOut> shipout) {

		logger.info("등록을 위해 입력한 shipout 정보 = " + shipout);

		Iterator<ShipOut> iterator = shipout.iterator();
		while(iterator.hasNext()) {
			ShipOut elements = iterator.next();
			logger.info("shipout 정보 iterator 변환 = " + elements);
			
			int writeCnt = shipOutService.writeShipOut(elements);
			logger.info("DB에 insert된 출하 개수 : " + writeCnt);
		}
		
		return shipout;
	}
	
}
