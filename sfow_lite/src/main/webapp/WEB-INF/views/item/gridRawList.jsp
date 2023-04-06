<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목등록(원자재)</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="/resources/js/tui-grid.js"></script>




<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css"/>
</head>


<body>
	


 	<div>		
        <div class="form-title">
		
            	
            	<div class="form-title-btn">ITEM코드</div><input type="text" style="margin-right: 20px; margin-left:20px; " placeholder='자동완성';>
              	<div class="form-title-btn">품명</div><input type="text" style="margin-right: 20px; margin-left:20px;">
              	<div class="form-title-btn">품번</div><input type="text" style="margin-right: 20px; margin-left:20px; ">
              	<div class="form-title-btn">규격</div><input type="text" style="margin-right: 20px; margin-left:20px; ">
    </div>
</div>



<font size='7px';>기준정보</font>
  <div id="grid">
				<button id="searchBtn">조회</button>
				<button id="addRowBtn">+</button>
				<button  type="button" id="delRowBtn" onclick="deleteRow()">-(DB삭제)</button>
				<button id="updateRowBtn">저장</button>
				<button id="savebtn">저장2</button>
				<button id="resetRow">초기화</button> 
  </div>

</body>
<script>

	var newRowData ="";
	var gridData=[]; 
	var grid = new tui.Grid({
	el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: false,
		data:gridData,
	    rowHeaders: ['checkbox','rowNum'],

	columns: [
    { header: 'Item코드'	 , name: 'itemCode'			, sortable: true, editor: 'text' ,align:'center' },	    	
    { header: '품명'	 	 , name: 'itemName'			, sortable: true, editor: 'text' ,align:'center' },
    { header: '품목번호'	 , name: 'itemNo'			, sortable: true, editor: 'text' ,align:'center' },
    { header: '유형',
      name: 'itemType',
      sortable: true,
      editor: {type: 'select',
    	  options: {
              listItems: [
                  {text: '제품', value: "제품"},
                  {text: '반제품', value: "반제품"},
                  {text: '원제품', value: "원제품"}
                  
             			 ] 
      				}
      }
      ,align:'center' },
    { header: '규격'	 	 , name: 'itemSpecification', sortable: true, editor: 'text' ,align:'center' },
    
    { header: '거래처명' 	 , name: 'clientName' 		, sortable: true, editor: 'text' ,align:'center' },
    { header: '매입단가'	 , name: 'buyPrice' 		, sortable: true, editor: 'text' ,align:'right'  },
	{ header: '매출단가'	 , name: 'salesPrice'		, sortable: true, editor: 'text' ,align:'right'  },
	{ header: '입고창고' 	 , name: 'warehouseCode' 	, sortable: true, editor: 'text' ,align:'center' },
	{ header: '창고명' 	 , name: 'warehouseName' 	, sortable: true, editor: 'text' ,align:'center' },
	{ header: '비고'		 , name: 'memo'				, sortable: true, editor: 'text' ,align:'center' },
	{ header: '사용여부',
	  name: 'useyn', 
	  sortable: true ,
	  editor: {type: 'select',
    	  options: {
              listItems: [
                  {text: 'Y', value: "Y"},
                  {text: 'N', value: "N"},
             			 ] 
      				}
      		   }
	  },
	{ header: '등록일자'	 , name: 'createdate'		, sortable: true, 				  align:'center' },
	{ header: '수정일자'	 , name: 'updatedate'		, sortable: true, 				  align:'center' }
	  	  
	]
	
	});
	

	// 목록 조회
	
	$.ajax({
		url : "toastRawDataList",		//toastDataList
		method :"GET",
		dataType : "JSON",
		success : function(result) {
			console.dir(result);
			grid.resetData(result);
		}
	});
	
	/*아래부터 버튼*/
	
	//목록 조회 버튼
	$('#searchBtn').on('click', function() { 
	$.ajax({
		url : "toastRawDataList",		//toastDataList
		method :"GET",
		dataType : "JSON",
		success : function(result) {
			console.dir(result);
			grid.resetData(result);
		}
	});
	});	
	
	//초기화 버튼

	var resetRow = document.getElementById('resetRow');
	resetRow.addEventListener('click', function() {
		var confirmMsg = `초기화 하시겠습니까?`;
		if(confirm(confirmMsg))
			grid.clear();
	});
	
	// 행 추가 버튼
	var addRowBtn = document.getElementById('addRowBtn');
	addRowBtn.addEventListener('click', function() {
  	var newRowData = {
    itemCode: '',
    itemName: '',
    itemNo: '',
    itemType: '',
    itemSpecification: '',
    clientName: '',
    buyPrice: '',
    salesPrice: '',
    warehouseCode: '',
    warehouseName: '',
    memo: '',
    useyn: '',
    createdate: '',
    updatedate: ''
 	};
 	 grid.appendRow(newRowData);
	});	

	//행 삭제
	   function deleteRow() {

	      var rowKeys = grid.getCheckedRowKeys();  // 선택한 row의 key
	      alert(rowKeys);
	      var test = JSON.stringify(rowKeys);  // 실제값으로 가공 --> 선택한 row의 key(index)를  JSON 문자배열로 반환
	      alert(test);
	      
	      var rowDatas = grid.getCheckedRows();   // 선택한 row에 해당하는 객체값
	      alert(rowDatas);
	      var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
	      alert(jsonRowDatas);
	      
	      grid.removeCheckedRows([test]);		// 그리드 인덱스 제거용 (한 줄 제거용)

	      $.ajax({
	         url : "raw/useUpdate",
	         method : "POST",
	         data : JSON.stringify(rowDatas),
	         contentType : "application/json; charset=UTF-8",
	         dataType: "JSON",
	         success : function (dd) {
	            alert(dd);
	            alert('성공');  // result를 배열로 받는다
	         },
	         error: function() {
	              console.log("실패");
	          }
	      });
	   }
		  

		

	// 컬럼 수정
	$('#updateRowBtn').on('click', function() { 
	grid.on('editingFinish', function(ev) {
	      const rowKey = ev.rowKey;
	      const columnName = ev.columnName;
	      var updatedData = {};
	      const rowData = grid.getRow(rowKey);
	      console.log('Row data: ', rowData);
	      
	     $.ajax({
	        url: '${conPath}/raw/updateRaw',
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
   		});
	
	// 저장
	$('#savebtn').on('click', function() {
    var rows = grid.getModifiedRows();
    var data = JSON.stringify(rows);

    $.ajax({
        type: "POST",
        url: "/save",
        data: data,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(data) {
            alert("저장되었습니다.");
        },
        error: function(xhr, status, error) {
            alert("저장에 실패했습니다.");
        }
    });
});


	


</script>

	
</html>