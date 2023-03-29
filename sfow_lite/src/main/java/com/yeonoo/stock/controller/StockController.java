package com.yeonoo.stock.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.stock.domain.Stock;
import com.yeonoo.stock.service.StockServiceImpl;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StockController {
	
	private final StockServiceImpl stockService;
	
    
    @RequestMapping(value="/stockSearch", method=RequestMethod.GET)
    public String stockSearch() {
    	
    	//return "stock/stockSearch";
    	return "stock/stockWhDetail";
    }//stockSearch() 끝 

	@ResponseBody
	@RequestMapping(value="/searchAllStock", method=RequestMethod.POST )
	public  List<Stock> search(Model model) throws Exception {

      List<Stock> results = stockService.searchAll();
      
      System.out.println("Controller results"+results);
      //model.addAttribute("results", results);

      return results;
      //return "stock/stockWhDetail";
      //return "stock/main";
  }//search() 끝

  
  @ResponseBody
  @RequestMapping(value="/updateStock", method=RequestMethod.PATCH)
  public void updateStock(Model model, @RequestBody Stock data) throws Exception {
  	System.out.println(data);
  	stockService.updateStock(data);
  	  //return a;
	  //return "";
  }
  
  @ResponseBody
  @RequestMapping(value="/searchWhStock", method=RequestMethod.POST)
  public List<Stock> searchWhStock(Model model, Stock data) throws Exception {
//  public List<Stock> searchWhStock(Model model, 
//		  								@RequestParam String warehouse_code,
//		  								@RequestParam String warehouse_name,
//		  								@RequestParam String lot_no,
//		  								@RequestParam String item_type,
//		  								@RequestParam String item_code,
//		  								@RequestParam String item_name) throws Exception {
//	  Stock data = new Stock();
//	  data.setWarehouse_name(warehouse_name);
//	  data.setWarehouse_code(warehouse_code);
//	  data.setLot_no(lot_no);
//	  data.setItem_code(item_code);
//	  data.setItem_name(item_name);
//	  data.setItem_type(item_type);
//	  System.out.println("data값"+data);
	  List<Stock> results = stockService.searchWhStock(data);
	  
	  System.out.println("컨트롤러 리저트 값"+results);
	  
	  return results;
  }

    
    
}//stockController
	
	

