package com.yeonoo.masterdata.item.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.masterdata.item.domain.BomItem;
import com.yeonoo.masterdata.item.service.BomService;

@Controller
public class BomController {
	
	@Autowired
	BomService bomService;
	
	private static final Logger logger = LoggerFactory.getLogger(BomController.class);
	
	@GetMapping("/ma/bom")
	public String maBom() {
		return "pp/bom";
	}
	
	@RequestMapping("/ma/bomGetItem")
	@ResponseBody
	public List<BomItem> getItem() throws Exception {
		int company_code = 1;
		List<BomItem> list = bomService.getItemList(company_code);
		System.out.println(list);
		return list;
	}
	
	//BomTree 조회 후 데이터 넘기기
	@RequestMapping("/ma/getBomTree")
	@ResponseBody
	public List<Object> getBomTree(String ppitem_cd) throws Exception {
		//넘길 데이터
		List<Object> treeData = new ArrayList<Object>();
		//자식 데이터
		List<BomItem> childList = bomService.getBomTree(ppitem_cd);
		//부모 데이터
		BomItem item = null;
		if(childList.isEmpty()) {
			//빈 객체
			item = bomService.selectItem(ppitem_cd);
			System.out.println(item);
			treeData.add(item);
			return treeData;
		}else {
			//부모 로우
			item = bomService.selectItem(ppitem_cd);
			Map att = new HashMap();
			att.put("expanded", "true");
		    item.set_attributes(att);
		    for(int i = 0; i < childList.size(); i++ ) {
		    	String sitem_code =  childList.get(i).getItem_code();
		    	List<BomItem> sitem_list = bomService.getBomTree(sitem_code);
		    	if(!sitem_list.isEmpty()) {
		    		childList.get(i).set_attributes(att);
		    		childList.get(i).set_children(sitem_list);
		    	}
		    }
		    //자식 로우 추가
		    item.set_children(childList);
		    treeData.add(item);
			return treeData;
		}
	}
	
	/*@ResponseBody
	@RequestMapping(value="/ma/addTree", method=RequestMethod.POST)
	public List<Item> addTree(@RequestBody List<Item> itemList){
		logger.info("등록을 위해 입력한 itemList 정보 = " + itemList);
		Iterator<Item> iterator = itemList.iterator();
		
		while(iterator.hasNext()) {
			Item elements = iterator.next();
	        logger.info("shipout 정보 iterator 변환 = " + elements);
	         
	        int writeCnt = productService.addTree(elements);
	        logger.info("DB에 insert된 출하 개수 : " + writeCnt);
	      }
		return itemList;
	}*/

}
