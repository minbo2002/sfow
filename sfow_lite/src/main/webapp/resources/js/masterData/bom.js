//페이지 불러오자마자 ItemList갖고오기
$(function(){
	$.ajax({
        url : " ma/bomGetItem",
        method :"POST",
        success : function(result){
        	grid1.resetData(result);
        } 
    });
});

//grid1 ItemList
var grid1 = new tui.Grid({
    el: document.getElementById('grid1'),
    scrollX: true,
    scrollY: true,
    rowHeaders: ['rowNum'],
    columns: [
      {
        header: 'ITEM코드',
        name: 'item_code',
        sortingType: 'desc',
        sortable: true
      },
      {
        header: '품명',
        name: 'item_name',
        sortingType: 'desc',
        sortable: true
      },
      {
        header: '품목코드',
        name: 'item_no',
        sortingType: 'desc',
        sortable: true
      },
      {
        header: '규격',
        name: 'item_specification',
        sortingType: 'desc',
        sortable: true,
      },
      {
        header: '품목구분',
        name: 'item_category',
        sortingType: 'desc',
        sortable: true,
      }
    ],
  });
	//grid1 로우 클릭시 grid2에 출력
	grid1.on('click', (ev) => {
		const { rowKey } = grid1.getFocusedCell();
		const rowData = grid1.getRow(rowKey);
		$.ajax({
			type: "GET",
	        url : "/ma/getBomTree?ppitem_cd="+rowData.item_code,
	        dataType: "json",
	        success: function(data) {
		        grid2.resetData(data);
		        grid3.resetData(data[0]._children);
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		        console.log(textStatus, errorThrown);
		    } 
	    });
	});

//grid2 트리 구조 출력
var grid2 = new tui.Grid({
    el: document.getElementById('grid2'),
    rowHeaders: ['checkbox'],
    treeColumnOptions: {
      name: 'item_code',
      useCascadingCheckbox: true
    },
    columns: [
      {
        header: 'BOM Tree',
        name: 'item_code',
        width: 300
      },
      {
        header: '품명',
        name: 'item_name'
      },
      {
        header: '품목코드',
        name: 'item_no'
      },
      {
        header: '규격',
        name: 'item_specification'
      }
    ]
  });


  grid2.on('expand', ev => {
    const { rowKey } = ev;
    const descendantRows = grid2.getDescendantRows(rowKey);

    console.log('rowKey: ' + rowKey);
    console.log('descendantRows: ' + descendantRows);

    if (!descendantRows.length) {
      grid.appendRow(
        {
          name: 'dynamic loading data',
          _children: [
            {
              name: 'leaf row'
            },
            {
              name: 'internal row',
              _children: []
            }
          ]
        },
        { parentRowKey: rowKey }
      );
    }
  });

  grid2.on('collapse', ev => {
    const { rowKey } = ev;
    const descendantRows = grid2.getDescendantRows(rowKey);

    console.log('rowKey: ' + rowKey);
    console.log('descendantRows: ' + descendantRows);
  });

//grid3 원자재목록 출력
var grid3 = new tui.Grid({
   el: document.getElementById('grid3'),
   scrollX: true,
   scrollY: true,
   rowHeaders: ['checkbox'],
   columns: [
     {
       header: '품명',
       name: 'item_name',
       sortingType: 'desc',
       sortable: true,
       editor: 'text'
     },
     {
       header: 'ITEM코드',
       name: 'item_code',
       sortingType: 'desc',
       sortable: true
     },
     {
       header: '품목코드',
       name: 'item_no',
       sortingType: 'desc',
       sortable: true
     },
     {
       header: '규격',
       name: 'item_specification',
       sortingType: 'desc',
       sortable: true,
     },
     {
         header: '소요량',
         name: 'item_qty',
         sortingType: 'desc',
         sortable: true,
     },
     {
         header: '단위',
         name: 'item_stock_unit',
         sortingType: 'desc',
         sortable: true,
     },
     {
       header: '품목구분',
       name: 'item_category',
       sortingType: 'desc',
       sortable: true,
     }
   ],
 });

//행 추가 버튼
var addRowBtn = document.getElementById('addRowBtn');
addRowBtn.addEventListener('click', function() {
	const { rowKey } = grid1.getFocusedCell();
	const rowData = grid1.getRow(rowKey);
	if(rowData == null) {
		alert("품목 선택 후 소요항목을 입력 해 주십시오.");
	}else{
		var newRowData = {
				 item_name: '',
				 item_code: '',
				 item_no: '',
				 item_specification: '',
				 item_qty: '',
				 item_unit: '',
				 item_category: '',
				 };
				  grid3.appendRow(newRowData);
	}

});

