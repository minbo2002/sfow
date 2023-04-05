<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Return Popup</title>
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script>
$(document).ready(function() {
    var grid = new tui.Grid({
        el: document.getElementById('grid'),
        columns: [
            { header: '거래처코드', name: 'client_code' },
            { header: '거래처명', name: 'client_name' }
        ]
    });

    $.ajax({
        url: '/so/getClients',
        method: 'GET',
        dataType: 'JSON',
        success: function(clients) {
            grid.resetData(clients);
        },
        error: function() {
            alert('Error loading clients');
        }
    });

    grid.on('click', function(ev) {
        if (ev.targetType === 'cell') {
            var rowData = grid.getRow(ev.rowKey);
            window.opener.document.getElementById('client_code').value = rowData.client_code;
            window.opener.document.getElementById('client_name').value = rowData.client_name;
            window.close();
        }
    });
});
</script>
</head>
<body>
    <h1>Select a Client</h1>
    <div id="grid"></div>
</body>
</html>