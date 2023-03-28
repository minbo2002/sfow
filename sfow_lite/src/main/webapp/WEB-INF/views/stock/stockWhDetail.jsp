<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창고별 재고현황</title>
</head>
	<script>
		var gridData=[];
	    var grid = new tui.Grid({
	      el: document.getElementById('grid'),
	      data: gridData,
	      scrollX: false,
	      scrollY: false,
	      rowHeaders: [{
              type: 'rowNum',
              header: "  ",
              width: 50,
          },{type : 'checkbox'}     ],
	      columns: [
	        {
	          header: '회사코드',
	          name: 'company_code',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: 'ITEM코드',
	          name: 'item_code',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: '창고코드',
	          name: 'warehouse_code',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: '구역코드',
	          name: 'area_code',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: 'LOT번호',
	          name: 'lot_no',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: 'ITEM타입',
	          name: 'item_type',
	          sortable: true,
	          align:'center'
	        },
	        {
		       header: '품명',
		       name: 'item_name',
		       sortable: true,
		       align:'center'
		      },
	        {
	          header: '창고이름',
	          name: 'warehouse_name',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: '규격',
	          name: 'item_specification',
	          sortable: true,
	          align:'center'
	        },
	        {
	          header: '양품수량',
	          name: 'pass_quantity',
	          sortable: true,
	          editor:'text',
	          align:'center'
	          
	        },
	        {
	          header: '불량수량',
	          name: 'fail_quantity',
	          sortable: true,
	          editor:'text',
	          align:'center'
	        },
	        {
	          header: '총수량',
	          name: 'quantity',
	          sortable: true,
	          editor:'text',
	          align:'center'
	        },
	        {
	          header: '재고상태',
	          name: 'stock_status',
	          sortable: true,
	          align:'center'
	        }
	      ]
	    });
	    
	    /*
	    grid.on('check', (ev) => {
	    	var warehousename = document.getElementById('warehousename');
	    	var test = gridData[0].warehouse_name;
	    	warehousename.innerText=test;
	    	const rowKey = ev.rowKey;
	    	const rowData = grid.getRow(rowKey);
			alert(gridData[0]);
			alert(rowData);
	    	alert(gridData[0].warehouse_name);
	    	
	    	});*/

	    	//checkbox 체크 시에 input 태그에 해당 value 출력 (추가수정 필요 checkbox 2개 check 시에 박스안에 data clear)
    	   	grid.on('check', function(ev) {
	            const rowKey = ev.rowKey;
	            const columnName = ev.columnName;
	            var updatedData = {};
	            const rowData = grid.getRow(rowKey);
	            console.log('Row data: ', rowData);
		    	var warehousename = document.getElementById('warehousename');
		    	var lotno = document.getElementById('lotno');
		    	var itemtype = document.getElementById('itemtype');
		    	var itemcode = document.getElementById('itemcode');
		    	var itemname = document.getElementById('itemname');
		    	var test1 =rowData.warehouse_name;
		    	var test2 =rowData.lot_no;
		    	var test3 =rowData.item_type;
		    	var test4 =rowData.item_code;
		    	var test5 =rowData.item_name;
		    	//alert(rowData.warehouse_name);
		    	//warehousename.innerText=test;
		    	warehousename.value=test1;
		    	lotno.value=test2;
		    	itemtype.value=test3;
		    	itemcode.value=test4;
		    	itemname.value=test5;
	    	   	});
	    	
	    	//checkbox 체크 해제 시에 input 태그 내에 해당 value 제거 & 다중 선택 시에 input 태그 내에 value 제거
	    	grid.on('uncheck', (ev) => {
	    		var warehousename = document.getElementById('warehousename');
		    	var lotno = document.getElementById('lotno');
		    	var itemtype = document.getElementById('itemtype');
		    	var itemcode = document.getElementById('itemcode');
		    	var itemname = document.getElementById('itemname');
		       	//warehousename.innerText="";
	    		warehousename.value="";
		    	lotno.value="";
		    	itemtype.value="--";
		    	itemcode.value="";
		    	itemname.value="";
	    		
	    	});
	    	

// 	    	function checkstock(){
// 	 		   // make AJAX call to server
// 	 	    $.ajax({
// 	 	      type:"GET", //요청방식 
// 	 	      dataType:"JSON",
<%-- 	 	      url: '<%=request.getContextPath()%>/search', --%>
// 	 	  	      success: function(data) {
// 	 		    	    console.dir(data)
// 	 	  	    	    gridData=data;
// 	 	 	  	     	grid.resetData(data);

// 	 	    	  },
// 	 	      error: function(xhr, status, error) {
// 	 	        // handle error
// 	 	        console.log(error);
// 	 	      }
// 	 	    });

