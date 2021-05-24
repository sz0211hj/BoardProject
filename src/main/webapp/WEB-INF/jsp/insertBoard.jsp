 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/bootstrap.min.css'/>"/>
<title>게시글 등록</title>
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
		<h1 align="center">게시글 등록</h1>
	</div>
		<form action="insertBoard.do" method="post">
			<table class="table" align="center">
				<tr>
					<th style="width: 100px; text-align: center;">제목</th>
					<td style="width: 400px;"><input type="text" style="width: 400px" name="b_title" required></td>
					<th style="width: 100px; text-align: center;">작성자</th>
					<td style="width: 200px; text-align: center;"><input type="text" name="b_writer" required></td>
				<tr>
				<tr>
					<th style="width: 100px; text-align: center;">내용</th>
					<td colspan="6" style="width: 700px; text-align: center;"><textarea rows="10" cols="80" name="b_content" required></textarea>
				</tr>
			</table>
		<div align="center">
			<button type="submit" class="btn btn-primary">등록</button>
			<button type="button" class="btn btn-danger" onclick="location.href='listBoard.do'">취소</button>
		</div>
		</form>
	
</body>
</html>