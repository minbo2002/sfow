<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title>출하등록</title>
	
	<style>
	
	</style>
	
	<script>
	$(document).ready(window.onload=function() {
		
		$('#searchBtn').on('click', function() {

			event.preventDefault(); // prevent form submission
			
			$.ajax({
				url : "shipout/list",
				method : "get",
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function (shipOutList) {
					console.dir(shipOutList)
					grid.resetData(shipOutList);  // result를 배열로 받는다
				}
			});
	   });
	});
	
	var gridData = [];
	var grid = new tui.Grid({
	      el: document.getElementById('grid'),
	      data: gridData,
	      scrollX: false,
	      scrollY: false,
	      rowHeaders: ['checkbox', 'rowNum'],
	      columns: [
			{header:"출하코드", name:"outCode", align:"center", width:"auto"},
			{header:"수주번호", name:"orderNumber", align:"center", width:"auto"},
			{header:"거래처코드", name:"clientCode", align:"center", width:"auto"},
			{header:"회사코드", name:"companyCode", align:"center", width:"auto"},
			{header:"ITEM코드", name:"itemCode", align:"center", width:"auto"},
			{header:"출하유형", name:"outType", editor:"text", align:"center"},  // filter:"text"
			{header:"수불타입", name:"transType", editor:"text", align:"center"},
			{header:"출하계획일", name:"outPlanDate", editor:"text", align:"center"},
			{header: "출하담당자", name:"outManager", editor:"text", align:"center"},
			{header: "상태", name:"outStatus", align:"center"},
			{header: "비고", name:"memo", editor:"text", align:"center"},
			{header: "등록일", name:"createDate", align:"center"},
			{header: "등록자", name:"createUser", editor:"text", align:"center"},
			{header: "수정일", name:"updateDate", align:"center"},
			{header: "수정자", name:"updateUser", editor:"text", align:"center"},
			{header: "삭제여부", name:"deleteYesNo", align:"center"}
	      ]
	
		  /*
		  onGridMounted (e) {
		    	console.log('mounted' + e);
		    	const grid = e.detail;
		    	
		    	// 각 행에 검색창 추가
		    	grid.on('check', function(ev) {
		    	var rowKey = ev.rowKey;
		    	var columnName = ev.columnName;
		    		if (columnName === 'outType') { // 검색창이 추가된 컬럼 클릭 시
		    			var row = grid.getRow(rowKey);
		    			var cellEl = row.getCellElement(columnName);
		    			var inputEl = document.createElement('input');
		    			inputEl.type = 'text';
		    			inputEl.value = row.getValue(columnName);
		    			inputEl.style.width = '100%';
		    			inputEl.addEventListener('blur', function() {
		    			  row.setValue(columnName, inputEl.value);
		    			  cellEl.textContent = inputEl.value;
		    			  inputEl.remove();
		    			});
		    			cellEl.textContent = '';
		    			cellEl.appendChild(inputEl);
		    			inputEl.focus();
		    		}
		    	});
			  }
			  */
	});

	// 체크박스 클릭시 검색창에 PK, FK값 출력
	grid.on('check', function(ev) {
		
		const rowKey = ev.rowKey;
		const columnName = ev.columnName;
		var updatedData = {};
		const rowData = grid.getRow(rowKey);
		console.log('Row data: ', rowData);
		
		var outCode = document.getElementById("outCode");  			// 출하코드
		var orderNumber = document.getElementById("orderNumber");   // 수주번호
		var clientCode = document.getElementById("clientCode");   	// 거래처코드
		var companyCode = document.getElementById("companyCode");   // 회사코드
		var itemCode = document.getElementById("itemCode");   		// ITEM코드

		var rowDatas = grid.getCheckedRows();	// 선택한 row에 해당하는 객체값
		alert("rowDatas : " + rowDatas + ",  rowDatas length : " + rowDatas.length);
		var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
		alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
		var jsonRowDatas2 = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
		
		if(rowDatas.length==1){

			outCode.value=rowData.outCode;
			outCode.readOnly=true;
			console.log('outCode: ', rowData.outCode);
			
			orderNumber.value=rowData.orderNumber;
			orderNumber.readOnly=true;

			clientCode.value=rowData.clientCode;
			clientCode.readOnly=true;
			
			companyCode.value=rowData.companyCode;
			companyCode.readOnly=true;
			
			itemCode.value=rowData.itemCode;
			itemCode.readOnly=true;
			console.log('itemCode: ', rowData.itemCode);

			$.ajax({
				url : "shipout/selectItems",
				method : "post",
				data : jsonRowDatas,
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function (result) {
					alert('Items 조회성공');
					console.dir('result : ' + result);
					gridItem.resetData(result);  // result를 배열로 받는다
				}
			});
			
			$.ajax({
				url : "shipout/selectLots",
				method : "post",
				data : jsonRowDatas2,
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function (result) {
					alert('Lots 조회성공');
					console.dir('result : ' + result);
					gridLot.resetData(result);  // result를 배열로 받는다
				}
			});

        }else{

        	outCode.value="";
        	outCode.readOnly=true;
			 
        	orderNumber.value="";
        	orderNumber.readOnly=false;

        	clientCode.value="";
        	clientCode.readOnly=false;
			
        	companyCode.value="";
        	companyCode.readOnly=false;
			
        	itemCode.value="";
        	itemCode.readOnly=false;
		}
    });
	
	grid.off('check', function(ev) {
		grid.removeCheckedRows(true);
	});
	
	
	var gridItemData = [];
	var gridItem = new tui.Grid({
	      el: document.getElementById('gridItem'),
	      data: gridItemData,
	      scrollX: false,
	      scrollY: false,
	      columns: [
			{header: "출하코드", name: "outCode"},		   // 출하 테이블
			{header: "ITEM코드", name: "itemCode"},     // 기준정보 테이블	 
			{header: "품명", name: "itemName"},		   // 기준정보 테이블		
			{header: "품번", name: "itemNo"},			   // 기준정보 테이블	
			{header: "수량", name: "requestQuantity"},  // 구매요청상세보기 테이블
			{header: "공급가액", name: "amount"},        // 구매요청상세보기 테이블
	      ]
	});
	
	var gridLotData = [];
	var gridLot = new tui.Grid({
	      el: document.getElementById('gridLot'),
	      data: gridLotData,
	      scrollX: false,
	      scrollY: false,
	      columns: [
			{header: "LOT번호", name: "lotNo"},        // 실적등록 테이블(pp_perform)
			{header: "ITEM코드", name: "itemCode"},    // 실적등록 테이블(pp_perform)
			{header: "품명", name: "itemName"},		  // 재고상세 테이블(mt_stock_detail)
			{header: "품번", name: "itemNo"},		      // 재고상세 테이블(mt_stock_detail)
			{header: "규격", name: "itemSpec"},        // 재고상세 테이블(mt_stock_detail)
			{header: "재고수량", name: "quantity"}, // 재고상세 테이블(mt_stock_detail)
			{header: "창고코드", name: "warehouseCode"}, // 재고상세 테이블(mt_stock_detail)
	      ]
	});

	// 행 추가 
	var addRow = document.getElementById("addRow");
	addRow.addEventListener("click", function() {
		var newRowData = {
			outCode: '',
			orderNumber: '',
			clientCode: '',
			companyCode: '',
			itemCode: '',
			outType: '',
			transType: '',
			outPlanDate: '',
			outManager: '',
			outStatus: '',
			memo: '',
			createDate: '',
			createUser: '',
			updateDate: '',
			updateUser: '',
			deleteYesNo: ''
		};
		grid.appendRow(newRowData);
	});
	
	// 행 삭제
	var deleteRow = document.getElementById("deleteRow");
	deleteRow.addEventListener("click", function() {

		grid.removeCheckedRows(true);
		// grid.blur();
	});
	
	// 등록 진행
	$("#addRowBtn").click(function() {
		let i = confirm('등록하시겠습니까?');
		if(i) {
			addBtn();
		}else {
			return false;
		}
	});
	
	// 등록 진행
	function addBtn() {

		var rowDatas = grid.getCheckedRows();	// 선택한 row에 해당하는 객체값
		alert("rowDatas : " + rowDatas);
		var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
		alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
		
		$.ajax({
			url : "shipout/write",
			method : "post",
			data : jsonRowDatas,
			contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
			dataType: "json",			// 서버에서 받을 데이터타입
			success : function (result) {
				alert(result); // result는 반환받은 json형태의 객체 
				alert('성공');
			},
			error: function() {
		        console.log("실패");
		    }
		});
	}
	
	// 삭제실행
	$("#deleteRowBtn").click(function() {
		let d = confirm('삭제하시겠습니까?');
		if(d) {
			deleteFunction();
		}else {
			return false;
		}
	});
	
	// 삭제함수
	function deleteFunction() {
		
		var rowKeys = grid.getCheckedRowKeys();  // 선택한 row의 key
		alert("rowKeys : " + rowKeys);
		var jsonRowKeys = JSON.stringify(rowKeys);  // 실제값으로 가공 --> 선택한 row의 key(index)를  JSON 문자배열로 반환
		alert("JSON.stringify(rowKeys) : " + jsonRowKeys);
		
		var rowDatas = grid.getCheckedRows();	// 선택한 row에 해당하는 객체값
		alert("rowDatas : " + rowDatas);
		var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
		alert("JSON.stringify(rowDatas) : " + jsonRowDatas);

		grid.removeCheckedRows([jsonRowKeys]);

		$.ajax({
			url : "shipout/statusUpdate",
			method : "post",
			data : jsonRowDatas,
			contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
			dataType: "json",			// 서버에서 받을 데이터타입
			success : function (result) {
				alert(result); // result는 반환받은 json형태의 객체 
				alert('성공');
			},
			error: function() {
		        console.log("실패");
		    }
		});
	}

	// 조회결과 초기화
	var resetRow = document.getElementById("resetRow");
	resetRow.addEventListener("click", function() {
			grid.clear();
	});  
	</script>
	
