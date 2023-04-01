package com.yeonoo.sfow.basicinfo.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yeonoo.sfow.basicinfo.domain.UserInfo;

import lombok.RequiredArgsConstructor;


@Repository
@RequiredArgsConstructor
public class UserInfoRepositoryImpl implements UserInfoRepository{

	private final SqlSession sqlSession;
	
	//사용자 정보 확인
	@Override
	public UserInfo userInfoSelect(int no) throws Exception {
		UserInfo userInfo=sqlSession.selectOne("userInfoSelect",no);
		return userInfo;
	}

	//로그인 검사
	@Override
	public UserInfo userValidate(UserInfo userInfo) throws Exception {
		System.out.println(userInfo);
		UserInfo loginUser=sqlSession.selectOne("userLogin",userInfo);
		
		System.out.println("loginUser======"+loginUser);
		return loginUser;
	}

	//사용자 정보 변경
	@Override
	public UserInfo userInfoUpdate(UserInfo userInfo) throws Exception {
		int result = sqlSession.update("updateUserInfo",userInfo);
		if(result==1) {
		String id = userInfo.getId();
		
		System.out.println("generalid========"+id);
		
		UserInfo generalUserInfo = sqlSession.selectOne("generalUserInfo", id);
		return generalUserInfo;
		} else {
			return null;
		}
	}
	
	//메인 관리자 정보 수정
	@Override
	public UserInfo mainUserInfoUpdate(UserInfo userInfo) throws Exception {
		int result = sqlSession.update("mainUserInfoUpdate",userInfo);
		if(result==1) {
			String id = userInfo.getId();
			
			System.out.println("mainid========"+id);
			
			UserInfo mainUserInfo = sqlSession.selectOne("mainUserInfo", id);
			return mainUserInfo;
		} else {
			return null;
		}
	}

	//사용자 목록 조회
	@Override
	public List<UserInfo> userInfoSelectAll(int companyCode) throws Exception {
		List<UserInfo> userInfoList =sqlSession.selectList("userInfoSelectAll",companyCode);
		return userInfoList;
	}

	//사용자 계정 관리 - 수정
	@Override
	public int userListUpdate(UserInfo userInfo) throws Exception {
		int result=sqlSession.update("userListUpdate",userInfo);
		return result;
	}
	
	//그리드 행 추가
	@Override
	public int newUserInsert(UserInfo newUserInfo) throws Exception {
		int result=sqlSession.insert("newUserAdd",newUserInfo);
		return result;
	}
	
	//그리드 행 삭제
	@Override
	public int deleteUser(String id) throws Exception {
			int result=sqlSession.delete("deleteUser",id);
		return result;
	}

	
	
}
