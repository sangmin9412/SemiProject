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
                        	이벤트
                        </h1>
                    </div>
                </div>
                
                <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading"></div>
	                        <div class="panel-body">
	                            <form action="eventBoardDelete.boeb" name="frm" method="post" role="form">
	                            	<input type="hidden" name="boardNum" value="${ eventList.boardNum }" />
	                                <div class="form-group">
	                                    <label>제목</label>
	                                    <p class="form-control-static">${ eventList.boardSubject }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>조회수</label>
	                                    <p class="form-control-static">${ eventList.readCount + 1 }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>시작</label>
	                                    <p class="form-control-static">
	                                    	<fmt:formatDate value="${ eventList.startDate }" pattern="yyyy-MM-dd" />
	                                    </p>
	                                </div>
	                                <div class="form-group">
	                                    <label>마감</label>
	                                    <p class="form-control-static">
	                                    	<fmt:formatDate value="${ eventList.endDate }" pattern="yyyy-MM-dd" />
	                                    </p>
	                                </div>
	                                <div class="form-group">
	                                    <label>내용</label>
	                                    <p class="form-control-static">
	                                    	${fn:replace(eventList.boardContent,cn,br)}
	                                    </p>
	                                    <img src="/backoffice/page/cscenter/eventupload/${eventList.storeFileName }" alt="" />
	                                </div>
	                                <a href="eventBoardList.boeb" class="btn btn-default">목록으로</a>
	                                <a href="eventBoardModify.boeb?boardNum=${ eventList.boardNum }" class="btn btn-default">수정</a>
	                                <a href="#" class="btn btn-default delete-btn" data-url="" data-toggle="modal" data-target="#ModalConfirm" onclick="modalDelete()">삭제</a>
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