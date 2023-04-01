<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getContextPath()%>" var="ContextPath"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 	<script src="${ContextPath}/resources/js/tui-grid.js"></script>
	<link rel="stylesheet" href="${ContextPath}/resources/css/tui-grid.css" type="text/css"/>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style>


</style>
</head>
<script>
$(document).ready(function() {
		const EMAIL_AT_REQUIRED = '올바른 이메일 주소를 입력해주세요.';
		const EMPTY_FIELD_ERROR_MSG ='값을 입력해주세요';
		const DELETE_SUCCESS = '삭제에 성공했습니다.';
		const DELETE_FAILED ='삭제에 실패했습니다.';
	  const ADD_SUCCESS = '추가에 성공했습니다.';
    const ADD_FAILED = '추가에 실패했습니다.';
			
		 
		var gridData = [];
		var grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    data: gridData,
	    scrollX: false,
	    scrollY: true,
	    rowHeaders: ['checkbox','rowNum'],
	    bodyHeight: 300,
	    columns: [
	    			// [회사코드 ] 
            {
                header: '회사코드',            
                name: 'companyCode',                
            },
        		// [회사명 ] 
            {
                header: '회사명',        
                name: 'companyName',  
                editor: 'text',
               },
               
            // [이름 ]
            	{
                header: '이름',   
                name: 'userName',  
                editor: 'text',                
                validation: {
                    dataType: 'string',
                    required: true
                  }
            },
            
         		// [아이디 ]
            {
                header: '아이디',         
                name: 'id',  
                editor: 'text',
                align: 'center', 
            },
            
         		// [계정번호 ]
            {
                header: '계정번호',         
                name: 'updateKey',            
                hidden: true
            },
            
         		// [비밀번호 ]
            {
                header: '비밀번호',         
                name: 'password',            
                editor: 'text',               
                align: 'center',
                validation: {
	                dataType: 'string',
	                required: true
	              }
            },
            
         		// [전화번호 ]
            {
                header: '전화번호',            
                name: 'phoneNum',             
                editor: 'text', 
                align: 'center',              
		            validation: {
		                dataType: 'string',
		                required: true
		              }
            },
            
         		// [이메일 ]
            	{
                header: '이메일',           
                name: 'email',             
                align: 'center',              
                editor: 'text',
	            	validation: {
	                dataType: 'string',
	                required: true
	              }
              },
              
           		// [생성일 ]
              {
                  header: '생성일',            
                  name: 'createDate',
                },
                
                
                // 수정일[]
                {
                    header: '수정일',            
                    name: 'updateDate',            
                  },
			        ]
	  });
		
		
	  
	  //행 추가
	  $('#add-row-btn').on('click', function() {
		    // 행 추가할 때 필수 데이터 입력
		    var newRowData = {
		        companyCode: '${sessionScope.AUTHUSER.companyCode}',
		        companyName: '${sessionScope.AUTHUSER.companyName}',
		        userName: '',
		        id: '',
		        updateId: '',
		        password: '',
		        phoneNum: '',
		        email: '',
		        createDate: '',
		        updateDate: ''
		    };
		    console.log("newRowData", newRowData);
				
		    // 새로운 행 추가
		    var newRowKey = grid.appendRow(newRowData); 
		    console.log("newRowKey",newRowKey);
		   
		    
		    // 새로운 행의 정보 전송
		    $.ajax({
		        url: '${ContextPath}/newUserAjax',
		        type: 'POST',
		        async : true,
		        data: JSON.stringify(newRowData),
		        contentType: 'application/json',
		        success: function(result) {
		            console.log(result);
		            alert(ADD_SUCCESS);
		        },
		        error: function(xhr, status, error) {
		            console.log(xhr.responseText);
		            alert(ADD_FAILED);
		        }
		    });
		});


	  
	  //모든 회원 목록 조회하기
	  $.ajax({
	    url: '${ContextPath}/userManagementAjax?companyCode=${sessionScope.AUTHUSER.companyCode}',
	    method: 'GET',
	    async : true,
	    dataType: 'JSON',
	    success: function(data) {
	      console.dir(data);		//배열인지 확인.
	      gridData=data;
	      grid.resetData(gridData);

	      grid.on('editingFinish', function(ev) {
	    	  var rowKey = ev.rowKey;
	    	  var columnName = ev.columnName;
	    	  var updatedData = {};
	    	  var rowData = grid.getRow(rowKey);
	    	  console.log('Row data: ', rowData);
	    	  console.log("컬럼이름",columnName);
	    	  
	    	  
	    	  //값 필수 입력 유효성 검사
	    	  if (!rowData[columnName]) {
	    		  alert(EMPTY_FIELD_ERROR_MSG);
	    		  return;
	    		}  
	    	  
	    	  //이메일 유효성 검사
	    	  if (columnName === 'email') {
	    		  var emailValue = rowData[columnName];
	    		  if (!emailValue || emailValue.indexOf('@') === -1) {
	    		    alert(EMAIL_AT_REQUIRED);
	    		    return;
	    		  }
	    		}

	    	  
	    	  $.ajax({
	    		    url: '${ContextPath}/userListUpdate',
	    		    method: 'PUT',
	    		    async : true,
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
	    }
	  });
	  
	  
	// 행 삭제
	  $('#delete-row-btn').on('click', function() {
	    const checkedRows = grid.getCheckedRows();
	    var ids = [];
	    for (var i = 0; i < checkedRows.length; i++) {
	      ids.push(checkedRows[i].id);
	    }
	    console.log("ids",ids);
	    
	    $.ajax({
	      url: '${ContextPath}/deleteUserAjax',
	      type: 'DELETE',
	      async : true,
	      data: JSON.stringify(ids[0]),
	      contentType: 'application/json',
	      success: function(result) {
	        console.log(result);
	        alert(DELETE_SUCCESS);
	        
	        // 삭제된 행 재로딩
	        $.ajax({
	          url: '${ContextPath}/userManagementAjax',
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
	        alert(DELETE_FAILED);
	      }
	    });
	  });
});
</script>
<body>
        <!-- 테이블 버튼 구성 -->
        <div class="btn-wrapper" style="margin-bottom: 10px;">
            <button id="add-row-btn"> 추가</button>
            <button id="delete-row-btn">삭제</button>
            
        </div>
        <!-- Toast Grid Load -->
  <div id="grid"></div>
</body>
</html>