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
	                            <form action="eventBoardWrite.boeb" name="frm" method="post" role="form" enctype="multipart/form-data">
	                                <div class="form-group">
	                                    <label>제목</label>
	                                    <input type="text" class="form-control" name="boardSubject" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>내용</label>
	                                    <textarea name="boardContent" class="form-control" id="" cols="30" rows="10"></textarea>
	                                </div>
	                                <div class="form-group">
	                                    <label>시작</label>
	                                    <input type="date" class="form-control" name="startDate" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>마감</label>
	                                    <input type="date" class="form-control" name="endDate" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>이미지</label>
	                                    <input type="file" class="form-control" name="fileUp" id="" value="">
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