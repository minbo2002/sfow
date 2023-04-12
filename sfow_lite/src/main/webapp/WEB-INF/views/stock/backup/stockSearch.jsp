<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창고별 재고현황</title>
		
</head>
<body>
<h3>전체조회</h3>
	<form id=stockSearch name=stockSearch action="<%=request.getContextPath()%>/search">
<!-- 		<div class=form-title></div><div><input type="text" id="tSearch" name="tSearch" /></div> -->
		<input type="submit" value="전체조회" id="allStockList"/>
	</form>
</body>
</html>