<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="egovframework.example.cmmn.Paging"%>
<%@ attribute name="jsFunc" required="false" type="java.lang.String"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/bootstrap.min.css'/>" />
<style>
.pagination{ 
justify-content: center;
}
.page-item.active .page-link {
background-color: #2c3e50 !important;
}
.page-link{
background-color: #dee2e6 !important;
color: #2c3e50;
font-weight: bold;
}
</style>

<c:if test="${empty jsFunc}">
	<c:set var="jsFunc" value="go_page"></c:set>
</c:if>
<ul id="paging" class="pagination">
	<c:if test="${paging.startPage>1}">
		<li class="page-item"><a class="page-link"
			href="javascript:${jsFunc}(${paging.startPage-1})">이전</a>
	</c:if>
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
		<c:if test="${i != paging.page}">
			<li class="page-item"><a class="page-link"
				href="javascript:${jsFunc}(${i})">${i}</a>
		</c:if>
		<c:if test="${i == paging.page}">
			<li class="page-item active"><a class="page-link">${i}</a>
		</c:if>
	</c:forEach>
	<c:if test="${paging.endPage<paging.totalRecord}">
		<li class="page-item"><a class="page-link"
			href="javascript:${jsFunc}(${paging.endPage+1})">다음</a>
	</c:if>
</ul>
