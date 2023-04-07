<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>

	<!-- 순서주의 -->
	<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" /> <!-- date-picker -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /><!-- jQuery Modal -->
	<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script> <!-- date-picker -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script><!-- include jQuery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script><!-- jQuery Modal -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<title>출하등록</title>
	
	<style>

	</style>
	
	<script>
	$(document).ready(window.onload=function() {
		
		$('#searchBtn').on('click', function() {

		    var searchData = {
		    		"outCode" : $("#outCode").val(),
		    		"orderNumber" : $("#orderNumber").val(),
		    		"clientCode" : $("#clientCode").val(),
		    		"companyCode" : $("#companyCode").val(),
		    		"itemCode" : $("#itemCode").val(),
		    		"outType" : $("#outType").val(),
		    		"transType" : $("#transType").val(),
		    		"outPlanDate" : $("#outPlanDate").val(),
		    		"outManager" : $("#outManager").val(),
		    		"outStatus" : $("#outStatus").val(),
		    		"memo" : $("#memo").val(),
		    		"createDate" : $("#createDate").val(),
		    		"createUser" : $("#createUser").val(),
		    		"deleteYesNo" : $("#deleteYesNo").val()
		    }
		
			event.preventDefault(); // prevent form submission

			$.ajax({
				url : "${conPath}/shipout/list",
				method : "post",
				data : JSON.stringify(searchData),
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
			{header:"출하수량", name:"outQuantity", align:"center", width:"auto"},
			{header:"출하유형", name:"outType", editor:"text", align:"center"},
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
	});

	// 체크박스 클릭시 검색창에 PK, FK값 출력
	grid.on('check', function(ev) {
		
		gridItem.clear();
		gridLot.clear();
		
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
		//alert("rowDatas : " + rowDatas + ",  rowDatas length : " + rowDatas.length);
		var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
		//alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
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
				url : "${conPath}/shipout/selectItems",
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
				url : "${conPath}/shipout/selectLots",
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
	
	// client_code 더블클릭 이벤트 실행
    grid.on('dblclick', function(ev) {
        if (ev.columnName === 'orderNumber') {
            window.open('${conPath}/shipout/modalItem', 'childWindow', 'width=500,height=500');
        }
    });
	
	// 
    window.addEventListener('message', function(ev) {
        const selectedRow = ev.data;
        const focusedCell = grid.getFocusedCell();
        grid.setValue(focusedCell.rowKey, 'orderNumber', selectedRow.orderNumber);
        grid.setValue(focusedCell.rowKey, 'clientCode', selectedRow.clientCode);
        grid.setValue(focusedCell.rowKey, 'companyCode', selectedRow.companyCode);
        grid.setValue(focusedCell.rowKey, 'itemCode', selectedRow.itemCode);
        grid.setValue(focusedCell.rowKey, 'outQuantity', selectedRow.outQuantity);
    });

	/*
	grid.off('check', function(ev) {
		grid.removeCheckedRows(true);
	});
	*/
	
	var gridItemData = [];
	var gridItem = new tui.Grid({
	      el: document.getElementById('gridItem'),
	      data: gridItemData,
	      scrollX: false,
	      scrollY: false,
	      columns: [
			{header: "출하코드", name: "outCode"},		    // 출하 테이블(so_shipout)
			{header: "수주번호", name: "orderNumber"},    // 수주서상세 테이블(so_order_detail)	 
			{header: "ITEM코드", name: "itemCode"},      // 수주서상세 테이블(so_order_detail)
			{header: "수량", name: "quantity"},          // 수주서상세 테이블(so_order_detail)
			{header: "단가", name: "price"},             // 수주서상세 테이블(so_order_detail)
			{header: "총액", name: "amount"},            // 수주서상세 테이블(so_order_detail)
			{header: "재고단위", name: "itemStockUnit"},  // 수주서상세 테이블(so_order_detail)
			{header: "품명", name: "itemName"},		   // 아이템정보 테이블(ma_item)	
			{header: "품번", name: "itemNo"}			   // 아이템정보 테이블(ma_item)	

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
		//alert("rowDatas : " + rowDatas);
		var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
		//alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
		
		$.ajax({
			url : "${conPath}/shipout/write",
			method : "post",
			data : jsonRowDatas,
			contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
			dataType: "json",			// 서버에서 받을 데이터타입
			success : function (result) {
				//alert(result); // result는 반환받은 json형태의 객체 
				alert('등록성공');
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
		//alert("rowKeys : " + rowKeys);
		var jsonRowKeys = JSON.stringify(rowKeys);  // 실제값으로 가공 --> 선택한 row의 key(index)를  JSON 문자배열로 반환
		//alert("JSON.stringify(rowKeys) : " + jsonRowKeys);
		
		var rowDatas = grid.getCheckedRows();	// 선택한 row에 해당하는 객체값
		//alert("rowDatas : " + rowDatas);
		var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
		//alert("JSON.stringify(rowDatas) : " + jsonRowDatas);

		grid.removeCheckedRows([jsonRowKeys]);

		$.ajax({
			url : "${conPath}/shipout/deleteShipOut",
			method : "post",
			data : jsonRowDatas,
			contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
			dataType: "json",			// 서버에서 받을 데이터타입
			success : function (result) {
				//alert(result); // result는 반환받은 json형태의 객체 
				alert('삭제성공');
				gridItem.clear();
				gridLot.clear();
			},
			error: function() {
		        console.log("실패");
		    }
		});
	}
	
	// 상태 변경실행
	$("#changeStatus").click(function() {
		let d = confirm('상태를 변경하시겠습니까?');
		if(d) {
			changeStatusFunction();
		}else {
			return false;
		}
	});
	
	// 상태변경 함수
	function changeStatusFunction() {

		var rowDatas = grid.getCheckedRows();	// 선택한 row에 해당하는 객체값
		//alert("rowDatas : " + rowDatas);
		var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
		//alert("JSON.stringify(rowDatas) : " + jsonRowDatas);

		$.ajax({
			url : "${conPath}/shipout/statusUpdate",
			method : "post",
			data : jsonRowDatas,
			contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
			dataType: "json",			// 서버에서 받을 데이터타입
			success : function (result) {
				//alert(result); // result는 반환받은 json형태의 객체 
				alert('상태변경 성공');
			},
			error: function() {
		        console.log("실패");
		    }
		});
	}
	
	
	// 데이터 수정
	$("#updateRow").click(function() {
		let d = confirm('수정 하시겠습니까?');
		if(d) {
			updateFunction();
		}else {
			return false;
		}
	});
	
	// 데이터 수정함수
	function updateFunction() {

		var rowDatas = grid.getCheckedRows();	// 선택한 row에 해당하는 객체값
		//alert("rowDatas : " + rowDatas);
		var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
		//alert("JSON.stringify(rowDatas) : " + jsonRowDatas);

		$.ajax({
			url : "${conPath}/shipout/updateShipOut",
			method : "patch",
			data : jsonRowDatas,
			contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
			dataType: "json",			// 서버에서 받을 데이터타입
			success : function (result) {
				//alert(result); // result는 반환받은 json형태의 객체 
				alert('데이터 수정성공');
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
			gridItem.clear();
			gridLot.clear();
	});
	
	// 검색조건 초기화
	var resetBtn = document.getElementById("resetBtn");
	resetBtn.addEventListener("click", function() {
		$("#shipOutSearch")[0].reset();
		document.getElementById("outPlanDate").valueAsDate = new Date();
		document.getElementById("createDate").valueAsDate = new Date();
		//document.getElementById("updateDate").valueAsDate = new Date();
	});
	
	// 검색창의 출하계획일, 등록일에 오늘날짜 계속 표시
	document.getElementById("outPlanDate").valueAsDate = new Date();
	document.getElementById("createDate").valueAsDate = new Date();
	//document.getElementById("updateDate").valueAsDate = new Date();
	
	</script>
	
</head>
<body>

 	<form id="shipOutSearch" > 
		<input type="submit" value="조회" id="searchBtn">
		<button type="button" id="resetBtn">검색조건 초기화</button> <br><br>
		
		<label for="outCode">출하코드:</label>
		<input type="text" name="outCode" id="outCode" value="">
		<label for="orderNumber">수주번호:</label>
		<input type="text" name="orderNumber" id="orderNumber" value="">
		<label for="clientCode">거래처코드:</label>
		<input type="text" name="clientCode" id="clientCode" value="">
		<label for="companyCode">회사코드:</label>
		<input type="text" name="companyCode" id="companyCode" value=""> <br>
		<label for="itemCode">ITEM코드:</label>
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
		  <input type="date" name="outPlanDate" id="outPlanDate" max="2030-12-31" min="2020-01-01">
		</label>

		<label for="outManager">출하담당자:</label>
		<input type="text" name="outManager" id="outManager" value=""> <br>
		
		<label for="outStatus">상태:</label>
		<select name="outStatus" id="outStatus">
			<option value="">--</option>
			<option value="등록">등록</option>
			<option value="확정">확정</option>
		</select>

		<label for="memo">비고:</label>
		<input type="text" name="memo" id="memo" value="">
		
		<label for="createDate">등록일:
		  <input type="date" name="createDate" id="createDate" max="2030-12-31" min="2020-01-01"> 
		</label>
		<label for="createUser">등록자:</label>
		<input type="text" name="createUser" id="createUser" value="">
		
		<!--
		<label for="updateDate">수정일:
		  <input type="date" name="updateDate" id="updateDate" max="2030-12-31" min="2020-01-01">
		</label>
		<label for="updateUser">수정자:</label>
		<input type="text" name="updateUser" id="updateUser" value="">
		-->
		
		<input type="hidden" name="deleteYesNo" id="deleteYesNo" value="N">
	</form> 
	<br><hr>

	<div id="grid">
		<button type="button" id="addRowBtn" style="background-color: #33F6FF">등록</button>
		<button type="button" id="deleteRowBtn" style="background-color: #FF3333">삭제</button>
		<button type="button" id="changeStatus">상태변경</button>
		<button type="button" id="updateRow">데이터수정</button>
		<button type="button" id="resetRow">조회결과 초기화</button>
		<button type="button" id="addRow">+</button>
		<button type="button" id="deleteRow">ㅡ</button>
	</div> <br><hr>
	<div id="gridItem"></div>   <br><hr>
	<div id="gridLot"></div>    <br><hr>
	
	


	<div class="modal">   
	    <!-- modal에 grid 띄우기 -->
	    <div id="modalGrid" style="display: flex; flex-direction: column; align-items: center;">
	    
	    <!-- reset 버튼 추가 -->
	    <button type="button" id="applyBtn" onclick="applyModal()" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">
	      <img src="${conPath}/resources\img\stock\apply.png" width="13px"/>&nbsp;&nbsp;적용
	    </button>
	    
	    <button type="reset" id="resetMdBtn" onclick="resetCheck()" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">
	      <img src="${conPath}/resources\img\stock\reset.png" width="11px"/>&nbsp;&nbsp;초기화
	    </button>
	    
	    <button type="button" id="closeBtn" onclick="closeModal()" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">
	      <img src="${conPath}/resources\img\stock\ex.png" width="11px"/>&nbsp;&nbsp;닫기
	    </button>
	    
    	</div>
	</div>
	
</body>
</html>