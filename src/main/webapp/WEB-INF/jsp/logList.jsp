<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/bootstrap.min.css'/>" />
<title>전체 변경 내역</title>
<style>
table {
	width: 1400px !important;
}

/* tr:nth-child(3n+0) {background:#999 !important;}
tr:nth-child(3n+1) {background:#CCC !important;}
tr:nth-child(3n+2) {background:#FFF !important;} */
</style> 
</head>
<body>
	<div align="center">
		<h1>전체 변경 내역</h1>
	</div>
		<!-- 검색창,게시글보기 Start -->
		<div style="width: 1400px; margin: 0 auto; margin-bottom: 0; height: 40px; position: relative;">
			<form class="d-flex" action="logList.do">
				<input type="hidden" name="page" value="1">
       			<input class="form-control me-sm-2" type="text" style="width: 250px; height: 38px; position: absolute; left: 0;" placeholder="글 번호" id="b_no" name="b_no">
      			<button class="btn btn-secondary my-2 my-sm-0" style="position: absolute;   margin-left:250px; left: 0;" type="submit">Search</button>
      			<button type="button" class="btn btn-primary" onclick="location.href='listBoard.do'"
								style="position: absolute; margin-left: 1280px;">&laquo; 게시글 보기</button>
      		</form>
      	</div>		
      	 <div style="width: 1400px; margin: 0 auto; height: 20px; position: relative;">
					<p style="position: absolute; right: 0; font-size: 15px; font-weight: bold; color: red;">
						최신 변경 순으로 나열됩니다.
					</p>
		</div>
	<!-- 검색창 End -->

	<!-- 로그List Start -->
	<div align="center">
		<table class="table">
			<thead>
				<tr class="table-primary" align="center">
					<th style="width: 100px; text-align: center;"></th>
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
					<tr>
						<th id="bno"  style="text-align: center; vertical-align:middle;">
							<!-- 글 번호 별 변경순서 script로 구현 -->
						</th>
						<td style="text-align: center; vertical-align:middle;">${logList.b_no}</td>
						<td style="text-align: center; vertical-align:middle;">
							<fmt:formatDate value="${logList.b_date }" pattern="yyyy.MM.dd hh:mm:ss" />
						</td>
						<td id="status" style="text-align: center; font-weight: bold;  vertical-align:middle;">
							<c:if test="${logList.b_state eq 'C' }">등록</c:if>
							<c:if test="${logList.delt_yn eq 'N' && logList.b_state eq 'U' }">수정</c:if>
							<c:if test="${logList.delt_yn eq 'Y' && logList.b_state eq 'U'}">삭제</c:if>
						</td>
						<td style="vertical-align:middle;">${logList.b_title }</td>
						<td style="vertical-align:middle;">${logList.b_content }</td>
						<td style="text-align: center; vertical-align:middle;">${logList.b_writer }</td>
					</tr>
			</c:forEach>
		</tbody>
		</table>

		
	</div>
	<!-- 로그List End -->
	
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
	//변경순서 - 번호매기기
		var table = document.getElementsByTagName('table')[0],
 			 rows = table.getElementsByTagName('tr'),
 			 text = 'textContent' in document ? 'textContent' : 'innerText';

		for (var i = 1, len = rows.length; i < len; i++) {
 		 rows[i].children[0][text] = i ;
		}
	
	//변경 이력 색 표시
		$("tbody tr").each(function(){
			var state = $(this).children().eq(3).text();
				//console.log(state);
			if(state == 'Y'){
				 $(this).css("color", "red")	
			}		// 삭제
			
			var num = $(this).children().eq(1).text();	// 위 tr 글번호
				console.log (num);
			var numAfter = $(this).next().children().eq(1).text(); // 아래 tr 글번호
				console.log("====" + numAfter);
			
		});
		
	
	</script>


</body>
</html>