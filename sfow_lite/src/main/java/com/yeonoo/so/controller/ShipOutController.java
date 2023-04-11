package com.yeonoo.so.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.so.domain.ShipOut;
import com.yeonoo.sfow.basicinfo.domain.UserInfo;
import com.yeonoo.so.domain.ItemShipOutDTO;
import com.yeonoo.so.domain.LotShipOutDTO;
import com.yeonoo.so.domain.SearchDTO;
import com.yeonoo.so.service.ShipOutService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/shipout/")
@RequiredArgsConstructor
public class ShipOutController {

	private final ShipOutService shipOutService;
	private final Logger logger = LoggerFactory.getLogger(ShipOutController.class);
	
	// 메인화면
	@RequestMapping(value="main")
	public String main() {
		
		return "so/shipOutMain";
	}
	
	// modal Item창
	@RequestMapping(value="modalItem")
	public String modalItem() {
		
		return "so/modalItem";
	}
	
	// modal Item값 조회
	@RequestMapping(value="getModalItem")
	@ResponseBody
	public List<Map<String, Object>> getModalItem() {
		
		List<Map<String, Object>> result = shipOutService.getModalItem();
		logger.info("1) modalItem = " + result);
		
		return result;
	}

	/*-------------------------------------------------------------------------------------*/

	// 전체조회
	@ResponseBody
	@RequestMapping(value="list", method=RequestMethod.POST)
	public List<ShipOut> getList(@RequestBody SearchDTO searchDTO, HttpSession session) {

		logger.info("1) searchDTO = " + searchDTO);

		List<ShipOut> shipOutList = shipOutService.getList(searchDTO);
		logger.info("shipOutList = " + shipOutList);
		
		return shipOutList;
	}
	
	/*-------------------------------------------------------------------------------------*/

	// 출하정보 삭제(삭제여부 상태 업데이트됨)
	@ResponseBody
	@RequestMapping(value="deleteShipOut", method=RequestMethod.PUT)
	public int deleteStatus(@RequestBody List<ShipOut> shipout) {

		logger.info("삭제를 위한 shipout 정보 = " + shipout);

		Iterator<ShipOut> iterator = shipout.iterator();
		int updateCnt = 0;
		
		while(iterator.hasNext()) {
			
			ShipOut elements = iterator.next();
			logger.info("출하코드 outCode = " + elements.getOutCode() + ",  출하상태 = " + elements.getOutStatus());

			updateCnt = shipOutService.deleteStatus(elements.getOutCode());
			logger.info("삭제한 row개수 = " + updateCnt);				
		}
		
		return updateCnt;
	}
	
	/*-------------------------------------------------------------------------------------*/

	// 등록
	@ResponseBody
	@RequestMapping(value="write", method=RequestMethod.POST)
	public List<ShipOut> shipOutWrite(@RequestBody List<ShipOut> shipout, HttpSession session) {

		logger.info("등록을 위해 입력한 shipout 정보 = " + shipout);

		UserInfo userInfo = (UserInfo) session.getAttribute("AUTHUSER");
		String userId = userInfo.getId();
		
		Iterator<ShipOut> iterator = shipout.iterator();
		
		while(iterator.hasNext()) {
			ShipOut elements = iterator.next();
			logger.info("shipout 정보 iterator 변환 = " + elements);
			elements.setCreateUser(userId);
			int writeCnt = shipOutService.writeShipOut(elements);
			logger.info("DB에 insert된 출하 개수 : " + writeCnt);
		}
		
		return shipout;
	}
	
	/*-------------------------------------------------------------------------------------*/
	
