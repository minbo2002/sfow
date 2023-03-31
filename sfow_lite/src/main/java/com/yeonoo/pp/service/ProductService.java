package com.yeonoo.pp.service;

import java.util.List;

import com.yeonoo.pp.domain.Item;

public interface ProductService {
	
	public List<Item> getItemList(int company_code) throws Exception;

	public List<Item> getBomTree(String ppitem_cd) throws Exception;

	public Item selectItem(String ppitem_cd) throws Exception;

}
