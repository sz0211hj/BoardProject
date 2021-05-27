<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	width: 1000px !important;
	margin-bottom: 0px !important;
}
th{
	font-size: 15px !important;
}
[name=orderCond] {
    padding: .10rem .1rem !important;
    font-size: .100rem !important;
}
</style>
</head>
<body>
	<div align="center">
		<h1>게시판 리스트</h1>
	</div>
<!-- 검색, 로그보기 버튼 Start-->
<form id="bList"action="listBoard.do" name="searchFrm">
	<div style="width: 1000px; margin: auto; height: 50px; position: relative;">
       		<input class="form-control me-sm-2" type="text" style="width: 250px; height: 38px; position: absolute; left: 0;" placeholder="제목" id="b_title" name="b_title">
        	<button class="btn btn-secondary my-2 my-sm-0" style="position: absolute;   margin-left:250px; left: 0;" type="submit">Search</button>
			<button type="button" class="btn btn-secondary btn-sm"
			onclick="location.href='logList.do'"
			style="position: absolute; right: 0;">전체변경내역</button>
	</div>
<!-- 검색, 로그보기 버튼  End-->

<!-- 게시판 리스트 Start -->
	<div align="center">
		<table id="table" class="table table-hover">
			<thead>
				<tr class="table-primary" align="center">
					<th><input type="checkbox" class="form-check-input"  id="allCheck" name="allCheck" /></th> <!-- 전체선택 -->
					<th style="width: 100px; text-align: center;">글 번호
						<button id="sortbtn1" class="btn btn-outline-danger btn-sm" name="orderCond" value="BNO_ASC">▲</button>
						<button id="sortbtn2" class="btn btn-outline-danger btn-sm" name="orderCond" value="BNO_DESC">▼</button>
					</th>
					<th style="width: 400px; text-align: center;">제목
						 <button id="sortbtn3" class="btn btn-outline-danger btn-sm" name="orderCond" value="BTITLE_ASC">▲</button>
						 <button id="sortbtn4" class="btn btn-outline-danger btn-sm" name="orderCond" value="BTITLE_DESC">▼</button>					
					</th>
					<th style="width: 100px; text-align: center;">작성자			
						<button id="sortbtn5" class="btn btn-outline-danger btn-sm" name="orderCond" value="BWRITER_ASC">▲</button>
						<button id="sortbtn6" class="btn btn-outline-danger btn-sm" name="orderCond" value="BWRITER_DESC">▲</button>
					</th>
					<th style="width: 200px; text-align: center;">작성일자
						 <button id="sortbtn7" class="btn btn-outline-danger btn-sm" name="orderCond" value="BDATE_ASC">▲</button>
						 <button id="sortbtn8" class="btn btn-outline-danger btn-sm" name="orderCond" value="BDATE_DESC">▼</button>
					</th>
					<th style="width: 100px; text-align: center;">변경내역</th>
			</thead>

			<tbody>
				<c:if test="${fn:length(list) >=1 }">
					<c:forEach items="${list }" var="list">
						<c:choose>
							<c:when test="${list.delt_yn eq 'N' }">
								<tr class="table-active"
									onclick="location.href='selectBoard.do?b_no=${list.b_no}'">
									<th style="text-align: center;"><input type="checkbox" class="form-check-input" name="delListRow" id="delListRow" style="margin:0 auto;" value="${list.b_no }" onclick="event.cancelBubble = true;"></th>
									<th style="text-align: center;">${list.b_no }
										<input type="hidden" value="${list.delt_yn }">
									</th>
									<td style="text-align: left; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${list.b_title }</td>
									<td style="text-align: center; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${list.b_writer }</td>
									
										<td style="text-align: center;">
											<fmt:formatDate value="${list.b_date }" pattern="yyyy.MM.dd hh:mm:ss" />
										</td>
									<td style="text-align: center;">
										<span class="badge rounded-pill bg-primary"
												onclick="event.cancelBubble = true; location.href='logList.do?b_no=${list.b_no}'">보기</span>
									</td>
								</tr>						
							</c:when>
						
						<c:otherwise>
							<tr class="table-active">
								<th></th>
								<th style="text-align: center;">${list.b_no }</th>
								<td colspan="3" style="text-align: center">삭제된 게시글 입니다.</td>
								<td style="text-align: center;">
										<span class="badge rounded-pill bg-primary"
												onclick="event.cancelBubble = true; location.href='logList.do?b_no=${list.b_no}'">보기</span>
								</td>
							</tr>	
						</c:otherwise>
					</c:choose>
					</c:forEach>
				
				</c:if>
				<c:if test="${fn:length(list) == 0}">
					<tr>
						<td colspan="6" style="text-align: center">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>

		</table>
		
		
	<!-- 삭제버튼,총 게시물 수,글등록 Start -->
	<div style="width: 1000px; margin: 0 auto; height: 15px; position: relative;">
		<p style="position: absolute; right: 0; font-size: 5px">총 게시물 :&nbsp;&nbsp;${count }</p>
	</div>
	<div style="width: 1000px; margin: 0 auto; height: 50px; position: relative;">
		<button type="button" class="btn btn-danger btn-sm" style="position: absolute; left: 0;" onclick="deleteValue()">선택삭제</button>	
		<button type="button" class="btn btn-primary btn-sm"
			onclick="location.href='insertBoardForm.do'"
			style="position: absolute; right: 0;">글 등록</button>
     </div>	
	<!-- 삭제버튼,글등록 End -->
		
		
	<!-- 페이징 시작-->
			<input type="hidden" name="page" value="1">
		
		<my:paging paging="${paging}" jsFunc="goPage" />
	<!-- 페이징 끝  -->
	</div>
