package com.yeonoo.so.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yeonoo.so.domain.ReturnAdd;
import com.yeonoo.so.domain.ReturnDetail;
import com.yeonoo.so.service.ReturnAddService;

import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j
public class ReturnAddController {

	@Autowired
	ReturnAddService returnAddService;
	
	
	//고객반품등록 연결
	@GetMapping("/so/returnMain")
	public String ReturnMain() {
		return "/so/returnMain";
	}
	
	//거래처코드 조회 연결
	@GetMapping("/so/returnMainChild")
	public String ReturnMainChild() {
		return "/so/returnMainChild";
	}
	
	//거래처코드 조회 연결
	@GetMapping("/so/returnInfo")
	public String ReturnInfo() {
		return "/so/returnInfo";
	}
	
	
	
	
	
	
	//전체 조회
	@RequestMapping(value="/so/getReturnAdd",
			   method=RequestMethod.POST)
	@ResponseBody
	public List<ReturnAdd> getReturn() throws Exception {
		List<ReturnAdd> returnAdd = returnAddService.getReturnAdd();
		return returnAdd;
	}
	
    //선택한 날짜에 맞춰 조회
    @GetMapping("/so/getReturnAddByDate")
    @ResponseBody
    public List<ReturnAdd> getReturnAddByDate(@RequestParam(value = "return_date", required = false) String return_date) throws Exception {
    	List<ReturnAdd> returnAddbyDate = returnAddService.getReturnAddByDate(return_date);
        if (return_date == null ||  return_date.isEmpty()) {
            returnAddbyDate = returnAddService.getReturnAdd(); // 전체 데이터 조회
            System.out.println(return_date+"date 비었음");
            System.out.println(returnAddbyDate);
        } else {
            returnAddbyDate = returnAddService.getReturnAddByDate(return_date);
            System.out.println(return_date+"date 있음");
            System.out.println(returnAddbyDate);
        }
    	
    	return returnAddbyDate;
    }
    
    //삭제
    @PostMapping("/so/deleteReturnAdd")
    public ResponseEntity<Void> deleteReturnAdd(@RequestParam("return_number") String returnNumber) throws Exception {
        System.out.println(returnNumber);
    	returnAddService.deleteReturnAdd(returnNumber);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    
    //저장과 수정
    @PostMapping("/so/saveReturnAdd")
    public void saveGridData(@RequestBody Map<String, Object> data, HttpServletResponse response, HttpSession session) {
        try {
			
        	// session.getAttribute로 company_code를 가져오고 그 파라미터를 리스트에 추가. 세션 없어서 임의값
        	/* String companyCode = (String) session.getAttribute("company_code"); */
        	String companyCode = "1234567890";

        	List<Map<String, Object>> createRows = (List<Map<String, Object>>) data.get("createRows");
            List<Map<String, Object>> updateRows = (List<Map<String, Object>>) data.get("updateRows");
            
            for (Map<String, Object> row : createRows) {
                row.put("company_code", companyCode);
            }

            for (Map<String, Object> row : updateRows) {
                row.put("company_code", companyCode);
            }
            
            // 로그 추가
            System.out.println(("Received data: {}"+data));
            System.out.println("Create Rows: {}"+ createRows);
            System.out.println("Update Rows: {}"+ updateRows);
            
            returnAddService.saveCreateRows(createRows);
            returnAddService.saveUpdateRows(updateRows);
            
            // 반환할 JSON 데이터 생성
            Map<String, Object> responseJson = new HashMap<>();
            responseJson.put("success", true);
            
            // JSON 데이터 반환
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(new ObjectMapper().writeValueAsString(responseJson));
        } catch (Exception e) {
            log.error("Error occurred while saving grid data: {}", e.getMessage(), e);
            // 에러 발생시 오류 메시지 반환
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            Map<String, Object> responseJson = new HashMap<>();
            responseJson.put("success", false);
            responseJson.put("errorMessage", e.getMessage());
            try {
                response.getWriter().write(new ObjectMapper().writeValueAsString(responseJson));
            } catch (IOException ex) {
                log.error("Error occurred while sending error response: {}", ex.getMessage(), ex);
            }
        }
    }
    
    //반품상태 확정으로 변경
    @PostMapping("/so/conFirmStatus")
    @ResponseBody
    public ResponseEntity<Void> conFirmStatus(@RequestParam("return_number") String returnNumber) throws Exception {
        System.out.println(returnNumber);
    	returnAddService.conFirmStatus(returnNumber);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    
    //반품상태 저장으로 변경
    @PostMapping("/so/cancelStatus")
    @ResponseBody
    public ResponseEntity<Void> cancelStatus(@RequestParam("return_number") String returnNumber) throws Exception {
        System.out.println(returnNumber);
    	returnAddService.cancelStatus(returnNumber);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    
    //거래처코드와 거래처명 조회. 자식창
    @GetMapping("/so/getClient")
    @ResponseBody
    public ResponseEntity<List<Map<String, String>>> getClient() throws Exception {
        List<Map<String, String>> result = returnAddService.getClient();
        System.out.println("Returning JSON data: " + new ObjectMapper().writeValueAsString(result));
        return ResponseEntity.ok(result);
    }
        
}

