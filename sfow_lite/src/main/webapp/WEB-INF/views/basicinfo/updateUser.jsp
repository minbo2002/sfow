<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getContextPath()%>" var="ContextPath"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
  border-collapse: collapse;
  width: 100%;
  margin-bottom: 1rem;
  background-color: #fff;
  color: #212529;
  font-size: 0.9rem;
  font-weight: 400;
  line-height: 1.6;
  text-align: center;
}
th, td {
  padding: 0.75rem;
  vertical-align: middle;
  border-top: 1px solid #dee2e6;
}
th {
  background-color: #f8f9fa;
  font-weight: 600;
  border-bottom: 2px solid #dee2e6;
}
tr:nth-child(even) {
  background-color: #f2f2f2;
}
</style>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	const SUCCESS_MESSAGE ='수정 성공.';
	const ERROR_MESSAGE = '수정 실패 정보를 다시 입력해주세요.';
	
	
    $("form").submit(function(e) {
        e.preventDefault();
        
        var formData = $(this).serialize(); // form 데이터를 일반 객체로 직렬화
        
        console.log('formData',formData);
        
        $.ajax({
            type: "POST",
            url: "${ContextPath}/updateUserAjax",
            data: formData,
            success: function(response) {
                console.log(response);
                if (response == "1") {
                		alert(SUCCESS_MESSAGE);
                } else if (response == "2") {
                    alert(ERROR_MESSAGE);
                }
            }
        });
    });
});


	</script>
</head>
<body>
	<form id="updateFrm">
							회사코드
							<input type="text" name="companyCode" value="${sessionScope.AUTHUSER.companyCode}" disabled="disabled">
						
						
							회사명
							<input type="text" name="companyName" value="${sessionScope.AUTHUSER.companyName }">
						
						
							아이디
							<input type="text" name="id" value="${sessionScope.AUTHUSER.id }" readonly="readonly">
							이름
							<input type="text" name="userName"value="${sessionScope.AUTHUSER.userName }" >
							이메일
							<input type="text" name="email" value="${sessionScope.AUTHUSER.email }">
							전화번호
							<input type="text" name="phoneNum" value="${sessionScope.AUTHUSER.phoneNum }">
			<input type="submit" value="저장">
			<input type="reset" value="취소">
		</form>
</body>
</html>