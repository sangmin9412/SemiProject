<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="paginate">
	<c:if test="${ page > 1 }">
		<a href="${ pageUrl }page=${ page-1 }" style="cursor:pointer" class="prev">&lt;</a>&nbsp;
	</c:if>
	<c:forEach begin="${ startPage }" end="${ endPage }" var="i" step="1">
	<c:if test="${ page == i }">
		<a class="on">${i}</a> &nbsp;
	</c:if>
	<c:if test="${ page != i }">
		<a href="${ pageUrl }page=${ i }">${i}</a> &nbsp;
	</c:if>
	</c:forEach>
	<c:if test="${ page < maxPage }">
		<a href="${ pageUrl }page=${ page+1 }" class="next">&gt;</a>
	</c:if>
</div>