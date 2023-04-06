<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목유형 코드등록</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="<%=request.getContextPath()%>/resources/css/main/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script>

window.onload = function(){
	
	const Grid = tui.Grid;
	const grid = new Grid({
		
		el: document.getElementById('grid'),
        scrollX: true,
        scrollY: true,
       
        rowHeaders: [
	      { type: 'rowNum', align: 'center'},
    	  { type: 'checkbox' }
        ],
        columns: [
          {
            header: '품목유형',
            name: 'item_type',
            align: 'center',
            editor:'text'
          }
        ]
      });
	
	$.ajax({
        url : './typeSelectAjax',
        method :'GET',
        dataType : 'JSON',
        success : function(result){
            grid.resetData(result);
             } //success끝 
          }); //typeSelectAjax끝
          
          grid.on('check', function(ev) {	
		      
			const rowKey = ev.rowKey;
          	const columnName = ev.columnName;
          	const rowData = grid.getRow(rowKey);
    		
          	console.log('check!', ev);
          	console.log('check!', columnName);
    		console.log('check!', rowData);
    		console.log('check!', rowData.item_type);

    		  Array.prototype.forEach.call(document.querySelectorAll('#subBtn'), el => {
			      el.addEventListener('click', ev => {  
			    	
			    	 //$("item_type", opener.document).val(rowData.item_category);
			    	 //opener.grid.setColumnValues('item_type',rowData.item_category,false);
			    	 //opener.document.getElementById("grid").value = rowData.item_category;
    				 console.log('opener!', opener.rowData);
			    	 //opener.document.getElementById("item_type").value = rowData.item_category;
			    	 window.close();
			    	 
			    	  //opener.rowData.value = rowData.item_category;  
		          }); //addEventListener끝
		    	}); //subBtn 끝
			    	  
   	}); //grid.on('check')끝    
   	
          grid.on('click', function(ev) {
				
			const rowKey = ev.rowKey;
        	const columnName = ev.columnName;
        	const rowData = grid.getRow(rowKey);
        	
        	$('input[name=item_type]').attr('value',rowData.item_type);
			});
			
			 Array.prototype.forEach.call(document.querySelectorAll('#searchBtn'), el => {   
	           	 el.addEventListener('click', ev => {
	           		 
	           var item_type = $("#search_area input[name='item_type']").val();
	           		           
	           console.log('item_type:', item_type);
	           
	           $.ajax({
	       		type: 'POST',
	       		dataType: 'JSON',
	       		url: './typeSelectSearchAjax',
	       		contentType: 'application/json',
	       	    data: JSON.stringify({	
	       	    	"item_type": item_type
	       	        }),
	       		success: function(data) {
	       			 gridData=data
	       	         grid.resetData(data)      
	               	},
	               error: function(error) {
	                   console.log('Error:', error);
	               	}
	           });	         
	           	 });
	           });			
	
};


</script>
<body>
<div>
<br>
<div id="search_area">
	<input type="text" id="item_type" name="item_type" value="">
	<button type="submit" id="searchBtn">조회</button>
</div>
<br/>
<div id="grid"></div>
</div>
<button onClick='self.close()'>닫기</button>
<button onClick='reset()'>초기화</button>
<button id="subBtn">적용</button>
<script>
</script>
</body>
</html>