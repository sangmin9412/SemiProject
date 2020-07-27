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
			
			
			<%@ include file = "/include/paging.jsp" %>
			
		</main>
		
<%@ include file = "/include/footer.jsp" %>