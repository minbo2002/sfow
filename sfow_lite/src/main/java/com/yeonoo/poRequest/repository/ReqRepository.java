package com.yeonoo.poRequest.repository;

import java.util.List;

import com.yeonoo.poRequest.model.ReqDetailVO;
import com.yeonoo.poRequest.model.ReqVO;

public interface ReqRepository {
	
	public List<ReqVO> reqOrder(ReqVO reqVO) throws Exception;

	public List<ReqDetailVO> reqOrderDetail(String request_number) throws Exception;
	
	public int reqUpdate(ReqVO reqVO)throws Exception;
	
	public void reqDel(String request_number)throws Exception;

	public int reqDetailUpdate(ReqDetailVO reqDetailVO)throws Exception;

	public void reqInsert(ReqVO req)throws Exception;

	public void reqDetailInsert(ReqDetailVO reqD)throws Exception;



}
