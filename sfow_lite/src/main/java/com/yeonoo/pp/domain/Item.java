package com.yeonoo.pp.domain;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Data
public class Item {
	
	//필드
	private String item_code;
	private String item_name;
	private String item_no;
	private String item_specification;
	private String item_type;
	
}
