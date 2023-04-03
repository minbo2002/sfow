package com.yeonoo.masterdata.item.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;

import com.yeonoo.masterdata.item.domain.BomItem;

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
}