	// 특정 수주번호에 있는 ITEM 정보조회
	@ResponseBody
	@RequestMapping(value="selectItems", method=RequestMethod.POST)
	public List<ItemShipOutDTO> selectItem(@RequestBody List<ShipOut> shipOutList) {	
		logger.info("Item 1) 체크한 row의 List<ShipOut> 정보 = " + shipOutList);	

		List<ItemShipOutDTO> itemShipOutList = new ArrayList<ItemShipOutDTO>();
		
		Iterator<ShipOut> iterator = shipOutList.iterator();
		while(iterator.hasNext()) {
			
			ShipOut elements = iterator.next();
			logger.info("Item 2) 체크한 row의 ShipOut 정보를 iterator변환 = " + elements + ", 그리고 그중에서 수주번호 추출 = " + elements.getOrderNumber());
			logger.info("상태값(등록, 확정) = " + elements.getOutStatus());

			List<ItemShipOutDTO> itemShipOut = shipOutService.selectItem(elements.getOrderNumber());
			logger.info("Item 5) 3개테이블 join 정보 : " + itemShipOut);
			
			Iterator<ItemShipOutDTO> iterator2 = itemShipOut.iterator();
			while(iterator2.hasNext()) {
				ItemShipOutDTO itemElements = iterator2.next();
				itemShipOutList.add(itemElements);
			}	
		}
		
		return itemShipOutList; 
	}
	
	/*-------------------------------------------------------------------------------------*/
	
	// 특정 ITEM 코드에 있는 LOT 정보조회
	@ResponseBody
	@RequestMapping(value="selectLots", method=RequestMethod.POST)
	public List<LotShipOutDTO> selectLot(@RequestBody List<ShipOut> shipOutList) {	
		logger.info("LOT 1) 체크한 row의 List<ShipOut> 정보 = " + shipOutList);	

		List<LotShipOutDTO> lotShipOutList = new ArrayList<LotShipOutDTO>();
		
		Iterator<ShipOut> iterator = shipOutList.iterator();
		while(iterator.hasNext()) {
			
			ShipOut elements = iterator.next();
			logger.info("LOT 2) 체크한 row의 ShipOut 정보 iterator변환 = " + elements + ", 그리고 그중에서 ITEM코드 추출 = " + elements.getItemCode());

			List<LotShipOutDTO> lotShipOut = shipOutService.selectLot(elements.getItemCode());
			logger.info("LOT 5) 2개테이블 join 정보 : " + lotShipOut);
			
			Iterator<LotShipOutDTO> iterator2 = lotShipOut.iterator();
			while(iterator2.hasNext()) {
				LotShipOutDTO itemElements = iterator2.next();
				lotShipOutList.add(itemElements);
			}
		}
		
		return lotShipOutList; 
	}

	/*-------------------------------------------------------------------------------------*/
	
	// 상태 변경
	@ResponseBody
	@RequestMapping(value="statusUpdate", method=RequestMethod.PUT)
	public int statusUpdate(@RequestBody List<ShipOut> shipout) {

		logger.info("상태변경을 위한 shipout 정보 = " + shipout);

		Iterator<ShipOut> iterator = shipout.iterator();
		int statuseCnt = 0;
		
		while(iterator.hasNext()) {
			
			ShipOut elements = iterator.next();
			logger.info("출하코드 outCode = " + elements.getOutCode());

			statuseCnt = shipOutService.statusUpdate(elements.getOutCode());
			logger.info("상태변경된 row수 = " + statuseCnt);
		}
		
		return statuseCnt;
	}
	
	/*-------------------------------------------------------------------------------------*/
	
	// 데이터 수정
	@ResponseBody
	@RequestMapping(value="updateShipOut", method=RequestMethod.PATCH)
	public int updateShipOut(@RequestBody List<ShipOut> shipout) {

		logger.info("1) 상태변경을 위한 shipout 정보 = " + shipout);

		Iterator<ShipOut> iterator = shipout.iterator();
		int updateCnt = 0;
		
		while(iterator.hasNext()) {
			
			ShipOut elements = iterator.next();
			logger.info("2) 출하코드 outCode = " + elements.getOutCode());

			updateCnt = shipOutService.updateShipOut(elements);
			logger.info("5) 수정된 행 개수 = " + updateCnt);
		}
		
		return updateCnt;
	}
}
