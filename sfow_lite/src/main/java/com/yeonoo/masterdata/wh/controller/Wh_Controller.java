package com.yeonoo.masterdata.wh.controller;

import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;

import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.masterdata.wh.domain.WH;
import com.yeonoo.masterdata.wh.service.WhService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class Wh_Controller {
	
	@Autowired
	WhService whService;
	
	//private final Logger logger = (Logger) LoggerFactory.getLogger(Wh_Controller.class);
	
	//창고폼 보여주기
	  @RequestMapping("/warehouse/whinfo")
	   public String whForm() {
	      
	      return "/warehouse/whForm";
	   }
	   
	  //창고폼에서 AJAX 로 내용 불러오기
	    @GetMapping("/warehouse/whinfoAJ")
	    @ResponseBody
	    public List<WH> getWhAllList() throws Exception {
	       
	       //전체 목록 조회
	        List<WH> results = whService.getWhAllList();

	        return results;
	    }
	    
		/*
		 * //update WH
		 * 
		 * @PutMapping("/warehouse/updateWH")
		 * 
		 * @ResponseBody public void updateWH(@RequestParam WH rowData) throws Exception
		 * {
		 * 
		 * System.out.println("행테이터"+rowData); whService.updateWH(rowData);
		 * 
		 * }
		 */
	  //area 보여주기
	    @PostMapping("/warehouse/whArea")
	    public String getAreaList() throws Exception {
		       
		       //전체 목록 조회
		       
		        return "/warehouse/whForm";
		    }
	    
	    //3가지 키워드로 검색해서 보여주기 aj    @GetMapping("/warehouse/searchWH")
	    @GetMapping("/warehouse/searchWH")
	    @ResponseBody
	    public List<WH> searchWH(Model model,WH searchwh) throws Exception {
	    	
	    	System.out.println("searchwh"+searchwh);
	    	
	    	List<WH> results = whService.searchWH(searchwh);
	    	
	    	System.out.println("results"+results);
			return results;
	    	
	    }
	    
	    @GetMapping("/warehouse/WHarea")
	    @ResponseBody
	    public List<WH> WHarea(Model model,WH wharea) throws Exception {
	    	
	    	System.out.println("searchwh"+wharea);
	    	
	    	List<WH> results = whService.WHarea(wharea);
	    	
	    	System.out.println("results"+results);
	    	
			return results;
	    	
	    }
	    
	    
	    //행 추가 등록(인서트)
	    @RequestMapping(value="/warehouse/insertWH", method=RequestMethod.POST)
	    @ResponseBody
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
