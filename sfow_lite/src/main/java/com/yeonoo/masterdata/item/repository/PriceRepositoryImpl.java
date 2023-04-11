package com.yeonoo.masterdata.item.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.masterdata.item.domain.ItemProduct;
import com.yeonoo.masterdata.item.domain.PriceDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PriceRepositoryImpl implements PriceRepository{


		@Autowired
		private SqlSession sqlSession;
		
		// 전체 반제품 조회
		@Override
		@ResponseBody
		public List<PriceDTO> priceList(PriceDTO dto) {
			System.out.println("이건 priceListDTO if문 전"+dto);
			if (	dto.getItemCategory()==null
					&&dto.getItemCode()==null
					&&dto.getItemName()==null
					&&dto.getItemNo()==null
					&&dto.getItemSpecification()==null
					&&dto.getClientCode()==null
					&&dto.getClientName()==null
					&&dto.getUseyn()==null) {
				
				List<PriceDTO> allList = sqlSession.selectList("price.priceList");
				return allList;
			}else
			{
				List<PriceDTO> List = sqlSession.selectList("price.priceListSearch", dto);
				return List;
			}
				
		}

		//거래처명 목록
		public List<PriceDTO> companycodeSelectAjax() throws DataAccessException {
			List<PriceDTO> companycodelist = sqlSession.selectList("price.companycodeList");
			return companycodelist;
		}
		//아이템코드 목록
		public List<PriceDTO> itemcodeSelectAjax() throws DataAccessException{
			List<PriceDTO> itemcodelist = sqlSession.selectList("price.itemcodeList");
			return itemcodelist;
		}
}
