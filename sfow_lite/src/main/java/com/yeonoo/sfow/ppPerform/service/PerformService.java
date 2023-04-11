package com.yeonoo.sfow.ppPerform.service;

import java.util.List;

import com.yeonoo.sfow.ppPerform.domain.BOM;
import com.yeonoo.sfow.ppPerform.domain.Order;
import com.yeonoo.sfow.ppPerform.domain.Perform;

public interface PerformService {

	public List<Order> selectOrder(Order order);
	public void updateOrder(Order order);
	public List<Perform> selectPerform(String pp_no);
	public List<BOM> selectBOM(String lot_no);
	public Boolean insetPerform(Perform perform);
	public int selectQty(String qty);
	public List<Perform> selectWorker(Perform worker);
	public Boolean deletePerform(Perform perform);

}
