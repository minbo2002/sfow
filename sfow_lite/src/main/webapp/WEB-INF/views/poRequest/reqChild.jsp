<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="conPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

 $(document).ready(function() {
	 
	 const grid = new tui.Grid({
		    el: document.getElementById('grid'),
		    columns: [
		        { header: 'ITEM코드', name: 'item_code' },
		        { header: '품명', name: 'item_name' },
		        { header: '품번', name: 'item_no' },
		        { header: '재고단위', name: 'item_stock_unit' },
		        { header: '단가', name: 'buy_price' }
		    ]
		});
	 
	 function loadGridData() {
		    $.ajax({
		        url: "${conPath}/reqItem", // 실제 데이터를 가져올 URL
		        method: 'GET',
		        dataType : "JSON",
		        success: function(result) {
		        	console.dir(result);
		        	grid.resetData(result);
		        },
		        error: function(xhr, status, errorThrown) {
		            console.log('Error occurred:', status, errorThrown);
		            alert('에러');
		        }
		    });
		}
		
		loadGridData();
		
		$('#confirmBtn').on('click', function() {
		    const selectedRow = grid.getRow(grid.getFocusedCell().rowKey);
		    window.opener.postMessage(selectedRow, '*');
		    window.close();
		});
		
	});
  	
 	</script>
 	
</head>
<title>ITEM</title>

<body>
	<div id="grid"></div>
	<button id="confirmBtn">선택</button>
</body>
</html>