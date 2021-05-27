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
							<input type="hidden" style="width: 400px" id="hb_title" name="hb_title" value="${list.b_title }">
							<input type="hidden" name="b_no" value="${list.b_no }">
					</td>
					<th style="width: 100px; text-align: center;">작성자</th>
					<td style="width: 200px; text-align: center;">
					<input type="text" style="width: 200px;" id="b_writer" name="b_writer" value="${list.b_writer }" readonly="readonly">
					<input type="hidden" style="width: 200px;" id="hb_writer" name="hb_writer" value="${list.b_writer }">
					</td>
				<tr>
				<tr>
					<th style="width: 100px; text-align: center;">내용</th>
					<td colspan="6" style="width: 700px; text-align:center;">
						<textarea rows="10" cols="80" id="b_content" name="b_content" onKeyUp="javascript:fnChkByte(this,'500')"  required>${list.b_content }</textarea>
							<br/><span id="byteInfo">0</span> / 500bytes
						<input type="hidden" id="hb_content" name="hb_content" value="${list.b_content }">
					</td>
			</table>

		<div align="center">
			<button type="submit" class="btn btn-primary">등록</button>
			<button type="button" class="btn btn-dark" onclick="location.href='selectBoard.do?b_no=${list.b_no}'">뒤로</button>
		</div>
		</form>		
	
</body>
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

//수정
function updateAlert(str) {
	var yn = confirm("<s:message code="board.update"/>");

	if (yn) {
		var title = $('#b_title').val();
		var htitle = $('#hb_title').val();
		var content = $('#b_content').val();
		var hcontent = $('#hb_content').val();
		console.log("1." + title);
		console.log("2." + content);
		console.log("3." + htitle);
		console.log("4." + hcontent);
		//제목이나 내용중 수정된 내용이 없으면 변경 불가 alert
		if(title == htitle && content == hcontent){
			alert("<s:message code = "board.update.same"/>");
			return false;
		}else if(title != htitle || content != hcontent){
			alert("<s:message code = "board.update.success"/>");
		}
	} else {		
		alert("<s:message code="board.update.fail"/>");
		return false;
	}
		}
//작성자 수정 시 변경 불가 alert
$('#b_writer').on('click',function(){
	
	alert("<s:message code = "board.update.writer.disable"/>");
	return false;
});
</script>
</html>