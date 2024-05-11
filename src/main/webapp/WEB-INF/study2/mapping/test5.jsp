<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>test5.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
		
		function fCheck() {
			let check = myform.member.value;
			
			if(check.trim()=="") {
				alert("항목을 선택하세요");
			}
			else {
				myform.action = check;
				myform.submit();
			}
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<h2>test5.jsp(/WEB-INF/study2/mapping)</h2>
	<hr/>
	<div>
		<form name="myform">
			<select name="member" onchange="fCheck()" class="form-control mr-1 ">
				<option>선택</option>
				<option value="HeowonLogin.do5">회원가입</option>
				<option value="HeowonUpdate.do5">회원수정</option>
				<option value="HeowonDelete.do5">회원삭제</option>
				<option value="HeowonSearch.do5">회원검색</option>
				<option value="HeowonList.do5">전체리스트</option>
			</select>
		</form>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>