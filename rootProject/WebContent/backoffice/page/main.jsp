<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/backoffice/include/head.jsp" %>
	<div id="wrapper">
		<%@ include file = "/backoffice/include/header.jsp" %>		
		<div id="page-wrapper">
            <div id="page-inner">
            	
            	<c:if test="${ empty logId }">
            	<div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                        	로그인
                        </h1>
                    </div>
                </div>
                <div class="row">
					<div class="panel panel-default">
					    <div class="panel-body" style="padding:100px 0;">
					    	<style>
					    		.login-area {
					    			max-width:300px;
					    			margin: 0 auto;
					    			padding:30px 0;
					    		}
					    		.submit {
					    			width: 100%;
					    		}
					    	</style>
					    	<div class="login-area">
					    		<form action="mainLogIn.bomain" name="" method="post" role="form">
					    			<div class="form-group">
	                                    <input type="text" class="form-control" name="adminId" id="" value="" placeholder="ID">
	                                </div>
	                                <div class="form-group">
	                                    <input type="password" class="form-control" name="adminPw" id="" value="" placeholder="Password">
	                                </div>
	                                <div class="form-group">
	                                	<button type="submit" class="btn btn-primary submit">로그인</button>
	                                </div>
					    		</form>
					    	</div>
						</div>
					</div>
				</div>
                </c:if>
                
                <c:if test="${ !empty logId }">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                        	페이지 타이틀... <small>타이틀 내용... 수정수정666666</small>
                        </h1>
                    </div>
                </div>
                </c:if>
				
				<%@ include file = "/backoffice/include/footer.jsp" %>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
<%@ include file = "/backoffice/include/script.jsp" %>