</form>	

<!-- model에 담긴 orderCond 불러오기 Start -->
<input type="hidden" id="voCond" value="${boardVO.orderCond}">
<!-- model에 담긴 orderCond 불러오기 End -->

<!-- 게시판 리스트 End -->
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
	
	//페이징
		function goPage(p) {
			searchFrm.page.value = p;
			searchFrm.submit();
		}
	
	//선택한 정렬 버튼에 색 변경
	$(function(){	
			var voVal = $('#voCond').val();	
			console.log(voVal);
			//button id값 추출
			var bVal1 = $('button[id="sortbtn1"]').val();
			var bVal2 = $('button[id="sortbtn2"]').val();
			var bVal3 = $('button[id="sortbtn3"]').val();
			var bVal4 = $('button[id="sortbtn4"]').val();
			var bVal5 = $('button[id="sortbtn5"]').val();
			var bVal6 = $('button[id="sortbtn6"]').val();
			var bVal7 = $('button[id="sortbtn7"]').val();
			var bVal8 = $('button[id="sortbtn8"]').val(); 
			
			if(voVal == bVal1){
				$('#sortbtn1').removeClass('.btn btn-outline-danger btn-sm').addClass('.btn btn-danger btn-sm')
			}else if(voVal == bVal2){
				$('#sortbtn2').removeClass('.btn btn-outline-danger btn-sm').addClass('.btn btn-danger btn-sm')
			}else if(voVal == bVal3){
				$('#sortbtn3').removeClass('.btn btn-outline-danger btn-sm').addClass('.btn btn-danger btn-sm')
			}else if(voVal == bVal4){
				$('#sortbtn4').removeClass('.btn btn-outline-danger btn-sm').addClass('.btn btn-danger btn-sm')
			}else if(voVal == bVal5){
				$('#sortbtn5').removeClass('.btn btn-outline-danger btn-sm').addClass('.btn btn-danger btn-sm')
			}else if(voVal == bVal6){
				$('#sortbtn6').removeClass('.btn btn-outline-danger btn-sm').addClass('.btn btn-danger btn-sm')
			}else if(voVal == bVal7){
				$('#sortbtn7').removeClass('.btn btn-outline-danger btn-sm').addClass('.btn btn-danger btn-sm')
			}else if(voVal == bVal8){
				$('#sortbtn8').removeClass('.btn btn-outline-danger btn-sm').addClass('.btn btn-danger btn-sm')
			} else{
				return false;
			}	

	}); 

	//다중체크 삭제
	$(function(){
		var chkObj =document.getElementsByName("delListRow") //체크박스 개수
		var rowCnt = chkObj.length;
		
		//전체선택시 모든 row check
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='delListRow']");
				for(var i = 0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
		});
		//선택하나라도 체크 풀리면 전체선택도 체크해제
		 $("input[name='delListRow']").click(function(){
			if($("input[name='delListRow']:checked").length == rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			}else{
				$("input[name='allCheck']")[0].checked = false;
			}		 
			
		 });
	}); 

		function deleteValue() {
			var cnt = $("input[name='delListRow']:checked").length;
			var url = "deleteBoard.do";
			var valueArr = new Array();
			var list = $("input[name='delListRow']");
			for (var i = 0; i < list.length; i++) {
				if (list[i].checked) { //체크되어 있으면 배열에 값 저장
					valueArr.push(list[i].value);
				}
				console.log(valueArr)
			}
			if (valueArr.length == 0) {
				alert("<s:message code = "board.del.noselect"/>");
						
						
			} else {
				var chk = confirm("<s:message code = "board.del"/>");
				if (chk) {
					$.ajax({
						url : url,
						type : "POST",
						traditional : true,
						dataType : "json",
						data : {
							valueArr : valueArr
						}, // 

					});//ajax end
					alert(cnt + "<s:message code = "board.del.cntSuccess"/>");
					location.href = "listBoard.do";
				} else {
					alert("<s:message code = "board.del.fail"/>");
				}
			}
		}
	</script>

</body>
</html>