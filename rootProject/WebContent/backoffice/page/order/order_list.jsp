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
                        	<c:if test="${ empty sort }">주문리스트</c:if>
                        	<c:if test="${ sort eq 'shipping' }">배송리스트</c:if>
                        	<c:if test="${ sort eq 'cancel' }">주문취소 리스트</c:if>
                        	<c:if test="${ sort eq 'return' }">반품/교환 리스트</c:if>
                        </h1>
                    </div>
                </div>  
                
                <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading"></div>
	                        <div class="panel-body">
	                        	<div class="row">
	                        		<div class="col-md-6"></div>
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
		                                        <th>구매자</th>
		                                        <th>판매날짜</th>
		                                        <th>구매수량</th>
		                                        <th>가격</th>
		                                        <th>배송상태</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                    <tr>
		                                        <td>1</td>
		                                        <td><a href="orderView.bood">책이름이름</a></td>
		                                        <td>구매자이름</td>
		                                        <td>2020-01-05</td>
		                                        <td>1</td>
		                                        <td>30000</td>
		                                        <td></td>
		                                    </tr>
		                                    <tr>
		                                        <td>2</td>
		                                        <td><a href="orderView.bood">책이름이름</a></td>
		                                        <td>구매자이름</td>
		                                        <td>2020-01-05</td>
		                                        <td>1</td>
		                                        <td>30000</td>
		                                        <td></td>
		                                    </tr>
		                                    <tr>
		                                        <td>3</td>
		                                        <td><a href="orderView.bood">책이름이름</a></td>
		                                        <td>구매자이름</td>
		                                        <td>2020-01-05</td>
		                                        <td>1</td>
		                                        <td>30000</td>
		                                        <td></td>
		                                    </tr>
		                                </tbody>
		                            </table>
		                            <div class="row">
			                            <div class="col-sm-12">
			                            	<div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
			                            		<ul class="pagination">
			                            			<li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
			                            				<a href="#">Previous</a>
			                            			</li>
			                            			<li class="paginate_button active" aria-controls="dataTables-example" tabindex="0"><a href="#">1</a></li>
			                            			<li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">2</a></li>
			                            			<li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">3</a></li>
			                            			<li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">4</a></li>
			                            			<li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">5</a></li>
			                            			<li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">6</a></li>
			                            			<li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
			                            				<a href="#">Next</a>
			                            			</li>
			                            		</ul>
			                            	</div>
			                           </div>
									</div>
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