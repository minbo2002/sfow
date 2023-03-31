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
	<button onclick="#"><i class="fa fa-floppy-o" aria-hidden="true"></i>저장</button>
</div>
<p>ITEM</p>
<div id="grid1"></div>
<p>BOM Tree</p>
<div id="grid2"></div>
<p>원자재목록</p>
<div id="grid3"></div>

<script>
$(function(){
	$.ajax({
        url : "${conPath}/ma/bomGetItem",
        method :"POST",
        success : function(result){
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
        name: 'item_type',
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
		        console.log(data.item_code);
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
   rowHeaders: ['rowNum','checkbox'],
   columns: [
     {
       header: '품명',
       name: 'item_name',
       sortingType: 'desc',
       sortable: true
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
       name: 'item_type',
       sortingType: 'desc',
       sortable: true,
     }
   ],
 });

</script>
</body>
</html>