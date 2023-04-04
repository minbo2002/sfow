package com.yeonoo.so.domain;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class PoRequest {

	private Integer requestOrder;  // 상세보기요청번호 PK
	private Integer requestQuantity;  // 수량
	private Integer amount;     // 공급가액
	private String itemCode;	// ITEM코드 FK
}
