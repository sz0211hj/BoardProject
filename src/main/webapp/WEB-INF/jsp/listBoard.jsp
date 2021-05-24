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
<title>게시판 리스트</title>
<style>
table {
	width: 800px !important;
}
</style>
</head>
<body>
	<div align="center">
		<h1>게시판 리스트</h1>
	</div>
<!-- 등록, 로그보기 버튼 Start-->
	<div style="width: 800px; margin: 0 auto; height: 50px; position: relative;">
		<button type="button" class="btn btn-primary"
			onclick="location.href='insertBoardForm.do'"
			style="position: absolute; left: 0;">글 등록</button>
		<button type="button" class="btn btn-danger btn-sm"
			onclick="location.href='logList.do'"
			style="position: absolute; right: 0;">로그보기</button>
	</div>
<!-- 등록, 로그보기 버튼  End-->

<!-- 게시판 리스트 Start -->
	<div align="center">
		<table class="table table-hover">
			<thead>
				<tr class="table-primary" align="center">
					<th style="width: 100px; text-align: center;">글 번호</th>
					<th style="width: 400px; text-align: center;">제목</th>
					<th style="width: 100px; text-align: center;">작성자</th>
					<th style="width: 200px; text-align: center;">작성일자</th>
				</tr>
			</thead>

			<tbody>
				<c:if test="${fn:length(list) >=1 }">
					<c:forEach items="${list }" var="list">
						<tr class="table-active"
							onclick="location.href='selectBoard.do?b_no=${list.b_no}'">
							<th style="text-align: center;">${list.b_no }</th>
							<td
								style="text-align: left; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${list.b_title }</td>
							<td
								style="text-align: center; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${list.b_writer }</td>
							<td style="text-align: center;">${list.b_date }</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${fn:length(list) == 0}">
					<tr>
						<td colspan="4" style="text-align: center">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>

		</table>
	<!-- 페이징 시작-->
		<form action="listBoard.do" name="searchFrm">
			<input type="hidden" name="page" value="1">
		</form>
		<my:paging paging="${paging}" jsFunc="goPage" />
	<!-- 페이징 끝  -->
	</div>
<!-- 게시판 리스트 End -->

	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
		function goPage(p) {
			searchFrm.page.value = p;
			searchFrm.submit();
		}
	</script>

</body>
</html>