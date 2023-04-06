<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 순서주의 -->
<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" /> <!-- date-picker -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /><!-- jQuery Modal -->
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script> <!-- date-picker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script><!-- include jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script><!-- jQuery Modal -->
<script>
$(document).ready(window.onload=function() {
      	
	  $('#search').click(function(event) {
	    event.preventDefault(); // submit 폼 제출 방지

	    // get search parameters
	  	var in_number = $('#in_number').val();
	    var in_type = $('#in_type').val();
	    var in_date = $('#in_date').val();
	    var in_trans_type = $('#in_trans_type').val();
	    var client_code= $('#client_code').val();
	    var client_name= $('#client_name').val();
	    var in_free= $('#in_free').val();
	    var memo= $('#memo').val();
	
	    
	    // make AJAX call to server
	    $.ajax({
	      url: '${conPath}/searchPoIn',
	      mehtod: 'get',
	      dataType:'json',
	      data: {
	    	  in_number:in_number,
	    	  in_type:in_type,
	    	  in_date:in_date,
	    	  in_trans_type:in_trans_type,
	    	  client_code:client_code,
	    	  client_name:client_name,
	    	  in_free:in_free,
	    	  memo:memo 
	      },
	      success: function(data) {
    	 	console.dir(data);
    	 	grid2.clear();
	    	  	grid.resetData(data);
	    	   	
	    	  	
	    	   	 grid.on('editingFinish', function(ev) {
	    	   	
		            const rowKey = ev.rowKey;
		            const columnName = ev.columnName;
		            var updatedData = {};
		            const rowData = grid.getRow(rowKey);
		            console.log('Row data: ', rowData);

		         //입고관리-수정
		         var updateBtn = document.getElementById('updateBtn');
		            updateBtn.addEventListener('click', function() {
		            	//alert("수정완료");
		            $.ajax({
		                 url: '${conPath}/reqMgUp',
		                 method: 'post',
		                 dataType: 'JSON',
		                 data: JSON.stringify(rowData),
		                 contentType: 'application/json; charset=utf-8',
		                 success: function(response) {
		                 
		                     console.log('Success:', response);
		                 },
		                 error: function(error) {
		                     console.log('Error:', error);
		                 }
		             }); 
		            
	          	});//btn
	            
	    	   	}); //grid.on(첫번쨰)
	    	  	//checkbox 체크 시 input 태그에 해당 value 출력
	            grid.on('check', function(ev){
	              const rowKey = ev.rowKey;
	              const columnName = ev.columnName;
	              var updatedData = {};
	              const rowData = grid.getRow(rowKey);
	              console.log('Row data: ', rowData);
	              
	              if(grid.getCheckedRows().length==1){
            	  	
	            	var in_number = document.getElementById('in_number');
	        	    var in_type = document.getElementById('in_type');
	        	    var in_date = document.getElementById('in_date');
	        	    var in_trans_type = document.getElementById('in_trans_type');
	        	    var client_code = document.getElementById('client_code');
	        	    var client_name = document.getElementById('client_name');
	        	    var in_free = document.getElementById('in_free');
	        	    var memo = document.getElementById('memo');
	              
	        	    var pi1=rowData.in_number;
	        	    var pi2=rowData.in_type;
	        	    var pi3=rowData.in_date;
	        	    var pi4=rowData.in_trans_type;
	        	    var pi5=rowData.client_code;
	        	    var pi6=rowData.client_name;
	        	    var pi7=rowData.in_free;
	        	    var pi8=rowData.memo;

	        	    in_number.value=pi1;
	        	    in_number.readOnly=true; //일반
	        	    
	        	    in_type.value=pi2;
	        	    in_type.disabled=true; //select option
	        	    in_date.value=pi3;
	        	    in_date.readOnly=true;
	        	    in_trans_type.value=pi4;
	        	    in_trans_type.disabled=true;
	        	    client_code.value=pi5;
	        	    client_code.readOnly=true;
	        	    client_name.value=pi6;
	        	    client_name.readOnly=true;
	        	    in_free.value=pi7;
	        	    in_free.disabled=true;
	        	    memo.value=pi8;
	        	    memo.readOnly=true;
	            	}else{	
	            		var in_number = document.getElementById('in_number');
		        	    var in_type = document.getElementById('in_type');
		        	    var in_date = document.getElementById('in_date');
		        	    var in_trans_type = document.getElementById('in_trans_type');
		        	    var client_code = document.getElementById('client_code');
		        	    var client_name = document.getElementById('client_name');
		        	    var in_free = document.getElementById('in_free');
		        	    var memo = document.getElementById('memo');
		        	    
		        	    in_number.value="";
		        	    in_number.readOnly=false;
		        	    in_type.value="";
		        	    in_type.disabled=false;
		        	    in_date.value="";
		        	    in_date.readOnly=false;
		        	    in_trans_type.value="";
		        	    in_trans_type.disabled=false;
		        	    client_code.value="";
		        	    client_code.readOnly=false;
		        	    client_name.value="";
		        	    client_name.readOnly=false;
		        	    in_free.value="";
		        	    in_free.disabled=false;
		        	    memo.value="";
		        	    memo.readOnly=false;   
		        	    grid2.clear();
	              }
	            	//상세보기
	            	//console.dir(in_number)
	            	/* var in_number = $('#in_number').val();
	            	var request_order = $('#request_order').val(); */
	         
	            	
	              	$.ajax({
	            	    url: '${conPath}/reqMgDetail',
	            	    method: 'GET',
	            	    dataType: 'JSON',
	            	    data:{
		            	      in_number:in_number.value // pi1 or in_number.value 입력 
		            	      //request_order:request_order.value
	            	    	
	            	         },
	            	    contentType: 'application/json',
	            	    success: function(response) {
	            	    	grid2.resetData(response)
	            	    	console.log('Success:', response);  
	            	    	
	            	    	//수정
	            	    	grid2.on('editingFinish', function(ev) {
	        		            const rowKey = ev.rowKey;
	        		            const columnName = ev.columnName;
	        		            var updatedData = {};
	        		            const rowData = grid2.getRow(rowKey);
	        		            console.log('Row data: ', rowData);
	        		            
	        		            var updateDetailBtn = document.getElementById('updateDetailBtn');
	        		            	updateDetailBtn.addEventListener('click', function() {
		            					//alert("세부항목수정완료");
			        		            $.ajax({
					    		    	       url: '${conPath}/reqMgDetailUp',
					    		    	       method: 'post',
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
	            	    	}); //grid2.on(두번째)

	            	    },
	            	    error: function(error) {
	            	      console.log('Error:', error);
	            	    }
	            	 });
	            });
	         //checkbox 체크 해제 시에 input 태그 내에 해당 value 제거 & 다중 선택 시에 input 태그 내에 value 제거
	         //그리드객체명.on('click', (ev) => {
	         grid.on('uncheck',(ev) => {  
	        	 	var in_number = document.getElementById('in_number');
	        	    var in_type = document.getElementById('in_type');
	        	    var in_date = document.getElementById('in_date');
	        	    var in_trans_type = document.getElementById('in_trans_type');
	        	    var client_code = document.getElementById('client_code');
	        	    var client_name = document.getElementById('client_name');
	        	    var in_free = document.getElementById('in_free');
	        	    var memo = document.getElementById('memo');
	        	    
	        	    in_number.value="";
	        	    in_number.readOnly=false;
	        	    in_type.value="";
	        	    in_type.disabled=false;
	        	    in_date.value="";
	        	    in_date.readOnly=false;
	        	    in_trans_type.value="";
	        	    in_trans_type.disabled=false;
	        	    client_code.value="";
	        	    client_code.readOnly=false;
	        	    client_name.value="";
	        	    client_name.readOnly=false;
	        	    in_free.value="";
	        	    in_free.disabled=false;
	        	    memo.value="";
	        	    memo.readOnly=false;    
	        	    grid2.clear();
	            
	         });
	    	   	
	    	  },
	      error: function(xhr, status, error) {
	        // handle error
	        console.log(error);
	      }
	    });
	  });
	});
	//입고관리 행 추가
    var plusRowBtn = document.getElementById('plusRowBtn');
	    plusRowBtn.addEventListener('click', function() {
	      var newRowData = {
	    		  in_number: '',
	    		  in_empid: '',
	    		  in_type: '',
	    		  in_date: '',
	    		  in_trans_type: '',
	    		  request_number: '',
	    		  client_code: '',
	    		  client_name: '',
	    		  in_regdate: '',
	    		  memo: '',
	    		  in_delyn: ''
	     };
	      grid.appendRow(newRowData);
    });  
	
	//세부항목 행추가
    var plusDeRowBtn = document.getElementById('plusDeRowBtn');
	    plusDeRowBtn.addEventListener('click', function() {
	      var newRowData = {
	    		  in_number: document.getElementById('in_number').value.toString(),
	    		  request_order: '',
	    		  item_code: '',
	    		  request_quantity: '',
	    		  in_quantity: '',
	    		  item_name: '',
	    		  item_no: '',
	    		  item_specification: '',
	    		  item_stock_unit: '',
	    		  warehouse_code: '',
	    		  warehouse_name: '',
	    		  
	    		  price: '',
	    		  amount: '',
	    		  tax_amount: '',
	    		  memo: ''
	     };
      	grid2.appendRow(newRowData);
    });
    

  	//입고관리 행 제거
  	//마지막 row에 값이 있으면 삭제 안되게 추가 필요
     var minusRowBtn = document.getElementById('minusRowBtn');
   		minusRowBtn.addEventListener('click', function() {
          var lastIndex = grid.getRowCount()-1;
          grid.removeRow(lastIndex);
        });



     //세부항목 행 제거
      var minusDeRowBtn = document.getElementById('minusDeRowBtn');
      	minusDeRowBtn.addEventListener('click', function() {
          var lastIndex = grid2.getRowCount()-1;
          grid2.removeRow(lastIndex);
        });
	  
	  
	  //등록
	 $("#saveBtn").click(function() {
	      let i = confirm('등록하시겠습니까?');
	      if(i) {
	         saveFunction();
	      }else {
	         return false;
	      }
	   });
	   
	   // 등록 진행
	   function saveFunction() {

	      var rowDatas = grid.getCheckedRows();   // 선택한 row에 해당하는 객체값
	      alert("rowDatas : " + rowDatas);
	      var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
	      alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
	      $.ajax({
	         url : "${conPath}/reqMgIn",
	         method : "post",
	         data : jsonRowDatas,
	         contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
	         dataType: "json",         // 서버에서 받을 데이터타입
	         success : function (result) {
	            //alert(result); // result는 반환받은 json형태의 객체 
	         },
	         error: function() {
	              console.log("입력실패");
	          },
	          complete:function(){
	          }
	          
	      });
	      
	   }
	      
	 	 $("#saveDetailBtn").click(function() {
		      let i = confirm('세부항목을 등록하시겠습니까?');
		      if(i) {
		    	  saveDetailFunction();
		      }else {
		         return false;
		      }
		   });
	      
	      //세부항목 입력 saveDetailBtn
	    function saveDetailFunction() {
	    	  
	      var rowDatas = grid2.getCheckedRows();   // 선택한 row에 해당하는 객체값
	      alert("rowDatas : " + rowDatas);
	      var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
	      alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
	      $.ajax({
	         url : "${conPath}/reqMgDetailIn",
	         method : "post",
	         data : jsonRowDatas,
	         contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
	         dataType: "json",         // 서버에서 받을 데이터타입
	         success : function (result) {
	            //alert(result); // result는 반환받은 json형태의 객체 
	         },
	         error: function() {
	              console.log("입력실패");
	          },
	          /* complete:function(){ 무조건 출력되는 함수
	          } */
	          
	      });
	      
	      
	   }

	  
	  
	  
	// 삭제실행
	$("#delPoIn").click(function() {
	   let d = confirm('삭제하시겠습니까?');
	   if(d) {
		   poInDelfunction();
	   }else {
		  return false;
	   }
	});
		
	// 삭제함수
	function poInDelfunction() {
	   var rowKeys = grid.getCheckedRowKeys();  // 선택한 row의 key
	   //alert("rowKeys : " + rowKeys);
	   var jsonRowKeys = JSON.stringify(rowKeys);  // 실제값으로 가공 --> 선택한 row의 key(index)를  JSON 문자배열로 반환
	   //alert("JSON.stringify(rowKeys) : " + jsonRowKeys);
	   
	   var rowDatas = grid.getCheckedRows();   // 선택한 row에 해당하는 객체값
	   //alert("rowDatas : " + rowDatas);
	   var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
	   //alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
 
	   grid.removeCheckedRows([jsonRowKeys]);
 
	   $.ajax({
			  url : "${conPath}/reqMgDel",
			  method : "PUT",
			  data : jsonRowDatas,
			  contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
			  dataType: "JSON",         // 서버에서 받을 데이터타입
			  success : function (result) {
				 //alert(result); // result는 반환받은 json형태의 객체 
			  },
			  error: function() {
				   console.log("수정실패");
			   }
	   });
	}  
	
	  
	//초기화
	//모든 테이블  초기화하는 부분, 위 아래 두 개 테이블 모두 초기화하고 checked상태에서 초기화할 경우 readOnly랑 disabled false처리
	function poInReset(){
		//처음엔 ajax로 넘어온 데이터를 다 ""로 입력해서 다시 resetData하려했는데 grid자체적으로 clear()함수가 있었음
		 grid.clear();
		 grid2.clear();
		 
		 	in_number.disabled=false;
		    in_type.disabled=false;
		    in_date.disabled=false;
		    in_trans_type.disabled=false;
		    client_code.disabled=false;
		    client_name.disabled=false;
		    in_free.disabled=false;
		    memo.disabled=false; 
		    
	}
</script>
<style>
/* modal */
.modal {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 1200px;
  height: 600px;
  background-color: white;
  box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.3);
  padding: 20px;
  box-sizing: border-box;
}

  .btnR{
   float:right;
  }
/* DivTable.com */
  .divTable{
	display: table;
	width: 100%;
    
}
.divTableRow {
	display: table-row;
}
.divTableHeading {
	background-color: #EEE;
	display: table-header-group;
}
.divTableCell, .divTableHead {
           border: 1px solid #999999;
           display: table-cell;
           padding: 3px 10px;
           text-align: center;
           border: 1px solid #E8EBF0;
           border-radius: 5px;
        }
.divTableHeading {
	background-color: #EEE;
	display: table-header-group;
	font-weight: bold;
}
.divTableFoot {
	background-color: #EEE;
	display: table-footer-group;
	font-weight: bold;
}
.divTableBody {
	display: table-row-group; 
}
</style>

<title>Insert title here</title>
</head>

<body>

<form id="searchFrm">
    <input type="submit" id="search" value="조회"/>
    <input type="button" name="delPoIn" id="delPoIn" value="삭제"/>        
    <input type="reset" onclick="poInReset()" value="초기화"/>
<div class="divTable">
    <div class="divTableBody">

    <div class="divTableRow">
    <div class="divTableCell">입고번호</div>
        <div class="divTableCell">
            <input type="text" name="in_number" id="in_number" value=""/>
        </div>
    <div class="divTableCell">입고유형</div>
        <div class="divTableCell">
            <select name="in_type" id="in_type">
                <option value="">--</option>
                <option value="구매입고">구매입고</option>
                <option value="미입고">미입고</option>
            </select>
        </div>
    <div class="divTableCell">입고일자</div>
        <div class="divTableCell">
            <input type="date" name="in_date" id="in_date"/>
        </div>
    </div>

    <div class="divTableRow">
    <div class="divTableCell">수불타입</div>
        <div class="divTableCell">
            <select name="in_trans_type" id="in_trans_type">
                <option value="">--</option>
                <option value="일반">일반</option>
                <option value="사급">사급</option>
                <option value="샘플">샘플</option>
            </select>
        </div>
    <div class="divTableCell">거래처코드</div>
    <div class="divTableCell">
        <input type="text" name="client_code" id="client_code"  value=""/>
        </div>
    <div class="divTableCell">거래처명</div>
    <div class="divTableCell">
        <input type="text" name="client_name" id="client_name"  value=""/>
    </div>
    </div>

    <div class="divTableRow">
    <div class="divTableCell">무상여부</div>
    <div class="divTableCell">
        <select name="in_free" id="in_free">
            <option value="">--</option>
            <option value="유상">유상</option>
            <option value="무상">무상</option>
        </select>
        </div>
    <div class="divTableCell">비고</div>
    <div class="divTableCell">
        <input type="text" name="memo" id="memo"  value=""/>
        </div>
    </div>
    </div>
    </div>
</form>
<span><input type="button" name="saveBtn" id="saveBtn" value="구매입고등록"/> <input type="button" name="updateBtn" id="updateBtn" value="구매입고수정"/></span><span class="btnR"><input type="button" name="plusRowBtn" id="plusRowBtn" value="+"/><input type="button" name="minusRowBtn" id="minusRowBtn" value="-"/></span>    
<div id="grid"></div>
<div id="ex1" class="modal">
  <p>Thanks for clicking. That felt good.</p>
  <a href="#" rel="modal:close">Close</a>
</div>
<span><input type="button" name="saveDetailBtn" id="saveDetailBtn" value="세부항목등록"/> <input type="button" name="updateDetailBtn" id="updateDetailBtn" value="세부항목수정"/></span><span class="btnR"><input type="button" name="plusDeRowBtn" id="plusDeRowBtn" value="+"/><input type="button" name="minusDeRowBtn" id="minusDeRowBtn" value="-"/></span>
<div id="grid2"></div>
<script>
//----------------------------------------------
   //구매입고
   var gridData=[];
   var grid = new tui.Grid({
         el: document.getElementById('grid'),
         data: gridData,
         scrollX: true, //스크롤 가로 false시 고정
         scrollY: true, //스크롤 세로
         rowHeaders: [{
             type: 'rowNum',
             header: "",
             width: 50
         },'checkbox'],
         columns: [
           {
              header: '구매입고번호',
              sortable: true,
              align:'center',
              width: 150,
              name: 'in_number'
              },
          {
              header: '구매발주번호',
              sortable: true,
              align:'center',
              width: 150,
              editor:'text',
              name: 'request_number'
            },          
           {
             header: '입고담당자',
             sortable: true, // 정렬
             align:'center',
             width: 100,
             editor:'text', 
             name: 'in_empid'
           },
           {
             header: '입고유형',
             sortable: true,
             align:'center',
             editor: {
            	 type: 'select',
                 	options: { 
                 		listItems: [
	                      {text: '구매입고', value: '구매입고'}
                        ]
                    }
         	},
	         width: 100,
             name: 'in_type'
           },
           {
               header: '무상여부',
               sortable: true,
               align:'center',
               editor: {
              	 type: 'select',
                   	options: { 
                   		listItems: [
  	                      {text: '유상', value: '유상'},
  	                      {text: '무상', value: '무상'}
                          ]
                      }
           	  },
             width: 100,
             name: 'in_free'
           },
           {
             header: '입고일자',
             sortable: true,
             align:'center',
             editor:'text',
             width: 150,
             name: 'in_date'
           }, 
           {
             header: '수불타입',
             sortable: true,
             align:'center',
             editor: {
            	 type: 'select',
                 	options: { 
                 		listItems: [
	                      {text: '일반', value: '일반'},
	                      {text: '사급', value: '사급'},
	                      {text: '샘플', value: '샘플'}
                        ]
                    }
         	},
         	 width: 100,
             name: 'in_trans_type'
           },
         {
             header: '거래처코드',
             sortable: true,
             align:'center',
             editor:'text', 
             width: 150,
             name: 'client_code'
           },
         {
             header: '거래처명',
             sortable: true,
             align:'center',
             editor:'text', 
             width: 150,
             name: 'client_name'
           },
         {
             header: '등록수정일',
             sortable: true,
             align:'center',
             width: 150,
             name: 'in_regdate'
           },
         {
             header: '비고',
             sortable: true,
             align:'center',
             editor:'text',
             width: 150,
             name: 'memo'
           },
          {
             header: '삭제여부(N,Y)',
             align:'center',
          /*    editor: {
            	 type: 'select',
                 	options: { 
                 		listItems: [
	                      {text: "N", value: "N"},
	                      {text: "Y", value: "Y"}
                        ]
                    }
         	}, */
         	 width: 100,
             name: 'in_delyn',
             cssClass: 'hidden' 
           }            
         ]
       });
   
	grid.on('check', function(ev) {
	      console.log('check', ev);
	});

	grid.on('uncheck', function(ev) {
	      console.log('uncheck', ev);
	});
   
   
   //-----------------------------------
   //세부항목(해당 입고관리번호 체크시 출력) 
   var gridData2=[];
   var grid2 = new tui.Grid({
         el: document.getElementById('grid2'),
         data: gridData2,
         scrollX: true, //스크롤 가로 false시 고정
         scrollY: true, //스크롤 세로
         rowHeaders: [{
             type: 'rowNum',
             header: "",
             width: 50
         },'checkbox'],
         columns: [
            {
               header: '구매입고번호',
               sortable: true,
               align:'center',
               width: 150,
               name: 'in_number'
              },
           {
               header: '발주상세보기번호',
               sortable: true,
               align:'center',
               width: 150,
               name: 'request_order'
              },
            {
              header: 'ITEM코드',
              sortable: true,
              align:'center',
              width: 150,
              editor:'text', 
              name: 'item_code'
              },
          {
              header: '요청수량',
              sortable: true,
              align:'center',
              width: 100,
              name: 'request_quantity'
            },
          {
              header: '입고수량',
              sortable: true,
              align:'center',
              editor:'text',
              width: 100,
              name: 'in_quantity'
            },
           {
             header: '품명',
             sortable: true,
             align:'center',
             width: 150, 
             name: 'item_name'
           },
           {
             header: '품번',
             sortable: true,
             align:'center',
	         width: 150,
             name: 'item_no'
           },
           {
             header: '규격',
             sortable: true,
             align:'center',
             width: 100,
             name: 'item_specification'
           }, 
           {
             header: '재고단위',
             sortable: true,
             align:'center',
         	 width: 100,
             name: 'item_stock_unit'
           },
           {
             header: '창고코드',
             sortable: true,
             align:'center',
             editor:'text', 
             width: 150,
             name: 'warehouse_code'
           },
         {
             header: '창고명',
             sortable: true,
             align:'center',
             width: 150,
             name: 'warehouse_name'
           },
         {
             header: '단가',
             sortable: true,
             align:'center',
             width: 100,
             name: 'price'
           },
         {
             header: '공급가액',
             sortable: true,
             align:'center',
             width: 100,
             name: 'amount'
           },
         {
             header: '부가세포함가',
             sortable: true,
             align:'center',
             width: 150,
             name: 'tax_amount'
           },
         {
             header: '비고',
             sortable: true,
             align:'center',
             editor:'text',
             width: 150,
             name: 'memo'
           }
      
         ]
       });
</script>






























<script>
/* modal */
//modal에 띄워지는 grid2

  var body = document.querySelector('body');
  var modal = document.querySelector('.modal');
  var btnOpenPopup = document.querySelector('.btnFas');

var grid2=null;	 //추가된 부분!!
	function resetCheck() {
	  if (grid2) {
	    grid2.uncheckAll();
	  }
	}
	
	//modal 닫기 함수
	function closeModal() {
		  modal.classList.remove('show');
	         body.style.overflow = 'auto';
		}	
	
	
	
	//modal 안에 grid2의 checkbox 체크된 row데이터 input태그에 찍기
	function applyModal() {
		// grid2가 존재하고 데이터가 있을 때만 이벤트 리스너 등록
		// if (grid2 && grid2.getData().length > 0) {   
		        //modal.classList.toggle('show');
		        //body.style.overflow = 'auto';
	      if (grid2 && grid2.getCheckedRows().length > 0) {
	   	    const checkedRows = grid2.getCheckedRows();
	   	    const warehouse_code = document.getElementById('warehouse_code');
	   	    warehouse_code.value = checkedRows[0].warehouse_code;
	        //alert(warehouse_code.value);
//	         var warehouse_code = document.getElementById('warehouse_code');
//	         var test = rowData.warehouse_code;
//	         warehouse_code.value = test;
	      }        
	         modal.classList.remove('show');
	         body.style.overflow = 'auto';
		   // });
		}	
	



$(document).ready(function() {
	
	//reset button 리셋 함수 그리드 내에 단일 check 된 데이터 초기화
// 	function resetCheck(){
// 		grid2.uncheckAll();
// 	};

	
  //$('.btn-open-popup').dblclick(function(event) {
  $('.btnFas').dblclick(function(event) {
	  
  
	  event.preventDefault();
	//추가된 부분!!
	  if(grid2){
		  grid2.destroy();
	  }
	  
	var gridData2=[];
  	grid2 = new tui.Grid({
  	el: document.getElementById('modalGrid'),
  	data: gridData2,
  	scrollX: false,
  	scrollY: false,
  	autoWidth: true,
  	rowHeaders: [{
   	   type: 'rowNum',
   	   header: "  ",
   	   width: 50
  	},{type : 'checkbox'}],
  	columns: [
   	 {
    	header: '창고코드',
      	name: 'warehouse_code',
      	sortable: true,
      	align:'center',
      	width:165
    	},
    	{
      	header: '창고명',
      	name: 'warehouse_name',
      	sortable: true,
      	align:'center',
      	width:165
    	}
  	]
	});
  	

$.ajax({
    type:"POST", //요청방식 
    dataType:"JSON",
    url: '<%=request.getContextPath()%>/searchWh',
	      success: function(data) {
	    	gridData2=data
  	  		grid2.resetData(data)
  	   	
  	  },
    error: function(xhr, status, error) {
      // handle error
      console.log(error);
    }
  });
  
	  //modal 안에 grid 행 checkbox 체크시 row데이터 출력(웹 console에만 출력하는 용도)
		grid2.on('check', function(ev) {
	    const rowKey = ev.rowKey;
	    const columnName = ev.columnName;
	    var updatedData = {};
	    const rowData = grid2.getRow(rowKey);
	    console.log('Row data: ', rowData);
	    console.dir('Row data: ', rowData);
		}); 

	});//double클릭 이벤트 끝
});//document.ready끝	


  //modal 띄우기


  
  btnOpenPopup.addEventListener('dblclick', () => {
    modal.classList.toggle('show');

    if (modal.classList.contains('show')) {
    	body.style.overflow = 'hidden';
    }
  });







</script>







</body>
</html>