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
	                            <form action="memberModifyPro.bomem" name="" method="post" role="form">
	                            	<div class="form-group">
	                                    <label>아이디</label>
	                                    <input type="text" class="form-control" name="userId" id="" value="${list[0].userId }" readonly>
	                                </div>
	                                <div class="form-group">
	                                    <label>비밀번호</label>
	                                    <input type="text" class="form-control" name="userPw" id="" value="${list[0].userPw }">
	                                </div>
	                                <div class="form-group">
	                                    <label>이름</label>
	                                    <input type="text" class="form-control" name="userName" id="" value="${list[0].userName }">
	                                </div>
	                                <div class="form-group">
	                                    <label>전화번호1</label>
	                                    <input type="text" class="form-control" name="userPh1" id="" value="${list[0].userPh1 }">
	                                </div>
	                                <div class="form-group">
	                                    <label>전화번호2</label>
	                                    <input type="text" class="form-control" name="userPh2" id="" value="${list[0].userPh2 }">
	                                </div>
	                                <div class="form-group">
	                                    <label>생년월일</label>
	                                    <input type="date" class="form-control" name="userBirth" id="" value="${list[0].userBirth }">
	                                </div>
	                                <div class="form-group">
	                                    <label>이메일</label>
	                                    <input type="text" class="form-control" name="userEmail" id="" value="${list[0].userEmail }">
	                                </div>
	                                <div class="form-group">
	                                    <label>주소</label>
	                                    <input type="text" class="form-control" name="userAddr" id="" value="${list[0].userAddr }">
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