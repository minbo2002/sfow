package com.yeonoo.sfow.ppPerform.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yeonoo.sfow.ppPerform.domain.BOM;
import com.yeonoo.sfow.ppPerform.domain.Order;
import com.yeonoo.sfow.ppPerform.domain.PerStock;
import com.yeonoo.sfow.ppPerform.domain.Perform;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PerformRepositoryImpl implements PerformRepository{
	
	private final SqlSession sqlSession;
	
	@Override
	public List<Order> selectOrder(Order order) {
	    System.out.println("select의 order:"+order);
		List<Order> result;
		//.isEmpty()||order.getPp_date().isEmpty()||order.getEnd_date().isEmpty()
		if(order.getPp_no()==""){
			if(order.getPp_date().isEmpty()||order.getEnd_date().isEmpty()) {
	    	System.out.println("여기지나가?");
	        result = sqlSession.selectList("mapper.perform.selectOrder2");
			}else {
				  result = sqlSession.selectList("mapper.perform.selectOrder", order);
			}
	    }else {
	    	if(order.getPp_date()==""||order.getPp_no()==null||order.getEnd_date()==""||order.getEnd_date()==null) {
	        order.setPp_date(null);
	        order.setEnd_date(null);
	    	System.out.println("이제 여기 지나가냐2?");
	        result = sqlSession.selectList("mapper.perform.selectOrder",order);
	        }else {
	        	result = sqlSession.selectList("mapper.perform.selectOrder",order);
	        }
	    }
	    return result;
	}

	@Override
	public void updateOrder(Order order) {
		if(order.getPp_date()=="") {
			order.setPp_date(null);
		}
		if(order.getEnd_date()=="") {
			order.setEnd_date(null);
		}
		
		sqlSession.update("mapper.perform.updateOrder",order);
	}

	@Override
	public List<Perform> selectPerform(String pp_no) {
		List<Perform> result=sqlSession.selectList("mapper.perform.selectPerform",pp_no);
		return result;
	}

	@Override
	public List<BOM> selectBOM(String lot_no) {
		Perform result = sqlSession.selectOne("mapper.perform.selectPerformByLot",lot_no);
		System.out.println(result.getItem_code());
		List<BOM> bom = sqlSession.selectList("mapper.perform.selectBOM",result.getItem_code());
		return bom;
	}

	@Override
	public Boolean insertPerform(Perform perform) {
		Order order=sqlSession.selectOne("mapper.perform.selectOrderOne", perform);
		
		System.out.println("insert할 perform에 이름담겼니?"+perform);
		System.out.println("insert의 첫번째 order"+order);
		if(order.getPp_date()==null|| order.getPp_date()=="") {
			sqlSession.update("mapper.perform.updatePerformStart",order);
		}
		
		int validQuantity=sqlSession.selectOne("mapper.perform.selectPerformSum",perform);
		System.out.println("validQuantity"+validQuantity);
		int qty =Integer.parseInt(order.getPp_quantity());
		System.out.println("qty"+qty);
		int performQty =Integer.parseInt(perform.getPer_quantity());
		System.out.println("performQty"+performQty);
		
		if(qty==validQuantity || qty < validQuantity+performQty){
			return false;	
		
		}else {
		System.out.println("아이템코드 안나와>"+order.getItem_code());	
		
		int bomNo = sqlSession.selectOne("mapper.perform.selectBOMOne",order);
		
		Perform insertPerform = new Perform();
		insertPerform.setPp_no(order.getPp_no());
		insertPerform.setBomdno(bomNo);
		insertPerform.setItem_code(order.getItem_code());
		insertPerform.setItem_name(order.getItem_name());
		insertPerform.setPer_sTime(perform.getPer_sTime());
		insertPerform.setPer_eTime(perform.getPer_eTime());
		insertPerform.setPer_quantity(perform.getPer_quantity());
		insertPerform.setUser_name(perform.getUser_name());
		insertPerform.setUser_code(perform.getUser_code());
		
		System.out.println("setting 확실해?"+insertPerform);
		
		int result=sqlSession.insert("mapper.perform.insertPerform", insertPerform);
		
		int validQuantity2=sqlSession.selectOne("mapper.perform.selectPerformSum",order);
		
		if(validQuantity2==qty) {
			sqlSession.update("mapper.perform.updatePerformEnd",order);
		}
		if(result==1) {
			System.out.println("지나가는거니?");
			PerStock performStock=sqlSession.selectOne("mapper.perform.selectPerformStock",order);
			if(performStock==null) {
				PerStock perStock = new PerStock();
				System.out.println("결과값 1에서 if?");
				//없을 경우 insert
				perStock.setCompany_code(order.getCompany_code());
				perStock.setItem_code(order.getItem_code());
				perStock.setWarehouse_name(order.getWarehouse_name());
				perStock.setWarehouse_code(order.getWarehouse_code());
				String lot=sqlSession.selectOne("mapper.perform.selectLastLot");
				perStock.setLot_no(lot);
				int qtyy=Integer.parseInt(insertPerform.getPer_quantity());
				perStock.setQuantity(qtyy);
				
				
				sqlSession.insert("mapper.perform.insertPerStock",perStock);
			}else {
				System.out.println("else일까?");
				//재고 있을 경우 수량 변경
				int originQty=performStock.getQuantity();
				int sumQty=originQty+performQty;
				performStock.setQuantity(sumQty);
				sqlSession.update("mapper.perform.updatePerformStock",performStock);
			}
			
			return true;
		}else {	
			
			return false;
		}
		
		}
	}

	@Override
	public int selectQty(String pp_no) {
		int sum=sqlSession.selectOne("mapper.perform.selectPerformSum", pp_no);
		return sum;
	}

	@Override
	public List<Perform> selectWorker(Perform worker) {
		System.out.println("worker"+worker);
		if(worker.getUser_code()==null || worker.getUser_code()==""){
		List<Perform> workers = sqlSession.selectList("mapper.perform.selectWorker",worker);
		return workers;
	}else {
		System.out.println("여기로오는거 맞아?");
		List<Perform> workers = sqlSession.selectList("mapper.perform.selectWorker2",worker);
		return workers;
	}
	}

	@Override
	public Boolean deletePerform(Perform perform) {
		System.out.println("deleteREPO"+perform);
		
		int result=sqlSession.delete("mapper.perform.deletePerform", perform);
		
		
		int lotSum=sqlSession.selectOne("mapper.perform.selectPerformSum",perform);
		
		if(lotSum==0) {
			sqlSession.update("mapper.perform.updateOrderDate", perform);	
		}else {
			sqlSession.update("mapper.perform.updateOrderDate2", perform);
		}
		
		if(result==1) {
			return true;
			
		}else {
			
			return false;
		}
	
	}

	
}
