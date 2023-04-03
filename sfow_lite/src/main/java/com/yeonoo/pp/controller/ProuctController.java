package com.yeonoo.pp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.pp.domain.Item;
import com.yeonoo.pp.service.ProductService;

@Controller
public class ProuctController {
	
	@Autowired
	ProductService productService;
	
	private static final Logger logger = LoggerFactory.getLogger(ProuctController.class);
	
	@GetMapping("/product/pp")
	public String ppMain() {
		return "pp/product";
	}
	
	@GetMapping("/ma/bom")
	public String maBom() {
		return "pp/bom";
	}
	
	@RequestMapping("/ma/bomGetItem")
	@ResponseBody
	public List<Item> getItem() throws Exception {
		int company_code = 1;
		List<Item> list = productService.getItemList(company_code);
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
		List<Item> childList = productService.getBomTree(ppitem_cd);
		//부모 데이터
		Item item = null;
		if(childList.isEmpty()) {
			//빈 객체
			item = productService.selectItem(ppitem_cd);
			System.out.println(item);
			treeData.add(item);
			return treeData;
		}else {
			//부모 로우
			item = productService.selectItem(ppitem_cd);
			Map att = new HashMap();
			att.put("expanded", "true");
		    item.set_attributes(att);
		    for(int i = 0; i < childList.size(); i++ ) {
		    	String sitem_code =  childList.get(i).getItem_code();
		    	List<Item> sitem_list = productService.getBomTree(sitem_code);
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
	
	@ResponseBody
	@RequestMapping("/ma/addTree")
	public List<Object> addTree(@RequestBody List<Item> jsonRowDatas){
		
		return null;
	}
	
	
}
