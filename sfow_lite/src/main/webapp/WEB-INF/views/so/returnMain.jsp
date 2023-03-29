<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<title>고객반품등록</title>
<script>
$(document).ready(function() {


	
	//아작스 datepicker
	
	//조회버튼 클릭이벤트
	//저장버튼 클릭이벤트
	//삭제버튼 클릭이벤트
	//초기화버튼 클릭이벤트
	//반입확정버튼 클릭이벤트
	//확정취소버튼 클릭이벤트
	//반품일자버튼 클릭이벤트

    
    // 아작스 호출



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

$( function() {
    $( "#datepicker" ).datepicker(config);
 });
  




}); // jQuery ready 끝
  
  
let openWin;

function openChild() {
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    
    let openUrl = ''
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open(openUrl, "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
}

var grid = new tui.Grid( {
	el: document.getElementById('grid'),
	columns: [
		{
			header: '이름',
			name: 'name'
		},
		{
			header: '나이',
			name: 'value',
			editor: 'text'
		}
	]
} );

// GRID 에 데이터를 입력한다.
var arrData = [
	{
		name: '홍길동',
		value: '20세'
	},
	{
		name: '이지연',
		value: '26세'
	}
];

grid.resetData( arrData );


</script>
</head>
<body>
	<h1>반품관리</h1>
<!-- 그리드 이외의 input관련 넣어봐  -->
	<form action="">
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
	
	
	<div id="grid"></div>

	
	
	</form>
	

<div id="grid"></div>
    <script>
	//그리드 관련 스크립트 넣어봐
    </script>
</body>
</html>