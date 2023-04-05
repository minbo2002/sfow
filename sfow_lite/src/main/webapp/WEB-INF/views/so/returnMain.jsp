<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/so/returnMain.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<title>고객반품등록</title>
<script>
$(document).ready(function() {
	
	 var grid = new tui.Grid({
	    	el: document.getElementById('grid'),
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
	                editor: {
	                    type: 'text',
	                    disabled: true
	                }
	    		},
	    		{
	    			header: '거래처코드',
	    			name: 'client_code',
	    			editor: {
	                    type: 'text',
	                    disabled: true
	                }
	    		},
	    		{
	    			header: '거래처명',
	    			name: 'client_name',
	                editor: {
	                    type: 'text',
	                    disabled: true
	                }
	    		},		{
	    			header: '비고',
	    			name: 'memo',
	    			editor: 'text'
	    		}
	    	]
	    	}); //그리드 테이블
	
	//전체 데이터 조회	    	
    $.ajax({
        url : "<%=request.getContextPath()%>/so/getReturnAdd",
        method :"POST",
        dataType : "JSON",
        contentType : "application/json; charset=utf-8",
        success : function(returnAdd){
            console.dir(returnAdd);
            grid.resetData(returnAdd);
        },
        error:function(returnAdd){
        	alert('에러');
        }
    
   }); //ajax끝
	
   //조회버튼 클릭시 데이트피커 val가져오기
   $('#search').on("click", function(){
       const date = $('#datepicker').val();
       loadDataByDate(date);
   });
   
   function loadDataByDate(date) {
       $.ajax({
           url: "<%=request.getContextPath()%>/so/getReturnAddByDate",
           method: "GET",
           dataType: "JSON",
           data: { return_date: date },
           success: function(returnAddbyDate){
               console.dir(returnAddbyDate);
               grid.resetData(returnAddbyDate);
           },
           error:function(returnAddbyDate){
               console.log(returnAddbyDate);
        	   alert('에러');
           }
       });
   }

   
   // 버튼을 클릭하면 테이블에 새로운 열을 추가합니다.
   $('#returnAddBtn').on("click", function() {
       grid.appendRow();
   });
   



   
   
}); //jQuery ready 끝

//데이트피커 설정
const datepickerConfig = {
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
    $("#datepicker").datepicker(datepickerConfig);
 });

</script>
</head>
<body>
	<h1>반품관리</h1>
	<div class="button-container">
    	<button id="save">
            <i class="fas fa-plus"></i>
            저장
        </button>
       <button id="search">
           <i class="fas fa-search"></i>
            조회
        </button>
	</div>
	<p>반품일자 :
	<input type="text" id="datepicker" readonly="readonly" >
	<hr/>
	<input type="button" value="행추가" id="returnAddBtn"/>
	<hr/>
	<!-- 그리드 삽입장소 -->
	<div id="grid"></div>
</body>
</html>