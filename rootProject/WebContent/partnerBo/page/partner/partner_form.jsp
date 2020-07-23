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
                        	입점업체등록
                        </h1>
                        <!-- 
						<ol class="breadcrumb">
						  <li><a href="#">Menu01</a></li>
						  <li><a href="#">Menu02</a></li>
						  <li class="active">Menu03</li>
						</ol>
						 -->
                    </div>
                </div>
                
                <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading"></div>
	                        <div class="panel-body">
	                            <form action="partnerWrite.bopt" name="" method="post" enctype="multipart/form-data">
	                                <div class="form-group">
	                                    <label>상호</label>
	                                    <input type="text" class="form-control" name="partnerName" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>사업자등록번호(ID)</label>
	                                    <input type="text" class="form-control" name="partnerNum" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>대표자</label>
	                                    <input type="text" class="form-control" name="partnerCeo" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>주민등록번호</label>
	                                    <input type="text" class="form-control" name="residentNum" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>사업장소재지</label>
	                                    <input type="text" class="form-control" name="partnerAddr" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>개업일</label>
	                                    <input type="date" class="form-control" name="openingDay" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>사업자등록일</label>
	                                    <input type="date" class="form-control" name="businessRegistDate" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>영업종류</label>
	                                    <input type="text" class="form-control" name="salesType" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>사업종류</label>
	                                    <input type="text" class="form-control" name="businessType" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>공동사업자</label>
	                                    <input type="text" class="form-control" name="cooperative" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>도서정보</label>
	                                    <textarea class="form-control" name="bookInfo" id="" rows="3"></textarea>
	                                </div>
	                                <div class="form-group">
	                                    <label>이메일</label>
	                                    <input type="text" class="form-control" name="partnerEmail" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>계좌번호</label>
	                                    <input type="text" class="form-control" name="partnerAccNum" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>사업자등록증사본</label>
	                                    <input type="file" class="form-control" name="businessRegistFile" id="" value="">
	                                </div>
	                                <div class="form-group">
	                                    <label>통장사본</label>
	                                    <input type="file" class="form-control" name="bankBookFile" id="" value="">
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