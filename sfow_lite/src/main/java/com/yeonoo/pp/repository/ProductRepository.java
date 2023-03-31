package com.yeonoo.pp.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.yeonoo.pp.domain.Item;

public interface ProductRepository {

	public List<Item> getItemList(int company_code) throws DataAccessException;

	public List<Item> getBomTree(String ppitem_cd) throws DataAccessException;

	public Item selectItem(String ppitem_cd) throws DataAccessException;

}
