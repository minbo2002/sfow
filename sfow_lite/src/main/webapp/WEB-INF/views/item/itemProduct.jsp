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
<style>
.modal{
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto;
	  width: 100%;
	  height: 100%;
	
	  display: none;
	  background-color: rgba(0, 0, 0, 0.4);
	  justify-content:center;
  	  align-items:center;
	}
	 
	.modal.show {
	  display: block;
	}
	
	#modalGrid {
	  position: fixed;
	  top: 50%; /* 모달이 수직 중앙에 위치하도록 top 값을 50%로 지정 */
  	  left: 50%;
	  width: 500px;
	  height: 500px;
	
	  padding: 40px;
	  justify-content:center;
  	  align-items:center;
	  text-align: center;
	  background-color: rgb(255, 255, 255);
	  border-radius: 10px;
	  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	  transform: translateX(-50%) translateY(-50%);
	}
	.modal-wrapper {
	  position: fixed;
 	  top: 100%;
  	  left: 100%;
	  width: 100%;
	  height: 100%;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	}
#applyBtn {
  height: 35px;
  width: 80px;
  font-size: 13px;
  color: black;
  border: 1px solid #8c8c8c;
  border-radius: 4px;
  position: absolute;
  bottom: 10px;
  right: 300px; /* 버튼 위치 조정 */
}
#resetMdBtn {
  height: 35px;
  width: 80px;
  font-size: 13px;
  color: black;
  border: 1px solid #8c8c8c;
  border-radius: 4px;
  position: absolute;
  bottom: 10px;
  right: 210px; /* 버튼 위치 조정 */
}

#closeBtn {
  height: 35px;
  width: 80px;
  font-size: 13px;
  color: black;
  border: 1px solid #8c8c8c;
  border-radius: 4px;
  position: absolute;
  bottom: 10px;
  right: 120px; /* 버튼 위치 조정 */
}
</style>
</head>
<body>
<button id="insertRow">저장</button>
<button id="addRow">추가</button>
<button id="deleteRow">삭제</button>
<button id="searchBtn">조회</button>
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
<div class="modal">
  <div id="modalGrid" style="display: flex; flex-direction: column; align-items: center;">
    <button type="button" id="applyBtn" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">&nbsp;&nbsp;적용</button>
    <button type="reset" id="resetMdBtn" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">&nbsp;&nbsp;초기화</button>
    <button type="button" id="closeBtn" style="height:35px; width:80px; font-size:13px; color:black; border:1px solid #8c8c8c; border-radius:4px; position:absolute; bottom:10px;">&nbsp;&nbsp;닫기</button>
  </div>
</div>
</body>
</html>