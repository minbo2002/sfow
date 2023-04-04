package com.yeonoo.so.domain;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ItemShipOutDTO {

	private String outCode;     // 출하코드    PK  (출하 테이블)
	private String itemCode;	// ITEM코드 PK  (기준정보 테이블)
	private String itemName;    // 품명		  (기준정보 테이블)	
	private String itemNo;   	// 품번                   (기준정보 테이블)
	private Integer requestQuantity;  // 수량     (구매요청상세보기 테이블)
	private Integer amount;     // 공급가액	  (구매요청상세보기 테이블)	 
}
