<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/so/returnMain.css">
<title>고객반품등록</title>
<script>
$(document).ready(function() {
	
	var contextPath = '<%= request.getContextPath() %>';
	// 사용자 정의 라디오 버튼 렌더러
	/* class CustomRadioRenderer {
    constructor(props) {
        const el = document.createElement('input');
        el.type = 'radio';
        el.name = 'grid-row-radio';
        el.className = 'grid-row-radio';

        this.el = el;
        this.render(props);
    }

    getElement() {
        return this.el;
    }

    render(props) {
    	this.el.setAttribute('data-row-key', props.rowKey);
    }
	} */
	
	 var grid = new tui.Grid({
	    	el: document.getElementById('grid'),
	        scrollX: false,
	        scrollY: false,
	        rowHeaders: ['rowNum'],
	        checkOnlyOneRow: true,
	        columns: [
/* 	        	{
	        	    header: '선택',
	        	    align: 'center',
	        	    width: 50,
	        	    renderer: {
	        	        type: CustomRadioRenderer
	        	    }
	        	}, */
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
	    			editor: false
	    		},
	    		{
	    			header: '거래처코드',
	    			name: 'client_code',
	    			editor: false
	    		},
	    		{
	    			header: '거래처명',
	    			name: 'client_name',
	    			editor: false
	    		},		
	    		{
	    			header: '비고',
	    			name: 'memo',
	    			editor: 'text'
	    		}
	    	]
	    	}); //그리드 테이블
	
	//client_code 더블클릭 이벤트
      grid.on('dblclick', function(ev) {
          if (ev.columnName === 'client_code') {
              window.open(contextPath + '/so/returnMainChild', 'childWindow', 'width=500,height=500');
          }
      });
	    	
      window.addEventListener('message', function(ev) {
          const selectedRow = ev.data;
          const focusedCell = grid.getFocusedCell();
          grid.setValue(focusedCell.rowKey, 'client_code', selectedRow.client_code);
          grid.setValue(focusedCell.rowKey, 'client_name', selectedRow.client_name);
      });
	    	
   	/* const companyCode = getSessionParameter('company_code'); // 세션에서 company_code 가져오기, 세션 현재 없어서 주석 */
   	const company_code = "1234567890";
	    	
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
   
   function loadGridData() {
	    $.ajax({
	        url: "<%=request.getContextPath()%>/so/getReturnAdd",
	        method: "POST",
	        dataType: "JSON",
	        contentType: "application/json; charset=utf-8",
	        success: function(returnAdd) {
	            console.dir(returnAdd);
	            grid.resetData(returnAdd);
	        },
	        error: function(returnAdd) {
	            alert('에러');
	        }
	    }); //ajax끝
	}
   

	//행의 컬럼 클릭시 rowKey 받아와서 Detail Select   
   grid.on('focusChange', function(ev) {
	    const rowKey = ev.rowKey;
	    console.log(rowKey);
	    
	    const rowData = grid.getRow(rowKey);
	    console.log(rowData);
	    const return_number = rowData.return_number;
	    console.log(return_number);
	    
	    $.ajax({
	        url: "<%=request.getContextPath()%>/so/getReturnDetail",
	        method: "POST",
	        dataType: "JSON",
	        data: { return_number: return_number },
	        success: function(returnDetail) {
	            // 가져온 데이터를 grid2에 표시합니다.
	            grid2.resetData(returnDetail);
	        },
	        error: function() {
	            alert('에러');
	            console.log(returnDetail);
	        }
	    });
	    
	});
   
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
	
   //삭제
	$('#deleteRowBtn').on("click", function() {
    const focusedCell = grid.getFocusedCell();
    if (focusedCell.rowKey === null) {
        alert('삭제할 행을 선택해주세요.');
        return;
    }

    const rowData = grid.getRow(focusedCell.rowKey);
    const return_number = rowData.return_number;

    // AJAX 요청을 사용하여 선택된 행의 return_number 값을 서버에 전달하고 해당 행을 삭제합니다.
    $.ajax({
        url: "<%=request.getContextPath()%>/so/deleteReturnAdd",
        method: "POST",
        data: { return_number: return_number },
        success: function() {
            alert('삭제되었습니다.');
        	//전체 데이터 조회	    
        	loadGridData();
        	// 위에 loadGridData 함수를 호출하면 ajax로 전체데이터 조회하게 해놨는데 작동하나?
        },
        error: function() {
            alert('삭제 중 오류가 발생했습니다.');
        }
    	});
	});
   
   //초기화
   $('#reset').on("click", function() {
    // jQuery Date Picker 날짜 초기화
    $('#datepicker').datepicker('setDate', null);
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
   
	});

   // 버튼을 클릭하면 테이블에 새로운 열을 추가합니다.
   $('#addRowBtn').on("click", function() {
       grid.appendRow();
   });

	// 저장 버튼 클릭 이벤트
	   $('#saveBtn').on("click", function() {
	       // 확인창을 띄우고 확인 버튼을 누르면 저장 진행
	       if (confirm('저장하겠습니까?')) {
	           saveGridData();
	       }
	   });

   //세이브버튼 이벤트 저장과 업데이트
	function saveGridData() {
	    const modifiedRows = grid.getModifiedRows();
	    const createRows = modifiedRows.createdRows;
	    const updateRows = modifiedRows.updatedRows;
	    
	    // 데이터 확인
	    console.log("createRows:", createRows);
	    console.log("updateRows:", updateRows);
	
	    // 새로운 행과 수정된 행을 서버로 전송하기 위한 AJAX 요청
	    $.ajax({
	        url: "<%=request.getContextPath()%>/so/saveReturnAdd",
	        method: "POST",
	        dataType: "json",
	        contentType: "application/json; charset=utf-8",
	        data: JSON.stringify({ "createRows": createRows, "updateRows": updateRows }),
	        success: function() {
	            alert('저장되었습니다.');
	            // 저장 후 그리드 데이터를 다시 불러옵니다.
	            loadGridData();
	        },
	        error: function(xhr, status, errorThrown) {
	            console.log('Error occurred:', status, errorThrown);
	            alert('에러');
	        }

	    });
	}
 
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
	$("#datepicker").datepicker(datepickerConfig);

	
	//grid2 테이블 관련 설정
	 var grid2 = new tui.Grid({
    	el: document.getElementById('grid2'),
        scrollX: false,
        scrollY: false,
        data:[],
        rowHeaders: ['rowNum','checkbox' ],
        checkOnlyOneRow: true,
        columns: [
            { header : 'sorder', name: 'sorder', editor: false},
            { header : '입고일자', name: 'receive_date', 
            	editor: {
	        	  type: 'datePicker',
	              options: {
	                format: 'yyyy-MM-dd'
	              }}},
            { header : '아이템코드', name: 'item_code', editor: false},
            { header : '품번', name: 'item_no', editor: false},
            { header : '품명', name: 'item_name', editor: false},
            { header : '품목유형', name: 'item_type', editor: false},
            { header : '재고단위', name: 'item_stock_unit', editor: false},
            { header : '수량', name: 'item_quantity', editor: 'text'},
            { header : 'LOT번호', name: 'lot_number', editor: 'text'},
            { header : '비고', name: 'memo', editor: 'text'},
            { header : '회사코드', name: 'company_code', hidden: true}
    	]
    	}); //그리드 테이블

    	
	// 거래처 코드 입력 필드 클릭 이벤트 등록
	 $('#client_code').click(function() {
	     const url = '/childWindow'; // 새 창의 URL
	     const name = 'childWindow'; // 새 창의 이름
	     const specs = 'width=500,height=500'; // 새 창의 크기
	     const childWindow = window.open(url, name, specs); // 새 창 열기
	     childWindow.focus();
	 });
    	
   // grid2 행추가. 행을 추가하며 추가된 행의 company_code 컬럼에 세션에서 받아온 데이터 넣음
   $('#addRowBtn2').on("click", function() {
	    // 현재 선택된 행의 데이터를 가져옵니다.
	   	const focusedRowData = grid.getRow(grid.getFocusedCell().rowKey);
	   	const return_number = focusedRowData.return_number;
	   	console.log(return_number);
	   	
	   	grid2.appendRow({ return_number: return_number, company_code: company_code });
   });
    	
	// grid2 저장
	$('#saveBtn2').on("click", function() {
       // 확인창을 띄우고 확인 버튼을 누르면 저장 진행
       if (confirm('저장하겠습니까?')) {
           saveGrid2Data();
       }
	 });

	//세이브버튼 이벤트 저장과 업데이트
	function saveGrid2Data() {
	    const allRows = grid2.getData(); // 그리드의 모든 로우 데이터를 가져옵니다.
	    const modifiedRows2 = grid2.getModifiedRows();
	    const createRows2 = modifiedRows2.createdRows;
	    const updateRows2 = modifiedRows2.updatedRows;

	    // 새로 추가된 로우의 company_code 값을 확인합니다.
	    allRows.forEach(function(row, index) {
	        const isCreatedRow = createRows2.findIndex(function(createdRow) {
	            return createdRow.rowKey === row.rowKey;
	        }) !== -1;
	        const isUpdatedRow = updateRows2.findIndex(function(updatedRow) {
	            return updatedRow.rowKey === row.rowKey;
	        }) !== -1;

	        if (row.company_code === company_code && !isCreatedRow && !isUpdatedRow) {
	            createRows2.push(row);
	        }
	    });

	    // 데이터 확인
	    console.log("createRows2:", createRows2);
	    console.log("updateRows2:", updateRows2);
	    console.log(company_code);
	
	
	    // 새로운 행과 수정된 행을 서버로 전송하기 위한 AJAX 요청
  	    $.ajax({
	        url: "<%=request.getContextPath()%>/so/saveReturnDetail",
	        method: "POST",
	        dataType: "json",
	        contentType: "application/json; charset=utf-8",
	        data: JSON.stringify({ "createRows2": createRows2, "updateRows2": updateRows2 }),
	        success: function() {
	            alert('저장되었습니다.');
	            // 저장 후 그리드 데이터를 다시 불러옵니다.
	            /* loadGridData(); */
	        },
	        error: function(xhr, status, errorThrown) {
	            console.log('Error occurred:', status, errorThrown);
	            alert('에러'); 
	        }
	
	    });
	}
   
	//체크박스 선택된 항목들 삭제
	$('#deleteRowBtn2').on("click", function() {
    	const checkedRows = grid2.getCheckedRows();
    	if (checkedRows.length === 0) {
   	        alert('삭제할 행을 선택하여 주세요');
   	        return;
   	    }
    	
        const sorder = checkedRows.map(function(row) {
            return row.sorder;
        });
        console.log(sorder);
        

	    if (confirm('선택한 행을 삭제하시겠습니까?')) {
	        $.ajax({
	            url: "<%=request.getContextPath()%>/so/deleteReturnDetail",
	            method: "POST",
	            dataType: "json",
	            data: JSON.stringify(sorder),
	            contentType: "application/json; charset=utf-8",
	            success: function(response) {
	                if (response.success) {
	                    // 성공적으로 삭제되면, 선택된 행을 그리드에서 제거합니다.
	                    const checkedRowKeys = grid2.getCheckedRowKeys();
	                    grid2.removeRow(checkedRowKeys, {
	                        removeOriginalData: true
	                    });
	                    alert("삭제성공");
	                    
	                    // 체크박스 선택을 초기화합니다.
	                    grid2.uncheckAll();
	                } else {
	                    alert('삭제 중 오류가 발생했습니다.');
	                }
	            },
	            error: function() {
	                alert('삭제 요청 중 에러가 발생했습니다.');
	            }
	        });
	    }
	});
	
	//아이템코드를 더블클릭해서 품번, 품명, 품목유형, 재고단위 조회하기
	
    	
}); //jQuery ready 끝

</script>
</head>
<body>
	<h1>반품관리</h1>
	<div class="button-container">
    	<button id="saveBtn">
            <i class="fas fa-plus"></i>
            저장
        </button>
       	<button id="search">
           	<i class="fas fa-search"></i>
            조회
        </button>
	    <button id="deleteRowBtn">
	    	<i class="fas fa-trash-alt"></i>
	    	삭제
		</button>
		<button id="reset">
	    <i class="fas fa-undo"></i>
	    초기화
		</button>
	</div>
	<p>반품일자 :
	<input type="text" id="datepicker" readonly="readonly" >
	<hr/>
	<input type="button" value="행추가" id="addRowBtn"/>
	<hr/>
	<!-- 그리드 삽입장소 -->
	<div id="grid"></div>
	
	<hr/>
	<h1>세부항목</h1>
	<div class="grid2-buttons">
    <button id="addRowBtn2">
        <i class="fas fa-plus"></i>
        행 추가
    </button>
    <button id="saveBtn2">
        <i class="fas fa-save"></i>
        저장
    </button>
    <button id="deleteRowBtn2">
        <i class="fas fa-trash-alt"></i>
        삭제
    </button>
</div>
	<div id="grid2"></div>
</body>
</html>