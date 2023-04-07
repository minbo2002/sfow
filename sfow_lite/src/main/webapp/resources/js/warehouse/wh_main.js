window.onload = function() {
     
   var gridData=[];
   var grid = new tui.Grid({
         el: document.getElementById('grid'),
         data: gridData,
         scrollX: true,
         scrollY: true,
         
         rowHeaders: [{
             type: 'rowNum',
             header: "",
             width: 50,
         },'checkbox'],
           columns: [
        	 {
                 header: '회사코드',            // [필수] 컬럼 이름
                 name: 'company_code',                 // [필수] 컬럼 매핑 이름 값
                 hidden: true,                   // [선택] 숨김 여부
             },
            	{
                header: '창고구분',
                sortable: true, //정렬하는거 옆에 삼각형 2개생김
                editor:'text', //텍스트 수정 (아직 db까지 안가고 화면에서만 가능)
                align:'center', //텍스트 가운데정렬
                name: 'warehouse_type'
              },
           {
             header: '창고코드',
             sortable: true,
             editor:'text',
             filter: {
                 type: 'text',
                 showApplyBtn: true,
                 showClearBtn: true
             },
             align:'center',
             name: 'warehouse_code',
           
           },
           {
             header: '창고명',
             sortable: true,
             editor:'text',
             align:'center',
             name: 'warehouse_name',
             filter: {
                 type: 'text',
                 showApplyBtn: true,
            	 showClearBtn: true
             },
           },
           {
             header: '거래처코드',
             sortable: true,
             editor:'text',
             align:'center',
             name: 'customer_code'
           },
           {
             header: '비고',
             sortable: true,
             editor:'text',
             width:'auto',
             align:'center',
             name: 'memo'
           },
           {
             header: '사용여부',
             sortable: true,
             editor:'text',
             align:'center',
             width:'90',
             name: 'useyn',
          //formatter: 'listItemText',     // [선택] 값을 기반으로 select box 옵션
             editor: {
                 type: 'select',
                 options: {
                     listItems: [
                         {text: "Y", value: "Y"},
                         {text: "N", value: "N"},
                     ]
                 }
             },
           },
           {
               header: '등록일',
               sortable: true,
               align:'center',
               width:'150',
               name: 'createdate'
             },
             {
               header: '등록자',
               sortable: true,
               editor:'text',
               align:'center',
               name: 'createuser'
             },
             {
                 header: '수정일시',
                 sortable: true,
                 align:'center',
                 width:'150',
                 name: 'updatedate'
               },
             {
                 header: '수정자',
                 sortable: true,
                 editor:'text',
                 align:'center',
                 name: 'updateuser'
               }
             
         ]

       }); //그리드 컬럼끝
   
    // 모든 목록 보여주는 ajax
    $.ajax({
      url : '../warehouse/whinfoAJ',
      method : 'GET',
      dataType : 'JSON',
      success : function(result) {
         console.dir(result);
        grid.resetData(result);
      } 
      
      
   });
 
       
 //행 추가
	var addRowBtn = document.getElementById('addRowBtn');
	addRowBtn.addEventListener('click', function() {
	  var newRowData = {
		warehouse_type:'',
		warehouse_code:'',
		warehouse_name:'',
		customer_code:'',
		 memo: '',
		 useyn: '',
		 createdate: '',
		 createuser:'',
		 updatedate: '',
		 updateuser:''
		 };
	  grid.appendRow(newRowData);
		 
	}); 


	var gridData2=[];
	   var grid2 = new tui.Grid({
	         el: document.getElementById('areaGrid'),
	         data: gridData2,
	         scrollX: false,
	         scrollY: false,
	         align:'center',
	         width: '500px',
	         rowHeaders: [{
	             type: 'rowNum',
	             header: "",
	             width: 50,
	         },'checkbox'],
	           columns: [
	        	 {
	        		 header: '구역코드',
		                sortable: true, //정렬하는거 옆에 삼각형 2개생김
		                editor:'text', //텍스트 수정 (아직 db까지 안가고 화면에서만 가능)
		                align:'center', //텍스트 가운데정렬
		                width: '150',
		                name: 'area_code'              
	             },
	            	{
	                header: '구역명',
	                sortable: true, //정렬하는거 옆에 삼각형 2개생김
	                editor:'text', //텍스트 수정 (아직 db까지 안가고 화면에서만 가능)
	                align:'center', //텍스트 가운데정렬
	                width: '150',
	                name: 'area_name'
	              }
	         ]
	       }); //area 그리드 컬럼끝
	       
	  //행 추가
		var addRowBtn2 = document.getElementById('addRowBtn2');
		addRowBtn2.addEventListener('click', function() {
		  var newRowData =[{area_code:''},{ area_name:''}];
		  grid2.appendRow(newRowData);
		});
		
		// 그리드 클릭하면 정보 데려오기
 		/* grid.on('click', (ev) => {
			  const { rowKey } = grid.getFocusedCell();
			  const rowData = grid.getRow(rowKey);
			  
			  const whcode= rowData.warehouse_code;
			  
			//alert(whcode); 
		});
		*/
		
	//조회 버튼 클릭하면 특정 내용 검색(빈내용이면 전부 검색)
	$(document).ready(function(){
			
			  $('#searchBtn').click(function(event) {
				  event.preventDefault(); // prevent form submission
				  var Grid = tui.Grid;
				    // get search parameters
				    var warehouse_type = $('#warehouse_type').val();
				    var warehouse_code = $('#warehouse_code').val();
				    var warehouse_name = $('#warehouse_name').val();
				   // alert(warehouse_type);
				     
				    // make AJAX call to server
				    $.ajax({
				      url:'../warehouse/searchWH',
				      type: 'get',
				      dataType:'JSON',
				      data: {
			    	  warehouse_type: warehouse_type,
			    	  warehouse_code: warehouse_code,
			    	  warehouse_name: warehouse_name
			      },
			      success: function(data) {
			    	 	console.dir(data);
			    	 	grid.clear();
			    	 	grid.resetData(data);
			    	  	
			    	  	
			      }
			    	   	 });
			 	});
			});
		
		
		// 행 삭제
		var deleteRow2 = document.getElementById("deleteRow2");
		deleteRow2.addEventListener("click", function() {
	
			areaGrid.removeCheckedRows(true);
			// grid.blur();
		});
		
		//창고 등록
		
		$(document).ready(function(){
			
			$("#saveBtn").click(function(){
			
			var rowDatas = grid.getCheckedRows();	// 선택한 row에 해당하는 객체값
			alert("rowDatas : " + rowDatas);
			var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
			alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
			
			
		 	$.ajax({
				url : '../warehouse/insertWH',
				method : 'post',
				data : jsonRowDatas,
				contentType : 'application/json; charset=utf-8',  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
				dataType: 'json',			// 서버에서 받을 데이터타입
				success : function (result) {
					alert(result); // result는 반환받은 json형태의 객체 
					alert('성공');
					
					
				},
				error: function() {
			        console.log("실패");
			    }
			});
		 	});
	 	}); 
	
	
	
	
	
	
	
};	//최초시작