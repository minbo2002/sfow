package com.yeonoo.so.domain;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Item {

	private String itemCode;	// ITEM코드 PK
	private String itemName;    // 품명
	private String itemNo;   	// 품번
}
