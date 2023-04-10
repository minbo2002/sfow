package com.yeonoo.so.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yeonoo.so.controller.ReturnAddController;
import com.yeonoo.so.domain.ReturnAdd;
import com.yeonoo.so.repository.ReturnAddRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReturnAddServiceImpl implements ReturnAddService {

	@Autowired
	ReturnAddRepository returnAddRepository;
	
	public List<ReturnAdd> getReturnAdd() throws Exception{
		return returnAddRepository.getReturnAdd();
	}
	
	//날짜로 반품조회
	public List<ReturnAdd> getReturnAddByDate(String return_date) throws Exception{
		 return returnAddRepository.getReturnAddByDate(return_date);
	}
	
	//행 삭제
    public void deleteReturnAdd(String returnNumber) {
        returnAddRepository.deleteByReturnNumber(returnNumber);
    }
    
    //저장
    public void saveCreateRows(List<Map<String, Object>> createRows) throws Exception {
        log.info("Saving create rows: {}", createRows);
    	for (Map<String, Object> row : createRows) {
            returnAddRepository.insertReturnAdd(row);
        }
    }
    
    //수정
    public void saveUpdateRows(List<Map<String, Object>> updateRows) throws Exception {
        log.info("Saving update rows: {}", updateRows);
    	for (Map<String, Object> row : updateRows) {
            returnAddRepository.updateReturnAdd(row);
        }
    }
    
    //회사조회
	public List<Map<String, String>> getClient() throws Exception{
		return returnAddRepository.getClient();
	}
    
	//상태 확정
    public void conFirmStatus(String returnNumber) throws Exception{
    	returnAddRepository.conFirmStatus(returnNumber);
    }
    
	//상태 저장
    public void cancelStatus(String returnNumber) throws Exception{
    	returnAddRepository.cancelStatus(returnNumber);
    }
}
