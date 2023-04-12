<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css"/>
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script>
$(document).ready(window.onload=function() {
  $('#searchBtn').click(function(event) {
    event.preventDefault(); // prevent form submission
    
    // get search parameters
//     var item_type = $('#item_type').val();
//     var warehouse_name = $('#warehouse_name').val();
//     var item_name = $('#item_name').val();
//     var item_code = $('#item_code').val();
    
    // make AJAX call to server
    $.ajax({
      url: '<%=request.getContextPath()%>/stockSearch',
      type: 'GET',
    //  dataType:'JSON'
//       data: {
//         item_type: item_type,
//         warehouse_name: warehouse_name,
//         item_name: item_name,
//         item_code: item_code
//       },
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
 	<form id="stockSearch" > 
	<input type="submit" value="searchBtn" id="searchBtn">
	<input type="reset" value="초기화">
 	<button>이동</button><br/><br/>
		<label for="itemType">품목구분</label>
		<select name="item_type" id="item_type">
			<option value="">--</option>
			<option value="pro1">제품</option>
			<option value="pro2">반제품</option>
			<option value="pro3">원자재</option>
			<option value="pro4">부자재</option>
			<option value="pro5">상품</option>
			<option value="pro6">기타</option>
			<option value="pro7">설비</option>
			<option value="pro8">설비예비부품</option>
			<option value="pro9">금형</option>
			<option value="pro10">금형예비부품</option>
			<option value="pro11">치공구</option>
			<option value="pro12">검사장비</option>
			<option value="pro13">소재</option>
			<option value="pro14">예비부품</option>
			<option value="pro15">소모품</option>
		</select>
		<label for="warehouseName">창고명:</label>
		<select name="warehouse_name" id="warehouse_name">
			<option value="">--</option>
			<option value="마우스창고">마우스창고</option>
			<option value="키보드창고">키보드창고</option>
			<option value="모니터창고">모니터창고</option>
		</select>
		<label for="itemName">품명:</label>
		<input type="text" name="item_name" id="item_name" value="">
		<label for="itemCode">품목코드:</label>
		<input type="text" name="item_code" id="item_code" value="">
		
	</form> 
	<hr><br>

<div id="grid"></div>
  <script type="text/babel" class="code-js">
	var gridData=[];
    var grid = new tui.Grid({
      el: document.getElementById('grid'),
      data: gridData,
      scrollX: false,
      scrollY: false,
      columns: [
        {
          header: '회사코드',
          name: 'company_code'
        },
        {
          header: 'ITEM코드',
          name: 'item_code'
        },
        {
          header: '창고코드',
          name: 'warehouse_code'
        },
        {
          header: '구역코드',
          name: 'area_code'
        },
        {
          header: 'LOT번호',
          name: 'lot_no'
        },
        {
          header: 'ITEM타입',
          name: 'item_type'
        },
        {
          header: '창고이름',
          name: 'item_name'
        },
        {
          header: '규격',
          name: 'item_specification'
        },
        {
          header: '양품수량',
          name: 'pass_quantity'
        },
        {
          header: '불량수량',
          name: 'fail_quantity'
        },
        {
          header: '총수량',
          name: 'quantity'
        },
        {
          header: '재고상태',
          name: 'stock_status'
        }
      ]
    });
  </script>
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css"/>
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script>
$(document).ready(window.onload=function() {
  $('#searchBtn').click(function(event) {
    event.preventDefault(); // prevent form submission
    
    // get search parameters
//     var item_type = $('#item_type').val();
//     var warehouse_name = $('#warehouse_name').val();
//     var item_name = $('#item_name').val();
//     var item_code = $('#item_code').val();
    
    // make AJAX call to server
    $.ajax({
      url: '<%=request.getContextPath()%>/stockSearch',
      type: 'GET',
    //  dataType:'JSON'
//       data: {
//         item_type: item_type,
//         warehouse_name: warehouse_name,
//         item_name: item_name,
//         item_code: item_code
//       },
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
 	<form id="stockSearch" > 
	<input type="submit" value="searchBtn" id="searchBtn">
	<input type="reset" value="초기화">
 	<button>이동</button><br/><br/>
		<label for="itemType">품목구분</label>
		<select name="item_type" id="item_type">
			<option value="">--</option>
			<option value="pro1">제품</option>
			<option value="pro2">반제품</option>
			<option value="pro3">원자재</option>
			<option value="pro4">부자재</option>
			<option value="pro5">상품</option>
			<option value="pro6">기타</option>
			<option value="pro7">설비</option>
			<option value="pro8">설비예비부품</option>
			<option value="pro9">금형</option>
			<option value="pro10">금형예비부품</option>
			<option value="pro11">치공구</option>
			<option value="pro12">검사장비</option>
			<option value="pro13">소재</option>
			<option value="pro14">예비부품</option>
			<option value="pro15">소모품</option>
		</select>
		<label for="warehouseName">창고명:</label>
		<select name="warehouse_name" id="warehouse_name">
			<option value="">--</option>
			<option value="마우스창고">마우스창고</option>
			<option value="키보드창고">키보드창고</option>
			<option value="모니터창고">모니터창고</option>
		</select>
		<label for="itemName">품명:</label>
		<input type="text" name="item_name" id="item_name" value="">
		<label for="itemCode">품목코드:</label>
		<input type="text" name="item_code" id="item_code" value="">
		
	</form> 
	<hr><br>

<div id="grid"></div>
  <script type="text/babel" class="code-js">
	var gridData=[];
    var grid = new tui.Grid({
      el: document.getElementById('grid'),
      data: gridData,
      scrollX: false,
      scrollY: false,
      columns: [
        {
          header: '회사코드',
          name: 'company_code'
        },
        {
          header: 'ITEM코드',
          name: 'item_code'
        },
        {
          header: '창고코드',
          name: 'warehouse_code'
        },
        {
          header: '구역코드',
          name: 'area_code'
        },
        {
          header: 'LOT번호',
          name: 'lot_no'
        },
        {
          header: 'ITEM타입',
          name: 'item_type'
        },
        {
          header: '창고이름',
          name: 'item_name'
        },
        {
          header: '규격',
          name: 'item_specification'
        },
        {
          header: '양품수량',
          name: 'pass_quantity'
        },
        {
          header: '불량수량',
          name: 'fail_quantity'
        },
        {
          header: '총수량',
          name: 'quantity'
        },
        {
          header: '재고상태',
          name: 'stock_status'
        }
      ]
    });
  </script>
</body>
>>>>>>> refs/heads/master
</html>