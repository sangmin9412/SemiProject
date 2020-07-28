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
	                        		<form action="goodsList.bogd" name="frm" method="get">
		                        		<div class="col-md-8">
		                        			<a href="goodsForm.bogd" class="btn btn-default" style="margin-bottom: 10px;">제품등록</a>
		                        			<select class="form-control" name="partnerName" style="display:inline-block; vertical-align:top; max-width:200px;" onchange="document.frm.submit();">
		                        				<c:forEach items="${ list2 }" var="plist">
		                        					<option value="${ plist.partnerName }" <c:if test="${ pName eq plist.partnerName }">selected</c:if>>${ plist.partnerName }</option>
		                        				</c:forEach>
		                                    </select>
		                                    <!-- <button type="submit" class="btn btn-default" style="margin-bottom: 10px;">확인</button> -->
		                        		</div>
		                        		<div class="col-md-4">
		                        			<div class="form-group input-group">
	                                            <input type="text" name="serchValue" class="form-control">
	                                            <span class="input-group-btn">
	                                                <button class="btn btn-default" type="button"><i class="fa fa-search"></i>
	                                                </button>
	                                            </span>
	                                        </div>
		                        		</div>
                                	</form>
	                        	</div>
	                        	<div class="table-responsive">
		                            <table class="table table-striped table-bordered table-hover">
		                                <thead>
		                                    <tr>
		                                        <th>No</th>
		                                        <th>표지이미지</th>
		                                        <th>도서</th>
		                                        <th>저자</th>
		                                        <th>출판사</th>
		                                        <th>가격</th>
		                                        <th>재고</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<c:forEach var="dto" items="${list}" varStatus="cnt">
		                                    <tr>
		                                        <td>${ ((page-1) * limit) + cnt.count }</td>
		                                        <td><img src="${imagePath }/partnerBo/page/goods/upload/${ dto.bookImage }" width="60" /></td>
		                                        <td><a href="goodsView.bogd?bookNum=${dto.bookNum }">${dto.bookName }</a></td>
		                                        <td>${dto.bookAuthorName }</td>
		                                        <td>${dto.partnerName }</td>
		                                        <td>${dto.bookPrice }</td>
		                                        <td>${dto.bookCount }</td>
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