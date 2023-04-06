<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목유형 코드등록</title>
</head>
<link rel="shortcut icon" href="#">
<script src="<%=request.getContextPath()%>/resources/js/main/itemStockUnit.js"></script>
<body>
<div>
<br>
<button id="searchBtn">조회</button>
<button id="insertRow">저장</button>
<button id="addRow">추가</button>
<button id="deleteRow">삭제</button>
<div id="search_area">
    <label for="item_stock_unit">재고단위</label>
    <input type="text" id="item_stock_unit" name="item_stock_unit" value="">
</div>
<br/>
<div>
<h1 style="margin-bottom: 50px; margin-top: 50px; text-align: center">품목유형 코드등록</h1>
</div>
<div id="grid"></div>
</div>
<script>
</script>
</body>
</html>