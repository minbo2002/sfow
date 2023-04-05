package com.yeonoo.masterdata.item.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.yeonoo.masterdata.item.domain.BomItem;

@Repository
public class BomRepositoryImpl implements BomRepository {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BomItem> getItemList(int company_code) throws DataAccessException {
		List<BomItem> list = sqlSession.selectList("mapper.bom.getItemList", company_code);
		return list;
	}
	
	@Override
	public List<BomItem> getBomTree(String ppitem_cd) throws DataAccessException {
		List<BomItem> list = sqlSession.selectList("mapper.bom.getBomTree", ppitem_cd);
		return list;
	}
	
	@Override
	public BomItem selectItem(String ppitem_cd) throws DataAccessException {
		String item_code = ppitem_cd;
		BomItem item = sqlSession.selectOne("mapper.bom.selectItem", item_code);
		return item;
	}
	
	@Override
	public List<BomItem> getItemListByName(String item_name) throws DataAccessException {
		List<BomItem> list = sqlSession.selectList("mapper.bom.getItemListByName", item_name);
		return list;
	}
	
	@Override
	public void updateTree(String ppitem_cd, BomItem bomItem) throws DataAccessException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ppitem_cd", ppitem_cd);
		map.put("bomItem", bomItem);
		sqlSession.update("mapper.bom.updateTree", map);
	}
	
	@Override
	public void insertTree(String ppitem_cd, BomItem bomItem) throws DataAccessException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ppitem_cd", ppitem_cd);
		map.put("bomItem", bomItem);
		sqlSession.insert("mapper.bom.insertTree", map);
	}
}
