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
                        	제품등록
                        </h1>
                    </div>
                </div>
                
                <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading"></div>
	                        <div class="panel-body">
	                            <form action="goodsWrite.pogd" name="" method="post" role="form" enctype="multipart/form-data">
	                            	<div class="form-group">
	                                    <label>ISBN</label>
	                                    <input type="text" class="form-control" name="bookIsbn" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>도서</label>
	                                    <input type="text" class="form-control" name="bookName" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>저자</label>
	                                    <input type="text" class="form-control" name="bookAuthorName" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>분야</label>
	                                    <input type="text" class="form-control" name="bookCategory" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>출판사</label>
	                                    <input type="text" class="form-control" name="partnerName" id="" value="${ logName }" readonly>
	                                </div>
	                                <div class="form-group">
	                                    <label>출판일자</label>
	                                    <input type="date" class="form-control" name="bookDate" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>가격</label>
	                                    <input type="text" class="form-control" name="bookPrice" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>페이지수</label>
	                                    <input type="text" class="form-control" name="bookPageNum" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>도서 길이</label>
	                                    <input type="text" class="form-control" name="bookLength" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>부록</label>
	                                    <textarea class="form-control" name="bookSub" id="" rows="3"></textarea>
	                                </div>
	                                <div class="form-group">
	                                    <label>표지 이미지</label>
	                                    <input type="file" class="form-control" name="bookImage" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>책 소개</label>
	                                    <textarea class="form-control" name="bookIntro" id="" rows="3"></textarea>
	                                </div>
	                                <div class="form-group">
	                                    <label>저자 소개</label>
	                                    <input type="text" class="form-control" name="bookAuthorIntro" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>목차</label>
	                                    <textarea class="form-control" name="bookList" id="" rows="3"></textarea>
	                                </div>
	                                <button type="submit" class="btn btn-default">확인</button>
	                                <button type="reset" class="btn btn-default">초기화</button>
	                            </form>
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
	                    <!-- /.panel -->
	                </div>
	                <!-- /.col-lg-12 -->
	            </div>
				
				<%@ include file = "/partnerBo/include/footer.jsp" %>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
<%@ include file = "/partnerBo/include/script.jsp" %>