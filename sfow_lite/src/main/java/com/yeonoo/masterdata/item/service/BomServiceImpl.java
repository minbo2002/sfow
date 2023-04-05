package com.yeonoo.masterdata.item.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeonoo.masterdata.item.domain.BomItem;
import com.yeonoo.masterdata.item.repository.BomRepository;

@Service
public class BomServiceImpl implements BomService{

	@Autowired
	BomRepository bomRepository;
	
	@Override
	public List<BomItem> getItemList(int company_code) throws Exception {
		return bomRepository.getItemList(company_code);
	}
	
	@Override
	public List<BomItem> getBomTree(String ppitem_cd) throws Exception {
		return bomRepository.getBomTree(ppitem_cd);
	}
	
	@Override
	public BomItem selectItem(String ppitem_cd) throws Exception {
		return bomRepository.selectItem(ppitem_cd);
	}
	
	@Override
	public List<BomItem> getItemListByName(String item_name) throws Exception {
		return bomRepository.getItemListByName(item_name);
	}
	
	@Override
	public void updateTree(String ppitem_cd, BomItem bomItem) throws Exception {
		bomRepository.updateTree(ppitem_cd, bomItem);
	}
	
	@Override
	public void insertTree(String ppitem_cd, BomItem bomItem) throws Exception {
		bomRepository.insertTree(ppitem_cd, bomItem);
	}
}
