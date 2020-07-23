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
                        	입점업체 리스트
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
		                                        <th>출판사명</th>
		                                        <th>사업자등록번호</th>
		                                        <th>대표자</th>
		                                        <th>이메일</th>
		                                        <th>생성날짜</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<c:forEach var="dto" items="${partnerList}" varStatus="cnt">
		                                    <tr>
		                                        <td>${ ((page-1) * limit) + cnt.count }</td>
		                                        <td>${dto.partnerName }</td>
		                                        <td><a href="partnerView.bopt?partnerNum=${dto.partnerNum }">${dto.partnerNum }</a></td>
		                                        <td>${dto.partnerCeo }</td>
		                                        <td>${dto.partnerEmail }</td>
		                                        <td>${dto.partnerRegistDate }</td>
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