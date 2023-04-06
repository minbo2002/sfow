<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목등록(제품)</title>
<script src="<%=request.getContextPath()%>/resources/js/main/itemProduct.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style>
.modal {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 1200px;
  height: 600px;
  background-color: white;
  box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.3);
  padding: 20px;
  box-sizing: border-box;
}
</style>
</head>
<body>
<div>
<button id="insertRow">저장</button>
<button id="addRow">추가</button>
<button id="deleteRow">삭제</button>
<button id="searchBtn">조회</button>
<button id="openBtn" data-toggle="modal" onclick="openModal()">모달창</button>
<br><br>
<div id="search_area">
	<label for="item_code">ITEM코드</label>
    <input type="text" name="item_code" value="" placeholder="자동완성">
    <label for="item_name">품명</label>
    <input type="text" id="item_name" name="item_name" value="">
    <label for="item_no">품목코드</label>
    <input type="text" id="item_no" name="item_no" value="">
    <label for="item_type">유형</label>
    <input type="text" id="item_type" name="item_type" value="">    
</div>
<br/>
<div>
<h1 style="margin-bottom: 50px; margin-top: 50px; text-align: center">품목등록(제품)</h1>
</div>
<div id="grid"></div>
</div>
<script>
function openModal() {
    document.querySelector('.modal_wrap').style.display ='block';
    
}    
</script>
<div class="modal_wrap">
<div id="grid"></div>
</div>
</body>
</html>