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
                       		입고현황
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
		                                        <th>상품주문정보</th>
		                                        <th>발주수량</th>
		                                        <th>반품수량</th>
		                                        <th>입하수량</th>
		                                        <th></th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                    <tr style="cursor: pointer;" onclick="location.href='goodsIpgoModify.pogd'">
		                                        <td>1</td>
		                                        <td>출판사이름</td>
		                                        <td>
		                                        	도서명 : 책이름<br>
		                                        	재고 : 10
		                                        </td>
		                                        <td>20</td>
		                                        <td>0</td>
		                                        <td>20</td>
		                                        <td></td>
		                                    </tr>
		                                    <tr style="cursor: pointer;" onclick="location.href='goodsIpgoModify.pogd'">
		                                        <td>2</td>
		                                        <td>출판사이름</td>
		                                        <td>
		                                        	도서명 : 책이름<br>
		                                        	재고 : 10
		                                        </td>
		                                        <td>20</td>
		                                        <td>0</td>
		                                        <td>20</td>
		                                        <td></td>
		                                    </tr>
		                                    <tr style="cursor: pointer;" onclick="location.href='goodsIpgoModify.pogd'">
		                                        <td>3</td>
		                                        <td>출판사이름</td>
		                                        <td>
		                                        	도서명 : 책이름<br>
		                                        	재고 : 10
		                                        </td>
		                                        <td>20</td>
		                                        <td>0</td>
		                                        <td>20</td>
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
				
				<%@ include file = "/partnerBo/include/footer.jsp" %>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
<%@ include file = "/partnerBo/include/script.jsp" %>