//저장버튼
$("#saveBtn").click(function() {
    let i = confirm('등록하시겠습니까?');
    if(i) {
       addToDB();
    }else {
       return false;
    }
 });

//저장 함수
function addToDB() {
	const { rowKey } = grid1.getFocusedCell();
	const ppitem_cd = grid1.getRow(rowKey).item_code;
    var rowDatas = grid3.getCheckedRows();   // 선택한 row에 해당하는 객체값
    alert("rowDatas : " + rowDatas);
    var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
    alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
    
    $.ajax({
       url : "/ma/addTree",
       method : "post",
       data : JSON.stringify({
   			ppitem_cd : ppitem_cd,
   			checkedRow : rowDatas
	   		}),
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

//grid3 품명 입력했을 때
/*grid3.on('click', () => {
	  const { rowKey } = grid3.getFocusedCell();
	  var rowCnt;
	  grid3.check(rowKey);
	  for (rowCnt = 1; rowCnt <= grid3.getRowCount(); rowCnt++) {
		  if(rowCnt != rowKey) {
			  grid3.uncheck(rowCnt);
		  }
		}
	})*/
	
grid3.on('editingFinish', () => {
	const { rowKey } = grid3.getFocusedCell();
	const rowData = grid3.getRow(rowKey);
	show();
	modalController(rowData.item_name);
	searchItem(rowData.item_name)
	})

//아이템 검색 ajax
function searchItem(item_name){
	$.ajax({
	    url: "/ma/searchItem",
        method : "POST",
	    data : item_name,
	    contentType : "application/json; charset=utf-8",
        dataType : "json",
	    success: function(data) {
	    	grid_popup.resetData(data);
	    },
	    error: function(){
	    	alert("품목 찾는 도중 에러발생")
	    }
	});
}

//조회눌렀을 때
function searchBtn() {
	const name = document.getElementById('searchInput').value;
	if(name == ""){
		alert("품명을 입력하세요");
	}else{
		searchItem(name);
	}
}

//엔터쳤을 때
function press(event){
    if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함
    	const name = document.getElementById('searchInput').value;
    	console.log(name);
    	if(name == ""){
    		alert("품명을 입력하세요");
    	}else{
    		searchItem(name);
    	}
    }
}

//grid_popup 모달 창 그리드
var grid_popup = new tui.Grid({
	   el: document.getElementById('grid_popup'),
	   scrollX: true,
	   scrollY: true,
	   rowHeaders: ['checkbox'],
	   columns: [
	     {
	       header: '품명',
	       name: 'item_name',
	       sortingType: 'desc',
	       sortable: true,
	       editor: 'text'
	     },
	     {
	       header: 'ITEM코드',
	       name: 'item_code',
	       sortingType: 'desc',
	       sortable: true
	     },
	     {
	       header: '품목코드',
	       name: 'item_no',
	       sortingType: 'desc',
	       sortable: true
	     },
	     {
	         header: '단위',
	         name: 'item_stock_unit',
	         sortingType: 'desc',
	         sortable: true,
	     },
	     {
	       header: '품목구분',
	       name: 'item_category',
	       sortingType: 'desc',
	       sortable: true,
	     }
	   ],
	 });

//모달창 함수
function show () {
  document.querySelector(".background").className = "background show";
}

function close () {
	  document.querySelector(".background").className = "background";
	}

document.querySelector(".close-area").addEventListener("click", close);
document.querySelector(".closeBtn").addEventListener("click", close);

//모달 input 창에 데이터 넘기기
function modalController(data){
	$("#searchInput").val(data);
}

//모달창에서 적용버튼
$(".applyBtn").click(function() {
    var checkedRow = grid_popup.getCheckedRows();
    const { rowKey } = grid1.getFocusedCell();
	const ppitem_cd = grid1.getRow(rowKey).item_code;
    $.ajax({
        url : "/ma/dupTest",
        method : "post",
        data : JSON.stringify({
        		ppitem_cd : ppitem_cd,
        		checkedRow : checkedRow
        	   }),
        contentType : "application/json",  // 전송 데이터타입.  application/json로 설정해야 JSON을 처리할수있는 HTTP메세지컨버터가 실행된다
        dataType: "text",         // 서버에서 받을 데이터타입
        success : function (result) {
           if(result == 1){
        	   alert("이미 포함된 원자재입니다.")
           }else{
        	   var { rowKey } = grid3.getFocusedCell();
        	    const endCnt = rowKey + checkedRow.length - 1;
        	    checkedRow.forEach(function(rowData) {
        	    	  grid3.setRow(rowKey, rowData);
        	    	  if(rowKey != endCnt) {
        	    		  grid3.appendRow();
        	    	  }
        	    	  rowKey++;
        	    	});
        		close();  
           }
        },
        error: function() {
             console.log("실패");
         }
     });
    
 });

