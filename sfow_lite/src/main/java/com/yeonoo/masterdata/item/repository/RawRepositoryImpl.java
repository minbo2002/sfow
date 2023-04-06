package com.yeonoo.masterdata.item.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yeonoo.masterdata.item.domain.RawDTO;

@Repository
public class RawRepositoryImpl implements RawRepository{


		@Autowired
		private SqlSession sqlSession;
		
		// 전체 반제품 조회
		@Override
		public List<RawDTO> rawList() {
			
			return sqlSession.selectList("raw.rawList");
		}

		// 반제품 등록
		@Override
		public int insertRaw(RawDTO dto) {
			
			return sqlSession.insert("raw.insertRaw", dto);
		}


		// 반제품 정보 수정
		@Override
		public int updateRaw(RawDTO dto) {
		
			int cnt = sqlSession.update("raw.updateRaw", dto);
			return cnt;
		}

		// 반제품 품목 삭제
		@Override
		public void deleteRaw(String itemCode) {
			
			sqlSession.delete("raw.deleteRaw", itemCode);
		}





}
