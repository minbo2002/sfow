package com.yeonoo.pp.domain;

import java.util.List;
import java.util.Map;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Item {
	
	//필드
	private String item_code;
	private String item_name;
	private String item_no;
	private String item_specification;
	private String item_category;
	private Map _attributes;
	private List<Item> _children;
	

	
}
