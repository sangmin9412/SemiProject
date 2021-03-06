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
                        	입고현황
                        </h1>
                    </div>
                </div>
                
                <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading"></div>
	                        <div class="panel-body">
	                            <form action="goodsIpgoModifyPro.bogd" name="" method="post" role="form">
	                            	<input type="hidden" name="partnerNum" value="${list[0].partnerNum}"/>
	                            	<input type="hidden" name="bookNum" value="${list[0].bookNum}"/>
	                            	<input type="hidden" name="pOrderNum" value="${list[0].pOrderNum}"/>
	                            	
	                            	<div class="form-group">
	                                    <label>출판사명</label>
	                                    <input type="text" class="form-control" name="partnerName" id="" value="${list[0].partnerName }" readonly>
	                                </div>
	                                <div class="form-group">
	                                    <label>도서명</label>
	                                    <input type="text" class="form-control" name="bookName" id="" value="${list[0].bookName }" readonly>
	                                </div>
	                                <div class="form-group">
	                                    <label>재고</label>
	                                    <input type="text" class="form-control" name="bookCount" id="" value="${list[0].bookCount }" readonly>
	                                </div>
	                                <div class="form-group">
	                                    <label>발주수량</label>
	                                    <input type="text" class="form-control" name="pOrderQty" id="" value="${list[0].pOrderQty }" readonly>
	                                </div>
	                                <div class="form-group">
	                                    <label>반품수량</label>
	                                    <input type="text" class="form-control" name="pOrderReQty" id="" value="${list[0].pOrderReQty }">
	                                </div>
	                                <div class="form-group">
	                                    <label>입하수량</label>
	                                    <input type="text" class="form-control" name="pOrderOkQty" id="" value="${list[0].pOrderOkQty }">
	                                </div>
	                                <button type="submit" class="btn btn-default">확인</button>
	                                <button type="reset" class="btn btn-default">초기화</button>
	                            </form>
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
	                    <!-- /.panel -->
	                </div>
	                <!-- /.col-lg-12 -->
	            </div>
				
				<%@ include file = "/backoffice/include/footer.jsp" %>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
<%@ include file = "/backoffice/include/script.jsp" %>