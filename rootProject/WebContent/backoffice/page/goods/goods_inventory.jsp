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
                       		재고관리
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
		                            	<colgroup>
		                            		<col />
		                            		<col />
		                            		<col />
		                            		<col />
		                            		<col style="width:60px;" />
		                            	</colgroup>
		                                <thead>
		                                    <tr>
		                                        <th>No</th>
		                                        <th>표지이미지</th>
		                                        <th>도서</th>
		                                        <th>출판사</th>
		                                        <th>재고</th>
		                                        <th class="text-center">신청</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<c:forEach var="dto" items="${list}" varStatus="cnt">
		                                    <tr>
		                                        <td>${ ((page-1) * limit) + cnt.count }</td>
		                                        <td><img src="/backoffice/page/goods/upload/${ dto.bookImage }" width="60" /></td>
		                                        <td>${dto.bookName }</td>
		                                        <td>${dto.partnerName }</td>
		                                        <td>${dto.bookCount }</td>
		                                        <td class="text-center" style="width:80px;"><a href="goodsInventoryForm.bogd?partnerNum=${dto.partnerNum }&bookNum=${dto.bookNum}" class="btn btn-default">발주</a></td>
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