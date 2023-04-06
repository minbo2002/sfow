package com.yeonoo.masterdata.item.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

	
public class RawDTO {
	
	//Field
	private String itemCode;			//item코드
	private String itemName;			//품명
	private String itemNo;				//품목코드
	private String itemType;			//유형
	private String itemSpecification;	//규격
	private String clientName;			//거래처명
	private int buyPrice;				//매입가격
	private int salesPrice;				//매출가격
	private String warehouseCode;		//입고창고
	private int warehouseName;			//창고명
	private String memo;				//비고
	private String useyn;				//사용여부
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd-hh-mm")
	private Date createdate;	//등록일시
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd-hh-mm")
	private Date updatedate;	//수정일시
	
	//baseConstructor
	public RawDTO() {}


	// all parameter
	public RawDTO(String itemCode, String itemName, String itemNo, String itemType, String itemSpecification,
			String clientName, int buyPrice, int salesPrice, String warehouseCode, int warehouseName, String memo,
			String useyn, Date createdate, Date updatedate) {
		this.itemCode = itemCode;
		this.itemName = itemName;
		this.itemNo = itemNo;
		this.itemType = itemType;
		this.itemSpecification = itemSpecification;
		this.clientName = clientName;
		this.buyPrice = buyPrice;
		this.salesPrice = salesPrice;
		this.warehouseCode = warehouseCode;
		this.warehouseName = warehouseName;
		this.memo = memo;
		this.useyn = useyn;
		this.createdate = createdate;
		this.updatedate = updatedate;
	}


	//getter & setter
	public String getItemCode() {
		return itemCode;
	}


	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}


	public String getItemName() {
		return itemName;
	}


	public void setItemName(String itemName) {
		this.itemName = itemName;
	}


	public String getItemNo() {
		return itemNo;
	}


	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
	}


	public String getItemType() {
		return itemType;
	}


	public void setItemType(String itemType) {
		this.itemType = itemType;
	}


	public String getItemSpecification() {
		return itemSpecification;
	}


	public void setItemSpecification(String itemSpecification) {
		this.itemSpecification = itemSpecification;
	}


	public String getClientName() {
		return clientName;
	}


	public void setClientName(String clientName) {
		this.clientName = clientName;
	}


	public int getBuyPrice() {
		return buyPrice;
	}


	public void setBuyPrice(int buyPrice) {
		this.buyPrice = buyPrice;
	}


	public int getSalesPrice() {
		return salesPrice;
	}


	public void setSalesPrice(int salesPrice) {
		this.salesPrice = salesPrice;
	}


	public String getWarehouseCode() {
		return warehouseCode;
	}


	public void setWarehouseCode(String warehouseCode) {
		this.warehouseCode = warehouseCode;
	}


	public int getWarehouseName() {
		return warehouseName;
	}


	public void setWarehouseName(int warehouseName) {
		this.warehouseName = warehouseName;
	}


	public String getMemo() {
		return memo;
	}


	public void setMemo(String memo) {
		this.memo = memo;
	}


	public String getUseyn() {
		return useyn;
	}


	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}


	public Date getCreatedate() {
		return createdate;
	}


	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}


	public Date getUpdatedate() {
		return updatedate;
	}


	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}


	//toString()
	@Override
	public String toString() {
		return "RawDTO [itemCode=" + itemCode + ", itemName=" + itemName + ", itemNo=" + itemNo + ", itemType="
				+ itemType + ", itemSpecification=" + itemSpecification + ", clientName=" + clientName + ", buyPrice="
				+ buyPrice + ", salesPrice=" + salesPrice + ", warehouseCode=" + warehouseCode + ", warehouseName="
				+ warehouseName + ", memo=" + memo + ", useyn=" + useyn + ", createdate=" + createdate + ", updatedate="
				+ updatedate + "]";
	}
	
	
	
	

	
	
	
	
}



