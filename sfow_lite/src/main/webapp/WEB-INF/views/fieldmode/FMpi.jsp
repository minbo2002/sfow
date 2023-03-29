<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>구매관리(필드모드)</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/js/tui-grid.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css"/>
		
<script>

//그리드
window.onload = function() {
	   var gridData=[];
	   var grid = new tui.Grid({
	       el: document.getElementById('grid'),
	       data: gridData,
	       scrollX: false,
	       scrollY: false,
	       rowHeaders: ['checkbox'],
	       
	    columns: [
	      {
	        header: '발주번호',	//헤더 제목
	        name: 'in_number',	//컬럼 이름
	        sortable: true,		//정렬 위아래로
	        editor: 'text',		//글씨 수정
	        align:'center', 	//텍스트 센터
	      },
	      {
	        header: '입고일자',
	        name: 'in_date',
	        sortable: true,
	        editor: 'text',
	        align:'center',
	      },
	      {
	        header: 'ITEM코드',
	        name: 'item_code',
	        sortable: true,
	        editor: 'text',
	        align:'center',
	      },
	      {
	        header: '품명',
	        name: 'item_name',
	        sortable: true,
	        editor: 'text',
	        align:'center',
	      },
	      {
	        header: '품번',
	        name: 'item_no',
	        sortable: true,
	        editor: 'text',
	        align:'center',
	      },
	      {
	        header: '규격',
	        name: 'item_specification',
	        sortable: true,
	        editor: 'text',
	        align:'center',
		  },
		  {
	        header: '재고단위',
	        name: 'item_stock_unit',
	        sortable: true,
	        editor: 'text',
	        align:'center',
		  }
	    ]
	  });//그리기 끝
	   
	   
	$.ajax({
		//전체 조회
		url : "${conPath}/FMpi/test", //컨트롤러url
		method : "GET",
		dataType : "JSON",
		success : function(data) {
			console.dir(data);
			grid.resetData(data);
			
			//수정
			grid.on('editingFinish', function(ev) {
	            const rowKey = ev.rowKey;
	            const columnName = ev.columnName;
	            var updatedData = {};
	            const rowData = grid.getRow(rowKey);
	            console.log('Row data: ', rowData);
	            
	     	   $.ajax({
	    	       url: '${conPath}/updateFMpi',
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
};

</script>

<style>

.right-btn-group{
    /* border: 1px solid red; */
    display: flex;
}
.editer-content{
     /* border: 1px solid red; */
     display: flex;
    padding: 1rem 1rem;
    border-radius: 10px;
    background: #F8F8F8;
    margin-top: 0.5rem;
        }

.right-tap-btn{
    height: 45px;
    font-size: 1.8em;
    text-align: center;
    margin-right: 4px;
    border: 1px solid #D6DAE2;
    border-radius: 5px;
    font-size: 0.875rem;
    display: -webkit-inline-box;
    display: -ms-inline-flexbox;
    display: inline-flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    height: 2rem;
    padding: 0 0.75rem;
    font-weight: 500;
    color: #636363;
}

.footer_form{
    display: inline;
    width: 95%;
    font-size: 1.2em;
    text-align: center;
    background-color: #F8F8F8!important;
    /* border: none!important; */
    border-width: 1px 0px 0px 0px;
    border-color: #e6e6e6!important;
    border-style: solid;
}

.footer_btn1{
    background: linear-gradient(to right, rgb(19, 78, 94), rgb(113, 178, 128));
    display: inline-block;
 
}
.footer_btn2{
    background: linear-gradient(to right, rgb(229, 57, 53), rgb(227, 93, 91));
    display: inline-block;
 
}

</style>		
</head>
<body>

	<div class="file-title" style="margin: 20px;">
        <div class="right-btn-group">
            <div class="right-tap-btn" id="search_btn">조회</div>
            <div class="right-tap-btn" id="search_btn">초기화</div>
            <div class="right-tap-btn" id="search_btn">구매발주조회</div>
            <div class="right-tap-btn" id="search_btn">입고등록</div>
        </div>
    </div>
    
    <div class="right-content">
        <div class="editer-content">
                       <div>
                <div >
                    발주번호 검색<input type="text" style="margin: 8px;">
                </div>
                <div>
                    품목검색<input type="text" style="margin: 8px;">
                </div>
            </div>
            <div>
                <div>
                    입고일자<input type="text" style="margin: 8px;">
                </div>
                <div>
                    창고선택<input type="text" style="margin: 8px;">
                </div>
            </div>
        </div>
     </div>
     
	<!-- 그리드 화면 -->
 <div id="grid"></div>
 
  <!-- footer -->
    <div class="footer" style="display: inline">
        <div class="footer_title">작업자
            <div class="footer_form">
                <input type="text" id="footer_form" placeholder="관리자" >
            </div>
            <div class="footer_btn" style="display: inline">
                <button class="footer_btn1">입고등록</button>
                <button class="footer_btn2">취소</button>
            </div>
        </div>
    </div>
</body>
</html>