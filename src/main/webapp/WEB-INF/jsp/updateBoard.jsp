  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/bootstrap.min.css'/>"/>
<title>게시글 수정</title>
<style>
			table {
				width: 800px !important;				
			}
			th{
				    color: #fff;
    				background-color: #2c3e50 !important;
    				padding: .5rem .5rem !important;	
			}
</style>
</head>
<body>
	<div align="center">
		<h1 align="center">게시글 수정</h1>
	</div>
		<form action="updateBoard.do" method="post" onsubmit="return updateAlert('${list.b_no }')">
			<table class="table" align="center">
				<tr>
					
					<th style="width: 100px; text-align: center;">제목</th>
					<td style="width: 400px;">
							<input type="text" style="width: 400px" id="b_title" name="b_title" value="${list.b_title }">
							<input type="hidden" name="b_no" value="${list.b_no }">
					</td>
					<th style="width: 100px; text-align: center;">작성자</th>
					<td style="width: 200px; text-align: center;"><input type="text" style="width: 200px;" id="b_writer" name="b_writer" value="${list.b_writer }"></td>
				<tr>
				<tr>
					<th style="width: 100px; text-align: center;">내용</th>
					<td colspan="6" style="width: 700px;"><textarea rows="10" cols="80" id="b_content" name="b_content">${list.b_content }</textarea>
				</tr>
			</table>

		<div align="center">
			<button type="submit" class="btn btn-primary">등록</button>
			<button type="button" class="btn btn-dark" onclick="location.href='selectBoard.do?b_no=${list.b_no}'">뒤로</button>
		</div>
		</form>		
	
</body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
//수정
function updateAlert(str) {
	var yn = confirm("<s:message code="board.update"/>");

	if (yn) {
		alert("<s:message code = "board.update.success"/>");
	} else {		
		alert("<s:message code="board.update.fail"/>");
		return false;
	}
		}
</script>
</html>