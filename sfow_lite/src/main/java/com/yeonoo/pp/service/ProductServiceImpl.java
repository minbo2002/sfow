package com.yeonoo.pp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeonoo.pp.domain.Item;
import com.yeonoo.pp.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductRepository productRepository;
	
	@Override
	public List<Item> getItemList(int company_code) throws Exception {
		return productRepository.getItemList(company_code);
	}
	
	@Override
	public List<Item> getBomTree(String ppitem_cd) throws Exception {
		return productRepository.getBomTree(ppitem_cd);
	}
	
	@Override
	public Item selectItem(String ppitem_cd) throws Exception {
		return productRepository.selectItem(ppitem_cd);
	}

}
