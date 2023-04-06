$(document).ready(window.onload=function() {
   
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
            header: '재고단위',
            name: 'item_stock_unit',
            editor:'text'
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
        url : './item/stockunitListAjax',
        method :'GET',
        dataType : 'JSON',
        success : function(result){
            grid.resetData(result);
        
             } //success끝 
          }); //ajax(/item/typeAjax)끝
     
     grid.on('check', function(ev) {	
	      
		const rowKey = ev.rowKey;
     	const columnName = ev.columnName;
     	const rowData = grid.getRow(rowKey);
			//console.log('check!', ev);
			//console.log('check!', rowData);
			
     Array.prototype.forEach.call(document.querySelectorAll('#insertRow'), el => {
		      el.addEventListener('click', ev => {

				$.ajax({
	                 url: './item/StockUnitInsertAjax',
	                 method :'POST',
	                 dataType: 'JSON',
	                 data: JSON.stringify(rowData),
	                 contentType: 'application/json',
	                 success: function(response) {
	                     console.log('Success:', response);
	                     location.href="javascript:acyncMovePage('./item/stockunitList');"
	                 	},
	                 error: function(error) {
	                     console.log('Error:', error);
	                     location.href="javascript:acyncMovePage('./item/stockunitList');"
	                 	}
	             }); //ajax(/item/typeInsertAjax)끝
	          }); //addEventListener끝
	    	}); //insertRow 끝
	}); //grid.on('check')끝
     
				grid.on('click', function(ev) {
					
					const rowKey = ev.rowKey;
	            	const columnName = ev.columnName;
	            	const rowData = grid.getRow(rowKey);
	            	
	            	$('input[name=item_stock_unit]').attr('value',rowData.item_stock_unit);
				});
				
				 Array.prototype.forEach.call(document.querySelectorAll('#searchBtn'), el => {   
		           	 el.addEventListener('click', ev => {
		           		 
		           var item_stock_unit = $("#search_area input[name='item_stock_unit']").val();
		           		           
		           console.log('item_stock_unit:', item_stock_unit);
		           
		           $.ajax({
		       		type: 'POST',
		       		dataType: 'JSON',
		       		url: './item/stockunitSearchAjax',
		       		contentType: 'application/json',
		       	    data: JSON.stringify({	
		       	    	"item_stock_unit": item_stock_unit
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