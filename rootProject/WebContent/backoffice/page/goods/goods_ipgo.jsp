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
                       		입고현황
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
		                                        <th>No</th>
		                                        <th>출판사명</th>
		                                        <th>상품주문정보</th>
		                                        <th>발주수량</th>
		                                        <th>반품수량</th>
		                                        <th>입하수량</th>
		                                        <th></th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<c:forEach var="dto" items="${list}" varStatus="cnt">
		                                    <tr style="cursor: pointer;" onclick="location.href='goodsIpgoModify.bogd'">
		                                        <td>${ ((page-1) * limit) + cnt.count }</td>
		                                        <td>${dto.partnerName }</td>
		                                        <td>
		                                        	${dto.bookName }<br>
		                                        	재고 : ${dto.bookCount }
		                                        </td>
		                                        <td>${dto.pOrderQty}</td>
		                                        <td>${dto.pOrderReQty}</td>
		                                        <td>${dto.pOrderOkQty}</td>
		                                        <td></td>
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