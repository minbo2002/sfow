package com.yeonoo.pp.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.yeonoo.pp.domain.Item;

@Repository
public class ProductRepositoryImpl implements ProductRepository{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Item> getItemList(int company_code) throws DataAccessException {
		List<Item> list = sqlSession.selectList("mapper.pp.getItemList", company_code);
		return list;
	}
	
	@Override
	public List<Item> getBomTree(String ppitem_cd) throws DataAccessException {
		List<Item> list = sqlSession.selectList("mapper.pp.getBomTree", ppitem_cd);
		return list;
	}
	
	@Override
	public Item selectItem(String ppitem_cd) throws DataAccessException {
		String item_code = ppitem_cd;
		Item item = sqlSession.selectOne("mapper.pp.selectItem", item_code);
		return item;
	}
}
