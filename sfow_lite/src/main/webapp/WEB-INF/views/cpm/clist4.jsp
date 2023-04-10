<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getContextPath()%>" var="ContextPath"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="./resources/tui-grid.js"></script>
   <link rel="stylesheet" href="./resources/tui-grid.css" type="text/css"/>

<title>Insert title here</title>
  <style>
  .btn-wrapper {
  display: flex;
  justify-content: flex-end; /* 변경 */
}

.btn-wrapper button {
  background-color: #f5f5f5;
  color: #333;
  border: 1px solid #ccc;
  padding: 5px 8px;
  border-radius: 4px;
  cursor: pointer;
  width: 70px;
  height: 30px;
  font-size: 12px;
}

#delete-row-btn {
  background-color: #ff8a80;
  color: #fff;
  border: 1px solid #ff8a80;
}

#delete-row-btn:hover {
  background-color: #ff7043;
  border: 1px solid #ff7043;
}

.inputBox,
.searchKeywordBtn {
  display: inline-block;
}

	
</style>
</head>
<script>


$(document).ready(function() {
	
	
	
     const grid = new tui.Grid({
       el: document.getElementById('grid'),
       scrollX: false,
       scrollY: true,
       rowHeaders: ['checkbox','rowNum'],
       bodyHeight: 300,
       columns: [
    	   {
               header: '거래처코드',
               name: 'client_Code',
               editor: 'text',
            	   align: 'center',
            	   sortable: true,
                   filter: {
                       type: 'text',
                       showApplyBtn: true,
                       showClearBtn: true 
                   }
                   },
             {
                 header: '회사명',             // [필수] 컬럼 이름
                 name: 'client_Name',
                 align: 'center',// [필수] 컬럼 매핑 이름 값
                 editor: 'text',
                 sortable: true,
                 filter: {
                     type: 'text',
                     showApplyBtn: true,
                     showClearBtn: true 
                 },
                 validation: {
                     dataType: 'string',
                     required: true
                   }
                 
                },

             {
               header: '대표자',
               name: 'ceo_Name',
               align: 'center',
               editor: 'text',
             },
            
             {
               header: '전화번호',
               name: 'client_Phone',
               align: 'center',
               editor: 'text',
               validation: {
                   dataType: 'string',
                   required: true
                 }
             },
             {
                  header: 'email',
                  name: 'client_Email',
                  align: 'center',
                  editor: 'text',
                  validation: {
                      dataType: 'string',
                      required: true
                    }
                },
             	{
                 header: '등록일',
                 name: 'create_Date',
                 align: 'center',
               	},
                {
                 header: '수정일',
                 name: 'update_Date',
                 align: 'center',
                 }
               	
        ]
     
        
     });
     
     
      
     
     
     $('#add-row-btn').on('click', function(event) {
    	    event.preventDefault(); // 기본 동작 막기
    	    var now = new Date();
  		  var currentDate = now.getFullYear() + '-' + ('0' + (now.getMonth() + 1)).slice(-2) + '-' + ('0' + now.getDate()).slice(-2) + '-' + ('0' + now.getHours()).slice(-2);


    	    // 새로운 데이터 생성
    	    const newRowData = {
    	        client_Code: '',
    	        client_Name: '',
    	        ceo_Name: '',
    	        client_Phone: '',
    	        client_Email: '',
    	        create_Date: '',
    	        update_Date: '',
    	    };
    	    console.log("newRowData", newRowData);
    	      
    	    // 새로운 행 추가
    	    const newRowKey = grid.appendRow(newRowData); 
    	    console.log("newRowKey",newRowKey);
    	    
    	    // 새로운 행의 정보 전송
    	    $.ajax({
    	        url: '${ContextPath}/insert',
    	        type: 'POST',
    	        data: JSON.stringify(newRowData),
    	        contentType: 'application/json',
    	        success: function(result) {
    	            console.log(result);
    	            
    	            $.ajax({
    	                url: '${ContextPath}/cpm',
    	                method: 'GET',
    	                dataType: 'JSON',
    	                success: function(result) {
    	                    console.dir(result); //배열인지 확인.
    	                    grid.resetData(result);
    	                },
    	                error: function(xhr, status, error) {
    	                    console.log(xhr.responseText);
    	                }
    	            });
    	            alert('사용자가 추가되었습니다.');
    	        }
    	    }); 
    	});

     
     
   //행 모든 데이터 불러오기
     $.ajax({
         url: '${ContextPath}/cpm',
         method: 'GET',
         dataType: 'JSON',
         success: function(result) {
             console.dir(result); //배열인지 확인.
             grid.resetData(result);

             grid.on('editingFinish', function(ev) {
                 const rowKey = ev.rowKey;
                 const columnName = ev.columnName;
                 var updatedData = {};
                 const rowData = grid.getRow(rowKey);
                 console.log('Row data: ', rowData);

               //이메일 유효성 검사
                 if (columnName === 'client_Email') {
                   var emailValue = rowData[columnName];
                   if (!emailValue || emailValue.indexOf('@') === -1) {
                     alert('이메일 주소에는 @ 문자가 포함되어야 합니다.');
                     return;
                   }
                 }
                 
                 
                 $.ajax({
                	    url: '${ContextPath}/update',
                	    method: 'PUT',
                	    dataType: 'text',
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
         }
     });



  // 행 삭제
     $('#delete-row-btn').on('click', function(event) {
       event.preventDefault(); // 기본 동작 막기
       const checkedRows = grid.getCheckedRows();
       var no = [];
       var client_Codes = [];
       for (var i = 0; i < checkedRows.length; i++) {
         client_Codes.push(checkedRows[i].no);
       }
       console.log("no",no);

       $.ajax({
         url: '${ContextPath}/deletecpm',
         type: 'DELETE',
         data: JSON.stringify(client_Codes[0]),
         contentType: 'application/json',
         success: function(result) {
           console.log(result);
           alert('삭제되었습니다.');
           // 삭제된 행 재로딩
           $.ajax({
             url: '${ContextPath}/cpm',
             method: 'GET',
             dataType: 'JSON',
             success: function(result) {
               console.dir(result);
               grid.resetData(result);
             }
           });
         },
         error: function(xhr, status, error) {
           console.log(xhr.responseText);
           alert('삭제에 실패했습니다.');
         }
       });
     });

  
  
});


   
</script>
<body>
<h3>거래처 정보</h3>
  <div class="wrapper">
 <div class="btn-wrapper" style="margin-bottom: 10px;">


         <!-- 테이블 버튼 구성 -->
         <div class="wrapper_rowBtn">
						  <button id="add-row-btn"><i class="fas fa-plus"></i></button>
						  <button id="delete-row-btn"><i class="fas fa-minus"></i></button>
						</div>
       
        </div>
        </div>
        <!-- Toast Grid Load -->
  <div id="grid"></div>
  
  
 </form>
</body>
</html>