package com.yeonoo.sfow.basicinfo.repository;

import java.util.List;

import com.yeonoo.sfow.basicinfo.domain.UserInfo;

public interface UserInfoRepository{
	
	public UserInfo userInfoSelect(int no) throws Exception;
	
	//로그인
	public UserInfo userValidate(UserInfo userInfo) throws Exception;
	
	//일반 계정 수정
	public UserInfo userInfoUpdate(UserInfo userInfo) throws Exception;
	
	//관리자 계정 수정
	public UserInfo mainUserInfoUpdate(UserInfo userInfo) throws Exception;
	
	public List<UserInfo> userInfoSelectAll(int companyCode) throws Exception;
	
	//사용자 계정관리 - 수정
	public int userListUpdate(UserInfo userInfo) throws Exception;
	
	public int newUserInsert(UserInfo newUserInfo) throws Exception;
	
	public int deleteUser(String id) throws Exception;

}
