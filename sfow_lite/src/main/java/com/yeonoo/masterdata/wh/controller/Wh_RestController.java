package com.yeonoo.masterdata.wh.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yeonoo.masterdata.wh.domain.WH;
import com.yeonoo.masterdata.wh.domain.WH_detail;
import com.yeonoo.masterdata.wh.service.WhService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
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
    
  //3가지 키워드로 검색해서 보여주기 aj
	@RequestMapping(method = {RequestMethod.GET}, value = "/warehouse/searchWH" )
    public List<WH> searchWH(Model model,WH searchwh) throws Exception {
    		System.out.println("searchwh"+searchwh);
    	List<WH> results = whService.searchWH(searchwh);
    		System.out.println("results"+results);
		return results;
    	
    }
	/*
    //area 데이터 불러오기
	@RequestMapping(method = {RequestMethod.POST}, value = "/warehouse/WHarea" , consumes="application/json")
    public List<WH_detail> WHarea(Model model,WH_detail wh_detail,WH wh) throws Exception {
    		System.out.println("searchwh============"+wh_detail);
    	List<WH_detail> results = whService.WHarea(wh_detail);
    		System.out.println("results==="+results);
    	
		return results;
    	
    }*/
	
	//area 데이터 불러오기
		@RequestMapping(method = {RequestMethod.POST}, value = "/warehouse/WHarea" , consumes="application/json")
	    public List<WH_detail> WHarea(@RequestBody List<WH> wh) throws Exception {
	    		
	    	List<WH_detail> wh_detail = new ArrayList<WH_detail>();
	    	
	    	Iterator<WH> iterator = wh.iterator();
	    	while(iterator.hasNext()) {
	    		
	    		WH elements = iterator.next();
	    		
	    		List<WH_detail> wh_detail2 = whService.WHarea(elements.getWarehouse_code());
	    			System.out.println("====wh_detail2===="+wh_detail2);
	    		Iterator<WH_detail> iterator2 = wh_detail2.iterator();
	    			
	    		while (iterator2.hasNext()) {
	    		
	    			WH_detail wh_details =iterator2.next();
	    			wh_detail.add(wh_details);
	    		}
	    	}	    	
			return wh_detail;
	    }
	
	
    //행 추가 등록(인서트 "저장" 버튼)
	@ResponseBody
    @RequestMapping(method= {RequestMethod.POST}, value="/warehouse/insertWH")
    public List<WH> insertWH(@RequestBody List<WH> wh,HttpSession session) throws Exception{
		
		
		 String company_code = "temp_company_code"; 
		    String id = "temp_id"; 
		    String createuser = id;
		    if(session != null) { //세션이 null이 아닌 경우에만 세션에서 값을 가져옴
		        //세션에서 company_code 랑 사용자 (접속자)이름 가져와야한다.
		        String company_code1 = (String) session.getAttribute("company_code"); //세션에서 company_code 받아오기
		        String id1 = (String) session.getAttribute("id"); //세션에서 user_id 받아오기
		        if(company_code1 != null) { //세션에서 받아온 값이 null이 아닌 경우에만 값을 설정
		            company_code = company_code1;
		        }
		        if(id1 != null) { //세션에서 받아온 값이 null이 아닌 경우에만 값을 설정
		            id = id1;
		            createuser = id;
		        }
		    }
		    
		    for(WH element : wh) {
		        element.setCompany_code(company_code); //받아온 company_code를 wh 객체에 설정
		        element.setCreateuser(createuser); //받아온 id를 wh 객체에 설정, createuser로 이름 변경
		        int writeCnt = whService.insertWH(element);
		    }
		    return wh;
		}
            
       
	
    //전체 행 업데이트 기능  - 구역(area)까지
    @ResponseBody
  	@RequestMapping(method = {RequestMethod.PUT,RequestMethod.PATCH}, value= "/warehouse/updateWH")
  	public int updateWH(@RequestBody List<WH> wh) throws Exception {
    	
    	Iterator<WH> iterator = wh.iterator();
    		int updateCnt = 0;
    	while(iterator.hasNext()) {
			
    		WH elements = iterator.next();

			updateCnt =  whService.updateWH(elements);
		}
		
		return updateCnt;
	}
  
    
    
    //특정 데이터로 구역(area) 데이터 조회하기
  	
   
    
  //품목등록(제품) 관리자용 삭제(delete)
  	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH} , value = "/warehouse/deleteWH" ,consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
  	public ResponseEntity<String> deleteWH(@RequestBody WH wh) throws Exception {
  		return whService.deleteWH(wh) == 1
  				? new ResponseEntity<String> ("success", HttpStatus.OK) :
                                 new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
  	}
    
    
    
}
