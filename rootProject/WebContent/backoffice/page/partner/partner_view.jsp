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
                        	입점업체 정보
                        </h1>
                    </div>
                </div>
                
                <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading"></div>
	                        <div class="panel-body">
	                        	<form action="partnerList.bopt" name="" method="post" role="form" enctype="multipart/form-data">
	                                <div class="form-group">
	                                    <label>상호</label>
	                                    <p class="form-control-static">${list[0].partnerName }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>사업자등록번호(ID)</label>
	                                    <p class="form-control-static">${list[0].partnerNum }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>대표자</label>
	                                    <p class="form-control-static">${list[0].partnerCeo}</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>주민등록번호</label>
	                                    <p class="form-control-static">${list[0].residentNum}</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>사업장소재지</label>
	                                    <p class="form-control-static">${list[0].partnerAddr}</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>개업일</label>
	                                    <p class="form-control-static">${list[0].openingDay}</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>사업자등록일</label>
	                                    <p class="form-control-static">${list[0].businessRegistDate}</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>영업종류</label>
	                                    <p class="form-control-static">${list[0].salesType}</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>사업종류</label>
	                                    <p class="form-control-static">${list[0].businessType}</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>공동사업자</label>
	                                    <p class="form-control-static">${list[0].cooperative}</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>도서정보</label>
	                                    <p class="form-control-static">${list[0].bookInfo}</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>이메일</label>
	                                    <p class="form-control-static">${list[0].partnerEmail}</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>계좌번호</label>
	                                    <p class="form-control-static">${list[0].partnerAccNum}</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>사업자등록증사본</label>
	                                    <p class="form-control-static">${list[0].businessRegistFile}</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>통장사본</label>
	                                    <p class="form-control-static">${list[0].bankBookFile}</p>
	                                </div>
	                                <a href="partnerList.bopt" class="btn btn-default">목록으로</a>
	                           		<a href="partnerModify.bopt?partnerNum=${list[0].partnerNum }" class="btn btn-default">수정</a>
	                           		<a href="#" class="btn btn-default delete-btn" data-url="partnerDelete.bopt?partnerNum=${list[0].partnerNum }" data-toggle="modal" data-target="#ModalConfirm" onclick="modelDelete()">삭제</a>
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