</head>
<body>

 	<form id="shipOutSearch" > 
		<input type="submit" value="조회" id="searchBtn">
		<input type="reset" value="검색 초기화"> <br><br>
		
		<label for="outCode">출하코드:</label>
		<input type="text" name="outCode" id="outCode" value="">
		<label for="orderNumber">수주번호:</label>
		<input type="text" name="orderNumber" id="orderNumber" value="">
		<label for="clientCode">거래처코드:</label>
		<input type="text" name="clientCode" id="clientCode" value="">
		<label for="companyCode">회사코드:</label>
		<input type="text" name="companyCode" id="companyCode" value=""> <br>
		<label for="companyCode">ITEM코드:</label>
		<input type="text" name="itemCode" id="itemCode" value="">
		
		<label for="outType">출하유형:</label>
		<select name="outType" id="outType">
			<option value="">--</option>
			<option value="기타출고">기타출고</option>
			<option value="반품출고">반품출고</option>
			<option value="생산출고">생산출고</option>
			<option value="판매출고">판매출고</option>
		</select>
		
		<label for="transType">수불타입:</label>
		<select name="transType" id="transType">
			<option value="">--</option>
			<option value="일반">일반</option>
			<option value="사급">사급</option>
			<option value="샘플">샘플</option>
			<option value="불량">불량</option>
		</select>
		
		<label for="outPlanDate"> 출하계획일:
		  <input type="date" id="outPlanDate" name="outPlanDate" max="2030-12-31" min="2020-01-01">
		</label>

		<label for="outManager">출하담당자:</label>
		<input type="text" name="outManager" id="outManager" value="">
		
		<label for="outStatus">상태:</label>
		<select name="outStatus" id="outStatus">
			<option value="">--</option>
			<option value="등록">등록</option>
			<option value="확정">확정</option>
		</select> <br>

		<label for="memo">비고:</label>
		<input type="text" name="memo" id="memo" value="">
		
		<label for="createDate">등록일:
		  <input type="date" id="createDate" name="createDate" max="2030-12-31" min="2020-01-01"> 
		</label>
		<label for="createUser">등록자:</label>
		<input type="text" name="createUser" id="createUser" value="">
		
		<label for="updateDate">수정일:
		  <input type="date" id="updateDate" name="updateDate" max="2030-12-31" min="2020-01-01">
		</label>
		<label for="updateUser">수정자:</label>
		<input type="text" name="updateUser" id="updateUser" value="">
	</form> 
	<br><hr>

	<div id="grid">
		<button type="button" id="addRowBtn" style="background-color: #33F6FF">등록</button>
		<button type="button" id="deleteRowBtn" style="background-color: #FF3333">삭제</button>
		<button type="button" id="resetRow">조회 초기화</button>
		<button type="button" id="addRow">+</button>
		<button type="button" id="deleteRow">ㅡ</button>
	</div> <br><hr>
	<div id="gridItem"></div>   <br><hr>
	<div id="gridLot"></div>    <br><hr>

</body>
</html>