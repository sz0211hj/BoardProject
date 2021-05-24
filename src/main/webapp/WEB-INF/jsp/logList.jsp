<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<th style="width: 50px; text-align: center;">NO</th>
					<th style="width: 100px; text-align: center;">글 번호</th>
					<th style="width: 400px; text-align: center;">제목</th>
					<th style="width: 100px; text-align: center;">작성자</th>
					<th style="width: 200px; text-align: center;">작성일자</th>
					<th style="width: 50px; text-align: center;">상태</th>
					<th style="width: 500px; text-align: center;">내용</th>
				</tr>
			</thead>
			<c:forEach items="${logList }" var="logList">
				<tbody>
					<tr class="table-active">
						<th style="text-align: center;">${logList.logNum }</th>
						<th style="text-align: center;">${logList.b_noTemp }</th>
						<td>${logList.b_titleTemp }</td>
						<td style="text-align: center;">${logList.b_writerTemp }</td>
						<td style="text-align: center;">${logList.dateTemp }</td>
						<td style="text-align: center; font-weight: bold;">${logList.b_state}</td>
						<td>${logList.b_contentTemp }</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
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
		function goPage(p) {
			searchFrm.page.value = p;
			searchFrm.submit();
		}
	</script>


</body>
</html>