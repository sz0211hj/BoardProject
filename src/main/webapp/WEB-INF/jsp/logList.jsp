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

</style> 
</head>
<body>
	<div align="center">
		<h1>변경 내역</h1>
	</div>
		<!-- 검색창,게시글보기 Start -->
		<div style="width: 1400px; margin: 0 auto; margin-bottom: 0; height: 40px; position: relative;">
      			<button type="button" class="btn btn-primary" onclick="location.href='listBoard.do'"
								style="position: absolute; margin-left: 1280px;">&laquo; 게시글 보기</button>
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
						<th style="text-align: center; vertical-align:middle;">
							<!-- 글 번호 별 변경순서 script로 구현 -->
						</th>
						<td id="bno" style="text-align: center; vertical-align:middle;">${logList.b_no}</td>
						<td style="text-align: center; vertical-align:middle;">
							<fmt:formatDate value="${logList.b_date }" pattern="yyyy.MM.dd hh:mm:ss" />
						</td>
						<td id="status" style="text-align: center; font-weight: bold;  vertical-align:middle;">
							<c:if test="${logList.b_state eq 'C' }">등록</c:if>
							<c:if test="${logList.delt_yn eq 'N' && logList.b_state eq 'U' }">수정</c:if>
							<c:if test="${logList.delt_yn eq 'Y' && logList.b_state eq 'U'}">삭제</c:if>
						<input id="hstatus" type="hidden" value="${logList.b_state }${logList.delt_yn}">
						</td>
						<td id="btitle" style="vertical-align:middle;">${logList.b_title }</td>
						<td id="bcontent" style="vertical-align:middle;">${logList.b_content }</td>
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
			// 삭제일 경우 배경색
			var statusText = $('#hstatus').val();
			console.log(statusText);

			
			var numBefor = $(this).children("#bno");	// 위 tr 글번호 - 수정 후
			var numAfter = $(this).next().children("#bno"); // 아래 tr 글번호 - 수정 전
					//console.log(" 수정 전 번호: " + numBefor.text());	
					//console.log(" 수정 후 번호: " + numAfter.text());
				
				
			var titleBefor = $(this).children("#btitle");	// 위 글 제목
			var titleAfter = $(this).next().children("#btitle"); // 아래글 제목
					//console.log("수정 전 제목:" + titleBefor.text())	
					//console.log("수정 후 제목:" + titleAfter.text())	
				
			var contentBefor = $(this).children("#bcontent"); // 위 글 내용
			var contentAfter = $(this).next().children("#bcontent"); //아래글 내용
					//console.log("수정 전 내용:" + contentBefor.text())	
					//console.log("수정 후 내용:" + contentAfter.text())
			
			//글 번호 같고 제목, 내용 수정 됐을 경우 빨간글씨 표시
			if(numBefor.text() == numAfter.text() 
					&& titleBefor.text() != titleAfter.text()) {	//제목,내용 모두 수정			
					titleAfter.css("color", "#F06464");
					titleAfter.css("font-weight", "bold");
					titleAfter.css("background-color","#FDF5DC");
					titleBefor.css("background-color","#FDF5DC");
			}else if(numBefor.text() == numAfter.text() 
					&& contentBefor.text() != contentAfter.text()){
					contentAfter.css("color", "#0078FF");
					contentAfter.css("font-weight", "bold");
					contentAfter.css("background-color","#E8F5FF");
					contentBefor.css("background-color","#E8F5FF");					
			}

		});
		

	</script>


</body>
</html>