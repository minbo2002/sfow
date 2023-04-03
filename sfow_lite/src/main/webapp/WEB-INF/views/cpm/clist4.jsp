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
</head>
<script>
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
             },
             {
                  header: 'email',
                  name: 'client_Email',
                  align: 'center',
                  editor: 'text',
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
      
     
    //행 추가
     $('#add-row-btn').on('click', function() {
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
              },
              error: function(xhr, status, error) {
                  console.log(xhr.responseText);
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
                 
               

                 $.ajax({
                	  url: '${ContextPath}/update',
                	  method: 'PUT',
                	  dataType: 'text',
                	  data: JSON.stringify(rowData),
                	  contentType: 'application/json',
                	  success: function(response) {
                	    if (columnName === 'client_email') {
                	      var emailValue = rowData[columnName];
                	      if (!emailValue || emailValue.indexOf('@') === -1) {
                	        alert('유효하지 않은 이메일입니다.');
                	        return;
                	      }
                	    } else if (response === 'invalidEmail') {
                	      alert('유효하지 않은 이메일입니다.');
                	    } else {
                	      console.log('Success:', response);
                	    }
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
     


   
</script>
<body>
<h3>거래처 정보</h3>
<form name="userListFrm" id="userListFrm" >
 <div class="btn-wrapper" style="margin-bottom: 10px;">

         <!-- 테이블 버튼 구성 -->
        <div class="btn-wrapper" style="margin-bottom: 10px;">
            <button id="add-row-btn"> 추가</button>
            <button id="delete-row-btn">삭제</button>

        </div>
        <!-- Toast Grid Load -->
  <div id="grid"></div>
  </div>
 </form>
</body>
</html>