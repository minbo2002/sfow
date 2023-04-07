package com.yeonoo.stock.domain;

import lombok.Data;

@Data
public class Stock {

	String company_code;
	String item_code;
	String warehouse_code;
	String area_code;
	String lot_no;
	String item_category;
	String item_name;
	String warehouse_name;
	String item_specification;
	String item_stock_unit;
	int pass_quantity;
	int fail_quantity;
	int quantity;
	String stock_status;
	
	
	
}
