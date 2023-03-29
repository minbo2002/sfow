<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객반품등록</title>
<script>
$(document).ready(window.onload=function() {
  $('#searchBtn').click(function(event) {
    event.preventDefault(); // prevent form submission
    
    // get search parameters
    var item_type = $('#item_type').val();
    var warehouse_name = $('#warehouse_name').val();
    var item_name = $('#item_name').val();
    var item_code = $('#item_code').val();
    
    // make AJAX call to server
    $.ajax({
      url: '<%=request.getContextPath()%>/search',
      type: 'get',
      dataType:'JSON',
      data: {
        item_type: item_type,
        warehouse_name: warehouse_name,
        item_name: item_name,
        item_code: item_code
      },
      success: function(data) {
    	 	gridData=data	
    	  	grid.resetData(data)
    	   	
    	   	grid.on('editingFinish', function(ev) {
            const rowKey = ev.rowKey;
            const columnName = ev.columnName;
            var updatedData = {};
            const rowData = grid.getRow(rowKey);
            console.log('Row data: ', rowData);
            
            $.ajax({
                 url: '<%=request.getContextPath()%>/updateStock',
                 method: 'PUT',
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
    	  },
      error: function(xhr, status, error) {
        // handle error
        console.log(error);
      }
    });
  });
});
</script>
</head>
<body>
	<h1>반품관리</h1>
 	<form id="stockSearch" > 
	<input type="submit" value="searchBtn" id="searchBtn">
	<input type="reset" value="초기화">
 	<button>이동</button><br/><br/>
		<label for="itemType">품목구분</label>
		<select name="item_type" id="item_type">
			<option value="">--</option>
			<option value="pro1">제품</option>
			<option value="pro2">반제품</option>
			<option value="pro3">원자재</option>
			<option value="pro4">부자재</option>
			<option value="pro5">상품</option>
			<option value="pro6">기타</option>
			<option value="pro7">설비</option>
			<option value="pro8">설비예비부품</option>
			<option value="pro9">금형</option>
			<option value="pro10">금형예비부품</option>
			<option value="pro11">치공구</option>
			<option value="pro12">검사장비</option>
			<option value="pro13">소재</option>
			<option value="pro14">예비부품</option>
			<option value="pro15">소모품</option>
		</select>
		<label for="warehouseName">창고명:</label>
		<select name="warehouse_name" id="warehouse_name">
			<option value="">--</option>
			<option value="마우스창고">마우스창고</option>
			<option value="키보드창고">키보드창고</option>
			<option value="모니터창고">모니터창고</option>
		</select>
		<label for="itemName">품명:</label>
		<input type="text" name="item_name" id="item_name" value="">
		<label for="itemCode">품목코드:</label>
		<input type="text" name="item_code" id="item_code" value="">
		
	</form> 
	<hr><br>

<div id="grid"></div>
    <script>
    class RowNumberRenderer {
      constructor(props) {
        const el = document.createElement('span');
        el.innerHTML = `No.${props.formattedValue}`;
        this.el = el;
      }

      getElement() {
        return this.el;
      }

      render(props) {
        this.el.innerHTML = `No.${props.formattedValue}`;
      }
    }

    class CheckboxRenderer {
      constructor(props) {
        const { grid, rowKey } = props;

        const label = document.createElement('label');
        label.className = 'checkbox tui-grid-row-header-checkbox';
        label.setAttribute('for', String(rowKey));

        const hiddenInput = document.createElement('input');
        hiddenInput.className = 'hidden-input';
        hiddenInput.id = String(rowKey);

        const customInput = document.createElement('span');
        customInput.className = 'custom-input';

        label.appendChild(hiddenInput);
        label.appendChild(customInput);

        hiddenInput.type = 'checkbox';
        label.addEventListener('click', (ev) => {
          ev.preventDefault();

          if (ev.shiftKey) {
            grid[!hiddenInput.checked ? 'checkBetween' : 'uncheckBetween'](rowKey);
            return;
          }

          grid[!hiddenInput.checked ? 'check' : 'uncheck'](rowKey);
        });

        this.el = label;

        this.render(props);
      }

      getElement() {
        return this.el;
      }

      render(props) {
        const hiddenInput = this.el.querySelector('.hidden-input');
        const checked = Boolean(props.value);

        hiddenInput.checked = checked;
      }
    }
    var gridData = [];
    var grid = new tui.Grid({
      el: document.getElementById('grid'),
      data: gridData,
      rowHeaders: [
        {
          type: 'rowNum',
          renderer: {
            type: RowNumberRenderer
          }
        },
        {
          type: 'checkbox',
          header: `
          <label for="all-checkbox" class="checkbox">
            <input type="checkbox" id="all-checkbox" class="hidden-input" name="_checked" />
            <span class="custom-input"></span>
          </label>
        `,
          renderer: {
            type: CheckboxRenderer
          }
        }
      ],
      columns: [
        {
          header: '창고명',
          name: 'warehouse_name',
        },
        {
          header: '품목이름',
          name: 'item_name'
        },
        {
          header: '품목코드',
          name: 'item_code'
        },
        {
          header: '양품수량',
          name: 'pass_quantity',
          editor: 'text'
        },
        {
          header: '불량수량',
          name: 'fail_quantity',
          editor: 'text'
        },
        {
          header: '수량',
          name: 'quantity',
          editor: 'text'
        }
      ]
    });

    grid.on('check', function(ev) {
      console.log('check', ev);
    });

    grid.on('uncheck', function(ev) {
      console.log('uncheck', ev);
    });
    </script>
</body>
</html>