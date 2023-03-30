<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var grid = new tui.Grid( {
	el: document.getElementById('grid'),
	data:gridData,
 	rowHeaders: ['rowNum'],
	columns: [
		{
			header: '라디오버튼',
			name: 'radiobutton',
			editor:{
				type:'radio',
				options:{
					listItems:[
						{text:'', value:'0'}
					]
				}
			}
		},
		{
			header: '상태',
			name: 'out_status',
			formatter: 'listItemText',
			editor: {
				type: 'select',
				options: {
					listItems: [
						{
							text: '저장',
							value: '0'
						},
						{
							text: '확정',
							value: '1'
						}
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
			editor: 'text'
		},
		{
			header: '거래처코드',
			name: 'customer_code',
			editor: 'text'
		},
		{
			header: '거래처명',
			name: 'client_name',
			editor: 'text'
		},		{
			header: '비고',
			name: 'memo',
			editor: 'text'
		}
	]
} );


</script>

</head>
<body>



</body>
</html>