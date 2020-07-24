<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/partnerBo/include/head.jsp" %>
	<div id="wrapper">
		<%@ include file = "/partnerBo/include/header.jsp" %>		
		<div id="page-wrapper">
            <div id="page-inner">
				
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                       		발주내역
                        </h1>
                    </div>
                </div>
                
                <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading"></div>
	                        <div class="panel-body">
	                        	<div class="table-responsive">
		                            <table class="table table-striped table-bordered table-hover">
		                                <thead>
		                                    <tr>
		                                        <th>No.</th>
		                                        <th>출판사명</th>
		                                        <th>Date.</th>
		                                        <th>상품주문정보</th>
		                                        <th>발주수량</th>
		                                        <th>반품수량</th>
		                                        <th>입하수량</th>
		                                        <th>입하날짜</th>
		                                        <th></th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<c:if test="${ empty list }">
		                                		<tr>
		                                			<td colspan="9" style="padding:30px 0; text-align:center;">등록된 글이 없습니다.</td>
		                                		</tr>
		                                	</c:if>
		                                	<c:if test="${ !empty list }">
			                                	<c:forEach var="dto" items="${list}" varStatus="cnt">
			                                    <tr>
			                                        <td>${ ((page-1) * limit) + cnt.count }</td>
			                                        <!--<td><a href="goodsIpgoModify.bogd?partnerNum=${ dto.partnerNum }&bookNum=${ dto.bookNum }">${dto.partnerName }</a></td> -->
			                                        <td>${dto.partnerName }</td>
			                                        <td><fmt:formatDate value="${dto.pOrderDate }" pattern="yyyy-MM-dd"/></td>
			                                        <td>
			                                        	${dto.bookName }<br>
			                                        	재고 : ${dto.bookCount }
			                                        </td>
			                                        <td>${dto.pOrderQty}</td>
			                                        <td>${dto.pOrderReQty}</td>
			                                        <td>${dto.pOrderOkQty}</td>
			                                        <td><fmt:formatDate value="${dto.pOrderReDate }" pattern="yyyy-MM-dd"/></td>
			                                        <td class="text-center" style="width:80px;">
			                                        	<c:if test="${ dto.pOrderChk == 0 }">
			                                        		<a href="goodsIpgoOk.pogd?pOrderNum=${ dto.pOrderNum }" class="btn btn-default">확인</a>
			                                        	</c:if>
			                                        	<c:if test="${ dto.pOrderChk == 2 }">
				                                        	<a class="btn btn-default btn-success">입하완료</a>
			                                        	</c:if>
			                                        	<c:if test="${ dto.pOrderChk == 3 }">
				                                        	<a class="btn btn-default btn-success">반품완료</a>
				                                        </c:if>
			                                        </td>
			                                    </tr>
			                                    </c:forEach>
		                                	</c:if>
		                                </tbody>
		                            </table>
		                            <%@ include file = "/partnerBo/include/paging.jsp" %>
		                        </div>
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
	                    <!-- /.panel -->
	                </div>
                </div>
				
				<%@ include file = "/partnerBo/include/footer.jsp" %>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
<%@ include file = "/partnerBo/include/script.jsp" %>