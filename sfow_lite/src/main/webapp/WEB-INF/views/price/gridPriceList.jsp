<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목단가관리</title>
 <link rel="stylesheet" href="https://uicdn.toast.com/tui-date-picker/latest/tui-date-picker.css" />
 <script src="https://uicdn.toast.com/tui-date-picker/latest/tui-date-picker.min.js"></script>

<style>
		.form-title{
		width : 100px;
		height: 30px;
		color:black;
		font-weight:bold;
 		background-color: #e2e2e2;
		border:1px solid #e2e2e2;
		text-align:center;
		line-height : 30px;
		border-radius:3px;
		display:inline-block;
		}
		
		.form-data{
		width : 200px;
		height: 30px;
		background-color: rgb(230, 242, 255);
		text-align:center;
		line-height : 30px;
		border-radius:3px;
		border:1px solid #e2e2e2;
		display:inline-block;
		}
	

	
	
</style>
</head>
<body>
	


 	<div>		
        <div class="form-code">
		
            	<form id="semiSearch">
            	<div class="form-title">품목구분</div><input type="text" class="form-data" id ="itemCategory" name = "itemCategory" style="margin-right: 20px; margin-left:20px; " placeholder='--';>
            	<div class="form-title">품목검색</div><input type="text" class="form-data" id ="itemCode" name = "itemCode" style="margin-right: 20px; margin-left:20px; " placeholder='자동완성';>
              	<div class="form-title">품명</div><input type="text" class="form-data" id = "itemName" name = "itemName" style="margin-right: 20px; margin-left:20px;">
              	<div class="form-title">품번</div><input type="text" class="form-data" id="itemNo" name = "itemNo" style="margin-right: 20px; margin-left:20px; ">
              	<div class="form-title">규격</div><input type="text" class="form-data" id = "itemSpecification" name = "itemSpecification" style="margin-right: 20px; margin-left:20px;">
              	<div class="form-title">거래처코드</div><input type="text" class="form-data" id = "clientCode" name = "clientCode" style="margin-right: 20px; margin-left:20px;">
              	<div class="form-title">거래처명</div><input type="text" class="form-data" id = "clientName" name = "clientName" style="margin-right: 20px; margin-left:20px;">
              	<div class="form-title">사용여부</div><input type="text" class="form-data" id = "useyn" name = "useyn" style="margin-right: 20px; margin-left:20px;">
              	
              	</form>
    </div>
</div>



<font size='7px';>품목단가관리</font>
  <div id="grid">
				<button id="searchBtn">조회</button>
				<button id="addRowBtn">+</button>
				<button  type="button" id="delRowBtn" onclick="deleteRow()">-(DB삭제)</button>
				<button type="button" id="insertRowBtn" style="background-color: #33F6FF">등록</button>
				<button id="updateRowBtn">저장</button>
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
	{ header: '회사코드	', name: 'companyCode', hidden:true	},
    { header: '품목구분',
	      name: 'itemCategory',
	      sortable: true,
	      editor: {type: 'select',
	    	  options: {
	              listItems: [
	                  {text: '제품', value: "제품"},
	                  {text: '반제품', value: "반제품"},
	                  {text: '원제품', value: "원자재"}
	                  
	             			 ] 
	      				}
	      }
	      ,align:'center' },
    { header: '품목검색'	 , name: 'itemCode'			, sortable: true, editor: 'text' ,align:'center' },
    { header: '품명'	 	 , name: 'itemName'			, sortable: true, editor: 'text' ,align:'center' },
    { header: '품목번호'	 , name: 'itemNo'			, sortable: true, editor: 'text' ,align:'center' },
    { header: '규격'	 	 , name: 'itemSpecification', sortable: true, editor: 'text' ,align:'center' },
    { header: '거래처코드'  , name: 'clientCode' 		, sortable: true, editor: 'text' ,align:'center' },
    { header: '거래처명'   , name: 'clientName' 		, sortable: true, editor: 'text' ,align:'center' },
