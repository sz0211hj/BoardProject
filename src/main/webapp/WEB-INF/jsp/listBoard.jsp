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
	width: 1000px !important;
}
#sortbtn {
    padding: .10rem .1rem !important;
    font-size: .100rem !important;
}
</style>
</head>
<body>
	<div align="center">
		<h1>게시판 리스트</h1>
	</div>
<!-- 등록, 로그보기 버튼 Start-->
	<div style="width: 1000px; margin: 0 auto; height: 50px; position: relative;">
		<button type="button" class="btn btn-primary"
			onclick="location.href='insertBoardForm.do'"
			style="position: absolute; left: 0;">글 등록</button>
		<button type="button" class="btn btn-danger btn-sm"
			onclick="location.href='logList.do'"
			style="position: absolute; right: 0;">전체로그내역</button>
	</div>
<!-- 등록, 로그보기 버튼  End-->

<!-- 게시판 리스트 Start -->
	<div align="center">
	<form action="listBoard.do" name="searchFrm">
		<table id="table" class="table table-hover">
			<thead>
				<tr class="table-primary" align="center">
					<th><input type="checkbox" id="allCheck" name="allCheck" /></th> <!-- 전체선택 -->
					<th style="width: 200px; text-align: center;">글 번호
						<button id="sortbtn" class="btn btn-outline-light btn-sm" name="orderCond" value="BNO_ASC">▲</button>
						<button id="sortbtn" class="btn btn-outline-light btn-sm" name="orderCond" value="BNO_DESC">▼</button>
					</th>
					<th style="width: 400px; text-align: center;">제목
						 <button id="sortbtn" class="btn btn-outline-light btn-sm" name="orderCond" value="BTITLE_ASC">▲</button>
						 <button id="sortbtn" class="btn btn-outline-light btn-sm" name="orderCond" value="BTITLE_DESC">▼</button>					
					</th>
					<th style="width: 100px; text-align: center;">작성자</th>			
					<th style="width: 200px; text-align: center;">작성일자
						 <button id="sortbtn" class="btn btn-outline-light btn-sm" name="orderCond" value="BDATE_ASC">▲</button>
						 <button id="sortbtn" class="btn btn-outline-light btn-sm" name="orderCond" value="BDATE_DESC">▼</button>
					</th>
					<th style="width: 100px; text-align: center;">history</th>
			</thead>

			<tbody>
				<c:if test="${fn:length(list) >=1 }">
					<c:forEach items="${list }" var="list">
						<c:choose>
							<c:when test="${list.delt_yn eq 'N' }">
								<tr class="table-active"
									onclick="location.href='selectBoard.do?b_no=${list.b_no}'">
									<th><input type="checkbox"  name="delListRow" id="delListRow" value="${list.b_no }" onclick="event.cancelBubble = true;"></th>
									<th style="text-align: center;">${list.b_no }
										<input type="hidden" value="${list.delt_yn }">
									</th>
									<td style="text-align: left; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${list.b_title }</td>
									<td style="text-align: center; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${list.b_writer }</td>
									<td style="text-align: center;">${list.b_date }</td>
									<td style="text-align: center;">
										<span class="badge rounded-pill bg-primary"
												onclick="event.cancelBubble = true; location.href='logList.do?b_no=${list.b_no}'">내역</span>
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
												onclick="event.cancelBubble = true; location.href='logList.do?b_no=${list.b_no}'">내역</span>
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
		<button type="button" onclick="deleteValue()">삭제</button>
		
	<!-- 검색창,총 게시물 수 Start -->
	<div style="width: 1000px; margin: 0 auto; height: 50px; position: relative;">
		<p style="position: absolute; left: 0; font-size: 5px">총 게시물 :&nbsp;&nbsp;${count }</p>
		<div class="d-flex">
       			<input class="form-control me-sm-2" type="text" style="width: 250px; height: 38px; position: absolute; right: 0;" placeholder="제목" id="b_title" name="b_title">
        		<button class="btn btn-secondary my-2 my-sm-0" style="position: absolute;  right: 0;" type="submit">Search</button>
      	</div>
     </div>	
	<!-- 검색창 End -->
		
		
	<!-- 페이징 시작-->
			<input type="hidden" name="page" value="1">
		</form>
		<my:paging paging="${paging}" jsFunc="goPage" />
	<!-- 페이징 끝  -->
	</div>
	
<!-- 게시판 리스트 End -->
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
	
	//페이징
		function goPage(p) {
			searchFrm.page.value = p;
			searchFrm.submit();
		}
	
	//정렬
	$("#button").on("click",function(){
	         var btn = $("#button").val();
	         if(btn == null || btn == ""){
	            return false;
	         }else{
	            searchFrm.submit();
	            return true;
	         }
	      })
	//다중체크 삭제
	
	$(function(){
		var chkObj =document.getElementsByName("delListRow") //체크된 것 개수
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
	
	//

		function deleteValue() {
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
				alert("선택된 글이 없습니다. ");
			} else {
				var chk = confirm("정말 삭제하시겠습니까?");
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
					alert("삭제 성공");
					location.href = "listBoard.do";
				} else {
					alert("삭제 실패");
				}
			}
		}
	</script>

</body>
</html>