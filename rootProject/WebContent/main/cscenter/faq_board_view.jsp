<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String pageCode = ""; %>
<%@ include file = "/include/head.jsp" %>
	<div id="wrap">
		<%@ include file = "/include/header.jsp" %>		
		<main id="container">
			<div class="sub-title">
				<div class="contain">
					<h2>자주묻는질문 <span class="num">(${ count })</span></h2>
				</div>
			</div>
			
			<style>
				/* 상세보기 */
				.board-view {max-width:1140px; margin:0 auto;}
				.board-view .head {border-top:1px solid #898989;}
				.board-view .head .tit {color:#333; font-family: 'Noto Sans KR'; font-size:16px; font-weight:500; line-height:1.3em; padding:13px 15px; background:#f7f7f7; border-bottom:1px solid #ddd;}
				.board-view .head .info {*zoom:1; padding:13px 15px; color:#767676; font-size:15px; line-height:normal; border-bottom:1px solid #ddd;}
				.board-view .head .info:after {content:" "; display:block; clear:both;}
				.board-view .head .info .name {font-family: 'Noto Sans KR'; float:left;}
				.board-view .head .info .date {font-family: 'Noto Sans KR'; float:left; border-left:1px solid #dedede; padding-left:10px; margin-left:10px;}
				.board-view .head .info .hit {font-family: 'Noto Sans KR'; float:right;}
				.board-view .head .info .hit strong {margin-right:5px;}
				.board-view .head .info strong {font-family: 'Noto Sans KR'; color:#333; font-weight:400;}
				.board-view .body {padding:20px 15px; border-bottom:1px solid #ddd;}
				.board-view .body img {/* width:auto !important; */ height:auto !important; max-width:100%;}

			</style>
			
			<div class="board-view">
				<div class="head">
					<h3 class="tit">${ faqList.boardSubject }</h3>
					<div class="info">
						<!-- <span class="name"><strong>${ noticeList.boardName }</strong></span> -->
						<span class="date" style="margin-left: 0; padding-left: 0; border-left: 0;">${ faqList.boardDate }</span>
						<span class="hit"><strong>조회수</strong> ${ faqList.readCount + 1 }</span>
					</div>
				</div>
				<div class="body">${fn:replace(faqList.boardContent,cn,br)}</div>
			</div>
			
		</main>
		
<%@ include file = "/include/footer.jsp" %>