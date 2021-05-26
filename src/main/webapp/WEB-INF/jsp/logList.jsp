<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/bootstrap.min.css'/>" />
<title>로그 기록</title>
<style>
table {
	width: 1400px !important;
}
</style>
</head>
<body>
	<div align="center">
		<h1>로그 기록</h1>
	</div>
	
	<!-- listBoard 돌아가기 button Start -->
	<div style="width: 1400px; margin: 0 auto; height: 50px; position: relative;">
		<button type="button" class="btn btn-primary"
			onclick="location.href='listBoard.do'"
			style="position: absolute; left: 0;">&laquo; 게시글 보기</button>
	</div>
	<!-- listBoard 돌아가기 button End -->
	
	<!-- 로그List Start -->
	<div align="center">
		<table class="table">
			<thead>
				<tr class="table-primary" align="center">
					<th style="width: 100px; text-align: center;">글 번호</th>
					<th style="width: 200px; text-align: center;">변경일자</th>
					<th style="width: 50px; text-align: center;">상태</th>
					<th style="width: 400px; text-align: center;">제목</th>
					<th style="width: 500px; text-align: center;">내용</th>
					<th style="width: 100px; text-align: center;">작성자</th>	
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${logList }" var="logList">
					<tr class="table-active">
						<th style="text-align: center;">${logList.b_no }</th>
						<td style="text-align: center;">${logList.b_date }</td>
						<td id="status" style="text-align: center; font-weight: bold;">
							<c:if test="${logList.b_state eq 'C' }">등록</c:if>
							<c:if test="${logList.delt_yn eq 'N' && logList.b_state eq 'U' }">수정</c:if>
							<c:if test="${logList.delt_yn eq 'Y' && logList.b_state eq 'U'}">삭제</c:if>
						</td>
						<td>${logList.b_title }</td>
						<td>${logList.b_content }</td>
						<td style="text-align: center;">${logList.b_writer }</td>
					</tr>
			</c:forEach>
		</tbody>
		</table>
	<!-- 검색창 Start -->
		<div style="width: 1400px; margin: 0 auto; height: 50px; position: relative;">
			<form class="d-flex" action="logList.do">
				<input type="hidden" name="page" value="1">
       			<input class="form-control me-sm-2" type="text" style="width: 250px; height: 38px; position: absolute; right: 0;" placeholder="글 번호" id="b_no" name="b_no">
        		<button class="btn btn-secondary my-2 my-sm-0" style="position: absolute;  right: 0;" type="submit">Search</button>
      		</form>
      	</div>		
	<!-- 검색창 End -->
		
	<!-- 페이징시작 -->
		<form action="logList.do" name="searchFrm">
			<input type="hidden" name="page" value="1">
		</form>
		<my:paging paging="${paging}" jsFunc="goPage" />
	<!-- 페이징 종료 -->
	</div>
	<!-- 로그List End -->
	
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
	//페이징
			function goPage(p) {
				searchFrm.page.value = p;
				searchFrm.submit();
			}
	//문자열 비교
	$(function() {
		var i = $('#status').text();
			console.log(i);
		
	});
	
	</script>


</body>
</html>