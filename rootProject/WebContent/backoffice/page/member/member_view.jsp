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
                        	회원이름
                        </h1>
                    </div>
                </div>
                
                <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading"></div>
	                        <div class="panel-body">
	                        	<form action="memberDelete.bomem" name="frm" method="post" role="form">
	                        		<input type="hidden" name="userId" value="${list[0].userId }">
	                                <div class="form-group">
	                                    <label>아이디</label>
	                                    <p class="form-control-static" >${list[0].userId }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>비밀번호</label>
	                                    <p class="form-control-static">${list[0].userPw }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>이름</label>
	                                    <p class="form-control-static">${list[0].userName }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>전화번호1</label>
	                                    <p class="form-control-static">${list[0].userPh1 }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>전화번호2</label>
	                                    <p class="form-control-static">${list[0].userPh2 }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>생년월일</label>
	                                    <p class="form-control-static">${list[0].userBirth }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>이메일</label>
	                                    <p class="form-control-static">${list[0].userEmail }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>생성날짜</label>
	                                    <p class="form-control-static">${list[0].userRegist }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>주소</label>
	                                    <p class="form-control-static">${list[0].userAddr }</p>
	                                </div>
	                                <a href="memberList.bomem" class="btn btn-default">목록으로</a>
	                                <a href="memberModify.bomem?userId=${list[0].userId }" class="btn btn-default">수정하기</a>
	                                <a href="#" class="btn btn-default delete-btn" data-url="" data-toggle="modal" data-target="#ModalConfirm" onclick="modalDelete()">삭제</a>
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