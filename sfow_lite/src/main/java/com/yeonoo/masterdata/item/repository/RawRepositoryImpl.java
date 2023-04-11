package com.yeonoo.masterdata.item.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.masterdata.item.domain.RawDTO;

@Repository
public class RawRepositoryImpl implements RawRepository{


		@Autowired
		private SqlSession sqlSession;
		
		// 전체 원자재 조회
		@Override
		@ResponseBody
		public List<RawDTO> rawList(RawDTO dto) {
			
			List<RawDTO> List = sqlSession.selectList("raw.rawListSearch",dto);
			return List;
		}

		// 반제품 등록
		@Override
		public int insertRaw(RawDTO elements) {
			
			return sqlSession.insert("raw.insertRaw", elements);
		}


		// 반제품 정보 수정
		@Override
		public int updateRaw(RawDTO dto) {
		
			int cnt = sqlSession.update("raw.updateRaw", dto);
			return cnt;
		}

		// 반제품 품목 삭제
		@Override
		public int deleteRaw(String itemCode) {
			
			return sqlSession.update("raw.useUpdate", itemCode);
		}
		
		// -------- Modal ---------------------
		
		// 거래처 모달 데이터처리
		@Override
		public List<Map<String, Object>> getModalClient() {
			
			return sqlSession.selectList("raw.getModalClient");
		}

		// 유형 모달 데이터처리
		@Override
		public List<Map<String, Object>> getModalType() {
			
			return sqlSession.selectList("raw.getModalType");
		}
		
		// 규격 모달 데이터처리
		@Override
		public List<Map<String, Object>> getModalSpecification() {
			
			return sqlSession.selectList("raw.getModalSpecification");
		}
		
		// 재고단위 모달 데이터처리
		@Override
		public List<Map<String, Object>> getModalStockUnit() {
			
			return sqlSession.selectList("raw.getModalStockUnit");
		}		


}
