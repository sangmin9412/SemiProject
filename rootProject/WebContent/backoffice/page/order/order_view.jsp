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
                        	주문서
                        </h1>
                    </div>
                </div>
                
                <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading"></div>
	                        <div class="panel-body">
	                        	<form action="" name="" method="post" role="form">
	                                <c:forEach var="dto" items="${list}" varStatus="cnt">
	                                <div class="form-group">
	                                    <label>도서</label>
	                                    <p class="form-control-static">${dto.bookName }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>출판사</label>
	                                    <p class="form-control-static">${dto.partnerName }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>가격</label>
	                                    <p class="form-control-static">${dto.bookPrice }원</p>
	                                </div>
	                                </c:forEach>
	                                <div class="form-group">
	                                    <label>아이디</label>
	                                    <p class="form-control-static">${list[0].userId }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>이름</label>
	                                    <p class="form-control-static">${list[0].userName }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>주소</label>
	                                    <p class="form-control-static">
	                                    	${list[0].userAddr }
	                                    </p>
	                                </div>
	                                <div class="form-group">
	                                    <label>주문번호</label>
	                                    <p class="form-control-static">${list[0].orderNum }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>배송지</label>
	                                    <p class="form-control-static">
	                                    	${list[0].userAddr }
	                                    </p>
	                                </div>
	                                <div class="form-group">
	                                    <label>반품/교환</label>
	                                    <p class="form-control-static">${list[0].orderReturnNum }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>구매날짜</label>
	                                    <p class="form-control-static">${list[0].orderDate }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>구매수량</label>
	                                    <p class="form-control-static">${list[0].orderQty }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>재고</label>
	                                    <p class="form-control-static">${dto.bookCount }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>구매가격</label>
	                                    <p class="form-control-static">${list[0].orderTotalPrice }</p>
	                                </div>
	                                 <div class="form-group">
	                                    <label>배송상태</label>
	                                    <p class="form-control-static">
	                                    	<c:if test="${ list[0].orderDeliveryNum == 1 }">
                                        		배송준비
                                        	</c:if>
                                        	<c:if test="${ list[0].orderDeliveryNum == 2 }">
                                        		배송중
                                        	</c:if>
                                        	<c:if test="${ list[0].orderDeliveryNum == 3 }">
                                        		배송완료
                                        	</c:if>
	                                    </p>
	                                </div>
	                                <a href="orderList.bood" class="btn btn-default">목록으로</a>
	                            </form>
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