<<<<<<< HEAD
    { header: '시작일' 	 , name: 'startDate' 		, sortable: true,  editor: {
        type: 'datePicker',
        options: {
          selectableRanges: [[new Date(2014, 3, 10), new Date(2014, 5, 20)]]
        }
      } ,align:'center' },
    { header: '종료일' 	 , name: 'endDate' 			, sortable: true,  editor: {
        type: 'datePicker',
        options: {
          selectableRanges: [[new Date(2014, 3, 10), new Date(2014, 5, 20)]]
        }
      } ,align:'center' },
=======
    { header: '시작일' 	 , name: 'startDate' 		, sortable: true, editor: {
											      				  	  type: 'datePicker',
											        			      options: {
											          				  format: 'yyyy-MM-dd'} ,align:'center' } },
    { header: '종료일' 	 , name: 'endDate' 			, sortable: true, editor: 'text' ,align:'center' },
>>>>>>> refs/remotes/origin/RAW
    { header: '매입단가'	 , name: 'buyPrice' 		, sortable: true, editor: 'text' ,align:'right'  },
	{ header: '매출단가'	 , name: 'salesPrice'		, sortable: true, editor: 'text' ,align:'right'  },
	{ header: '비고'		 , name: 'memo'				, sortable: true, editor: 'text' ,align:'center' },
	{ header: '사용여부',
	  name: 'useyn', 
	  sortable: true ,
	  editor: {type: 'select',
    	  options: {
              listItems: [
                  {text: 'Y', value: "Y"},
                  {text: 'N', value: "N"}
             			 ] 
      				}
      		   },
      align:'center'
	  }
	  	  // itemCode,itemName itemNo itemSpecification clientCode clientName startDate endDate buyPrice salesPrice memo
	]
	
	});
	//checkbox 체크 시에 input 태그에 해당 value 출력(checkbox 다중 선택시 데이터 초기화 기능 추가)
	grid.on('check', function(ev) {
        const rowKey = ev.rowKey;
        const columnName = ev.columnName;
        var updatedData = {};
        const rowData = grid.getRow(rowKey);
        console.log('Row data: ', rowData);
        if(grid.getCheckedRows().length==1){
        var itemCategory = document.getElementById('itemCategory');
   		var itemCode = document.getElementById('itemCode');
   		var itemName = document.getElementById('itemName');
  		var itemNo = document.getElementById('itemNo');
  		var itemSpecification = document.getElementById('itemSpecification');
  		var clientCode = document.getElementById('clientCode');
  		var clientName = document.getElementById('clientName');
  		var useyn = document.getElementById('useyn');
    	
  		itemCategory.value=rowData.itemCategory;
  		itemCategory.readOnly=true;
  		
    	itemCode.value=rowData.itemCode;
    	itemCode.readOnly=true;

    	
    	itemName.value=rowData.itemName;
    	itemName.readOnly=true;
	
    	
    	itemNo.value=rowData.itemNo;
    	itemNo.readOnly=true;
    	
    	itemSpecification.value=rowData.itemSpecification;
    	itemSpecification.readOnly=true;
    	
    	clientCode.value=rowData.clientCode;
    	clientCode.readOnly=true;
    	
    	clientName.value=rowData.clientName;
    	clientName.readOnly=true;
    	
    	useyn.value=rowData.useyn;
    	useyn.readOnly=true;
    	
        }else{
        	var itemCategory = document.getElementById('itemCategory');
       		var itemCode = document.getElementById('itemCode');
       		var itemName = document.getElementById('itemName');
      		var itemNo = document.getElementById('itemNo');	
      		var itemSpecification = document.getElementById('itemSpecification');
      		var clientCode = document.getElementById('clientCode');
      		var clientName = document.getElementById('clientName');
      		var useyn = document.getElementById('useyn');

      		itemCategory.value="";
      		itemCategory.readOnly=true;
      		
        	itemCode.value="";
    		itemCode.readOnly=true;
        	
    		itemName.value="";
    		itemName.readOnly=false;

        	itemNo.value="";
        	itemNo.readOnly=false;
        	
        	itemSpecification.value="";
        	itemSpecification.readOnly=false;
        	
        	clientCode.value="";
        	clientCode.readOnly=false;
        	
        	clientName.value="";
        	clientName.readOnly=false;
        	
        	useyn.value="";
        	useyn.readOnly=false;
        	
        	}
        
	});
	
	//checkbox 체크 해제 시에 input 태그 내에 해당 value 제거 & 다중 선택 시에 input 태그 내에 value 제거
	grid.on('uncheck', (ev) => {
    	var itemCategory = document.getElementById('itemCategory');
   		var itemCode = document.getElementById('itemCode');
   		var itemName = document.getElementById('itemName');
  		var itemNo = document.getElementById('itemNo');	
  		var itemSpecification = document.getElementById('itemSpecification');
  		var clientCode = document.getElementById('clientCode');
  		var clientName = document.getElementById('clientName');
  		var useyn = document.getElementById('useyn');
	
    	
  		itemCategory.value="";
  		itemCategory.readOnly=true;
  		
    	itemCode.value="";
		itemCode.readOnly=true;
    	
		itemName.value="";
		itemName.readOnly=false;

    	itemNo.value="";
    	itemNo.readOnly=false;
    	
    	itemSpecification.value="";
    	itemSpecification.readOnly=false;
    	
    	clientCode.value="";
    	clientCode.readOnly=false;
    	
    	clientName.value="";
    	clientName.readOnly=false;
    	
    	useyn.value="";
    	useyn.readOnly=false;
	
	
	});
	
	

	// 목록 조회(첫 페이지 출력시 자동 조회)
	
	$.ajax({
		url : "price/toastPriceDataList",		//toastDataList
		method :"GET",
		dataType : "JSON",
		contentType : "application/json; charset=utf-8",
		success : function(result) {
			console.dir(result);
			grid.resetData(result);
		}
	});
	
	/*아래부터 버튼*/
	
	//목록 조회 버튼(검색 추가)
	$('#searchBtn').on('click', function() { 
		// itemCode,itemName itemNo itemSpecification clientCode clientName startDate endDate buyPrice salesPrice memo
		var searchData = {
				itemCategory: $("#itemCategory").val(),
				itemCode: $("#itemCode").val(),
				itemName: $("#itemName").val(),
				itemNo: $("#itemNo").val(),
				itemSpecification: $("#itemSpecification").val(),
				clientCode: $("#clientCode").val(),
				clientName: $("#clientName").val(),
				useyn: $("#useyn").val()
			    
		}
		
		//var jsonSearchData = JSON.stringify(searchData)
		event.preventDefault();	// 새 창 열림 방지
		
	$.ajax({
		url : "price/toastPriceDataList",		//toastDataList
		method :"POST",
		data:searchData,
		dataType : "JSON",
		/* contentType : "application/json; charset=utf-8", */
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
	companyCode:'',
    itemCode: '',
    itemName: '',
    itemNo: '',
    itemType: '',
    itemSpecification: '',
    clientCode: '',
    clientName: '',
    startDate:'',
    endDate: '',
    buyPrice: '',
    salesPrice: '',
    memo: '',
    useyn: ''
 	};
 	 grid.appendRow(newRowData);
	});	
	// itemCode,itemName itemNo itemSpecification clientCode clientName startDate endDate buyPrice salesPrice memo
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
	         url : "semi/useUpdate",
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
	      const rowKey = el.rowKey;
	      const columnName = el.columnName;
	      var updatedData = {};
	      const rowData = grid.getRow(rowKey);
	      console.log('Row data: ', rowData);
	      
	     $.ajax({
	        url: '${conPath}/semi/updateSemi',
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
	
	
		
		
		// 등록 진행
   $("#insertRowBtn").click(function() {
      let i = confirm('등록하시겠습니까?');
      if(i) {
         addBtn();
      }else {
         return false;
      }
   });
   
   // 등록 진행
   function addBtn() {

      var rowDatas = grid.getCheckedRows();   // 선택한 row에 해당하는 객체값
      alert("rowDatas : " + rowDatas);
      var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
      alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
      
      $.ajax({
         url : "semi/insertSemi",
         method : "post",
         data : jsonRowDatas,
         contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
         dataType: "json",         // 서버에서 받을 데이터타입
         success : function (result) {
            alert(result); // result는 반환받은 json형태의 객체 
            alert('성공');
         },
         error: function() {
              console.log("실패");
          }
      });
   }


	


</script>

	
</html>