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
		return list;
	}
	
	@RequestMapping("/ma/getBomTree")
	@ResponseBody
	public List<Object> getBomTree(String ppitem_cd) throws Exception {
		//넘길 데이터
		List<Object> treeData = new ArrayList<Object>();
		//자식 데이터
		List<Item> childList = productService.getBomTree(ppitem_cd);
		//부모 데이터
		Item item = productService.selectItem(ppitem_cd);
		if(childList.isEmpty()) {
			//빈 객체
			treeData.add(item);
			return treeData;
		}else {
			//부모 로우
			Map<String, Object> parents = new HashMap<String, Object>();
			parents.put("item_code", item.getItem_code());
			parents.put("item_name", item.getItem_name());
			parents.put("item_no", item.getItem_no());
			parents.put("item_specification", item.getItem_specification());
			Map<String, Object> attNode = new HashMap<String, Object>();
		    attNode.put("expanded", "true");
		    
		    parents.put("_attributes", attNode);
		    
		    //자식 로우 추가
		    parents.put("_children", childList);
		    treeData.add(parents);
			return treeData;
		}
	}
	
	
}
