$(document).ready(window.onload=function() {
	
	const opener=$(this)
	console.log(opener)
	
	class CustomTextEditor {
		  constructor(props) {
		    const el = document.createElement('input');

		    el.type = 'text';
		    el.value = String(props.value);

		    this.el = el;
		  }

		  getElement() {
		    return this.el;
		  }

		  getValue() {
		    return this.el.value;
		  }

		  mounted() {
		    this.el.select();
		  }
		}

    const Grid = tui.Grid;
    const grid = new Grid({    
		
        el: document.getElementById('grid'),
        scrollX: true,
        scrollY: true,
       
        rowHeaders: [
	       { type: 'rowNum', align: 'center'},
    	   { type: 'checkbox' }
        ],
        columns: [
          {
            header: 'ITEM코드',
            name: 'item_code',
            align: 'center',
            filter: {
                      type: 'text',
                      showApplyBtn: true,
                      showClearBtn: true
                     },
          },
          {
            header: '품명',
            name: 'item_name',
            align: 'center',
            editor: 'text',
            align: 'center',
            filter: {
                      type: 'text',
                      showApplyBtn: true,
                      showClearBtn: true
                     },
          },
          {
            header: '품번',
            name: 'item_no',
            editor: 'text',
            align: 'center',
            filter: {
                      type: 'text',
                      showApplyBtn: true,
                      showClearBtn: true
                     },
          },
          {
            header: '유형',
            name: 'item_type',
            id: 'item_type',
            onBeforeChange(ev) {
            	openModal();
            	
            	function openModal() {
         		   var modal = document.createElement('div');
         		   modal.classList.add('modal');
         		   
         		   // 모달창 드래그 이벤트 핸들러 등록
         		   var isDragging = false;
         		   var mouseOffsetX = 0;
         		   var mouseOffsetY = 0;
         		   var modalX = 0;
         		   var modalY = 0;
         		   var handleMouseDown = function (e) {
         		     isDragging = true;
         		     mouseOffsetX = e.clientX;
         		     mouseOffsetY = e.clientY;
         		     modalX = modal.offsetLeft;
         		     modalY = modal.offsetTop;
         		   };
         		   var handleMouseMove = function (e) {
         		     if (!isDragging) {
         		       return;
         		     }
         		     var deltaX = e.clientX - mouseOffsetX;
         		     var deltaY = e.clientY - mouseOffsetY;
         		     modal.style.left = modalX + deltaX + 'px';
         		     modal.style.top = modalY + deltaY + 'px';
         		   };
         		   var handleMouseUp = function (e) {
         		     isDragging = false;
         		   };
         		   modal.addEventListener('mousedown', handleMouseDown);
         		   document.addEventListener('mousemove', handleMouseMove);
         		   document.addEventListener('mouseup', handleMouseUp);
         		   
         		   modal.innerHTML = `
         			   <button type="button" class="close-modal">Close</button>	
         			   <iframe src="./item/typeSelect" width="100%" height="100%" style="border: none;"></iframe>
         		   `;
         		   document.body.appendChild(modal);

         		   modal.style.display = 'block';

         		   var closeModalButton = modal.querySelector('.close-modal');
         		   closeModalButton.addEventListener('click', () => {
         		     modal.remove();
         		   });   
         		 }
              },
              editor: {
                  type: CustomTextEditor
                  },
            align: 'center',
            filter: {
                      type: 'text',
                      showApplyBtn: true,
                      showClearBtn: true
                     },
          },
          {
            header: '규격',
            name: 'item_specification',
            onBeforeChange(ev) {
            
            	const rowKey = ev.rowKey;
             	const columnName = ev.columnName;
             	const rowData = grid.getRow(rowKey);

             	openModal();
/*            	
            	function openModal() {
            		window.open("./item/itemSpecificationSelect", "itemSpecificationSelect", "width=450, height=250, top=150, left=200");
            	} //openModal 끝	
            	item_specificaion = '<%= session.getAttribute("param1") %>';
            	console.log('rowData.item_specification!',item_specification);            	
            	grid.resetData(item_specificaion)
*/            	
            },
            editor: 'text',
            align: 'center',
            filter: {
                      type: 'text',
                      showApplyBtn: true,
                      showClearBtn: true
                     }, 
          },
          {
            header: '재고단위',
            name: 'item_stock_unit',
            callback: {
                onClick: function(e) {
                	
                	openModal();
                	
                	function openModal() {
             		   var modal = document.createElement('div');
             		   modal.classList.add('modal');
             		   
             		   // 모달창 드래그 이벤트 핸들러 등록
             		   var isDragging = false;
             		   var mouseOffsetX = 0;
             		   var mouseOffsetY = 0;
             		   var modalX = 0;
             		   var modalY = 0;
             		   var handleMouseDown = function (e) {
             		     isDragging = true;
             		     mouseOffsetX = e.clientX;
             		     mouseOffsetY = e.clientY;
             		     modalX = modal.offsetLeft;
             		     modalY = modal.offsetTop;
             		   };
             		   var handleMouseMove = function (e) {
             		     if (!isDragging) {
             		       return;
             		     }
             		     var deltaX = e.clientX - mouseOffsetX;
             		     var deltaY = e.clientY - mouseOffsetY;
             		     modal.style.left = modalX + deltaX + 'px';
             		     modal.style.top = modalY + deltaY + 'px';
             		   };
             		   var handleMouseUp = function (e) {
             		     isDragging = false;
             		   };
             		   modal.addEventListener('mousedown', handleMouseDown);
             		   document.addEventListener('mousemove', handleMouseMove);
             		   document.addEventListener('mouseup', handleMouseUp);
             		   
             		   modal.innerHTML = `
             			   <button type="button" class="close-modal">Close</button>	
             			   <iframe src="./item/itemStockUnitSelect" width="100%" height="100%" style="border: none;"></iframe>
             		   `;
             		   document.body.appendChild(modal);

             		   modal.style.display = 'block';

             		   var closeModalButton = modal.querySelector('.close-modal');
             		   closeModalButton.addEventListener('click', () => {
             		   console.log('item_specification~~', item_specification); 
             		   document.getElementById("item_specification").value = modal.item_specification;
             		   //modal.remove();
             		   });
             		 }
                }
              },
            	
            editor: 'text',
            align: 'center',
            filter: {
                      type: 'text',
                      showApplyBtn: true,
                      showClearBtn: true
                     },
          },
          {
            header: 'lot_Size',
            name: 'lotsize',
            editor: 'text',
            align: 'center',
            filter: {
                      type: 'text',
                      showApplyBtn: true,
                      showClearBtn: true
                     },
          },
          {
            header: '매입가격',
            name: 'buy_price',
            editor: 'text',
            align: 'center',
            filter: {
                      type: 'text',
                      showApplyBtn: true,
                      showClearBtn: true
                     }, 
          },
          {
            header: '매출가격',
            name: 'sales_price',
            editor: 'text',
            align: 'center',
            filter: {
                      type: 'text',
                      showApplyBtn: true,
                      showClearBtn: true
                     }, 
          },
          {
            header: '비고',
            name: 'memo',
            editor: 'text',
            align: 'center'
          },
          {
            header: '사용여부',
            name: 'useyn',
            formatter: 'listItemText',
            editor: {
                type: 'select',
                options: {
                  listItems: [
                    { text: 'Y', value: 'Y' },
                    { text: 'N', value: 'N' }
                  ]
                }
              },
            align: 'center',
            filter: {
                      type: 'text',
                      showApplyBtn: true,
                      showClearBtn: true
                     },
          },
          {
            header: '등록일시',
            name: 'createdate',
            align: 'center',
            filter: {
                      type: 'text',
                      showApplyBtn: true,
                      showClearBtn: true
                     },
          },
          {
            header: '수정일시',
            name: 'updatedate',
            align: 'center',
            filter: {
                      type: 'text',
                      showApplyBtn: true,
                      showClearBtn: true
                     }, 
          }
        ]       
      });
    
    Array.prototype.forEach.call(document.querySelectorAll('#addRow'), el => {
	      el.addEventListener('click', ev => {
	             
			const rowData = [{}]
			 					
			grid.appendRow(rowData, {
			at: grid.getRowCount(),
			focus: true,
			useViewMode: true,
				});
			});
			grid.enable();
		}); //addRow끝
      
     $.ajax({
        url : './item/productListAjax',
        method :'GET',
        dataType : 'JSON',
        contentType : 'application/json',
        success : function(result){
            grid.resetData(result);
            
        } //success끝 
    }); //ajax(/item/productListAjax)끝
        
    grid.on('check', function(ev) {	
	      
	    const rowKey = ev.rowKey;
    	const columnName = ev.columnName;
    	const rowData = grid.getRow(rowKey);
			console.log('check!', ev);
			console.log('check!', rowData);
			
    Array.prototype.forEach.call(document.querySelectorAll('#insertRow'), el => {
	      el.addEventListener('click', ev => {

				$.ajax({
                 url: './item/productInsertAjax',
                 method :'POST',
                 dataType: 'JSON',
                 data: JSON.stringify(rowData),
                 contentType: 'application/json',
                 success: function(response) {
                     console.log('Success:', response);
                     location.href="javascript:acyncMovePage('./item/productList');"
                 	},
                 error: function(error) {
                     console.log('Error:', error);
                     location.href="javascript:acyncMovePage('./item/productList');"
                 	}
             }); //ajax(/item/typeInsertAjax)끝
          }); //addEventListener끝
    	}); //insertRow 끝
	}); //grid.on('check')끝 
    
    grid.on('editingFinish', function(ev) {
    	
        const rowKey = ev.rowKey;
        const columnName = ev.columnName;
        var updatedData = {};
        const rowData = grid.getRow(rowKey);

		$.ajax({
	                 url: './item/productUpdateAjax',
	                 method :'PUT',
	                 dataType: 'JSON',
	                 data: JSON.stringify(rowData),
	                 contentType: 'application/json',
	                 success: function(response) {
	                     console.log('Success:', response);
	                     //location.href = "../item/productList";
	                 },
	                 error: function(error) {
	                     console.log('Error:', error);
	                     //location.href = "../item/productList";
	                 }
	             }); //ajax(/item/productUpdateAjax)끝
  }); //grid.on('editingFinish')끝
    
    grid.on('check', function(ev) {
     	const rowKey = ev.rowKey;
    	const columnName = ev.columnName;
    	const rowData = grid.getRow(rowKey);
    	
			console.log('check!', ev);
			console.log('check!', rowData);
			
	  Array.prototype.forEach.call(document.querySelectorAll('#deleteRow'), el => {
	      el.addEventListener('click', ev => {

				$.ajax({
                 url: './item/productDeleteAjax',
                 method :'PUT',
                 dataType: 'JSON',
                 data: JSON.stringify(rowData),
                 contentType: 'application/json',
                 success: function(response) {
                     console.log('Success:', response);
                     location.href="javascript:acyncMovePage('./item/productList');"
                 	},
                 error: function(error) {
                     console.log('Error:', error);
                     location.href="javascript:acyncMovePage('./item/productList');"
                 	}
             }); //ajax(/item/productDeleteAjax)끝
          }); //addEventListener끝
    	}); //deleteRow 끝
    }); //grid.on('check')끝 
    
	grid.on('click', function(ev) {
		
		const rowKey = ev.rowKey;
    	const columnName = ev.columnName;
    	const rowData = grid.getRow(rowKey);
    	
    	$('input[name=item_code]').attr('value',rowData.item_code);
    	$('input[name=item_name]').attr('value',rowData.item_name);
    	$('input[name=item_no]').attr('value',rowData.item_no);
    	$('input[name=item_type]').attr('value',rowData.item_type);
	});
	
	 Array.prototype.forEach.call(document.querySelectorAll('#searchBtn'), el => {   
       	 el.addEventListener('click', ev => {
       		 
       var item_code = $("#search_area input[name='item_code']").val();
       var item_name = $("#search_area input[name='item_name']").val();
       var item_no = $("#search_area input[name='item_no']").val();
       var item_type = $("#search_area input[name='item_type']").val();
       		           
       console.log('item_type', item_type);
       console.log('item_name', item_name);
       console.log('item_code', item_code);
       console.log('item_no', item_no);
       
       $.ajax({
   		type: 'POST',
   		dataType: 'JSON',
   		url: './item/productSearchAjax',
   		contentType: 'application/json',
   	    data: JSON.stringify({	
   	    	"item_type": item_type,
   	    	"item_name": item_name,
   	    	"item_code": item_code,
   	    	"item_no": item_no
   	        }),
   		success: function(data) {
   			 gridData=data
   	         grid.resetData(data)      
           	},
           error: function(error) {
               console.log('Error:', error);
           	}
       });
     
       	 });
       });
	 
      
  }); //window.onload끝