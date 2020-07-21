<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-sm-12">
	 	<div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
	 		<ul class="pagination">
	 			<!-- <c:if test="${ page <= 1 }"><a>[이전]</a>&nbsp;</c:if> -->
				<c:if test="${ page > 1 }">
					<li class="paginate_button previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
		 				<a href="${ pageUrl }?page=${ page-1 }">Prev</a>
		 			</li>
				</c:if>
				<c:forEach begin="${ startPage }" end="${ endPage }" var="i" step="1">
					<c:if test="${ page == i }">
						<li class="paginate_button " aria-controls="dataTables-example" tabindex="0">
							<a style="color:#222; font-weight:bold;">${i}</a>
						</li>
					</c:if>
					<c:if test="${ page != i }">
						<li class="paginate_button " aria-controls="dataTables-example" tabindex="0">
							<a href="${ pageUrl }?page=${ i }">${i}</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${ page < maxPage }">
					<li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
						<a href="${ pageUrl }?page=${ page+1 }">Next</a>
					</li>
				</c:if>
				<!-- <c:if test="${ page >= maxPage }"><a>[다음]</a></c:if>  -->
	 		</ul>
	 	</div>
	</div>
</div>
