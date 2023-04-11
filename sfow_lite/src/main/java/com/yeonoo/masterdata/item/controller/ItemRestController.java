package com.yeonoo.masterdata.item.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.yeonoo.masterdata.item.domain.CompanyCode;
import com.yeonoo.masterdata.item.domain.ItemProduct;
import com.yeonoo.masterdata.item.domain.ItemSpecification;
import com.yeonoo.masterdata.item.domain.ItemStockUnit;
import com.yeonoo.masterdata.item.domain.ItemType;
import com.yeonoo.masterdata.item.service.ItemService;

@RestController
public class ItemRestController {
	
	@Autowired
	private ItemService itemService;
	
	//품목유형등록 목록
	@RequestMapping(value="/item/typeAjax")
	public List<ItemType> getItemTypeListAjax() throws Exception {
		List<ItemType> result = itemService.getItemTypeList();
		return result;
	}
	//품목유형등록 등록
	@RequestMapping(method = {RequestMethod.POST} ,value="/item/typeInsertAjax",consumes="application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertItemType(@RequestBody ItemType itemtype) throws Exception {
		return itemService.insertItemType(itemtype) == 1
				? new ResponseEntity<String> ("success", HttpStatus.OK) :
                    new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//품목유형등록 삭제
	@RequestMapping(method = {RequestMethod.DELETE} , value = "/item/typeDeleteAjax")
	public ResponseEntity<String> deleteItemType(@RequestBody ItemType itemtype) throws Exception {
		return itemService.deleteItemType(itemtype) == 1
				? new ResponseEntity<String> ("success", HttpStatus.OK) :
	                new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//품목유형등록 검색
	@RequestMapping(method = {RequestMethod.POST}, value="/item/typeSearchAjax", consumes="application/json")
	public List<ItemType> getItemTypeListSearchAjax(@RequestBody ItemType itemtype) throws Exception {
		List<ItemType> result = itemService.getItemTypeSearchList(itemtype);
		return result;
	}
	//품목등록(제품) 목록
	@RequestMapping(value="/item/productListAjax")
	public List<ItemProduct> productListAjax() throws Exception {
		List<ItemProduct> result = itemService.productList();
		return result;
	}
	//품목등록(제품) 등록
	@RequestMapping(method = {RequestMethod.POST} ,value="/item/productInsertAjax",consumes="application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertProduct(@RequestBody ItemProduct itemproduct) throws Exception {
		return itemService.insertProduct(itemproduct) == 1
				? new ResponseEntity<String> ("success", HttpStatus.OK) :
	                 new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	//품목등록(제품) 수정
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value= "/item/productUpdateAjax", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> updateProduct(@RequestBody ItemProduct itemproduct) throws Exception {
			return itemService.updateProduct(itemproduct) == 1 
                    ? new ResponseEntity<String> ("success", HttpStatus.OK)
                            : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//품목등록(제품) 삭제(수정)
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH} , value = "/item/productDeleteAjax" ,consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteProduct(@RequestBody ItemProduct itemproduct) throws Exception {
		return itemService.deleteProduct(itemproduct) == 1
				? new ResponseEntity<String> ("success", HttpStatus.OK) :
                               new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//품목등록(제품) 검색
	@RequestMapping(method = {RequestMethod.POST}, value="/item/productSearchAjax", consumes="application/json")
	public List<ItemProduct> getItemProductListSearchAjax(@RequestBody ItemProduct itemproduct) throws Exception {
		List<ItemProduct> result = itemService.getItemProductListSearchAjax(itemproduct);
		return result;
	}
	//품목유형등록(제품) 목록
	@RequestMapping(value="/item/typeSelectAjax")
	public List<ItemType> selectItemTypeListAjax() throws Exception {
		List<ItemType> result = itemService.selectItemTypeList();
		return result;
	}
	//재고단위 목록
	@RequestMapping(value="/item/stockunitListAjax")
	public List<ItemStockUnit> stockunitListAjax() throws Exception {
		List<ItemStockUnit> result = itemService.stockunitListAjax();
		return result;
	}
	//재고단위 등록
	@RequestMapping(method = {RequestMethod.POST} ,value="/item/StockUnitInsertAjax",consumes="application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> StockUnitInsertAjax(@RequestBody ItemStockUnit itemstockunit) throws Exception {
		return itemService.StockUnitInsert(itemstockunit) == 1
				? new ResponseEntity<String> ("success", HttpStatus.OK) :
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//재고단위 삭제
	@RequestMapping(method = {RequestMethod.DELETE} , value = "/item/stockUnitDeleteAjax")
	public ResponseEntity<String> stockUnitDeleteAjax(@RequestBody ItemStockUnit itemstockunit) throws Exception {
		return itemService.deleteStockUnit(itemstockunit) == 1
				? new ResponseEntity<String> ("success", HttpStatus.OK) :
	                new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//재고단위 검색
	@RequestMapping(method = {RequestMethod.POST}, value="/item/stockunitSearchAjax", consumes="application/json")
	public List<ItemStockUnit> stockunitSearchAjax(@RequestBody ItemStockUnit itemstockunit) throws Exception {
		List<ItemStockUnit> result = itemService.stockunitSearchAjax(itemstockunit);
		return result;
	}
	//규격 목록
	@RequestMapping(value="/item/specificationListAjax")
	public List<ItemSpecification> specificationListAjax() throws Exception {
		List<ItemSpecification> result = itemService.specificationListAjax();
		return result;
	}
	//규격 등록
	@RequestMapping(method = {RequestMethod.POST} ,value="/item/specificationInsert",consumes="application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> specificationInsert(@RequestBody ItemSpecification itemspecification) throws Exception {
		return itemService.specificationInsert(itemspecification) == 1
				? new ResponseEntity<String> ("success", HttpStatus.OK) :
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//규격 삭제
	@RequestMapping(method = {RequestMethod.DELETE} , value = "/item/specificationDeleteAjax")
	public ResponseEntity<String> specificationDeleteAjax(@RequestBody ItemSpecification itemspecification) throws Exception {
		return itemService.deleteSpecification(itemspecification) == 1
				? new ResponseEntity<String> ("success", HttpStatus.OK) :
	                new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//규격 검색
	@RequestMapping(method = {RequestMethod.POST}, value="/item/specificationSearchAjax", consumes="application/json")
	public List<ItemSpecification> specificationSearchAjax(@RequestBody ItemSpecification itemspecification) throws Exception {
		List<ItemSpecification> result = itemService.specificationSearchAjax(itemspecification);
		return result;
	}
	//품목유형등록(제품) 목록
	@RequestMapping(method = {RequestMethod.POST}, value="/item/typeSelectSearchAjax", consumes="application/json")
	public List<ItemType> typeSelectSearchAjax(@RequestBody ItemType itemtype) throws Exception {
		List<ItemType> result = itemService.typeSelectSearchAjax(itemtype);
		return result;
	}
	//아이템코드 목록
	@RequestMapping(value="/item/itemcodeSelectAjax")
	public List<ItemProduct> itemcodeSelectAjax() throws Exception {
		List<ItemProduct> result = itemService.itemcodeSelectAjax();
		return result;
	}
	//거래처명 목록
	@RequestMapping(value="/item/companycodeSelectAjax")
	public List<CompanyCode> companycodeSelectAjax() throws Exception {
		List<CompanyCode> result = itemService.companycodeSelectAjax();
		return result;
	}
}
