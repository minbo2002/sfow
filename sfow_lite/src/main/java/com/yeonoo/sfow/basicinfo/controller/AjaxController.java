package com.yeonoo.sfow.basicinfo.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yeonoo.sfow.basicinfo.domain.UserInfo;
import com.yeonoo.sfow.basicinfo.service.UserInfoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@Controller
@RequiredArgsConstructor
public class AjaxController {
	
	private final UserInfoService userInfoService;
	
	
	
	
	//회원정보 수정
	@PostMapping("/updateUserAjax")
	@Transactional(rollbackFor = Exception.class)
	public @ResponseBody String updateUser(UserInfo userInfo) throws Exception {
		
		
		UserInfo generalUserInfo = userInfoService.userInfoModify(userInfo);
		
		UserInfo mainUserInfo = userInfoService.mainUserModify(userInfo);
		if(generalUserInfo!=null || mainUserInfo!=null) {
			return "1";
		} else {
			return "2";
		}
		
	}
	
	@RequestMapping("/userManagementAjax")
	public List<UserInfo> userManagementAjax(String companyCode) throws Exception {
		List<UserInfo> userInfoList =userInfoService.userListAll(companyCode);
		return userInfoList;
	}
	
	
	//계정 정보 수정
	@RequestMapping(value = "/userListUpdate")
	public int userListUpdate(@RequestBody UserInfo updatedData) throws Exception {
		System.out.println("userListUpdate==========="+updatedData);
	    int result = userInfoService.userListModify(updatedData);

	    return result;
	}
	
	//새로운 유저 생성
	@RequestMapping("/newUserAjax")
	public String newUserAdd(@RequestBody UserInfo newUserData) throws Exception {
		System.out.println("updatedData======="+newUserData);
		int result=userInfoService.newUserAdd(newUserData);
		
		return "1";
	}

	
	//계정 삭제
	@RequestMapping("/deleteUserAjax")
	public String deleteUserAjax(@RequestBody String updateKey) throws Exception {
		System.out.println("ids========"+updateKey);
		String deleteId = updateKey;
		if (deleteId.startsWith("\"") && deleteId.endsWith("\"")) {
			deleteId = deleteId.substring(1, deleteId.length() - 1);
		}
		int result = userInfoService.removeUser(deleteId);
		
	    return "1";
	}
	
	
	
	

	}
