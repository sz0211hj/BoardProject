 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/bootstrap.min.css'/>"/>
<title>게시글 상세보기</title>
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
		<h1 align="center">게시글 상세보기</h1>
		
	</div>
	<br />
	<div>
			<table class="table" align="center">
				<tr>
					<th style="width: 100px; text-align: center;">제목</th>
					<td colspan="3" style="width: 700px; text-align: center; font-weight: bold">${select.b_title }</td>
				</tr>
				<tr>
					<th style="width: 100px; text-align: center;">작성일자</th>
					<td style="width: 400px; text-align: center;">${select.b_date }</td>
					<th style="width: 100px; text-align: center;">작성자</th>
					<td style="width: 200px; text-align: center;">${select.b_writer }</td>
				<tr>
				<tr>
					<th style="width: 100px; text-align: center;">내용</th>
					<td colspan="6"  style="width: 700px; text-align: center;"><textarea rows="10" cols="80" name="b_content" style="align: center;" readonly="readonly">${select.b_content }</textarea>
				</tr>
			</table>
			<br/>
		<div align="center">
			<button type="button" class="btn btn-primary" onclick="location.href='updateBoardForm.do?b_no=${select.b_no}'">수정</button>
			<button type="reset" class="btn btn-danger" onclick="deleteAlert('${select.b_no}')">삭제</button>
			<button type="button" class="btn btn-dark" onclick="location.href='listBoard.do'">목록보기</button>
		</div>
	</div>	
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
//삭제
function deleteAlert(str) {
var yn = confirm("정말 삭제할까요?");
if (yn) {
	location.href = "deleteBoard.do?b_no=" + str;
} else {
	alert("삭제하지 못하였습니다.  ");
}
	}

</script>		
</body>
</html>