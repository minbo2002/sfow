package com.yeonoo.masterdata.wh.controller;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.masterdata.wh.domain.WH;
import com.yeonoo.masterdata.wh.service.WhService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class Wh_Controller {
	
	@Autowired
	WhService whService;
	
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
	    //update WH
	    @PostMapping("/warehouse/updateWH")
	    public ModelAndView updateWHform(@RequestParam("warehouse_code") WH wh, ModelAndView mv) throws Exception {
	    	
	    	int cnt =whService.updateWHform(wh);
	    		mv.setViewName("redirect:/warehouse/whinfo");
	    	return  mv;
	    }
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
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    /*
	    //인서트 WH
	    @GetMapping("/warehoues/insertwh")
	    public String insertwhService(@ModelAttribute WH wh,HttpServletRequest request,Model model) throws Exception {
			
	    	whService.insertwhService(wh);
	    	
	    	model.addAttribute("wh",wh);
	    	
	    	return "redirect:/warehouse/whinfo";
	    	
	    }
	    */

	
	
}
