package com.yeonoo.so.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.yeonoo.so.domain.ReturnAdd;

public interface ReturnAddRepository {

	//전체 반품조회
	public List<ReturnAdd> getReturnAdd() throws DataAccessException;
}
