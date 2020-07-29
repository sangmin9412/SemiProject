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
	        <a class="navbar-brand" href="/partnerBo"><i class="fa fa-gear"></i> <strong>PARTNERS</strong></a>
	    </div>
	
	    <ul class="nav navbar-top-links navbar-right">
	        <!-- /.dropdown -->
	        <li class="dropdown">
				<c:if test="${ empty logId }">
					<a href="/partnerBo/">
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
		                <li><a href="/partnerBo/mainLogOut.pomain"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
	                	상품관리<span class="fa arrow"></span>
	                </a>
	                <ul class="nav nav-second-level">
	                    <li>
	                        <a href="/partnerBo/goodsList.pogd">제품리스트</a>
	                    </li>
	                    <li>
	                        <a href="/partnerBo/goodsForm.pogd">제품등록</a>
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
	                        <a href="goodsIpgo.pogd">발주내역</a>
	                    </li>
	                </ul>
	            </li>
	            <li>
	                <a href="#">
	                	<i class="fa fa-folder-open-o"></i>
	                	<i class="fa fa-folder-o"></i> 
	                	정산<span class="fa arrow"></span>
	                </a>
	                <ul class="nav nav-second-level">
	                    <li>
	                        <a href="#">정산내역</a>
	                    </li>
	                    <li>
	                        <a href="orderList.pood">판매내역</a>
	                    </li>
	                </ul>
	            </li>
	        </ul>
	
	    </div>
	
	</nav>
	<!-- /. NAV SIDE  -->