package com.yeonoo.masterdata.item.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.masterdata.item.domain.SemiDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class SemiRepositoryImpl implements SemiRepository{


		@Autowired
		private SqlSession sqlSession;
		
		// 전체 반제품 조회
		@Override
		@ResponseBody
		public List<SemiDTO> semiList(SemiDTO dto) {
			if (	dto.getItemCode()==null
					&&dto.getItemName()==null
					&&dto.getItemNo()==null) {
				
				List<SemiDTO> allList = sqlSession.selectList("semi.semiList");
				return allList;
			}else
			{
				List<SemiDTO> List = sqlSession.selectList("semi.semiListSearch", dto);
				return List;
			}
				
		}

		
		// 반제품 등록
		@Override
		public int insertSemi(SemiDTO elements) {
			 
			return sqlSession.insert("semi.insertSemi", elements);
		}


		// 반제품 정보 수정
		@Override
		public int updateSemi(SemiDTO elements) {
		
			int cnt = sqlSession.update("semi.updateSemi", elements);
			return cnt;
		}

		// 반제품 품목 삭제(상태업데이트)
		@Override
		public int deleteSemi(String itemCode) {
			
			return sqlSession.update("semi.useUpdate", itemCode);
		}

		// 거래처 모달 데이터처리
		@Override
		public List<Map<String, Object>> getModalClient() {
			
			return sqlSession.selectList("semi.getModalClient");
		}



}
