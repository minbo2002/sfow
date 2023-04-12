
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
    { header: '유형', name: 'item_type',
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
	    columns: [{ header: '유형', name: 'item_type', align: 'center', ediFtor:'text'}]});       		
		
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
		    const item_type = rowData.item_type;
		    
		   Array.prototype.forEach.call(document.querySelectorAll('#applyBtn'), el => {
			      el.addEventListener('click', ev => {
			    	  console.log('item_type!', item_type);
			    	  	grid.setValue(tp.rowKey,tp.columnName,item_type)
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
		           var item_type = $("#modal_search input[name='keyword']").val();
		           console.log('item_type:', item_type);
		           $.ajax({
		       		type: 'POST',
		       		dataType: 'JSON',
		       		url: 'item/typeSelectSearchAjax',
		       		contentType: 'application/json',
		       	    data: JSON.stringify({	
		       	    	"item_type": item_type
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
	var searchData = {
			itemCode: $("#itemCode").val(),
			itemName: $("#itemName").val(),
			itemNo: $("#itemNo").val(),
			useyn: $("#useyn").val()
		    
	}
	$.ajax({
		url : "semi/toastSemiDataList",		//toastDataList
		method :"POST",
		data:searchData,
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
    item_type: '',
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
        grid.setValue(focusedCell.rowKey, 'clientCode', selectedRow.clientCode);
        grid.setValue(focusedCell.rowKey, 'companyCode', selectedRow.companyCode);
        grid.setValue(focusedCell.rowKey, 'itemCode', selectedRow.itemCode);
    });

	


