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
		                                        <th>도서</th>
		                                        <th>출판사</th>
		                                        <th>재고</th>
		                                        <th class="text-center">신청</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                    <tr>
		                                        <td>1</td>
		                                        <td>책이름이름</td>
		                                        <td>출판사이름이름</td>
		                                        <td>20</td>
		                                        <td class="text-center"><a href="goodsInventoryForm.bogd" class="btn btn-default">발주</a></td>
		                                    </tr>
		                                    <tr>
		                                        <td>2</td>
		                                        <td>책이름이름</td>
		                                        <td>출판사이름이름</td>
		                                        <td>20</td>
		                                        <td class="text-center"><a href="goodsInventoryForm.bogd" class="btn btn-default">발주</a></td>
		                                    </tr>
		                                    <tr>
		                                        <td>3</td>
		                                        <td>책이름이름</td>
		                                        <td>출판사이름이름</td>
		                                        <td>20</td>
		                                        <td class="text-center"><a href="goodsInventoryForm.bogd" class="btn btn-default">발주</a></td>
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