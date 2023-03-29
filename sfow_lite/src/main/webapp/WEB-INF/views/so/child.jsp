<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Child</title>
</head>
<body>
    <br>
    <b><font size="5" color="gray">자식창</font></b>
    <br><br>
 
    <input type="text" id="cInput"> <input type="button" value="전달" onclick="setParentText()">
    <br><br>
    <input type="button" value="창닫기" onclick="window.close()">
    
    <script>
        function setParentText(){
        	opener.document.getElementById("serchCustomerCode").value = document.getElementById("cInput").value
        }
    </script>
</body>
</html>