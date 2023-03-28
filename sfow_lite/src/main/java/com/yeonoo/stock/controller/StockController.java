package com.yeonoo.stock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	

//    @RequestMapping(value="/stockSearch", method=RequestMethod.POST )
//    public String search(Model model) {
//
//        List<Stock> results = stockService.search();
//        
//        System.out.println("Controller results"+results);
//        model.addAttribute("results", results);
//
//        
//        return "stock/stockWhDetail";
//        //return "stock/main";
//    }//search() 끝

	@ResponseBody
	@RequestMapping(value="/search", method=RequestMethod.POST )
	public  List<Stock> search(Model model) {

      List<Stock> results = stockService.search();
      
      System.out.println("Controller results"+results);
      //model.addAttribute("results", results);

      return results;
      //return "stock/main";
  }//search() 끝

  
  @ResponseBody
  @RequestMapping(value="/updateStock", method=RequestMethod.PATCH)
  public void updateStock(Model model, @RequestBody Stock data) {
  	System.out.println(data);
  	stockService.updateStock(data);
  	  //return a;
	  //return "";
  }

    
    
}//stockController
	
	

