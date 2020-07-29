<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String pageCode = ""; %>
<%@ include file = "/include/head.jsp" %>
	<div id="wrap">
		<%@ include file = "/include/header.jsp" %>		
		<main id="container">
			
			<style>
				.order { width:1140px; margin:0 auto; overflow:hidden; }
				
				.order{position:relative;}
				.order h3{padding-bottom:30px; margin-bottom:0; font-family:"Noto Sans KR"; font-size:30px; font-weight:400; line-height:1.1; color:#111; letter-spacing:-0.025em;}
				
				.btn-pack{display:inline-block; vertical-align:top; min-width:70px; height:36px; padding:0 12px; background-color:#fff; border:1px solid #ddd; font-family:"Nanum Barun Gothic"; font-size:13px; font-weight:400; line-height:36px; color:#111; text-align:center; box-sizing:border-box;}
				.btn-pack.dark{background-color:#444; border-color:#444; color:#fff}
				.btn-pack.purple{background-color:#591ea6; border-color:#591ea6; color:#fff;}
				
				
				.order-complete {
					display:flex;
					justify-content:center;
					align-items:center;
					height: 400px;
					border: 1px solid #ddd;	
				}
				
				.order-complete h4 {
					font-size: 20px;
				}
				
			</style>
			
			<div class="order">
				<form action="#" name="frm" method="post">
					<div class="section_order_mticket">
						<h3>주문완료</h3>
						
                        <div class="order-complete">
                        	<h4>정상적으로 주문이 완료되었습니다.</h4>
                        </div>
                        
						<div class="buttons tc">
							<a href="/main.main" class="btn btn02 btn-over purple">메인으로</a>
						</div>
					</div>
				</form>
			</div>
			
		</main>
		
<%@ include file = "/include/footer.jsp" %>