package com.yeonoo.so.controller;

import java.util.ArrayList;
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
import com.yeonoo.so.domain.ItemShipOutDTO;
import com.yeonoo.so.domain.LotShipOutDTO;
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

	// 전체조회
	@ResponseBody
	@RequestMapping(value="list")
	public List<ShipOut> getList() {

		List<ShipOut> shipOutList = shipOutService.getList();

		logger.info("shipOutList = " + shipOutList);
		
		return shipOutList;
	}
	
	/*-------------------------------------------------------------------------------------*/

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

	// 등록
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
	
	// 특정 출하번호에 있는 ITEM 정보조회
	@ResponseBody
	@RequestMapping(value="selectItems", method=RequestMethod.POST)
	public List<ItemShipOutDTO> selectItem(@RequestBody List<ShipOut> shipOutList) {	
		logger.info("1) 체크한 row의 List<ShipOut> 정보 = " + shipOutList);	

		List<ItemShipOutDTO> itemShipOutList = new ArrayList<ItemShipOutDTO>();
		
		Iterator<ShipOut> iterator = shipOutList.iterator();
		while(iterator.hasNext()) {
			
			ShipOut elements = iterator.next();
			logger.info("2) 체크한 row의 ShipOut 정보 iterator변환 = " + elements + ", 그리고 그중에서 출하코드 추출 = " + elements.getOutCode());
			
			ItemShipOutDTO itemShipOut = shipOutService.selectItem(elements.getOutCode());
			logger.info("5) 3개테이블 join 정보 : " + itemShipOut);
			itemShipOutList.add(itemShipOut);

		}
		return itemShipOutList; 
	}
	
	// 특정 ITEM코드에 있는 LOT 정보조회
	@ResponseBody
	@RequestMapping(value="selectLots", method=RequestMethod.POST)
	public List<LotShipOutDTO> selectLot(@RequestBody List<ShipOut> shipOutList) {	
		logger.info("1) 체크한 row의 List<ShipOut> 정보 = " + shipOutList);	

		List<LotShipOutDTO> lotShipOutList = new ArrayList<LotShipOutDTO>();
		
		Iterator<ShipOut> iterator = shipOutList.iterator();
		while(iterator.hasNext()) {
			
			ShipOut elements = iterator.next();
			logger.info("2) 체크한 row의 ShipOut 정보 iterator변환 = " + elements + ", 그리고 그중에서 ITEM코드 추출 = " + elements.getItemCode());

			LotShipOutDTO lotShipOutDTO = shipOutService.selectLot(elements.getItemCode());
			logger.info("5) 2개테이블 join 정보 : " + lotShipOutDTO);
			lotShipOutList.add(lotShipOutDTO);   

		}
		return lotShipOutList; 
	}

}
