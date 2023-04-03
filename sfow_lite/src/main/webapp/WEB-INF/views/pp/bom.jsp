<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* #grid1 {
	float: left;
}
#grid2 {
	float: left;
} */
</style>

</head>
<body>
<div>
</div>
	<p>ITEM</p>
<div id="grid1"></div>
	<p>BOM Tree</p>
<div id="grid2"></div>
<div>
	<span>원자재목록</span><button id="addRowBtn"><i class="fa fa-plus" aria-hidden="true"></i></button>
	<button id="saveBtn"><i class="fa fa-cloud" aria-hidden="true"></i>저장</button>
</div>
<div id="grid3"></div>
<div id="container">
        <h2>Lorem Ipsum</h2>
        <button id="btn-modal">모달 창 열기 버튼</button>
        <div id="lorem-ipsum"></div>
    </div>
    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2>모달</h2>
            </div>
            <div class="close-area">X</div>
            <div class="content">
                <p>가나다라마바사 아자차카타파하</p>
                <p>가나다라마바사 아자차카타파하</p>
                <p>가나다라마바사 아자차카타파하</p>
                <p>가나다라마바사 아자차카타파하</p>
                
            </div>
        </div>
    </div>
<script>
$(function(){
	$.ajax({
        url : "${conPath}/ma/bomGetItem",
        method :"POST",
        success : function(result){
        	console.log(result);
        	grid1.resetData(result);
        } 
    });
});

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

	grid1.on('click', (ev) => {
		const { rowKey } = grid1.getFocusedCell();
		const rowData = grid1.getRow(rowKey);
		$.ajax({
			type: "GET",
	        url : "${conPath}/ma/getBomTree?ppitem_cd="+rowData.item_code,
	        dataType: "json",
	        success: function(data) {
		        grid2.resetData(data);
		        grid3.resetData(data[0]._children);
		        console.log(data);
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		        console.log(textStatus, errorThrown);
		    } 
	    });
	});
	
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
         name: 'item_unit',
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
});

$("#saveBtn").click(function() {
    let i = confirm('등록하시겠습니까?');
    if(i) {
       addToDB();
    }else {
       return false;
    }
 });
 
function addToDB() {

    var rowDatas = grid3.getCheckedRows();   // 선택한 row에 해당하는 객체값
    alert("rowDatas : " + rowDatas);
    var jsonRowDatas = JSON.stringify(rowDatas);   // 선택한 row에 해당하는 객체를 JSON 문자배열로 반환
    alert("JSON.stringify(rowDatas) : " + jsonRowDatas);
    
    $.ajax({
       url : "${conPath}/ma/addTree",
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

grid3.on('editingFinish', () => {
	  const { rowKey } = grid3.getFocusedCell();
		const rowData = grid3.getRow(rowKey);
		alert('editingFinish!!'+rowData.item_name);
	})

</script>
</body>
</html>