<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String pageCode = ""; %>
<%@ include file = "/include/head.jsp" %>
	<div id="wrap">
		<%@ include file = "/include/header.jsp" %>		
		<main id="container">
			<div class="sub-title">
				<div class="contain">
					<h2>국내도서 <span class="num">(0)</span></h2>
				</div>
			</div>
			
			<div class="goods-area">
				<div class="card-list type2">
					<ul>
						<li class="item">
							<div class="thumb">
								<div class="img">
									<a href="goodsView.gd?bookNum=" style="background-color:#F7F7F7;">
										<div class="pos">
											<div class="tb">
												<div class="cell">
													<img src="http://image.kyobobook.co.kr/images/book/large/721/l9788997924721.jpg" alt="">
												</div>
											</div>
										</div>
									</a>
								</div>											
								<div class="over">
									<a href="javascript:void(0);" onclick="getGalleryPop('');" class="zoom">확대보기</a>
									<a href="javascript:void(0);" onclick="" class="cart">장바구니</a>
								</div>
							</div>
							<div class="info">
								<ul>
									<li class="tit">책이름</li>
									<li class="spec">
										<span>저자이름</span>
									</li>
									<li class="price"><span class="cmp">10,000</span>원</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div>
			
		</main>
		
<%@ include file = "/include/footer.jsp" %>