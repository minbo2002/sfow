<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
h4{
	margin: 1%;
	color: black;
}

p {
    margin-bottom: 10px;
    color: black;
    margin-left: 1%;
}

#grid{
	margin: 1%;
}

.custom-button {
    background-color: rgba(051, 51, 102, 1);
    font-weight: bolder;
    color: #fff;
    border: none;
    height: 35px;
    min-width: 80px;
	font-size: 13px;
	border-radius: 4px;
	display: inline-block;
}

#search:hover {
  background-color: rgba(051, 102, 204, 1);
  opacity: 0.8;
}

</style>
<title>반품 현황</title>
<script type="text/javascript">
$(document).ready(function() {
	
	var grid = new tui.Grid({
    	el: document.getElementById('grid'),
        scrollX: true,
        scrollY: false,
        rowHeaders: ['rowNum'],
        columns: [
            { header : '입고번호', name: 'return_number', align: 'center', sortable: true, width:150, editor: false},
            { header : '거래처코드', name: 'client_code', align: 'center', sortable: true, width:80, editor: false},
            { header : '거래처명', name: 'client_name', align: 'center', sortable: true, width:80, editor: false},
            { header : '입고일자', name: 'receive_date', align: 'center', sortable: true, width:150, editor: false},
            { header : '아이템코드', name: 'item_code', align: 'center', sortable: true, width:150, editor: false},
            { header : '품번', name: 'item_no', align: 'center', sortable: true, width:100, editor: false},
            { header : '품명', name: 'item_name', align: 'center', sortable: true, width:150, editor: false},
            { header : '품목유형', name: 'item_type', align: 'center', sortable: true, width:150, editor: false},
            { header : '규격', name: 'item_specification', align: 'center', sortable: true, width:220, editor: false},
            { header : '수량', name: 'item_quantity', align: 'center', sortable: true, width:50, editor: false},
            { header : 'LOT번호', name: 'lot_number', align: 'center', sortable: true, width:150, editor: false},
            { header : '비고', name: 'memo', align: 'center', sortable: true, editor: false},
    	]
    	}); //그리드 테이블
	
    	//반품확정 조회	    	
        $.ajax({
            url : "<%=request.getContextPath()%>/so/getReturnInfo",
            method :"GET",
            dataType : "JSON",
            contentType : "application/json; charset=utf-8",
            success : function(result){
                console.dir(result);
                grid.resetData(result);
            },
	        error: function(xhr, status, errorThrown) {
	            console.log('Error occurred:', status, errorThrown);
	            alert('에러');
	        }
        
       }); //ajax끝

}); //jQuery 끝
</script>
</head>
<body>
	<h4>반품현황</h4>
	
<p>거래처명 :
<input type="text" id="datepicker" readonly="readonly" height="35px" >
<button type="button" id="search" class="custom-button">
<i class="fa fa-search"></i> 조회</button>

<hr/>
<div id="grid"></div>


</body>
</html>