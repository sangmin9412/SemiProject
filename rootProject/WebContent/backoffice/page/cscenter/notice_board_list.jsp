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
                        	공지사항
                        </h1>
                    </div>
                </div>
                
                <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading"></div>
	                        <div class="panel-body">
	                        	<a href="noticeBoardForm.bonb" class="btn btn-default" style="margin-bottom: 10px;">글쓰기</a>
	                        	<div class="table-responsive">
		                            <table class="table table-striped table-bordered table-hover">
		                                <thead>
		                                    <tr>
		                                        <th>No</th>
		                                        <th>ID</th>
		                                        <th>제목</th>
		                                        <th>날짜</th>
		                                        <th>조회수</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<c:if test="${ empty noticeList }">
		                                		<tr>
		                                			<td colspan="9" style="padding:30px 0; text-align:center;">등록된 글이 없습니다.</td>
		                                		</tr>
		                                	</c:if>
		                                	<c:if test="${ !empty noticeList }">
		                                	<c:forEach items="${ noticeList }" var="list" varStatus="cnt">
			                                    <tr>
			                                        <td>${ ((page-1) * limit) + cnt.count }</td>
			                                        <td>${ list.adminId }</td>
			                                        <td><a href="noticeBoardView.bonb?boardNum=${ list.boardNum }">${ list.boardSubject }</a></td>
			                                        <td><fmt:formatDate value="${ list.boardDate }" pattern="yyyy-MM-dd" /></td>
			                                        <td>${ list.readCount }</td>
			                                    </tr>
		                                    </c:forEach>
		                                    </c:if>
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