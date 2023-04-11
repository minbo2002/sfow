<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- conpath 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>

<c:set var="conPath"  value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목등록(반제품)</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
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
	
button {
/*   background-color: rgba(60, 80, 135, 1); */
  background-color: rgba(051, 51, 102, 1);
  font-weight : bolder;
    color: #fff;
    border: none;
}

#searchBtn:hover {
  background-color: rgba(051, 102, 102, 1);
  opacity: 0.8;
}

   
#resetBtn:hover {
  background-color: rgba(204, 000, 051, 1);
  opacity: 0.8;
}


#applyBtn:hover {
  background-color: rgba(051, 102, 204, 1);
  opacity: 0.8;
}


#resetMdBtn:hover {
  background-color: rgba(204, 000, 051, 1);
  opacity: 0.8;
}


#closeBtn:hover {
  background-color: rgba(153, 102, 000, 1);
  opacity: 0.8;
}

#whSearchBtn:hover {
  background-color: rgba(102, 102, 102, 1);
  opacity: 0.8;
}

.modal{
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto;
  width: 100%;
  height: 100%;
  display: none;
  background-color: rgba(0, 0, 0, 0.4);
  justify-content:center;
  align-items:center;
}
.modal.show {
  display: block;
}
#modalGrid{
	  position: fixed;
	  top: 50%; /* 모달이 수직 중앙에 위치하도록 top 값을 50%로 지정 */
  	  left: 50%;
	  width: 500px;
	  height: 500px;
	  padding: 40px;
	  justify-content:center;
  	  align-items:center;
	  text-align: center;
	  background-color: rgb(255, 255, 255);
	  border-radius: 10px;
	  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	  transform: translateX(-50%) translateY(-50%);
}
#modal_search{
  position: fixed;
  top: 33%; 
  left: 47%;
  z-index: 1;
}	
.btn-open-popup{
width : 200px;
height: 30px;
background-color: rgb(230, 242, 255);
text-align:left;
line-height : 30px;
border-radius:3px;
border:1px solid #e2e2e2;
display:inline-block;
}
.search_tp .form-title{
border-radius:3px;
line-height : 30px;
}
.search_tp input[type="text"] {
border: none;
outline: none;
border-radius:3px;
border:1px solid #e2e2e2;
line-height : 30px;
height: 30px;
}
.search_tp input[type="text"]#lens_sh {
margin-left:-0.5px;
}
.search_tp input[type="text"].btn-open-popup {
padding-left: 30px;
cursor: text;
margin-left:-3.5px;
margin-right:5px;
}
.search_tp input[type="text"].btn-open-popup:focus {
outline: none;
}
.search_tp i.fa-search {
position: absolute;
left: 5px;
top: 50%;
transform: translateY(-50%);
z-index: 1;
}
#addRow .fas fa-plus {
float: right;
}
.modal{
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto;
  width: 100%;
  height: 100%;
  display: none;
  background-color: rgba(0, 0, 0, 0.4);
  justify-content:center;
  align-items:center;
}
.modal.show {
  display: block;
}
#modalGrid{
	  position: fixed;
	  top: 50%; /* 모달이 수직 중앙에 위치하도록 top 값을 50%로 지정 */
  	  left: 50%;
	  width: 500px;
	  height: 500px;
	  padding: 40px;
	  justify-content:center;
  	  align-items:center;
	  text-align: center;
	  background-color: rgb(255, 255, 255);
	  border-radius: 10px;
	  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	  transform: translateX(-50%) translateY(-50%);
}
#modal_search{
  position: fixed;
  top: 33%; 
  left: 47%;
  z-index: 1;
}
#keyword{
    flex: 1;
    margin: 0;
    padding: 0;
    border-radius: 4px;
}
button {
  background-color: rgba(051, 51, 102, 1);
  font-weight : bolder;
}
#applyBtn {
  height: 35px;
  width: 80px;
  font-size: 13px;
  color: black;
  border: 1px solid #8c8c8c;
  border-radius: 4px;
  position: absolute;
  bottom: 10px;
  right: 300px; /* 버튼 위치 조정 */
}
#applyBtn:hover {
  background-color: rgba(051, 102, 204, 1);
  opacity: 0.8;
}
#resetMdBtn {
  height: 35px;
  width: 80px;
  font-size: 13px;
  color: black;
  border: 1px solid #8c8c8c;
  border-radius: 4px;
  position: absolute;
  bottom: 10px;
  right: 210px; /* 버튼 위치 조정 */
}
#resetMdBtn:hover {
  background-color: rgba(204, 000, 051, 1);
  opacity: 0.8;
}
#closeBtn {
  height: 35px;
  width: 80px;
  font-size: 13px;
  color: black;
  border: 1px solid #8c8c8c;
  border-radius: 4px;
  position: absolute;
  bottom: 10px;
  right: 120px; /* 버튼 위치 조정 */
}
#closeBtn:hover {
  background-color: rgba(153, 102, 000, 1);
  opacity: 0.8;
}
#mdshBtn {
        margin: 0;
        padding: 0;
        height: 28px;
	    width: 60px;
	    font-size: 13px;
	    color: black;
	    border: 1px solid #8c8c8c;
	    border-radius: 4px;
	    bottom: 10px;
}
input::placeholder {
color: grey;
font-style: italic;
font-size:5px;
}
#mdshBtn:hover {
 background-color: rgba(102, 102, 102, 1);
  opacity: 0.8;
}
</style>
	

