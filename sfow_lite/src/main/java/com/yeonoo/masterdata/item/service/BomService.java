package com.yeonoo.masterdata.item.service;

import java.util.List;

import com.yeonoo.masterdata.item.domain.BomItem;

public interface BomService {

	public List<BomItem> getItemList(int company_code) throws Exception;

	public List<BomItem> getBomTree(String ppitem_cd) throws Exception;

	public BomItem selectItem(String ppitem_cd) throws Exception;
}
