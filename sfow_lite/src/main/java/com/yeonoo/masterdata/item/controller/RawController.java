package com.yeonoo.masterdata.item.controller;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.masterdata.item.domain.RawDTO;
import com.yeonoo.masterdata.item.domain.SemiDTO;
import com.yeonoo.masterdata.item.service.RawService;

@RequestMapping("/raw")
@Controller
public class RawController {


	@Autowired
	RawService rawService;

	// 원제품 리스트 ( 그리드버젼, 수정까지 완료 후 매핑 수정 및 테이블버젼 삭제 예정) 전체 조회
	@RequestMapping("/list") //get
	public String allList() {
		return "item/gridRawList";
	}
	
	@ResponseBody
	@RequestMapping(value="toastRawDataList",method={RequestMethod.POST, RequestMethod.GET}) 
 	public List<RawDTO> toastDataList(RawDTO dto) {
		List<RawDTO> list = rawService.rawList(dto);
		
		return list;
	}


	// 반제품 정보 수정
		    
		  //수정하기
		     @ResponseBody
		     @RequestMapping(value="/updateRaw", method=RequestMethod.PUT)
		     public void update(@RequestBody RawDTO dto) throws Exception {
		        rawService.updateRaw(dto);

		     }	    
		  // 삭제하기(useyn 상태 변경)
		     @ResponseBody
		     @RequestMapping(value="useUpdate", method=RequestMethod.POST)
		     public List<RawDTO> useUpdate(@RequestBody List<RawDTO> dto) {

		    	 Iterator<RawDTO> iterator = dto.iterator();
		    	 while(iterator.hasNext()) {
		    		 RawDTO elements= iterator.next();
		    		 rawService.deleteRaw(elements.getItemCode());
		    	 }
		    	 
		        System.out.println("dto = " + dto);
		        return dto;
		     }
		     
		  // 등록
		     @ResponseBody
		     @RequestMapping(value="insertRaw", method=RequestMethod.POST)
		     public List<RawDTO> insertRaw(@RequestBody List<RawDTO> dto) {


		        Iterator<RawDTO> iterator = dto.iterator();
		        while(iterator.hasNext()) {
		        	RawDTO elements = iterator.next();
		           
		           int insertCnt = rawService.insertRaw(elements);
		        }
		        
		        return dto;
		     }
		     
	

}
