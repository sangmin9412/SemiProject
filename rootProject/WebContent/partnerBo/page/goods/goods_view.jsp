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
                        	제품명
                        </h1>
                    </div>
                </div>
                
                <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading"></div>
	                        <div class="panel-body">
	                        	<form action="goodsDelete.pogd" name="frm" method="post" role="form">
	                        		<input type="hidden" name="bookNum" value="${ list[0].bookNum }" />
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
	                                    <p class="form-control-static">${fn:replace(list[0].bookSub,cn,br)}</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>표지 이미지</label>
	                                    <p class="form-control-static">
	                                    	<img src="/partnerBo/page/goods/upload/${list[0].bookImage }" alt="" />
	                                    </p>
	                                </div>
	                                <div class="form-group">
	                                    <label>책 소개</label>
	                                    <p class="form-control-static">${fn:replace(list[0].bookIntro,cn,br)}</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>저자 소개</label>
	                                    <p class="form-control-static">${list[0].bookAuthorIntro }</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>목차</label>
	                                    <p class="form-control-static">${fn:replace(list[0].bookList,cn,br)}</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>재고</label>
	                                    <p class="form-control-static">${list[0].bookCount }권</p>
	                                </div>
	                                <a href="goodsList.pogd" class="btn btn-default">목록으로</a>
	                                <a href="goodsModify.pogd?bookNum=${list[0].bookNum }" class="btn btn-default">수정</a>
	                                <a href="#" class="btn btn-default delete-btn" data-toggle="modal" data-target="#ModalConfirm" onclick="modalDelete()">삭제</a>
	                            </form>
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