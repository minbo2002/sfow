package com.yeonoo.masterdata.item.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.masterdata.item.domain.RawDTO;
import com.yeonoo.masterdata.item.service.RawService;

@RequestMapping("raw")
@Controller
public class RawController {


	@Autowired
	RawService rawService;

	// 원제품 리스트 ( 그리드버젼, 수정까지 완료 후 매핑 수정 및 테이블버젼 삭제 예정) 전체 조회
	@RequestMapping("/list") //get
	public String test() {
		return "gridRawList";
	}
	
	@ResponseBody
	@RequestMapping("toastRawDataList") 
 	public List toastDataList() {
		List<RawDTO> list = rawService.rawList();
		
		return list;
	}


	// 반제품 정보 수정
		    
		  //수정하기
		     @ResponseBody
		     @RequestMapping(value="/updateRaw", method=RequestMethod.PUT)
		     public void update(@RequestBody RawDTO dto) throws Exception {
		        rawService.updateRaw(dto);

		     }	    
		     
		  // 민보님의 컨트롤러
		     @ResponseBody
		     @RequestMapping(value="useUpdate", method=RequestMethod.POST)
		     public void useUpdate(@RequestBody List<RawDTO> dto) {

		        System.out.println("dto = " + dto);
		     }
	

}
