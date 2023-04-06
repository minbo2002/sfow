package com.yeonoo.masterdata.wh.controller;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.yeonoo.masterdata.wh.domain.WH;
import com.yeonoo.masterdata.wh.service.WhService;

@RestController
public class Wh_RestController {

	
	@Autowired
	private WhService whService;
	
	
	//창고폼에서 AJAX 로 내용 불러오기
	@RequestMapping(value="/warehouse/whinfoAJ")
    public List<WH> getWhAllList() throws Exception {
       //전체 목록 조회
        List<WH> results = whService.getWhAllList();
        return results;
    }
    
  //3가지 키워드로 검색해서 보여주기 aj    @GetMapping("/warehouse/searchWH")
	@RequestMapping(method = {RequestMethod.GET}, value = "/warehouse/searchWH" ,consumes="application/json")
    public List<WH> searchWH(Model model,WH searchwh) throws Exception {
    		System.out.println("searchwh"+searchwh);
    	List<WH> results = whService.searchWH(searchwh);
    		System.out.println("results"+results);
		return results;
    	
    }
    //area 데이터 불러오기
	@RequestMapping(method = {RequestMethod.GET}, value = "/warehouse/WHarea" ,consumes="application/json")
    public List<WH> WHarea(Model model,WH wharea) throws Exception {
    		System.out.println("searchwh"+wharea);
    	List<WH> results = whService.WHarea(wharea);
    		System.out.println("results"+results);
    	
		return results;
    	
    }
    
    //행 추가 등록(인서트)
    @RequestMapping(value="/warehouse/insertWH", method=RequestMethod.POST,consumes="application/json")
    public List<WH> insertWH(@RequestBody List<WH> wh){
    	
    	Iterator<WH> iterator = wh.iterator();
    	while(iterator.hasNext()){
    		WH elements = iterator.next();
    		//logger.info("elements=="+elements);
    		int insertCnt = whService.writeWH(elements);
    		//logger.info("insertCnt==="+insertCnt);
    	}
    	return wh;
    }
    
	
	
}
