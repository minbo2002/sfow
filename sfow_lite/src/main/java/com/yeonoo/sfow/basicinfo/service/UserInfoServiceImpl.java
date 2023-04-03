package com.yeonoo.sfow.basicinfo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.yeonoo.sfow.basicinfo.domain.UserInfo;
import com.yeonoo.sfow.basicinfo.repository.UserInfoRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor

public class UserInfoServiceImpl implements UserInfoService{

	private final UserInfoRepository userInfoRepository; 

	/*
	 * // @Override // public UserInfo userInfoList(int no) throws Exception { //
	 * return userInfoRepository.userInfoSelect(no); // }
	 */
	
	
	@Override
	public UserInfo userLogin(UserInfo userInfo) throws Exception {
		return userInfoRepository.userValidate(userInfo);
	}

	@Override
	public UserInfo userInfoModify(UserInfo userInfo) throws Exception {
		return userInfoRepository.userInfoUpdate(userInfo);
	}
	
	@Override
	public UserInfo mainUserModify(UserInfo userInfo) throws Exception {
		return userInfoRepository.mainUserInfoUpdate(userInfo);
	}

	@Override
	public List<UserInfo> userListAll(String companyCode) throws Exception {
		return userInfoRepository.userInfoSelectAll(companyCode);
	}

	@Override
	public int userListModify(UserInfo userInfo) throws Exception {
		return userInfoRepository.userListUpdate(userInfo);
	}

	@Override
	public int newUserAdd(UserInfo newUserInfo) throws Exception {
		return userInfoRepository.newUserInsert(newUserInfo);
	}

	@Override
	public int removeUser(String deleteId) throws Exception {
		return userInfoRepository.deleteUser(deleteId);
	}

}
