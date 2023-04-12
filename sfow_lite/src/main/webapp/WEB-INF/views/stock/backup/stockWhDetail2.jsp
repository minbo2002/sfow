<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창고별 재고현황</title>
		
</head>
 <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script>

	function checkstock(){
		   // make AJAX call to server
	    $.ajax({
	      type:"POST", //요청방식 .
	      url: '<%=request.getContextPath()%>/stockSearch',
	  	      success: function(data) {
	  	    	  
	  	    	$('#tableBody').empty();
	  	     	 $.each(data, function(index, result) {
	    	      	
	    	    	var newRow = '<tr>' +
	    	          '<td>' + result.company_code + '</td>' +
	    	          '<td>' + result.item_code + '</td>' +
	    	          '<td>' + result.warehouse_code + '</td>' +
	    	          '<td>' + result.area_code + '</td>' +
	    	          '<td>' + result.lot_no + '</td>' +
	    	          '<td>' + result.item_type + '</td>' +
	    	          '<td>' + result.item_name + '</td>' +
	    	          '<td>' + result.warehouse_name + '</td>' +
	    	          '<td>' + result.item_specification + '</td>' +
	    	          '<td>' + result.pass_quantity + '</td>' +
	    	          '<td>' + result.fail_quantity + '</td>' +
	    	          '<td>' + result.quantity + '</td>' +
	    	          '<td>' + result.stock_status + '</td>' +
	    	          '</tr>';  
	    	      $('#tableBody').append(newRow);
	    	    });

	    	    
	    	  },
	      error: function(xhr, status, error) {
	        // handle error
	        console.log(error);
	      }
	    });

	};
	    
	 

		







</script>

<style>
	th {
		width: 1150px;
 	    margin-left: auto; 
 	    margin-right: auto; 
/* 		border: 1px solid black; */
  	    text-align: center;
  	    height:50px;
	}
	tr:hover {
	background-color: #dcdcdc;
	text-align:center;
	height:50px;
	}
	
	.form-title{
	width : 100px;
	height: 30px;
	background-color: #e2e2e2;
	border:1px solid #e2e2e2;
	text-align:center;
/* 	vertical-align: middle; */
	line-height : 30px;
	border-radius:3px;
	display:inline-block;
	}
	
	.form-data{
	width : 200px;
	height: 30px;
	background-color: rgb(230, 242, 255)
	text-align:center;
/* 	vertical-align: middle; */
	line-height : 30px;
	border-radius:3px;
	border:1px solid #e2e2e2;
	display:inline-block;
	}
	
	.total {
	width:1600px;
	}
	
	.item {
	height:50px;
	}
	
	.result {
	height:40px;
	font-size:13px;
	}
	
	
	
</style>

<body>
<h3>창고별 재고현황</h3>
	<form id=stockSearch name=stockSearch action="<%=request.getContextPath()%>/stockSearch" method="post">
<!-- 		<div class=form-title></div><div><input type="text" id="tSearch" name="tSearch" /></div> -->
<!-- 		<input type="submit" value="조회" id="searchStockList"/> -->
		<input type="button" value="조회" onclick="checkstock()">
		<input type="reset" value="초기화" id="reset"/>
	</form>
<br/><br/>
<!-- <input type="button" value="창고 검색" style="border:1px solid #e2e2e2;" /> -->
<!-- <div class="form-title" style="display: inline-block;">창고 검색</div> -->
<div style="display:inline-block; margin:5px;"><div class="form-title" >창고 검색</div><div class="form-data" style="background-color: rgb(230, 242, 255);"><input type="text"  style="border:none; height:25px; width:190px; background-color: rgb(230, 242, 255);"></div></div>

<div style="display:inline-block; margin:5px;"><div class="form-title" >창고명</div><div class="form-data"><input type="text"  style="border:none; height:25px; width:190px;"></div></div>

<div style="display:inline-block; margin:5px;"><div class="form-title" >LOT번호</div><div class="form-data"><input type="text"  style="border:none; height:25px; width:190px;"></div></div>

<div style="display:inline-block; margin:5px;"><div class="form-title" >품목구분</div><div class="form-data"><select name="choice" id="choice" style="border:none; height:25px; width:200px;"> 
    <option value="--" 				<c:if test="${choice == ''}">selected</c:if>>--</option>
    <option value="item" 			<c:if test="${choice == 'item'}">selected</c:if>>제품</option>
    <option value="hitem" 		<c:if test="${choice == 'hitem'}">selected</c:if>>반제품</option>
    <option value="material" 	<c:if test="${choice == 'material'}">selected</c:if>>원자재</option>
    <option value="goods" 		<c:if test="${choice == 'goods'}">selected</c:if>>상품</option>
    <option value="etc" 			<c:if test="${choice == 'etc'}">selected</c:if>>기타</option>
</select></div></div>

<div style="display:inline-block; margin:5px;"><div class="form-title" >ITEM코드</div><div class="form-data"><input type="text"  style="border:none; height:25px; width:190px;"></div></div>

<div style="display:inline-block; margin:5px;"><div class="form-title" >품명</div><div class="form-data"><input type="text"  style="border:none; height:25px; width:190px;"></div></div>

<div style="display:inline-block; margin:5px;"><div class="form-title" >품번</div><div class="form-data"><input type="text"  style="border:none; height:25px; width:190px;"></div></div>
<br/>
<hr/>
<br/>
<table class="total" id = "total" border=1 style="margin:0 auto;  text-align: center;">
	<thead>
	<tr class="item" style="background-color:steelblue; color:white;">
		<th>회사코드</th>
		<th>ITEM코드</th>
		<th>창고코드</th>
		<th>구역코드</th>
		<th>LOT번호</th>
		<th>ITEM타입</th>
		<th>품명</th>
		<th>창고이름</th>
		<th>규격</th>
		<th>양품수량</th>
		<th>불량수량</th>
		<th>총수량</th>
		<th>재고상태</th>
	</tr>
	</thead>
	<tbody id="tableBody">
<%-- 	<c:forEach var="list" items="${results}"> --%>
<!-- 	<tr class="result"> -->
<%-- 		<td><c:out value="${list.company_code}"/></td> --%>
<%-- 		<td><c:out value="${list.item_code}"/></td> --%>
<%-- 		<td><c:out value="${list.warehouse_code}"/></td> --%>
<%-- 		<td><c:out value="${list.area_code}"/></td> --%>
<%-- 		<td><c:out value="${list.lot_no}"/></td> --%>
<%-- 		<td><c:out value="${list.item_type}"/></td> --%>
<%-- 		<td><c:out value="${list.item_name}"/></td> --%>
<%-- 		<td><c:out value="${list.warehouse_name}"/></td> --%>
<%-- 		<td><c:out value="${list.item_specification}"/></td> --%>
<%-- 		<td><c:out value="${list.pass_quantity}"/></td> --%>
<%-- 		<td><c:out value="${list.fail_quantity}"/></td> --%>
<%-- 		<td><c:out value="${list.quantity}"/></td> --%>
<%-- 		<td><c:out value="${list.stock_status}"/></td> --%>
	
<!-- 	</tr> -->
<%-- 	</c:forEach> --%>
	</tbody>

</table>



</body>
</html>