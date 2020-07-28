<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String pageCode = ""; %>
<%@ include file = "/include/head.jsp" %>
	<div id="wrap">
		<%@ include file = "/include/header.jsp" %>		
		<main id="container">
			<div class="sub-title">
				<div class="contain">
					<h2>1:1문의</h2>
				</div>
			</div>
			
			<style>
				/* 검색 */
				.board-search {*zoom:1; max-width:1140px; margin:0 auto 10px;}
				.board-search:after {content:" "; display:block; clear:both;}
				.board-search .total-page {float:left; margin-top:10px; font-size:14px; line-height:20px; color:#555;}
				.board-search .search {float:right;}
				.board-search .select {width:120px; background:#fafafa;}
				.board-search .input {width:200px;}
				.board-search .btn-pack {height:35px !important;padding:0 17px !important;line-height:33px !important;font-size:15px !important;color:#fff;background:#555 !important; border:1px solid #555;}
				
				/* 리스트 */
				.board-list {max-width:1140px; margin:0 auto;}
				.board-list table {width:100%; border-collapse:collapse; border-spacing:0px; border-top:1px solid #898989;}
				.board-list table thead th {height:45px; border-bottom:1px solid #ddd; color:#454545; font-family: 'Noto Sans KR'; font-size:15px; font-weight:500; text-align: center; background:#f5f5f5;}
				.board-list table tbody td {padding:12px 0; border-bottom:1px solid #ddd; text-align:center; font-family: 'Noto Sans KR'; font-size:15px; line-height:20px; color:#747474;}
				.board-list table tbody td.subject {text-align:left; padding-left:15px;}
				.board-list table tbody td img {vertical-align:middle;}
				.board-list table tbody td a {text-decoration:none; color:inherit;}
				.board-list table tbody tr:hover td {background-color:#fafafa;}
				.board-list .label {display:inline-block;zoom:1;*display:inline;color:#fff;background:#ff6000;font-weight:500;padding:0 6px;font-size:11px;line-height:20px;border-radius:2px;}
				.board-list .comment {color:#ff6000;font-family:Tahoma;font-size:11px;}
				.board-list .thumb {text-align:left;}
				.board-list .thumb img {margin-right:8px;}
				
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
				
				#answerFormDiv{display:none; max-width:1140px; margin:50px auto 0;}
								
			</style>
			
			<!-- 
			<div class="board-search"> 
				<div class="total-page">페이지정보 : 1 / 1 </div> 
			    <div class="search">
			        <form name="form1" method="get" action="/sub/support1.php"> 
					<input type="hidden" name="boardid" value="notice">
					<input type="hidden" name="category" value="">
			        	<label for="bbsOption" class="hide">검색옵션</label>
			            <select name="sw" id="bbsOption" class="select">
			              <option value="a">전체</option>
						  <option value="s">제목</option>
						  <option value="c">내용</option>
						  <option value="n">작성자</option>
			            </select>
			            <label for="keyword" class="hide">search_word</label>
			        	<input type="text" name="sk" id="keyword" value="" class="input" title="검색어"> 
						<button type="submit" class="btn btn-pack">검색</button>
			        </form>
			    </div>
			</div>
			 -->
			
			<div class="board-list">
				<table>
					<caption>1:1문의 목록</caption>
					<colgroup>
						<col width="85">
						<col>
						<col width="110">
						<col width="130">
						<col width="90">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">등록일</th>
							<th scope="col">조회</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${ empty answerList }">
						<tr>	
							<td colspan="9" style="padding:30px 0; text-align:center;">등록된 글이 없습니다.</td>
						</tr>
						</c:if>
						
						<c:if test="${ !empty answerList }">
						<c:forEach items="${ answerList }" var="dto" varStatus="cnt">
					    <tr>
							<td scope="row">${ ((page-1) * limit) + cnt.count }</td>
							<td class="subject">&nbsp;
							<a href="answerView.ab?boardNum=${ dto.boardNum }" >${ dto.boardSubject }</a></td>
							<td class="name">${ dto.boardName }</td>
							<td class="date"><fmt:formatDate value="${ dto.boardDate }" pattern="yyyy-MM-dd "/></td>
							<td class="hit">${ dto.readCount }</td>
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			
			<div id="answerFormDiv"></div>
			
			<div class="buttons">
				<div class="fr">
					<a href="javascript:void(0)" class="btn-pack medium" id="answerFormBtn">글쓰기</a>
				</div>
			</div>
			
			<%@ include file = "/include/paging.jsp" %>
			
		</main>
		
		<script>
			$(function(){
				$("#answerFormBtn").click(function(){
					$.ajax({
						type: 'post',
						url: '/main/cscenter/answer_board_form.jsp',
						success: function(data) {
							$("#answerFormDiv").show();
							$("#answerFormDiv").empty();
							$("#answerFormDiv").html(data);
						},
						error: function(e) {
							console.log("error", e);
						}
					});
					return false;
				});
			});
			
			/*
			function answerFormSubmitFunc() {
				var form = $("#answerForm")[0];
				console.log(form);
				
				var data = new FormData(form);
				console.log(data);
				
				$.ajax({
					type: 'post',
					enctype: 'multipart/form-data',
					url: 'answerFormPro.ab',
					data: data,
					processData: false,
		            contentType: false,
					success: function(data) {
						console.log("success");
					},
					error: function(e) {
						console.log("error", e);
					}
				});	
			}
			*/
		</script>
		
<%@ include file = "/include/footer.jsp" %>