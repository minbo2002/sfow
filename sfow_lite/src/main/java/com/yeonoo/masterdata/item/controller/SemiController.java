package com.yeonoo.masterdata.item.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.masterdata.item.domain.SemiDTO;
import com.yeonoo.masterdata.item.service.SemiService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/semi")
@Controller
@RequiredArgsConstructor
public class SemiController {


	@Autowired
	SemiService semiService;
	private final Logger logger = LoggerFactory.getLogger(SemiController.class);
	
	// modal form
	@RequestMapping("/modalList") //get
	public String modalList() {
		return "item/modalList";
	}
	
// modal data process
	
// modal Item값 조회
   @RequestMapping(value="getModalClient")
   @ResponseBody
   public List<Map<String, Object>> getModalClient() {
      
      List<Map<String, Object>> result = semiService.getModalClient();
      logger.info("1) modalItem = " + result);
      
      return result;
   }
	
	
	// 전체 조회 page mapping
	@RequestMapping("/list") //get
	public String allList() {
		return "item/gridSemiList";
	}
	
	@ResponseBody
	@RequestMapping(value="toastSemiDataList", method= {RequestMethod.POST, RequestMethod.GET}) 
 	public List<SemiDTO> toastDataList(SemiDTO dto) {
		List<SemiDTO> list = semiService.semiList(dto);
		
		return list;
	}


			// 반제품 정보 수정
		    
		  //수정하기
		    @ResponseBody
		    @RequestMapping(value="updateSemi", method=RequestMethod.POST)
		    public List<SemiDTO> updateSemi(@RequestBody List<SemiDTO> dto) {
		
		
		       Iterator<SemiDTO> iterator = dto.iterator();
		       		while(iterator.hasNext()) {
		       	SemiDTO elements = iterator.next();
		          
		          int insertCnt = semiService.updateSemi(elements);
		       }
		       
		       return dto;
		    }
		     
		  // 삭제하기(useyn 상태 변경)
		     @ResponseBody
		     @RequestMapping(value="useUpdate", method=RequestMethod.POST)
		     public List<SemiDTO> useUpdate(@RequestBody List<SemiDTO> dto) {

		    	 Iterator<SemiDTO> iterator = dto.iterator();
		    	 
		    	 while(iterator.hasNext()) {
		    		 SemiDTO elements= iterator.next();
		    		 semiService.deleteSemi(elements.getItemCode());
		    	 }
		    	 
		    	 return dto;
		     }

		     
		  // 등록
		     @ResponseBody
		     @RequestMapping(value="insertSemi", method=RequestMethod.POST)
		     public List<SemiDTO> insertSemi(@RequestBody List<SemiDTO> dto) {


		        Iterator<SemiDTO> iterator = dto.iterator();
		        while(iterator.hasNext()) {
		        	SemiDTO elements = iterator.next();
		           
		           int insertCnt = semiService.insertSemi(elements);
		        }
		        
		        return dto;
		     }
		  
}
