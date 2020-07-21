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
		                                    <tr>
		                                        <td>1</td>
		                                        <td>test4</td>
		                                        <td><a href="memberView.bomem">길동이</a></td>
		                                        <td>010-0000-1111</td>
		                                        <td>name@site.com</td>
		                                    </tr>
		                                    <tr>
		                                        <td>2</td>
		                                        <td>test5</td>
		                                        <td><a href="memberView.bomem">길동홍</a></td>
		                                        <td>010-0000-1112</td>
		                                        <td>name@site.com</td>
		                                    </tr>
		                                    <tr>
		                                        <td>3</td>
		                                        <td>test6</td>
		                                        <td><a href="memberView.bomem">길동홍</a></td>
		                                        <td>010-0000-1113</td>
		                                        <td>name@site.com</td>
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