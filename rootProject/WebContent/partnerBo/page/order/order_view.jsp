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
                        	제품명
                        </h1>
                    </div>
                </div>
                
                <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading"></div>
	                        <div class="panel-body">
	                        	<form action="" name="" method="" role="form">
	                                <div class="form-group">
	                                    <label>도서</label>
	                                    <p class="form-control-static">책이름</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>출판사</label>
	                                    <p class="form-control-static">출판사이름</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>가격</label>
	                                    <p class="form-control-static">100000원</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>재고</label>
	                                    <p class="form-control-static">20</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>아이디</label>
	                                    <p class="form-control-static">test4</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>이름</label>
	                                    <p class="form-control-static">구매자이름</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>주소</label>
	                                    <p class="form-control-static">
	                                    	구매자 주소
	                                    </p>
	                                </div>
	                                <div class="form-group">
	                                    <label>주문번호</label>
	                                    <p class="form-control-static">책 소개 내용</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>배송지</label>
	                                    <p class="form-control-static">
	                                    	배송지 내용
	                                    </p>
	                                </div>
	                                <div class="form-group">
	                                    <label>배송상태</label>
	                                    <p class="form-control-static">
	                                    	배송준비, 배송중, 배송완료
	                                    </p>
	                                </div>
	                                <div class="form-group">
	                                    <label>반품/교환</label>
	                                    <p class="form-control-static"></p>
	                                </div>
	                                <div class="form-group">
	                                    <label>구매날짜</label>
	                                    <p class="form-control-static">2020-01-05</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>구매수량</label>
	                                    <p class="form-control-static">1</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>구매가격</label>
	                                    <p class="form-control-static">30000</p>
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