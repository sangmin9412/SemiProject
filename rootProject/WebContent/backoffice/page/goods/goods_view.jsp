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
                        	${list[0].bookName }
                        </h1>
                    </div>
                </div>
                
                <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading"></div>
	                        <div class="panel-body">
	                        	<form action="goodsList.bogd" name="" method="post" role="form" enctype="multipart/form-data">
	                                <div class="form-group">
	                                    <label>ISBN</label>
	                                    <p class="form-control-static">${list[0].bookIsbn }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>도서명</label>
	                                    <p class="form-control-static">${list[0].bookName }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>저자</label>
	                                    <p class="form-control-static">${list[0].bookAuthorName }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>분야</label>
	                                    <p class="form-control-static">${list[0].bookCategory }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>출판사</label>
	                                    <p class="form-control-static">${list[0].partnerName }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>출판일자</label>
	                                    <p class="form-control-static"><fmt:formatDate value="${list[0].bookDate }" pattern="yyyy-MM-dd"/></p>
	                                </div>
	                                <div class="form-group">
	                                    <label>가격</label>
	                                    <p class="form-control-static">${list[0].bookPrice }원</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>페이지수</label>
	                                    <p class="form-control-static">${list[0].bookPageNum }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>도서 길이</label>
	                                    <p class="form-control-static">${list[0].bookLength }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>부록</label>
	                                    <p class="form-control-static">${list[0].bookSub }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>표지 이미지</label>
	                                    <p class="form-control-static">
	                                    	<img src="${imagePath }/partnerBo/page/goods/upload/${list[0].bookImage }" alt="" />
	                                    </p>
	                                </div>
	                                <div class="form-group">
	                                    <label>책 소개</label>
	                                    <p class="form-control-static">${list[0].bookIntro }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>저자 소개</label>
	                                    <p class="form-control-static">${list[0].bookAuthorIntro }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>목차</label>
	                                    <p class="form-control-static">${list[0].bookList }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>재고</label>
	                                    <p class="form-control-static">${list[0].bookCount }권</p>
	                                </div>
	                                <a href="goodsList.bogd" class="btn btn-default">목록으로</a>
	                                <a href="goodsModify.bogd?bookNum=${list[0].bookNum }" class="btn btn-default">수정</a>
	                            </form>
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