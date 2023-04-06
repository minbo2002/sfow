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
<script src="<%=request.getContextPath()%>/resources/js/main/itemType.js"></script>
<body>
<div>
<br>
<button id="searchBtn">조회</button>
<button id="insertRow">저장</button>
<button id="addRow">추가</button>
<button id="deleteRow">삭제</button>
<div id="search_area">
    <label for="item_category">품목구분</label>
	<select id="item_category" name="item_category">
                <option value="제품">제품</option>
                <option value="반제품">반제품</option>
                <option value="원자재">원자재</option>
    </select>  
    <label for="item_type">품목유형</label>
    <input type="text" id="item_type" name="item_type" value="">
</div>
<br/>
<div>
<h6 style="color:black; font-weight:bold; font-size:15px;">&nbsp;품목유형 코드등록</h6>
</div>
<div id="grid"></div>
</div>
<script>
</script>
</body>
</html>