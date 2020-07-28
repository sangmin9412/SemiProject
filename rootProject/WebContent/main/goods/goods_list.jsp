<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String pageCode = ""; %>
<%@ include file = "/include/head.jsp" %>
	<div id="wrap">
		<%@ include file = "/include/header.jsp" %>		
		<main id="container">
			<div class="sub-title">
				<div class="contain">
					<h2>${ bookCategory } <span class="num">(${ count })</span></h2>
				</div>
			</div>
			
			<div class="goods-area">
				<div class="card-list type2">
					<ul>
						<c:forEach items="${ list }" var="dto">
						<li class="item">
							<div class="thumb">
								<div class="img">
									<a href="goodsView.gd?bookNum=${ dto.bookNum }" style="background-color:#F7F7F7;">
										<div class="pos">
											<div class="tb">
												<div class="cell">
													<img src="${imagePath }/partnerBo/page/goods/upload/${ dto.bookImage }" alt="">
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
									<li class="tit">${ dto.bookName }</li>
									<li class="spec">
										<span>${ dto.bookAuthorName }</span>
									</li>
									<li class="price"><span class="cmp"><fmt:formatNumber value="${ dto.bookPrice }" type="number" /></span>원</li>
								</ul>
							</div>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<%@ include file = "/include/paging.jsp" %>
			
		</main>
		
<%@ include file = "/include/footer.jsp" %>