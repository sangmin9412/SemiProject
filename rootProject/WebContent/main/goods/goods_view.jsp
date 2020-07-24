<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String pageCode = ""; %>
<%@ include file = "/include/head.jsp" %>
	<div id="wrap">
		<%@ include file = "/include/header.jsp" %>		
		<main id="container">
			
			<div id="view-info">
				<div class="contain">
					<div class="img-area">
						<div id="divDetBig">
							<ul>
								<li class="big-list active"><img src="http://image.kyobobook.co.kr/images/book/xlarge/721/x9788997924721.jpg" name="ImgDetBig" alt=""></li>
							</ul>
						</div>
					</div>
					<div class="view-summary">
						<div class="head">
							<div class="tit">책 이름</div>
						</div>
						<div class="con">
							<div class="row">
								<div class="v-table">
									<table>
										<colgroup>
											<col style="width:100px;">
											<col style="">
										</colgroup>
										<tbody>
											<tr class="pb16">
												<th scope="row">소비자가</th>
												<td>
													<span class="cmp">1,700</span>원
												</td>
											</tr>
											<tr class="tr_select pb16">
												<th scope="row">주문수량</th>
												<td>
													<div class="qty-wrap">
														<a href="javascript:onchangeQtyClick('StyleQty1',-1);" class="btn minus">-</a>
														<input type="text" name="Qty" id="StyleQty1" class="inorder_txt cmp" style="width:52px;" value="1" readonly="">
														<a href="javascript:onchangeQtyClick('StyleQty1',1)" class="btn plus">+</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								
								<div class="v-button">
									<a href="javascript:void(0);" class="btn btn02 btn-over black">주문하기</a>
								</div>
							</div>
							<div class="row">
								<div class="v-table">
									<table>
										<colgroup>
											<col style="width:100px;">
											<col style="">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">저자</th>
												<td><span class="p-code">저자이름</span></td>
											</tr>
											<tr>
												<th scope="row">배송안내</th>
												<td>택배(무료배송)</td>
											</tr>
											<tr>
												<th scope="row">결제방법</th>
												<td>주문 즉시</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		
		<script>
			function onchangeQtyClick(id,num){
				
				var y = Number($("#"+id+"").val()) + num;			
				if(y < 1) y = 1;
				$("#"+id+"").val(y);			
			}
		</script>
		
<%@ include file = "/include/footer.jsp" %>