<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/backoffice/include/head.jsp" %>
	<div id="wrapper">
		<%@ include file = "/backoffice/include/header.jsp" %>		
		<div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                        	<c:if test="${ empty sort }">주문리스트</c:if>
                        	<c:if test="${ sort eq 'shipping' }">배송리스트</c:if>
                        	<c:if test="${ sort eq 'cancel' }">주문취소 리스트</c:if>
                        	<c:if test="${ sort eq 'return' }">반품/교환 리스트</c:if>
                        </h1>
                    </div>
                </div>  
                
                <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading"></div>
	                        <div class="panel-body">
	                        	<div class="row">
	                        		<div class="col-md-6"></div>
	                        		<div class="col-md-6">
	                        			<form action="" method="" name="">
		                        			<div class="form-group input-group">
	                                            <input type="text" class="form-control">
	                                            <span class="input-group-btn">
	                                                <button class="btn btn-default" type="button"><i class="fa fa-search"></i>
	                                                </button>
	                                            </span>
	                                        </div>
                                        </form>
	                        		</div>
	                        	</div>
	                        	<div class="table-responsive">
		                            <table class="table table-striped table-bordered table-hover">
		                                <thead>
		                                    <tr>
		                                        <th>주문번호</th>
		                                        <th>도서명</th>
		                                        <th>구매자</th>
		                                        <th>구매수량</th>
		                                        <th>가격</th>
		                                        <th>판매날짜</th>
		                                        <th>배송상태</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<c:forEach var="dto" items="${list}" varStatus="cnt">
		                                    <tr>
		                                        <td>${dto.orderNum }</td>
		                                        <td><a href="orderView.bood?orderNum=${dto.orderNum }">${ dto.bookName }</a></td>
		                                        <td>${dto.userName }</td>
		                                        <td>${dto.orderQty }</td>
		                                        <td>${dto.orderTotalPrice }</td>
		                                        <td>${dto.orderDate }</td>
		                                        <td>
		                                        	<c:if test="${ dto.orderDeliveryNum == 1 }">
		                                        		배송준비
		                                        	</c:if>
		                                        	<c:if test="${ dto.orderDeliveryNum == 2 }">
		                                        		배송중
		                                        	</c:if>
		                                        	<c:if test="${ dto.orderDeliveryNum == 3 }">
		                                        		배송완료
		                                        	</c:if>
		                                        </td>
		                                    </tr>
		                                    </c:forEach>
		                                </tbody>
		                            </table>
		                            <%@ include file = "/backoffice/include/paging.jsp" %>
		                        </div>
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
	                    <!-- /.panel -->
	                </div>
                </div>
				
				<%@ include file = "/backoffice/include/footer.jsp" %>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
<%@ include file = "/backoffice/include/script.jsp" %>