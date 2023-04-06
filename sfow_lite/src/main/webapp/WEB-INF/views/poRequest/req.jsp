<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="conPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>

<script>

 $(document).ready(window.onload=function() {
	 
	 var addRowBtn = document.getElementById('addRowBtn');
	   addRowBtn.addEventListener('click', function() {
	     var newRowData = {
	    request_number: '',
	    request_type: '',
	    request_date: '',
	    createdate: '',
	    memo: '',
	    delyn: '',
	    company_code: ''
	    };
	     grid.appendRow(newRowData);
	   });  
	   
	 var addRowBtn2 = document.getElementById('addRowBtn2');
	   addRowBtn2.addEventListener('click', function() {
	     var newRowData = {
 		 request_order: '',
 		 item_code: '',
 		 no: '',
 		 item_name: '',
 		 item_no: '',
 		 item_stock_unit: '',
 		 request_quantity: '',
 		 price: '',
 		 amount: '',
 		 tax_amount: '',
 		 memo: '',
 		 request_number: document.getElementById('request_number').value.toString()
	    };
	     grid2.appendRow(newRowData);
	   });  
 
	 //행삭제
     var removeRowBtn = document.getElementById('removeRowBtn');
	   removeRowBtn.addEventListener('click', function() {
	     var lastIndex = grid.getRowCount()-1;
	     grid.removeRow(lastIndex);
	   });

   	 var removeRowBtn2 = document.getElementById('removeRowBtn2');
	   removeRowBtn2.addEventListener('click', function() {
	     var lastIndex = grid2.getRowCount()-1;
	     grid2.removeRow(lastIndex);
	   });
	   
	   
	   
	   
	 //데이터삭제
	 // 삭제실행
	$("#deleteBtn").click(function() {
      let d = confirm('삭제하시겠습니까?');
      if(d) {
         reqDelfunction();
      }else {
        return false;
      }
	});
	 
	 //초기화
  	 var resetRow = document.getElementById('resetRow');
	   resetRow.addEventListener('click', function() {
	      var confirmMsg = `모든 데이터를 삭제하시겠습니까?`;
	      if(confirm(confirmMsg))
	      grid.clear();
	      grid2.clear();
	   });
	
	   //입력
	   $("#saveBtn").click(function() {
	         let i = confirm('등록하시겠습니까?');
	         if(i) {
	            saveFunction();
	         }else {
	            return false;
	         }
	      });
	      

 
	 $('#searchBtn').click(function(event) {
		 event.preventDefault(); // prevent form submission
		    
	    // get search parameters
	    var request_number = $('#request_number').val();
	    var request_type = $('#request_type').val();
	    var request_date = $('#request_date').val();
	    var request_empid = $('#request_empid').val();
	    
	 $.ajax({
	      url : "${conPath}/reqSearch",
	      type : "GET",
	      dataType : "JSON",
	      data:  {
	    	    request_number: request_number,
	    	    request_type: request_type,
	    	    request_date: request_date,
	    	    request_empid:request_empid
	    	},
	      success : function(data) {
	         console.dir(data);
	         grid2.clear();
	         grid.resetData(data);
	         
	         grid.on('editingFinish', function(ev) {
	             const rowKey = ev.rowKey;
	             const columnName = ev.columnName;
	             var updatedData = {};
	             const rowData = grid.getRow(rowKey);
	             console.log('Row data: ', rowData);

	             $.ajax({
	            	 url: '${conPath}/reqUpdate',
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
	             });//ajax_update
	            
	          });//gridon
	          
	          //추가!!!
	          grid.on('check', function(ev){
	              const rowKey = ev.rowKey;
	              const columnName = ev.columnName;
	              var updatedData = {};
	              const rowData = grid.getRow(rowKey);
	              console.log('Row data: ', rowData);
	              if(grid.getCheckedRows().length==1){
	              
	              	var request_number = document.getElementById('request_number');
	            	var request_type = document.getElementById('request_type');
	            	var request_date = document.getElementById('request_date');
	            	var request_empid = document.getElementById('request_empid');
	            	
	            
	            	var test1 =rowData.request_number;
	            	var test2 =rowData.request_type;
	            	var test3 =rowData.request_date;
	            	var test4 =rowData.request_empid;
	            	
	            	request_number.value=test1;
	            	request_number.disabled=true;
	            	request_type.value=test2;
	            	request_type.disabled=true;
	            	request_date.value=test3;
	            	request_date.disabled=true;
	            	request_empid.value=test4;
	            	request_empid.disabled=true;}
	              else{
	            	  var request_number = document.getElementById('request_number');
	                  var request_type = document.getElementById('request_type');
	                  var request_date = document.getElementById('request_date');
	                  var request_empid = document.getElementById('request_empid');
	                  
	                  request_number.value="";
	                  request_number.disabled=false;
	                  request_type.value="";
	                  request_type.disabled=false;
	                  request_date.value="";
	                  request_date.disabled=false;
	                  request_empid.value="";
	                  request_empid.disabled=false;
	                  grid2.clear()
	                  }
	              
	               $.ajax({
	            	    url: "${conPath}/reqDetail",
	            	    method: 'GET',
	            	    dataType: 'JSON',
	            	    data:  {
	            	    	request_number:request_number.value
				    	},
	            	    contentType: 'application/json',
	            	    success: function(response) {
	            	    	grid2.resetData(response)
	            	    	console.log('Success:', response);
	         	     
	            	    	grid2.on('editingFinish', function(ev) {
	           	             const rowKey = ev.rowKey;
	           	             const columnName = ev.columnName;
	           	             var updatedData = {};
	           	             const rowData = grid2.getRow(rowKey);
	           	             console.log('Row data: ', rowData);

	           	             $.ajax({
	           	            	 url: '${conPath}/reqDetailUpdate',
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
	           	             });//ajax_update
	            	    	});
	           	           
	            	    },
	            	    error: function(error) {
	            	      console.log('Error:', error);
	            	    }
	            	 });
	          });
	          
	          grid.on('uncheck',(ev) => {
	        	  var request_number = document.getElementById('request_number');
            	  var request_type = document.getElementById('request_type');
            	  var request_date = document.getElementById('request_date');
            	  var request_empid = document.getElementById('request_empid');
	              
	              request_number.value="";
                  request_number.disabled=false;
                  request_type.value="";
                  request_type.disabled=false;
                  request_date.value="";
                  request_date.disabled=false;
                  request_empid.value="";
                  request_empid.disabled=false;
                  grid2.clear()
	              
	           });
	          
	          //여기까지 추가함
	          
	       }//search_success
	     });//ajax_search

	 }); //searchBtn
	 

	   // 삭제함수
    function reqDelfunction() {
       
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
            url : "${conPath}/reqDel",
            method : "PUT",
            data : jsonRowDatas,
            contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
            dataType: "JSON",         // 서버에서 받을 데이터타입
            success : function (result) {
              //alert(result); // result는 반환받은 json형태의 객체 
            },
            error: function() {
                console.log("실패");
             }
       });
    }  
	 
	 //입력함수
  	 function saveFunction() {

         var rowDatas = grid.getCheckedRows();   // 선택한 row에 해당하는 객체값
         alert("rowDatas : " + rowDatas);
         var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
         alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
         
         $.ajax({
            url : "${conPath}/reqInsert",
            method : "post",
            data : jsonRowDatas,
            contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
            dataType: "JSON",         // 서버에서 받을 데이터타입
            success : function (result) {
               //alert(result); // result는 반환받은 json형태의 객체 
            },
            error: function() {
                 console.log("입력실패");
             }
         });
      }
	 
  	 function saveFunction() {

         var rowDatas = grid2.getCheckedRows();   // 선택한 row에 해당하는 객체값
         alert("rowDatas : " + rowDatas);
         var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
         alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
         
         $.ajax({
            url : "${conPath}/reqDetailInsert",
            method : "post",
            data : jsonRowDatas,
            contentType : "application/json; charset=utf-8",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
            dataType: "JSON",         // 서버에서 받을 데이터타입
            success : function (result) {
               //alert(result); // result는 반환받은 json형태의 객체 
            },
            error: function() {
                 console.log("입력실패");
             }
         });
      }	 
	 
}); //doc끝
	 	
  	
 	</script>
 	<script>
 	
 	</script>
 	
	<style>
	
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
	
	.selectbox1 {
	    width: calc(100%)
	}
	.buttonRight{
		float:right
	}
	
	.divTable{
	   display: table;
	   background: #F8F8F8;
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

</head>
<title>구매발주</title>

<body>
		<form id="selectReq">
         <input type="submit" name="searchBtn" id="searchBtn" value="조회"/>
         <button type="button" name="deleteBtn" id="deleteBtn">삭제</button>
         <button type="button" name="saveBtn" id="saveBtn">저장</button>
         <input type="reset" name="resetRow" id="resetRow" value="초기화"/>
         <div class="buttonRight">
         <input type="button" name="addRowBtn" id="addRowBtn" value="+"/>
         <input type="button" name="removeRowBtn" id="removeRowBtn" value="-"/>
         </div>
          <div class="divTable">
            <div class="divTableBody">
            <div class="divTableRow">
            <div class="divTableCell">구매발주번호</div>
                <div class="divTableCell">
                    <input class="divTableCell" type="text" name="request_number" id="request_number" value=""/>
                </div>
            <div class="divTableCell" style="border-color: rgb(255, 92, 92);">구매발주유형</div>
                <div class="divTableCell">
                    <select name="request_type" id="request_type">
                        <option value="">--</option>
                        <option value="일반구매">일반구매</option>
                        <option value="특별구매">특별구매</option>
                    </select>
                </div>
            <div class="divTableCell" style="border-color: rgb(255, 92, 92);">구매발주일자</div>
                <div class="divTableCell">
                    <input type="date" name="request_date" id="request_date"/>
                </div>
            </div>
            <div class="divTableRow">
            <div class="divTableCell" style="border-color: rgb(255, 92, 92);">구매발주담당자
            </div>
            <div class="divTableCell">
                <input type="text" name="request_empid" id="request_empid" value=""/>
                </div>
        	</div>
<!--             <div class="divTableCell">사용자명</div>
            <div class="divTableCell">
                <input type="text" name="user_name" id="user_name"/>
            </div> -->

            </div>
          </div>
		</form>
	<div id="grid"></div>
	 <div class="buttonRight">
	<input type="button" name="addRowBtn2" id="addRowBtn2" value="+"/>
    <input type="button" name="removeRowBtn2" id="removeRowBtn2" value="-"/>
    </div>
	<div id="grid2"></div>
	

 
 <script>
	 var gridData=[];
	 var grid = new tui.Grid({
	       el: document.getElementById('grid'),
	       data: gridData,
	       scrollX: false,
	       scrollY: false,
	       rowHeaders: [{
	           type: 'rowNum',
	           header: "  ",
	           width: 50,
	       },'checkbox'],
	       
	       columns: [
	          {
	           header: '구매발주번호',
	           sortable: true,
	           editor:'text',
	           name: 'request_number',
	           align:'center'
	          },
	         {
	           header: '구매발주유형',
	           sortable: true,
	           //editor:'text',
	           name: 'request_type',
	           formatter: 'listItemText',
	           editor: {
	             type: 'select',
	             options: {
	               listItems: [
	                 { text: '일반구매', value: '일반구매' },
	                 { text: '특별구매', value: '특별구매' }
	               ]
	             }
	           },
	           align:'center'
	         },
	         {
	           header: '구매발주일자',
	           sortable: true,
	           editor:'text',
	           name: 'request_date',
	           align:'center'
	         },
	         {
	           header: '구매발주담당',
	           sortable: true,
	           editor:'text',
	           name: 'request_empid',
	           align:'center'
	         },
	         {
	           header: '비고',
	           sortable: true,
	           editor:'text',
	           name: 'memo',
	           align:'center'
	           },
	         {
	           header: '등록수정일',
	           sortable: true,
	           name: 'createdate',
	           align:'center'
	         },
	         {
	           header: '회사코드',
	           sortable: true,
	           editor:'text',
	           name: 'company_code',
	           align:'center'
		      }
	       ]
	     });
	 
	 var gridData2=[];
	 var grid2 = new tui.Grid({
	       el: document.getElementById('grid2'),
	       data: gridData2,
	       scrollX: false,
	       scrollY: false,
	       rowHeaders: [{
	           type: 'rowNum',
	           header: "  ",
	           width: 50,
	       },'checkbox'],
	       
	       columns: [
	         {
	           header: '상세번호',
	           sortable: true,
	           name: 'request_order',
	           align:'center'
	          },
	         {
	           header: 'ITEM코드',
	           sortable: true,
	           editor:'text',
	           name: 'item_code',
	           align:'center'
	         },
	         {
	           header: '거래처',
	           sortable: true,
	           editor:'text',
	           name: 'no',
	           align:'center'
	         },
	         {
	           header: '품명',
	           sortable: true,
	           name: 'item_name',
	           editor:'text',
	           align:'center'
	         },
	         {
	           header: '품번',
	           sortable: true,
	           name: 'item_no',
	           editor:'text',
	           align:'center'
	           },
	         {
	           header: '재고단위',
	           sortable: true,
	           name: 'item_stock_unit',
	           editor:'text',
	           align:'center'
	         },
	         {
	           header: '수량',
	           sortable: true,
	           editor:'text',
	           name: 'request_quantity',
	           align:'center'
		     },
	         {
	           header: '단가',
	           sortable: true,
	           editor:'text',
	           name: 'price',
	           align:'center'
			 },
	         {
	           header: '공급가액',
	           sortable: true,
	           name: 'amount',
	           align:'center'
		     },
	         {
	           header: '부가세포함가',
	           sortable: true,
	           name: 'tax_amount',
	           align:'center'
		     },
		     {
	           header: '비고',
	           sortable: true,
	           editor:'text',
	           name: 'memo',
	           align:'center'
		     },
		     {
	           header: '구매발주번호',
	           sortable: true,
	           name: 'request_number',
	           align:'center'
		     }
		    
	       ]
	     });
 

</script>
        
       
            

</body>
</html>