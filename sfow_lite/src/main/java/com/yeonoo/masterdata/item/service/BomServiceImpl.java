package com.yeonoo.masterdata.item.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.yeonoo.masterdata.item.domain.BomItem;
import com.yeonoo.masterdata.item.repository.BomRepository;

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
}
