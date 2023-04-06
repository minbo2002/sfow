<!-- 추가한 security taglib  -->
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
  integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
  crossorigin="anonymous">
<title>Spring Security Custom Login Form</title>
</head>
<body>
  <div class="container">
    <h2>Company Website</h2>
    <hr>
    <p>You are now logged in</p>
    <p>
      User :: <security:authentication property="principal.username"/>
    </p>
    <p>
      Roles(s) :: <security:authentication property="principal.authorities"/>
    </p>
  </div>
</body>
</html>