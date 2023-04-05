<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOM 등록</title>
<link href="${conPath}/resources/css/masterData/itemSearchModal.css" rel="stylesheet">
</head>
<body>
	<p>ITEM</p>
<div id="grid1"></div>
	<p>BOM Tree</p>
<div id="grid2"></div>
<div>
	<span>원자재목록</span>
	<span class="btnGroup">
	<button id="addRowBtn"><i class="fa fa-plus" aria-hidden="true"></i></button>
	<button id="delRowBtn"><i class="fa fa-minus" aria-hidden="true"></i></button>
	<button id="saveBtn">저장</button>
	</span>
</div>
<div id="grid3"></div>
    <div class="background">
      <div class="window">
        <div class="popup">
        <div class="close-area">X</div>
			<div class="searchForm">
				<input type="text" id="searchInput" onKeypress="javascript:press(event)">
				<button onclick="searchBtn()"><i class="fa fa-search" aria-hidden="true"></i></button>
			</div>
			<div id="grid_popup"></div>
			<div class="buttons">
				<button class="closeBtn">닫기</button>
				<button class="applyBtn">적용</button>
			</div>
        </div>
        <div>
          <div></div>
        </div>
      </div>
    </div>
<script type="text/javascript" src="${conPath}/resources/js/masterData/bom.js"></script>
</body>
</html>