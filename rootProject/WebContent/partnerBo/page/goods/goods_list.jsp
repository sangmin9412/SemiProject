<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/partnerBo/include/head.jsp" %>
	<div id="wrapper">
		<%@ include file = "/partnerBo/include/header.jsp" %>		
		<div id="page-wrapper">
            <div id="page-inner">
				
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                       		제품리스트
                        </h1>
                    </div>
                </div>
                
                <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading"></div>
	                        <div class="panel-body">
	                        	<div class="row">
	                        		<div class="col-md-6">
	                        			<a href="goodsForm.pogd" class="btn btn-default" style="margin-bottom: 10px;">제품등록</a>
	                        		</div>
	                        		<div class="col-md-6">
	                        			<form action="" method="" name="">
		                        			<div class="form-group input-group">
	                                            <input type="text" class="form-control">
	                                            <span class="input-group-btn">
	                                                <button class="btn btn-default" type="button"><i class="fa fa-search"></i>
	                                                </button>
	                                            </span>
	                                        </div>
                                        </form>
	                        		</div>
	                        	</div>
	                        	<div class="table-responsive">
		                            <table class="table table-striped table-bordered table-hover">
		                                <thead>
		                                    <tr>
		                                        <th>No</th>
		                                        <th>도서</th>
		                                        <th>저자</th>
		                                        <th>출판사</th>
		                                        <th>가격</th>
		                                        <th>표지이미지</th>
		                                        <th>재고</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<c:if test="${ empty goodsList }">
		                                		<tr>
		                                			<td colspan="9" style="padding:30px 0; text-align:center;">등록된 글이 없습니다.</td>
		                                		</tr>
		                                	</c:if>
		                                	<c:if test="${ !empty goodsList }">
		                                	<c:forEach var="dto" items="${goodsList}" varStatus="cnt">
		                                    <tr>
		                                        <td>${cnt.count }</td>
		                                        <td><a href="goodsView.pogd?bookNum=${dto.bookNum }">${dto.bookName }</a></td>
		                                        <td>${dto.bookAuthorName }</td>
		                                        <td>${dto.partnerName }</td>
		                                        <td>${dto.bookPrice }</td>
		                                        <td><img src="/partnerBo/page/goods/upload/${ dto.bookImage }" width="60" /></td>
		                                        <td>${dto.bookCount }</td>
		                                    </tr>
		                                   	</c:forEach>
		                                   	</c:if>
		                                </tbody>
		                            </table>
		                            <%@ include file = "/partnerBo/include/paging.jsp" %>
		                        </div>
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
	                    <!-- /.panel -->
	                </div>
                </div>
				
				<%@ include file = "/partnerBo/include/footer.jsp" %>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
<%@ include file = "/partnerBo/include/script.jsp" %>