</head>


<body>
	


 	<div>		
        <div class="form-code">
		
            	<form id="semiSearch">
            	<div class="form-title">ITEM코드</div><input type="text" class="form-data" id ="itemCode" name = "itemCode" style="margin-right: 20px; margin-left:20px; " placeholder='자동완성';>
              	<div class="form-title">품명</div><input type="text" class="form-data" id = "itemName" name = "itemName" style="margin-right: 20px; margin-left:20px;">
              	<div class="form-title">품번</div><input type="text" class="form-data" id="itemNo" name = "itemNo" style="margin-right: 20px; margin-left:20px; ">
              	</form>
    </div>
</div>



<font size='7px';>기준정보</font>
  <div id="grid">
				<button id="searchBtn"> <i class="fa fa-search"></i>조회</button>
				<button id="updateRowBtn" onclick="updateRow()"><i class="fa fa-save"></i>저장</button>
				<button  type="button" id="delRowBtn" onclick="deleteRow()"> <i class="fa fa-trash"></i> 삭제</button>
				<button id="resetRow"><i class="fa fa-power-off"></i>초기화</button>
				<button id="addRowBtn"> <i class="fa fa-plus"></i></button>
				<button type="button" id="insertRowBtn" style="background-color: #33F6FF">등록</button>
  </div>
<div class="modal">
<div id="modal_search">
    <input type="text" id="keyword" name="keyword" value="" style="border: 1px solid #8c8c8c;">
	<button type="submit" id="mdshBtn" style="color:white;">조회</button>
</div>
  <div id="modalGrid" style="display: flex; flex-direction: column; align-items: center;">
    <button type="button" id="applyBtn" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">&nbsp;&nbsp;적용</button>
    <button type="reset" id="resetMdBtn" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">&nbsp;&nbsp;초기화</button>
    <button type="button" id="closeBtn" style="height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">&nbsp;&nbsp;닫기</button>
  </div>
