<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<title>고객반품등록</title>
<script>
$(document).ready(function() {
	$('#search').on("click", function(){
		event.preventDefault();
		
	$.ajax({
		url : "<%=request.getContextPath()%>/so/getReturnAdd",
		method : "POST",
		dataType : "JSON",
		contentType : "application/json; charset=utf-8",
		success : function (returnAdd) {
			/* console.dir(returnAdd); */
			grid.resetData(returnAdd);  // result를 배열로 받는다
		},
		error:function(returnAdd){
			alert('에러');
			console.log(returnAdd);
		}
	}); //아작스 끝
	
  }); //버튼이벤트 끝
	
	
	$('#returnAddBtn').on("click", function(){
		grid.appendRow();
	}); //그리드 추가

	grid.on("click", function(){
	let rowkey = grid.getFocusedCell();
	console.log(rowkey);
	
	
	});
	
}); // jQuery ready 끝


</script>
</head>
<body>
	<h1>반품관리</h1>
<!-- 그리드 이외의 input관련 넣어봐  -->
	<form action="${contextPath}/sfow/so/test" method="get">
	<input type="button" value="조회" id="search"/>
	<input type="submit" value="저장" id="save"/>
	<input type="button" value="삭제" id="delete"/>
	<input type="reset" value="초기화" id="reset"/>
	<input type="button" value="반입확정" id="returnConfirm"/>
	<input type="button" value="확정취소" id="returnCancle"/>
	<hr><br>
	<p>반품일자 :
	<input type="text" id="datepicker" readonly="readonly" >
	</p>
	<p>거래처코드 :
	<input type="text" id="serchCustomerCode" readonly="readonly" onclick="openChild()">
	</p>
	<hr/>
	
	<input type="button" value="행추가" id="returnAddBtn"/>
	<hr/>
	<div id="grid"></div>

	</form>

<script>

	//그리드 관련 스크립트 넣어봐
var gridData = [];
var grid = new tui.Grid({
	el: document.getElementById('grid'),
    data: gridData,
    scrollX: false,
    scrollY: false,
    rowHeaders: ['rowNum'],
    columns: [
		{
			header: '상태',
			name: 'out_status',
			formatter: 'listItemText',
			editor: {
				type: 'select',
				options: {
					listItems: [
						{text: '저장',value: '0'},
						{text: '확정',value: '1'}
					]
				}
			}
		},
		{
			header: '반품일자',
			name: 'return_date',
	          editor: {
	        	  type: 'datePicker',
	              options: {
	                format: 'yyyy-MM-dd'
	              }
	          }
		},
		{
			header: '입고번호',
			name: 'return_number',
			editor: 'text'
		},
		{
			header: '거래처코드',
			name: 'client_code',
			editor: 'text'
		},
		{
			header: '거래처명',
			name: 'client_name',
			editor: 'text'
		},		{
			header: '비고',
			name: 'memo',
			editor: 'text'
		}
	]
	});
	
//데이트피커 설정
const config = {
		dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    yearSuffix: '년',
        changeMonth: true,
        changeYear: true
};

//반품일자 jQuery 데이트피커
$( function() {
    $( "#datepicker" ).datepicker(config);
 });
	
    </script>
</body>
</html>