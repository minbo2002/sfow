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
	public List<UserInfo> userManagementAjax(int companyCode) throws Exception {
		List<UserInfo> userInfoList =userInfoService.userListAll(companyCode);
		return userInfoList;
	}
	
	
	@RequestMapping(value = "/userListUpdate")
	public int userListUpdate(@RequestBody UserInfo updatedData) throws Exception {

	    int result = userInfoService.userListModify(updatedData);

	    return result;
	}
	
	@RequestMapping("/newUserAjax")
	public String newUserAdd(@RequestBody UserInfo updatedData) throws Exception {
		
		int result=userInfoService.newUserAdd(updatedData);
		
		return "1";
	}

	@RequestMapping("/deleteUserAjax")
	public String deleteUserAjax(@RequestBody String ids) throws Exception {
		String id = ids;
		if (id.startsWith("\"") && id.endsWith("\"")) {
			id = id.substring(1, id.length() - 1);
		}
		int result = userInfoService.removeUser(id);
		
	    return "1";
	}
	
	
	
	

	}
