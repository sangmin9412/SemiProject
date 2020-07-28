<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<nav class="navbar navbar-default top-navbar" role="navigation">
	    <div class="navbar-header">
	        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
	            <span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	        </button>
	        <a class="navbar-brand" href="/backoffice"><i class="fa fa-gear"></i> <strong>ADMIN</strong></a>
	    </div>
	
	    <ul class="nav navbar-top-links navbar-right">
	        <!-- /.dropdown -->
	        <li class="dropdown">
				<c:if test="${ empty logId }">
					<a href="/backoffice/">
		                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
		            </a>
				</c:if>
	            <c:if test="${ !empty logId }">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
		                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
		            </a>
		            <ul class="dropdown-menu dropdown-user">
		                <li><a href="#"><i class="fa fa-user fa-fw"></i> ${ logId } 님 안녕하세요</a>
		                </li>
		                <li class="divider"></li>
		                <li><a href="/backoffice/mainLogOut.bomain"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
		                </li>
		            </ul>	
				</c:if>
	            <!-- /.dropdown-user -->
	        </li>
	        <!-- /.dropdown -->
	    </ul>
	</nav>
	<!--/. NAV TOP  -->
	<nav class="navbar-default navbar-side" role="navigation">
	<div id="sideNav" href=""><i class="fa fa-caret-right"></i></div>
	    <div class="sidebar-collapse">
	        <ul class="nav" id="main-menu">
	            <li>
	                <a class="active-menu" href="#"><i class="fa fa-dashboard"></i> Dashboard</a>
	            </li>
	            <li>
	                <a href="#">
	                	<i class="fa fa-folder-open-o"></i>
	                	<i class="fa fa-folder-o"></i> 
	                	업체관리<span class="fa arrow"></span>
	                </a>
	                <ul class="nav nav-second-level">
	                    <li>
	                        <a href="/backoffice/partnerForm.bopt">입점업체 등록</a>
	                    </li>
	                    <li>
	                        <a href="/backoffice/partnerList.bopt">입점업체 리스트</a>
	                    </li>
	                    <li>
	                        <a href="#">업체 정산</a>
	                    </li>
	                </ul>
	            </li>
	            <li>
	                <a href="#">
	                	<i class="fa fa-folder-open-o"></i>
	                	<i class="fa fa-folder-o"></i> 
	                	업체상품관리<span class="fa arrow"></span>
	                </a>
	                <ul class="nav nav-second-level">
	                    <li>
	                        <a href="/backoffice/goodsList.bogd">제품리스트</a>
	                    </li>
	                    <li>
	                        <a href="/backoffice/goodsInventoryList.bogd">재고관리</a>
	                    </li>
	                    <li>
	                        <a href="/backoffice/goodsIpgo.bogd">입고현황</a>
	                    </li>
	                </ul>
	            </li>
	            <li>
	                <a href="#">
	                	<i class="fa fa-folder-open-o"></i>
	                	<i class="fa fa-folder-o"></i> 
	                	회원관리<span class="fa arrow"></span>
	                </a>
	                <ul class="nav nav-second-level">
	                    <li>
	                        <a href="/backoffice/memberList.bomem">회원리스트</a>
	                    </li>
	                </ul>
	            </li>
	            <li>
	                <a href="#">
	                	<i class="fa fa-folder-open-o"></i>
	                	<i class="fa fa-folder-o"></i> 
	                	주문관리<span class="fa arrow"></span>
	                </a>
	                <ul class="nav nav-second-level">
	                    <li>
	                        <a href="/backoffice/orderList.bood?sort=all">전체주문조회</a>
	                    </li>
	                    <li>
	                        <a href="/backoffice/orderList.bood?sort=new">신규주문</a>
	                    </li>
	                    <li>
	                        <a href="/backoffice/orderShippingList.bood?sort=ing">배송중</a>
	                    </li>
	                    <li>
	                        <a href="/backoffice/orderShippingList.bood?sort=end">배송완료</a>
	                    </li>
	                    <li>
	                        <a href="/backoffice/orderCancelList.bood">주문취소</a>
	                    </li>
	                    <li>
	                        <a href="/backoffice/orderReturnList.bood">반품/교환</a>
	                    </li>
	                </ul>
	            </li>
	            <li>
	                <a href="#">
	                	<i class="fa fa-folder-open-o"></i>
	                	<i class="fa fa-folder-o"></i>
	                	고객센터<span class="fa arrow"></span>
	                </a>
	                <ul class="nav nav-second-level">
	                    <li>
	                        <a href="/backoffice/noticeBoardList.bonb">공지사항</a>
	                    </li>
	                    <li>
	                        <a href="/backoffice/faqBoardList.bofb">자주묻는 질문</a>
	                    </li>
	                    <li>
	                        <a href="/backoffice/answerBoardList.boab">1:1 문의</a>
	                    </li>
	                    <li>
	                        <a href="/backoffice/eventBoardList.boeb">이벤트</a>
	                    </li>
	                </ul>
	            </li>
	            <li>
	            	<a href="/backoffice/page/formtest.jsp">
	            		<i class="fa fa-fw fa-file"></i>
	            		Form Test
	            	</a>
	            </li>
	        </ul>
	
	    </div>
	
	</nav>
	<!-- /. NAV SIDE  -->