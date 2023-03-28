<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
	<!-- Custom fonts for this template-->
    <link href="${conPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${conPath}/resources/css/main/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<title>출하등록</title>
	
	<script>
	$(document).ready(window.onload=function() {
	  $('#searchBtn').click(function(event) {
	    event.preventDefault(); // prevent form submission
	    
	    // get search parameters
	    var item_type = $('#item_type').val();
	    var warehouse_name = $('#warehouse_name').val();
	    var item_name = $('#item_name').val();
	    var item_code = $('#item_code').val();
	    
	    // make AJAX call to server
	    $.ajax({
	      url: "${conPath}/shipout/search",
	      type: "GET",
	      dataType: "JSON",
	      data: {
	        item_type: item_type,
	        warehouse_name: warehouse_name,
	        item_name: item_name,
	        item_code: item_code
	      },
	      success: function(data) {
	    	 	gridData=data	
	    	  	grid.resetData(data)
	    	   	
	    	   	grid.on('editingFinish', function(ev) {
	            const rowKey = ev.rowKey;
	            const columnName = ev.columnName;
	            var updatedData = {};
	            const rowData = grid.getRow(rowKey);
	            console.log('Row data: ', rowData);
	            
	            $.ajax({
	                 url: '<%=request.getContextPath()%>/updateStock',
	                 method: 'PUT',
	                 dataType: 'JSON',
	                 data: JSON.stringify(rowData),
	                 contentType: 'application/json',
	                 success: function(response) {
	                     console.log('Success:', response);
	                 },
	                 error: function(error) {
	                     console.log('Error:', error);
	                 }
	             }); 
	    	   	});
	    	  },
	      error: function(xhr, status, error) {
	        // handle error
	        console.log(error);
	      }
	    });
	  });
	});
	</script>
</head>
<body>

	<h1>Search Results</h1>
	
 	<form id="shipOutSearch" > 
		<input type="submit" value="조회" id="searchBtn">
		<input type="reset" value="초기화"> <br>
		
		<label for="outCode">출하코드:</label>
		<input type="text" name="outCode" id="outCode" value="">
		<label for="orderNumber">수주번호:</label>
		<input type="text" name="orderNumber" id="orderNumber" value="">
		<label for="clientCode">거래처코드:</label>
		<input type="text" name="clientCode" id="clientCode" value="">
		<label for="companyCode">회사코드:</label>
		<input type="text" name="companyCode" id="companyCode" value=""> <br>
		
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
		</select>

		<label for="memo">비고:</label>
		<input type="text" name="memo" id="memo" value=""> <br>
		
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

	<div id="grid"></div>
	
	<script>
	var gridData = [];
	var grid = new tui.Grid({
	      el: document.getElementById('grid'),
	      data: gridData,
	      scrollX: false,
	      scrollY: false,
	      columns: [
	        {
	          header: '출하코드',
	          name: 'outCode'
	        },
	        {
	          header: '수주번호',
	          name: 'orderNumber'
	        },
	        {
	          header: '거래처코드',
	          name: 'clientCode'
	        },
	        {
	          header: '회사코드',
	          name: 'companyCode'
	        },
	        {
	          header: '출하유형',
	          name: 'outType'
	        },
	        {
	          header: '수불타입',
	          name: 'transType'
	        },
	        {
	          header: '출하계획일',
	          name: 'outPlanDate'
	        },
	        {
	          header: '출하담당자',
	          name: 'outManager'
	        },
	        {
	          header: '상태',
	          name: 'outStatus'
	        },
	        {
	          header: '비고',
	          name: 'memo'
	        },
	        {
	          header: '등록일',
	          name: 'createDate'
	        },
	        {
	          header: '등록자',
	          name: 'createUser'
	        },
	        {
	          header: '수정일',
	          name: 'updateDate'
	        },
	        {
	          header: '수정자',
	          name: 'updateUser'
	        },
	        {
	          header: '삭제여부',
	          name: 'deleteYesNo'
	        },
	      ]
	});
	
	$.ajax({
		url : "shipout/list",  // toastList, toasDatatList
		method : "GET",
		dataType : "JSON",
		success : function (result) {
			console.dir(result)
			grid.resetData(result);  // result를 배열로 받는다
		}
	});
	</script>
	
</body>
</html>