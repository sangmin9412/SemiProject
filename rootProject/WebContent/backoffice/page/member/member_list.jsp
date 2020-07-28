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
                        	회원리스트
                        </h1>
                    </div>
                </div>
                
                <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading"></div>
	                        <div class="panel-body">
	                        	<div class="table-responsive">
		                            <table class="table table-striped table-bordered table-hover">
		                                <thead>
		                                    <tr>
		                                        <th>No</th>
		                                        <th>ID</th>
		                                        <th>이름</th>
		                                        <th>전화번호</th>
		                                        <th>이메일</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<c:forEach var="dto" items="${list}" varStatus="cnt">
		                                    <tr>
		                                        <td>${ ((page-1) * limit) + cnt.count }</td>
		                                        <td>${dto.userId}</td>
		                                        <td><a href="memberView.bomem">${dto.userName }</a></td>
		                                        <td>${dto.userPh1 }</td>
		                                        <td>${dto.userEmail }</td>
		                                    </tr>
		                                    </c:forEach>
		                                </tbody>
		                            </table>
		                            <%@ include file = "/backoffice/include/paging.jsp" %>
		                        </div>
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