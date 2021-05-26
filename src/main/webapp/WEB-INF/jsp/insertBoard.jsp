<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/bootstrap.min.css'/>" />
<title>게시글 등록</title>
<style>
table {
	width: 800px !important;
}

th {
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
	<form action="insertBoard.do" method="post" onsubmit="return insertAlert()">
		<table class="table" align="center">
			<tr>
				<th style="width: 100px; text-align: center;">제목</th>
				<td style="width: 400px;">
					<input type="text" id="input_text" style="width: 400px" name="b_title" maxlength="100" required>
				</td>
				<th style="width: 100px; text-align: center;">작성자</th>
				<td style="width: 200px; text-align: center;">
					<input type="text" id="input_text" name="b_writer" maxlength="100" required>
				</td>
			</tr>
			<tr>
				<th style="width: 100px; text-align: center;">내용</th>
				<td colspan="6" style="width: 700px; text-align: center;"><textarea
						rows="10" cols="80" name="b_content"
						onKeyUp="javascript:fnChkByte(this,'500')" required></textarea> <br />
					<span id="byteInfo">0</span> / 500bytes</td>
			</tr>
		</table>
		<div align="center">
			<button type="submit" class="btn btn-primary">등록</button>
			<button type="button" class="btn btn-danger"
				onclick="location.href='listBoard.do'">취소</button>
		</div>
	</form>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
		//textarea 글자 수 제한
 		function fnChkByte(obj, maxByte) {
			var str = obj.value;
			var str_len = str.length;

			var rbyte = 0;
			var rlen = 0;
			var one_char = "";
			var str2 = "";

			for (var i = 0; i < str_len; i++) {
				one_char = str.charAt(i);
				if (escape(one_char).length > 4) {
					rbyte += 2; //한글2Byte
				} else {
					rbyte++; //영문 등 나머지 1Byte
				}

				if (rbyte <= maxByte) {
					rlen = i + 1; //return할 문자열 갯수
				}
			}

			if (rbyte > maxByte) {
				//alert(maxByte + "<s:message code="board.text.Length"/>")
				str2 = str.substr(0, rlen); //문자열 자르기
				obj.value = str2;
				fnChkByte(obj, maxByte);
			} else {
				document.getElementById('byteInfo').innerText = rbyte;
			}
		}

	//등록
		function insertAlert() {
			var yn = confirm("<s:message code="board.inst"/>");
			if (yn) {
				alert("<s:message code = "board.inst.success"/>");
			} else {
				alert("<s:message code="board.inst.fail"/>");
				return false;				
			}
		}
	</script>
</body>
</html>