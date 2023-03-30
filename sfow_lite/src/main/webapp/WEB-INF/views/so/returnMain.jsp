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
  

let openWin;

function openChild() {
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    
    let openUrl = ''
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open(openUrl, "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
}

/* 그리드객체명.on('click', (ev) => {
    const { rowKey } = grid1.getFocusedCell();
    const rowData = grid1.getRow(rowKey);
                      alert(rowData.그리드컬럼name);
}); */

//GRID 에 데이터를 입력한다.
/* const gridData  = [
	{
		out_status:'0',
		return_date:'2020-11-16',
		return_number:'230320-002',
		customer_code: 'C00000222',
		client_name: '(주)에이테크경주',
		memo: ''
	}
]; */

const grid = new tui.Grid({
    el: document.getElementById('grid'),
    data: {
      api: {
        readData: { url: '<%=request.getContextPath()%>/so/getReturnAdd', method: 'POST' }
      }
    },
    scrollX: false,
    scrollY: false,
    minBodyHeight: 30,
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
						{
							text: '저장',
							value: '0'
						},
						{
							text: '확정',
							value: '1'
						}
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
			name: 'customer_code',
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
} );


//조회 클릭했을때 받아오긴 함. 이걸 그리드에 어떻게 넣지?
$('#search').on("click", function(){
	alert('hi');
		$.ajax({
			type:'post',
			url:'<%=request.getContextPath()%>/so/getReturnAdd',
			success:function(data,status,xhr){
      	      let jsonInfo = JSON.parse(data);
    	      console.log(jsonInfo.test);
			},
			error:function(xhr,status,error){
				alert('에러');
			}
		}); //아작스 끝
});


//그리드 테이블 만들기
/* var grid = new tui.Grid( {
	el: document.getElementById('grid'),
	data:dataSource,
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
						{
							text: '저장',
							value: '0'
						},
						{
							text: '확정',
							value: '1'
						}
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
			name: 'customer_code',
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
} ); */

$('#search').on("click", function(){
	alert('hi2');
		$.ajax({
			type:'post',
			url:'<%=request.getContextPath()%>/so/getReturnAdd',
			success:function(reseult){
				console.dir(result);
				gride.resetDate(result);
				
	      	      /* let jsonInfo = JSON.parse(data);
	    	      console.log(jsonInfo.test); */
				
			},
			error:function(xhr,status,error){
				alert('에러');
			}
		}); //아작스 끝
});



}); // jQuery ready 끝

</script>
</head>
<body>
	<h1>반품관리</h1>
<!-- 그리드 이외의 input관련 넣어봐  -->
	<form action="${contextPath}/sfow/so/test" method="get">
	<input type="button" value="조회" id="search"   />
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