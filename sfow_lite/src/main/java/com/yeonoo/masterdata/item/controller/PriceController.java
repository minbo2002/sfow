package com.yeonoo.masterdata.item.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.masterdata.item.domain.ItemProduct;
import com.yeonoo.masterdata.item.domain.PriceDTO;
import com.yeonoo.masterdata.item.service.PriceService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/price")
@Controller
@RequiredArgsConstructor
public class PriceController {


	@Autowired
	PriceService priceService;
	private final Logger logger = LoggerFactory.getLogger(PriceController.class);
	
	// 전체 조회 page mapping
	@RequestMapping("/list") //get
	public String allList() {
		return "price/gridPriceList";
	}
	
	@ResponseBody
	@RequestMapping(value="toastPriceDataList", method= {RequestMethod.POST, RequestMethod.GET}) 
 	public List<PriceDTO> toastDataList(PriceDTO dto) {
		List<PriceDTO> list = priceService.priceList(dto);
		
		return list;
	}
	//거래처명 목록
	@ResponseBody
	@RequestMapping(value="companycodeSelectAjax", method= {RequestMethod.GET})
	public List<PriceDTO> companycodeSelectAjax() throws Exception {
		List<PriceDTO> result = priceService.companycodeSelectAjax();
		return result;
	}
	@RequestMapping("companyCodeSelect")
    public String selectCompanyCode() throws Exception {
        return "price/gridPriceList"; // 처리 결과에 해당하는 뷰 이름 반환
    }
	//아이템코드 목록
	@ResponseBody
	@RequestMapping(value="itemcodeSelectAjax")
	public List<PriceDTO> itemcodeSelectAjax() throws Exception {
		List<PriceDTO> result = priceService.itemcodeSelectAjax();
			return result;
	}
	// 등록
	
			
		  
}
