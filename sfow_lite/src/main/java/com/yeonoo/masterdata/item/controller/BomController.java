package com.yeonoo.masterdata.item.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.masterdata.item.domain.BomItem;
import com.yeonoo.masterdata.item.domain.DupDto;
import com.yeonoo.masterdata.item.service.BomService;

@Controller
public class BomController {
	
	@Autowired
	BomService bomService;
	
	private static final Logger logger = LoggerFactory.getLogger(BomController.class);
	
	@GetMapping("/ma/bom")
	public String maBom() {
		return "masterData/bom";
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
	public List<BomItem> getBomTree(String ppitem_cd) throws Exception {
		//넘길 데이터
		List<BomItem> treeData = new ArrayList<BomItem>();
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
	
	@ResponseBody
	@RequestMapping(value = "/ma/searchItem", method = RequestMethod.POST)
	public List<BomItem> searchItem(@RequestBody String item_name) throws Exception {
		List<BomItem> list = bomService.getItemListByName(item_name);
		return list;
	}
	
	//중복 Tree 검사
	@ResponseBody
	@RequestMapping(value = "/ma/dupTest", method = RequestMethod.POST)
	public int dupTest(@RequestBody DupDto dupDto) throws Exception {
		String ppitem_cd = dupDto.getPpitem_cd();
		List<BomItem> list = bomService.getBomTree(ppitem_cd);
		List<BomItem> checkedRow = dupDto.getRowData();
		for(int i = 0; i < list.size(); i++) {
			String treeItem_code = list.get(i).getItem_code();
			for(int j = 0; j < checkedRow.size(); j++) {
				String chkItem_code = checkedRow.get(j).getItem_code();
				if(treeItem_code.equals(chkItem_code)) {
					return 1;
				}
			}
			
		}
		return 0;
	}
	
	@ResponseBody
	@RequestMapping(value="/ma/addTree", method=RequestMethod.POST)
	public int addTree(@RequestBody DupDto dupDto) throws Exception{
		String ppitem_cd = dupDto.getPpitem_cd();
		List<BomItem> list = bomService.getBomTree(ppitem_cd);
		List<BomItem> rowData = dupDto.getRowData();
		for(int i = 0; i < rowData.size(); i++) {
			Boolean found = false;
			String rowItem_code = rowData.get(i).getItem_code();
			for(int j = 0; j < list.size(); j++) {
				String treeItem_code = list.get(j).getItem_code();
				if(treeItem_code.equals(rowItem_code)) {
					bomService.updateTree(ppitem_cd, rowData.get(i));
					found = true;
					break;
				}
			}
			if(!found) {
				bomService.insertTree(ppitem_cd, rowData.get(i));
			}
		}
		
		return 1;
	}

}
