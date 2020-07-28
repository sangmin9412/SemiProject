<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String pageCode = ""; %>
<%@ include file = "/include/head.jsp" %>
	<div id="wrap">
		<%@ include file = "/include/header.jsp" %>		
		<main id="container">
			<div class="sub-title">
				<div class="contain">
					<h2>이벤트 <span class="num">(${ count })</span></h2>
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
				
				.buttons{max-width:1140px; margin:0 auto;}
				.buttons:after {content:" "; display:block; clear:both;}
				.buttons .cen {text-align:center;}
				.buttons .cen .btn-pack {margin:0 2px;}
				.buttons .fr {float:right;}
				.buttons .fl {float:left;}
				.buttons a {text-decoration:none;}
				.buttons a,.buttons input {vertical-align:top;}
									
				
				.btn-pack {display:inline-block;overflow:visible;position:relative;margin:0;padding:0 10px;font-family:"Noto Sans KR";background:#fff;color:#4d4d4d;border:1px solid #ddd;text-align:center;text-decoration:none !important;vertical-align:top;white-space:nowrap;cursor:pointer;outline:0;box-sizing:border-box; -webkit-box-sizing:border-box; -moz-box-sizing:border-box;}
				.btn-pack.focus {background:#f68220; border:1px solid #f68220; color:#fff;}
				.btn-pack.dark {background:#868686; border:1px solid #868686;  color:#fff;}
				.btn-pack.medium {height:36px;padding:0 12px;line-height:34px;font-size:14px;}
			</style>
			
			<div class="board-view">
				<div class="head">
					<h3 class="tit">${ eventList.boardSubject }</h3>
					<div class="info">
						<span class="date" style="margin-left: 0; padding-left: 0; border-left: 0;">시작일 : <fmt:formatDate value="${ eventList.startDate }" pattern="yyyy-MM-dd" /></span>
						<span class="date">마감일 : <fmt:formatDate value="${ eventList.endDate }" pattern="yyyy-MM-dd" /></span>
						<span class="hit"><strong>조회수</strong> ${ eventList.readCount + 1 }</span>
					</div>
				</div>
				<div class="body">
					${fn:replace(eventList.boardContent,cn,br)}
					<br>
					<img src="/backoffice/page/cscenter/eventupload/${ eventList.storeFileName }" alt="" />
				</div>
			</div>
			
		</main>
		
<%@ include file = "/include/footer.jsp" %>