</div>
</body>
<script>


	var newRowData ="";
	var gridData=[]; 
	var Grid = tui.Grid;
	var grid = new tui.Grid({
		
	el: document.getElementById('grid'),
	    scrollX: false,
	    scrollY: false,
		
	    data:gridData,
	    
	    rowHeaders: ['checkbox','rowNum'],
  
	    /*  아래부터 그리드 컬럼 */
	columns: [
	{ header: '회사코드	', name: 'companyCode', hidden:true	},
    { header: 'Item코드'	 , name: 'itemCode'			, sortable: true, align:'center' },	    	
    { header: '품명'	 	 , name: 'itemName'			, sortable: true, editor: 'text' ,align:'center' , validation:{required: true}},
    { header: '품목번호'	 , name: 'itemNo'			, sortable: true, editor: 'text' ,align:'center' , validation:{required: true}},
    
    /* 유형 칼럼 시작 */
    { header: '유형', name: 'itemType',
    	 onBeforeChange(tp) { 

    		openModal();
    	
    	function openModal(){
    	  var body = document.querySelector('body');
    	  var modal = document.querySelector('.modal');
    	  //modalGrid 초기화
    	  
    	  var modalGrid = document.getElementById("modalGrid");
    	  modalGrid.innerHTML = "";
    	  const keyword = document.getElementById("keyword");
    	  keyword.value="";
    	  var applyBtn = document.createElement("button");
    	  applyBtn.setAttribute("type", "button");
    	  applyBtn.setAttribute("id", "applyBtn");
    	  applyBtn.setAttribute("style", "height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;");
    	  applyBtn.innerText = "적용";
    	  modalGrid.appendChild(applyBtn);
    	  var resetMdBtn = document.createElement("button");
    	  resetMdBtn.setAttribute("type", "reset");
    	  resetMdBtn.setAttribute("id", "resetMdBtn");
    	  resetMdBtn.setAttribute("style","height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;");
    	  resetMdBtn.innerText = "초기화";
    	  modalGrid.appendChild(resetMdBtn);
    	  var closeBtn = document.createElement("button");
    	  closeBtn.setAttribute("type", "button");
    	  closeBtn.setAttribute("id", "closeBtn");
    	  closeBtn.setAttribute("style","height:35px; width:80px; font-size:13px; color:white; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;");
    	  closeBtn.innerText = "닫기";
    	  modalGrid.appendChild(closeBtn);
    	  
    	  modal.classList.toggle('show');
    	 
		const Grid = tui.Grid;
		const grid2 = new Grid({
			
	  	el: document.getElementById('modalGrid'),
	  	scrollX: false,
	  	scrollY: false,
	  	autoWidth: true,
	  	rowHeaders: [{ type: 'rowNum', align: 'center'},{ type: 'checkbox' }],
	    columns: [{ header: '유형', name: 'itemType', align: 'center', ediFtor:'text'}]});       		
		
	$.ajax({
		url : 'item/typeSelectAjax',
        method :'GET',
        dataType : 'JSON',
	  	  success: function(result) {
	  		console.log('result', result);
	  	  	grid2.resetData(result)
	  	  },
	    error: function(xhr, status, error) {
	      console.log(error);
	    }
	  });
			grid2.on('check', function(ev) {
				
		    const rowKey = ev.rowKey;
		    const columnName = ev.columnName;
		    const rowData = grid2.getRow(rowKey);
		    const itemType = rowData.itemType;
		    
		   Array.prototype.forEach.call(document.querySelectorAll('#applyBtn'), el => {
			      el.addEventListener('click', ev => {
			    	  console.log('itemType!', itemType);
			    	  	grid.setValue(tp.rowKey,tp.columnName,itemType)
    			    	modal.classList.remove('show');
    			    	body.style.overflow = 'auto';
					});
				});
			}); 
		  Array.prototype.forEach.call(document.querySelectorAll('#closeBtn'), el => {
			      el.addEventListener('click', ev => {
			    	  modal.classList.remove('show');
			    	  body.style.overflow = 'auto';
			      });
		  });
		  		//검색
				 Array.prototype.forEach.call(document.querySelectorAll('#mdshBtn'), el => {   
		           	 el.addEventListener('click', ev => {
		           var itemType = $("#modal_search input[name='keyword']").val();
		           console.log('itemType:', itemType);
		           $.ajax({
		       		type: 'POST',
		       		dataType: 'JSON',
		       		url: 'item/typeSelectSearchAjax',
		       		contentType: 'application/json',
		       	    data: JSON.stringify({	
		       	    	"itemType": itemType
		       	        }),
		       		success: function(data) {
		       			 //gridData=data
		       	         grid2.resetData(data)      
		               	},
		               error: function(error) {
		                   console.log('Error:', error);
		               	}
		           });	         
		           	 });
		           });		
    		}  //openModal끝
         } ,
    	sortable: true, editor: 'text' ,align:'center'},	// 유형 컬럼 끝 
    
    	
    	
    	{ header: '규격'	 	 , name: 'itemSpecification', sortable: true, editor: 'text' ,align:'center' },
    { 
      header: '재고단위',
      name: 'itemStockUnit',
      sortable: true,
      editor: {type: 'select',
    	  options: {
              listItems: [
                  {text: 'EA', value: "EA"},
                  {text: 'g', value: "g"},
                  {text: 'KG', value: "KG"},
                  {text: 'Ton', value: "Ton"},
                  {text: '㎖', value: "㎖"},
                  {text: 'ℓ', value: "ℓ"},
                  {text: '㎡', value: "㎡"},
                  {text: 'm', value: "m"},
                  
             			 ] 
      				}
      },
      align:'center'
      },
    { header: 'lot size' , name: 'lotSize' 			, sortable: true, editor: 'text' ,align:'center' },
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
	  },
	{ header: '등록일자'	 , name: 'createdate'		, sortable: true, 				  align:'center' },
	{ header: '수정일자'	 , name: 'updatedate'		, sortable: true, 				  align:'center' }
	  	  
	]
	
	});			/* 그리드 컬럼 끝 */

	
	
	//checkbox 체크 시에 input 태그에 해당 value 출력(checkbox 다중 선택시 데이터 초기화 기능 추가)
	grid.on('check', function(ev) {
        const rowKey = ev.rowKey;
        const columnName = ev.columnName;
        var updatedData = {};
        const rowData = grid.getRow(rowKey);
        console.log('Row data: ', rowData);
        if(grid.getCheckedRows().length==1){
   		var itemCode = document.getElementById('itemCode');
   		var itemName = document.getElementById('itemName');
  		var itemNo = document.getElementById('itemNo');
	
    	
    	itemCode.value=rowData.itemCode;
    	itemCode.readOnly=true;

    	
    	itemName.value=rowData.itemName;
    	itemName.readOnly=true;
	
    	
    	itemNo.value=rowData.itemNo;
    	itemNo.readOnly=true;
        }else{
        	
       		var itemCode = document.getElementById('itemCode');
       		var itemName = document.getElementById('itemName');
      		var itemNo = document.getElementById('itemNo');	
        	

        	itemCode.value="";
    		itemCode.readOnly=true;
        	
    		
    		itemName.value="";
    		itemName.readOnly=false;

    		
        	itemNo.value="";
        	itemNo.readOnly=false;
        	
        	}
        
	});
	
	//checkbox 체크 해제 시에 input 태그 내에 해당 value 제거 & 다중 선택 시에 input 태그 내에 value 제거
	grid.on('uncheck', (ev) => {
   		var itemCode = document.getElementById('itemCode');
   		var itemName = document.getElementById('itemName');
  		var itemNo = document.getElementById('itemNo');
	
	
    	
    	itemCode.value="";
		itemCode.readOnly=true;
    	
		itemName.value="";
		itemName.readOnly=false;
	
    	itemNo.value="";
    	itemNo.readOnly=false;
	
	
	});
	
	

	// 목록 조회(첫 페이지 출력시 자동 조회)
	
	$.ajax({
		url : "semi/toastSemiDataList",		//toastDataList
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
		
		var searchData = {
				itemCode: $("#itemCode").val(),
				itemName: $("#itemName").val(),
				itemNo: $("#itemNo").val(),
				useyn: $("#useyn").val()
			    
		}
		
		//var jsonSearchData = JSON.stringify(searchData)
		event.preventDefault();	// 새 창 열림 방지
		
	$.ajax({
		url : "semi/toastSemiDataList",		//toastDataList
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
    itemStockUnit: '',
    lotSize: '',
    memo: '',
    useyn: '',
    createdate:'',
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
		  

		

	// 행 수정
	function updateRow() {

	      var rowKeys = grid.getCheckedRowKeys();  // 선택한 row의 key
	      alert(rowKeys);
	      var test = JSON.stringify(rowKeys);  // 실제값으로 가공 --> 선택한 row의 key(index)를  JSON 문자배열로 반환
	      alert(test);
	      
	      var rowDatas = grid.getCheckedRows();   // 선택한 row에 해당하는 객체값
	      alert(rowDatas);
	      var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
	      alert(jsonRowDatas);
	      

	      $.ajax({
	         url : "semi/updateSemi",
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

   
   /* modal 삽입 */
   // client_code 더블클릭 이벤트 실행
    grid.on('dblclick', function(ev) {
        if (ev.columnName === 'orderNumber') {
            window.open('${conPath}/semi/modalList', 'childWindow', 'width=500,height=500');
        }
    });
   
   //
    window.addEventListener('message', function(ev) {
        const selectedRow = ev.data;
        const focusedCell = grid.getFocusedCell();
        grid.setValue(focusedCell.rowKey, 'orderNumber', selectedRow.orderNumber);
        grid.setValue(focusedCell.rowKey, 'clientCode', selectedRow.clientCode);
        grid.setValue(focusedCell.rowKey, 'companyCode', selectedRow.companyCode);
        grid.setValue(focusedCell.rowKey, 'itemCode', selectedRow.itemCode);
        grid.setValue(focusedCell.rowKey, 'outQuantity', selectedRow.outQuantity);
    });

	


</script>

	
</html>