// 	 	};
	    	
	    	
	//function checkstock(){
		   // make AJAX call to server
	    $.ajax({
	      type:"POST", //요청방식 
	      dataType:"JSON",
	      url: '<%=request.getContextPath()%>/search',
	  	      success: function(data) {
	      	 	gridData=data
	    	  	grid.resetData(data)
	    	   	
	    	   	grid.on('editingFinish', function(ev) {
	            const rowKey = ev.rowKey;
	            const columnName = ev.columnName;
	            var updatedData = {};
	            const rowData = grid.getRow(rowKey);
	            console.log('Row data: ', rowData);
	            //alert(rowData);
	            
	            $.ajax({
	                 url: '<%=request.getContextPath()%>/updateStock',
	                 method: 'PATCH',
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

	function checkstock(){
		   
		   
	};
	    
</script>

<style>
/*  	th { */
/*  		width: 1150px; */
/*   	    margin-left: auto; */
/*   	    margin-right: auto; */
/*  		border: 1px solid black; */
/*    	    text-align: center; */
/*    	    height:50px; 	 */
/*    	    }  */
/* 	 tr:hover {  */
/* 	 	background-color: #dcdcdc; */
/* 	 	text-align:center; */
/* 	 	height:50px; */
/* 	 	}  */
		
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
	
/* 	.total { */
/* 	width:1600px; */
/* 	} */
	
/* 	.item { */
/* 	height:50px; */
/* 	} */
	
/* 	.result { */
/* 	height:40px; */
/* 	font-size:13px; */
/* 	} */
	
	
	
</style>


<body>
<%-- 	<form id=stockSearch name=stockSearch action="<%=request.getContextPath()%>/stockSearch" method="post"> --%>
	<form id=stockSearch name=stockSearch >
<!-- 		<div class=form-title></div><div><input type="text" id="tSearch" name="tSearch" /></div> -->
<!-- 		<input type="submit" value="조회" id="searchStockList"/> -->
		&nbsp;<button type="button" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;" onclick="checkstock()"><img src="<%=request.getContextPath()%>/resources\img\stock\lens.png" width="11px"/>&nbsp;&nbsp;조회</button>&nbsp;
					<button type="reset" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px;" style="font-size:15px; color:black;"><img src="<%=request.getContextPath()%>/resources\img\stock\reset.png" width="11px"/>&nbsp;&nbsp;초기화</button>

<br/><br/>
<!-- <input type="button" value="창고 검색" style="border:1px solid #e2e2e2;" /> -->
<!-- <div class="form-title" style="display: inline-block;">창고 검색</div> -->
<div style="display:inline-block; margin:5px; font-size:13px; color:black;">
<input type="text" class="form-title" value="창고검색" disabled/><input type="text" class="form-data" id ="" name="" style="background-color: rgb(230, 242, 255);"/></div>
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >창고검색</div><div class="form-data" style="background-color: rgb(230, 242, 255);"><input type="text"  style="border:none; height:25px; width:190px; background-color: rgb(230, 242, 255);"></div></div> -->

<%-- <button type="button" class="form-title" style="background-color: rgb(230, 242, 255);"><img src="<%=request.getContextPath()%>/resources\img\stock\lens.png" width="11px" /><input type="text" class="form-data" id ="" name="" style="background-color: rgb(230, 242, 255);"/></button> --%>



<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="창고이름" disabled/><input type="text" class="form-data" id ="warehousename" name="warehousename"/></div>
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >창고명</div><div class="form-data" id ="warehousename"><input type="text"  style="border:none; height:25px; width:190px;" ></div></div> -->
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >창고명</div><div class="form-data" id ="warehousename" contenteditable="true" style="background-color:white; word-wrap:normal; white-space: pre-wrap; width:200px;"></div></div> -->

<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="LOT번호" disabled/><input type="text" class="form-data" id ="lotno" name="lotno"/></div>
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >LOT번호</div><div class="form-data"><input type="text"  style="border:none; height:25px; width:190px;"></div></div> -->

<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="품목구분" disabled/><select name="choice"  class="form-data" id="itemtype">
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >품목구분</div><div class="form-data"><select name="choice" id="choice" style="border:none; height:25px; width:200px;">  -->
    <option value="--" 				<c:if test="${choice == ''}">selected</c:if>>--</option>
    <option value="item" 			<c:if test="${choice == 'item'}">selected</c:if>>제품</option>
    <option value="hitem" 		<c:if test="${choice == 'hitem'}">selected</c:if>>반제품</option>
    <option value="material" 	<c:if test="${choice == 'material'}">selected</c:if>>원자재</option>
    <option value="goods" 		<c:if test="${choice == 'goods'}">selected</c:if>>상품</option>
    <option value="etc" 			<c:if test="${choice == 'etc'}">selected</c:if>>기타</option>
</select></div>

<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="ITEM코드" disabled/><input type="text" class="form-data" id ="itemcode" name="itemcode"/></div>
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >ITEM코드</div><div class="form-data"><input type="text"  style="border:none; height:25px; width:190px;"></div></div> -->

<div style="display:inline-block; margin:5px; font-size:13px; color:black;"><input type="text" class="form-title" value="품명" disabled/><input type="text" class="form-data" id ="itemname" name="itemname"/></div>
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >품명</div><div class="form-data"><input type="text"  style="border:none; height:25px; width:190px;"></div></div> -->

<!-- <div style="display:inline-block; margin:5px;"><input type="text" class="form-title" value="품번" disabled/><input type="text" class="form-data" id ="" name=""/></div> -->
<!-- <div style="display:inline-block; margin:5px;"><div class="form-title" >품번</div><div class="form-data"><input type="text"  style="border:none; height:25px; width:190px;"></div></div> -->
</form>
	<br/>
	<hr/>
<h6 style="color:black; font-weight:bold; font-size:15px;">&nbsp;창고별 재고현황</h6>
	
<div id="grid"></div>





</body>
</html>