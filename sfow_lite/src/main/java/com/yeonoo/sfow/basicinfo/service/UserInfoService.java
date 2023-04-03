package com.yeonoo.sfow.basicinfo.service;

import java.util.List;

import com.yeonoo.sfow.basicinfo.domain.UserInfo;


public interface UserInfoService {
	
	//public UserInfo userInfoList(int no)  throws Exception;
	
	//로그인
	public UserInfo userLogin(UserInfo userInfo) throws Exception;
	
	//일반 계정 수정
	public UserInfo userInfoModify(UserInfo userInfo) throws Exception;
	
	//관리자 계정 수정
	public UserInfo mainUserModify(UserInfo userInfo) throws Exception;
	
	//사용자 목록 
	public List<UserInfo> userListAll(String companyCode) throws Exception;
	
	//일반 사용자 계정관리
	public int userListModify(UserInfo userInfo) throws Exception;
	
	//계정 생성(그리드)
	public int newUserAdd(UserInfo newUserInfo) throws Exception;
	
	//계정 삭제(그리드)
	public int removeUser(String deleteId) throws Exception;
	
}
