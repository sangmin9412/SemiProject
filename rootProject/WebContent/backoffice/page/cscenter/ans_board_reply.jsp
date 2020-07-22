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
	                            <form action="answerBoardReplyPro.boab" name="" method="post" role="form">
	                            	<input type="hidden" name="boardNum" value="${ answerList.boardNum }">
	                            	<input type="hidden" name="boardReRef" value="${ answerList.boardReRef }" />
									<input type="hidden" name="boardReLev" value="${ answerList.boardReLev }" />
									<input type="hidden" name="boardReSeq" value="${ answerList.boardReSeq }" />
	                                <div class="form-group">
	                                    <label>제목</label>
	                                    <input type="text" class="form-control" name="boardSubject" id="" value="RE: ${ answerList.boardSubject }">
	                                </div>
	                                <div class="form-group">
	                                    <label>작성자</label>
	                                    <input type="text" class="form-control" name="boardName" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>비밀번호</label>
	                                    <input type="password" class="form-control" name="boardPass" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>내용</label>
	                                    <textarea name="boardContent" class="form-control" id="" cols="30" rows="10">&#10;&#10;==========================================&#10;${ answerList.boardContent }</textarea>
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
				
				<%@ include file = "/backoffice/include/footer.jsp" %>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
<%@ include file = "/backoffice/include/script.jsp" %>