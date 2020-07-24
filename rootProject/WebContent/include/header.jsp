<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header id="header2">
	<div class="global">
		<div class="contain">
			<div class="events">
				<a href="#" class="event active">이벤트</a>
				<a href="#">회원혜택</a>
			</div>
			<div class="util">
				<ul>
					<li><a href="/script/membership/logout.asp">로그아웃</a></li>
					<li><a href="/script/membership/login.asp">로그인</a></li>
					<li><a href="/script/mypage/memberedit.asp">정보수정</a></li>
					<li><a href="/script/membership/memberRegStep1.asp">회원가입</a></li>
					<li><a href="/script/mypage/">마이페이지</a></li>
					<li class="cs"><a href="/script/cscenter/faq.asp">고객센터</a>
						<div class="csmenu">
							<ul>
								<li><a href="#">자주묻는 질문</a></li>
								<li><a href="#">1:1 문의</a></li>
								<li><a href="#">공지사항</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="gnb-wrap">
		<div class="contain">
			<h1 class="logo"><a href="/">그냥 서점</a></h1>
			<div id="gnb2">
				<ul>
					<li class="m1"><a href="/goods/goodsList.gd">국내도서</a></li>
					<li class="m2"><a href="#">메뉴 02</a>
						<div class="submenu">
							<ul>
								<li><a href="#">서브 메뉴</a></li>
								<li><a href="#">서브 메뉴</a></li>
								<li><a href="#">서브 메뉴</a></li>
							</ul>
						</div>
					</li>
					<li class="m3"><a href="#">메뉴 03</a></li>
					<li class="m4"><a href="#">메뉴 04</a>
						<div class="submenu">
							<ul>
								<li><a href="#">서브 메뉴</a></li>
								<li><a href="#">서브 메뉴</a></li>
								<li><a href="#">서브 메뉴</a></li>
							</ul>
						</div>
					</li>
					<li class="m5"><a href="#">메뉴 05</a></li>
					<li class="m6"><a href="#">메뉴 06</a>
						<div class="submenu">
							<ul>
								<li><a href="#">서브 메뉴</a></li>
								<li><a href="#">서브 메뉴</a></li>
								<li><a href="#">서브 메뉴</a></li>
							</ul>
						</div>
					</li>
					<li class="m7"><a href="#">1:1 문의</a></li>
					<li class="m8"><a href="#">구매후기</a></li>
				</ul>
			</div>
			<div class="search-btn">
				<a href="javascript:void(0);" class="search-open"><img src="/static/image/renewal2019/common/header_search_01.png" alt="검색버튼"></a>
				<a href="javascript:void(0);" class="search-close"><img src="/static/image/renewal2019/common/header_close.png" alt="검색닫기"></a>
			</div>
			<div class="menu-btn">
				<a href="javascript:void(0);" class="menu-open"><img src="/static/image/renewal2019/common/header_bar.png" alt="메뉴버튼"></a>
				<a href="javascript:void(0);" class="menu-close"><img src="/static/image/renewal2019/common/header_close.png" alt="메뉴닫기"></a>
			</div>
		</div>
	</div>

	<div class="head-menu">
		<div class="contain">
			<div class="head-menu-list">
				<ul>
					<li class="m1">
						<div class="box">
							<div class="category">메뉴 01</div>
							<ul>
								<li><a href="#">서브 메뉴</a></li>
								<li><a href="#">서브 메뉴</a></li>
								<li><a href="#">서브 메뉴</a></li>
								<li><a href="#">서브 메뉴</a></li>
							</ul>
						</div>
						<div class="sort">
							<ul>
								<li><a href="#">서브 메뉴</a></li>
								<li><a href="#">서브 메뉴</a></li>
							</ul>
						</div>
					</li>
					<li class="m2">
						<div class="box">
							<div class="category">메뉴 02-1</div>
							<ul>
								<li><a href="#">서브 메뉴</a></li>
								<li><a href="#">서브 메뉴</a></li>
								<li><a href="#">서브 메뉴</a></li>
							</ul>
						</div>
						<div class="box">
							<div class="category">메뉴 02-2</div>
							<ul>
								<li><a href="#">서브 메뉴</a></li>
							</ul>
						</div>
					</li>
					<li class="m3">
						<div class="box">
							<div class="category">메뉴 03-1</div>
							<ul>
								<li><a href="#">서브 메뉴</a></li>
								<li><a href="#">서브 메뉴</a></li>
								<li><a href="#">서브 메뉴</a></li>
							</ul>
						</div>
						<div class="box">
							<div class="category">메뉴 03-2</div>
							<ul>
								<li><a href="#">서브 메뉴</a></li>
							</ul>
						</div>
					</li>
					<li class="m4">
						<div class="box">
							<div class="category">메뉴 04</div>
							<ul>
								<li><a href="#">서브 메뉴</a></li>
								<li><a href="#">서브 메뉴</a></li>
								<li><a href="#">서브 메뉴</a></li>
							</ul>
						</div>
					</li>
					<li class="m5">
						<div class="box">
							<div class="category">메뉴 05</div>
							<ul>
								<li><a href="#">서브 메뉴</a></li>
								<li><a href="#">서브 메뉴</a></li>
								<li><a href="#">서브 메뉴</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="head-search">
		<form name="frmTopSearch" method="get" action="/script/card/Search.asp">
			<div class="search-group">
				<input type="text" name="searchKeyword" id="searchKeyword" class="input" placeholder="검색어를 입력해주세요" value="">
				<input type="hidden" name="grid" value="4" />
				<button class="submit">검색</button>
			</div>
			<div class="hash">
				<dl>
					<dt>추천검색어</dt>
					<dd>
						<a href="javascript:goSearch('')">#국내도서</a>
						<a href="javascript:goSearch('')">#외국도서</a>
						<a href="javascript:goSearch('')">#소설</a>
					</dd>
				</dl>
			</div>
		</form>
	</div>
</header>
<script>
	$(document).ready(function(){
		$("#gnb2").gnb({ d1: 0 });
	});
</script>