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
                        	1:1 문의
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
	                                    <label>제목</label>
	                                    <p class="form-control-static">테스트 제목</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>날짜</label>
	                                    <p class="form-control-static">20-07-10</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>내용</label>
	                                    <p class="form-control-static">
	                                    	테스트 내용<br>
	                                    	테스트 내용<br>
	                                    	테스트 내용<br>
	                                    	테스트 내용<br>
	                                    	테스트 내용<br>
	                                    	테스트 내용
	                                    </p>
	                                </div>
	                                <a href="answerBoardList.boab" class="btn btn-default">목록으로</a>
	                                <a href="answerBoardModify.boab" class="btn btn-default">수정</a>
	                                <a href="answerBoardReply.boab" class="btn btn-default">답변</a>
	                                <a href="#" class="btn btn-default">삭제</a>
	                            </form>
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
	                    <!-- /.panel -->
	                </div>
	                <!-- /.col-lg-12 -->
	            </div>
				
				<%@ include file = "/backoffice/include/footer.jsp" %>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
<%@ include file = "/backoffice/include/script.jsp" %>