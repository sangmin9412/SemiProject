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
	                        	<form action="" name="" method="" role="form">
	                                <div class="form-group">
	                                    <label>아이디</label>
	                                    <p class="form-control-static">test4</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>비밀번호</label>
	                                    <p class="form-control-static">0202020202</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>이름</label>
	                                    <p class="form-control-static">홍길동</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>전화번호1</label>
	                                    <p class="form-control-static">010-0000-1111</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>전화번호2</label>
	                                    <p class="form-control-static"></p>
	                                </div>
	                                <div class="form-group">
	                                    <label>생년월일</label>
	                                    <p class="form-control-static">1994-12-20</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>이메일</label>
	                                    <p class="form-control-static">enlwne@naver.com</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>생성날짜</label>
	                                    <p class="form-control-static">2020-01-05</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>주소</label>
	                                    <p class="form-control-static">서울시...</p>
	                                </div>
	                                <a href="memberList.bomem" class="btn btn-default">목록으로</a>
	                                <a href="memberModify.bomem" class="btn btn-default">수정하기</a>
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