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
	                                    <label>ISBN</label>
	                                    <p class="form-control-static">02023021</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>도서</label>
	                                    <p class="form-control-static">책이름</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>저자</label>
	                                    <p class="form-control-static">저자이름</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>분야</label>
	                                    <p class="form-control-static">분야내용</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>출판사</label>
	                                    <p class="form-control-static">출판사이름</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>출판일자</label>
	                                    <p class="form-control-static">2020-01-10</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>가격</label>
	                                    <p class="form-control-static">100000원</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>페이지수</label>
	                                    <p class="form-control-static">321</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>도서 길이</label>
	                                    <p class="form-control-static">30x60</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>부록</label>
	                                    <p class="form-control-static">부록내용</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>표지 이미지</label>
	                                    <p class="form-control-static">
	                                    	<img src="" alt="" />
	                                    </p>
	                                </div>
	                                <div class="form-group">
	                                    <label>책 소개</label>
	                                    <p class="form-control-static">책 소개 내용</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>저자 소개</label>
	                                    <p class="form-control-static">저자 소개 내용</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>목차</label>
	                                    <p class="form-control-static">목차 내용</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>재고</label>
	                                    <p class="form-control-static">20</p>
	                                </div>
	                                <a href="goodsList.bogd" class="btn btn-default">목록으로</a>
	                                <a href="goodsModify.bogd" class="btn btn-default">수정</a>
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