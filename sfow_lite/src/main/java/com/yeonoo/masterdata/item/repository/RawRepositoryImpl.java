package com.yeonoo.masterdata.item.repository;

import java.util.List;

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





}
