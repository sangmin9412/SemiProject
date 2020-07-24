<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String pageCode = "main"; %>
<%@ include file = "/include/head.jsp" %>
	<div id="wrap">
		<%@ include file = "/include/header.jsp" %>		
		<main id="container">
			<div class="sub-title">
				<div class="contain">
					<c:if test="${ empty logId }"><h2 style="text-align: center;">로그인</h2></c:if>
					<c:if test="${ !empty logId }"><h2>국내도서</h2></c:if>
				</div>
			</div>
			<c:if test="${ empty logId }">
			
			<style>
				.login-area {
					width: 460px;
					margin: 0 auto;
					padding: 30px 20px;
					border: 1px solid #ddd;
				}
				.login-area .input {
					width: 100%;
					height: 48px;
					padding: 7px 35px 10px 11px;
					border: 1px solid #ddd;
					background: #fff;
					box-sizing:border-box;
				}
				.login-area .form-group {
					margin-top: 8px;
				}
				.login-area .submit {
					width: 100%;
					height: 48px;
					margin: 12px 0 14px;
					background: #5b1eaa;
					border: 0;
					font-size: 16px;
					color:#fff;
				}
				.login-area label {
					
				}
				.login-area .checkbox {
					vertical-align: middle;
				}
			</style>
			
			<div class="login-area">
				<form action="#" method="post" name="frm" id="frm">
					<div class="inner">
						<div class="form-group">
							<input type="text" class="input" name="userId" id="" value="" placeholder="ID" />
						</div>
						<div class="form-group">
							<input type="password" class="input" name="userPw" id="" value="" placeholder="Password" />
						</div>
						<div class="form-group">
							<button type="button" class="submit">로그인</button>
						</div>
						<label for="ic1">아이디저장</label>
						<input type="checkbox" name="saveId" id="ic1" class="checkbox" value="" />
					</div>
				</form>
			</div>
			
			<script>
				$(function(){
					var form = $("#frm");
					var btn = $(".submit");
					var id = $("[name='userId']");
					var pw = $("[name='userPw']");
					
					btn.click(function(){
						if (id.val() === "") {
							alert('아이디를 입력하세요');
							id.focus();
							return false;
						}
						if (pw.val() === "") {
							alert('비밀번호를 입력하세요');
							pw.focus();
							return false;	
						}
						
						form.submit();
					});
				});
			</script>
			</c:if>
			<c:if test="${ !empty logId }">
			<div class="goods-area">
				<div class="card-list type2">
					<ul>
						<li class="item">
							<div class="thumb">
								<div class="img">
									<a href="javascript:goDetail('')" style="background-color:#F7F7F7;">
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
						<!-- -->
						<li class="item">
							<div class="thumb">
								<div class="img">
									<a href="javascript:goDetail('')" style="background-color:#F7F7F7;">
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
						<!-- -->
						<li class="item">
							<div class="thumb">
								<div class="img">
									<a href="javascript:goDetail('')" style="background-color:#F7F7F7;">
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
						<!-- -->
						<li class="item">
							<div class="thumb">
								<div class="img">
									<a href="javascript:goDetail('')" style="background-color:#F7F7F7;">
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
						<!-- -->
						<li class="item">
							<div class="thumb">
								<div class="img">
									<a href="javascript:goDetail('')" style="background-color:#F7F7F7;">
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
			</c:if>
			
		</main>
		
<%@ include file = "/include/footer.jsp" %>