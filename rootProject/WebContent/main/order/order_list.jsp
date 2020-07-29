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
				.order h4{margin:0 0 15px}
				.order h5{margin:0 0 15px}
				.order table.tbl_form{margin-bottom:15px}
				
				
				.section_order_mticket{position: relative;}
				
				.goods_option{ width:100%; padding-top:30px; border-top:1px solid #111; overflow:hidden; position:relative; margin-bottom:15px}
				
				.order_step{position:absolute; right:0; top:5px;}
				.order_step .list:after{content:''; display:block; clear:both;}
				.order_step li{position:relative; float:left; margin-right:20px; padding-right:28px; font-family:"Noto Sans KR"; font-size:14px; font-weight:400; line-height:20px; color:#aaa;}
				.order_step li:last-child{margin-right:0; padding-right:0;}
				.order_step li:after{content:''; position:absolute; right:0; top:50%; margin-top:-7px; display:block; width:8px; height:15px; background:url("https://www.itscard.co.kr/image/renewal2019/common/step_arr_off.png") 0 0 no-repeat;}
				.order_step li:last-child:after{display:none;}
				.order_step li.active:after{background:url("https://www.itscard.co.kr/image/renewal2019/common/step_arr_on.png") 0 0 no-repeat;}
				.order_step li.active{color:#5b1eaa;}
				.order_step li strong{font-family:inherit; font-weight:inherit;}
				
				.mypage-btn{display:inline-block; vertical-align:top; margin-left:6px; height:34px; padding:0 12px; border:1px solid #e0e0e0; font-family:"Nanum Barun Gothic"; font-size:12px; font-weight:400; line-height:34px; color:#666; box-sizing:border-box;}
				.mypage-btn.black{background:#444; border:1px solid #444; color:#fff;}
				.mypage-btn[data-disabled="on"]{background:#fafafa; border:1px solid #eee; color:#aaa;}
				.mypage-btn:first-child{margin-left:0;}
				.mypage-btn:not([data-disabled="on"]):not(.black):hover{color:#666;border:1px solid #999;}
				.mypage-btn.black:hover{border:1px solid #444; color:#fff;}
				.btn-block{margin-top:5px; font-size:0;}
				.btn-block:first-child{margin-top:0;}
				
				.checkbox{display:none;}
				.checkbox + label{position:relative; top:0; display:inline-block; vertical-align:top; margin:0; font-family:"Nanum Barun Gothic"; font-size:12px; color:#111;}
				.checkbox + label {font-size: 0;}
				.checkbox + label:before{content:''; position:relative; top:-1px; display:inline-block; vertical-align:middle; width:18px; height:18px; margin-right:5px; background:#fff; border:1px solid #bdbdbd; box-sizing:border-box;}
				.checkbox:checked + label:before{background:#fff url("https://www.itscard.co.kr/image/renewal2019/common/checkbox_purple.png") 50% 50% no-repeat; border-color:#591ea6;}
								
				/* table type 01 */
				.table-type-01 .table{width:100%; border-top:1px solid #eee; border-bottom:1px solid #eee; border-collapse:collapse;}
				.table-type-01 .table thead th{height:50px; vertical-align:middle; font-family:"Nanum Barun Gothic"; font-size:13px; font-weight:400; line-height:24px; text-align:center; color:#111; background:#fafafa;}
				.table-type-01 .table tbody td{padding:30px 0; vertical-align:middle; border-bottom:1px solid #eee; font-family:"Nanum Barun Gothic"; font-size:13px; font-weight:400; line-height:20px; text-align:center;}
				.table-type-01 .table .colspan{padding:16px 0;}
				.table-type-01 .table .vtc-t{vertical-align:top;}
				.table-type-01 .table .vtc-m{vertical-align:middle;}
				.table-type-01 .table .txt-l{text-align:left;}
				.table-type-01 .table .txt-c{text-align:center;}
				
				.my-goods-summary{
					display:-webkit-box;
					display:-ms-flexbox;
					display:flex;
					align-items:center;
					justify-content:center;
					-ms-flex-direction:row;
					flex-direction:row;
				}
				.my-goods-summary .thumb img{max-width:100%;}
				.my-goods-summary .mc-thumb{flex:0 0 214px; background:#fafafa;}
				.my-goods-summary .info{flex:1 0 auto; padding:0 10px 0 26px; text-align:left; letter-spacing:-0.025em; box-sizing:border-box;}
				.my-goods-summary .info .cate{margin-bottom:5px; font-family:"Noto Sans KR"; font-size:13px; font-weight:300; line-height:24px; color:#111;}
				.my-goods-summary .info .tit{font-family:"Noto Sans KR"; font-size:16px; font-weight:400; line-height:20px; color:#111;}
				.my-goods-summary .info .tit .cmp{display:inline-block; vertical-align:top; margin-top:3px;}
				.my-goods-summary .info .txt{margin-top:20px; font-family:"Noto Sans KR"; font-size:13px; font-weight:300; line-height:24px; color:#666;}
				.my-goods-summary .info .date{font-family:"Noto Sans KR"; font-size:13px; font-weight:300; line-height:24px; color:#111;}
				.my-goods-summary .info .date.end{color:#5b1eaa;}
				.my-price{font-family:"campton", "Nanum Barun Gothic"; font-size:13px; font-weight:400; line-height:20px; color:#111;}
				.my-order-price{font-family:"campton", "Nanum Barun Gothic"; font-size:13px; font-weight:400; line-height:20px; color:#591ea6;}
				.my-qty > span{display:block; font-family:"campton", "Nanum Barun Gothic"; font-size:13px; font-weight:400; line-height:20px; color:#111;}
				.my-qty .st{margin-right:2px; color:#666;}
				.strike{color:#ccc !important;}
				
				.sec-tit{margin:0; padding:5px 0 20px; font-family:"Noto Sans KR"; font-size:18px; font-weight:400; line-height:1; color:#111;}
				
				/* 세로형 */
				.ordernew_tbl2 { width:100%; border:0; border-right:1px solid #eee; border-top:1px solid #111; font-size:13px; font-weight:400; line-height:18px; color:#111; letter-spacing:-0.025em; border-collapse: separate;}
				.ordernew_tbl2 .bdb-0{border-bottom-color:transparent;}
				.ordernew_tbl2 th { vertical-align:top; color:#000; padding:16px 10px 16px 20px; border:0; border-left:1px solid #eee; border-bottom:1px solid #eee; font-family:"Nanum Barun Gothic"; font-weight:inherit; line-height:36px; text-align:left;}
				.ordernew_tbl2 td { padding:16px 20px; text-align:left; vertical-align:top; border:0; border-left:1px solid #eee; border-bottom:1px solid #eee; font-family:"Nanum Barun Gothic"; font-weight:inherit;}
				.ordernew_tbl2 td.tipbg { color:#e1b47b; line-height:19px}
				.ordernew_tbl2 td th, .ordernew_tbl2 td td {border:none;}
				.ordernew_tbl2 td.center { text-align:center}
				.ordernew_tbl2 td .bgm_area ul li { padding-bottom:5px}
				.ordernew_tbl2 .group{margin-right:-20px; padding-right:20px; margin-top:16px; padding-top:17px; border-top:1px dashed #ddd; font-size:0;}
				.ordernew_tbl2 .group.r0{margin-right:0; padding-right:0;}
				.ordernew_tbl2 .group:first-child{margin-top:0; padding-top:0; border-top:0;}
				.ordernew_tbl2 .group:after{content:''; display:block; clear:both;}
				.ordernew_tbl2 .group .col{float:left; min-width:288px; margin-left:60px;}
				.ordernew_tbl2 .group .col:first-child{margin-left:0;}
				.ordernew_tbl2 label{font-family:inherit;}
				.ordernew_tbl2 span.s1,
				.ordernew_tbl2 span.s2,
				.ordernew_tbl2 span.deceased-chk,
				.ordernew_tbl2 span.use-chk{display:inline-block; vertical-align:top; font-family:"Nanum Barun Gothic"; font-size:13px; font-weight:400; line-height:36px; color:#666; letter-spacing:-0.025em;}
				.ordernew_tbl2 .group .s1{width:68px;}
				.ordernew_tbl2 .group .s1.deceased-on{position:relative;}
				.ordernew_tbl2 .group .s1.deceased-on:before{content:'故'; position:absolute; right:5px; top:0; display:block; font-family:"Nanum Barun Gothic"; font-size:13px; font-weight:400; line-height:36px; color:#111;}
				.ordernew_tbl2 .group input,
				.ordernew_tbl2 .group select{vertical-align:top; margin-right:2px;}
				.ordernew_tbl2 .group .tit{font-family:"Nanum Barun Gothic"; font-size:13px; font-weight:400; line-height:36px; color:#111;}
				.ordernew_tbl2 .group .left{float:left; width:180px; font-family:"Nanum Barun Gothic"; font-size:13px; font-weight:400; line-height:36px; color:#111; box-sizing:border-box;}
				.ordernew_tbl2 .group .right{float:right; width:calc(100% - 180px); padding-left:20px; box-sizing:border-box;}
				.ordernew_tbl2.vertical th{vertical-align:middle; padding:12px 10px;}
				.ordernew_tbl2.vertical .th_col{background:#fafafa; padding:0; height:60px;}
				.ordernew_tbl2.vertical td{vertical-align:middle; padding:12px 10px; height:60px; box-sizing:border-box;}
				.ordernew_tbl2.vertical td td{height:auto;}
				.ordernew_tbl2.tc th,
				.ordernew_tbl2.tc td{text-align:center;}
				
				.y70 {
					display:block;
				    height: 70px;
				}
				
				.radio{display:none;}
				.radio + label{position:relative; top:0; display:inline-block; vertical-align:top; margin:0; margin-left:60px; font-family:"Nanum Barun Gothic"; line-height:35px; color:#111;}
				.radio + label:before{content:''; position:relative; top:-2px; display:inline-block; vertical-align:middle; margin-right:10px; width:18px; height:18px; border:1px solid #bdbdbd; background:#fff; border-radius:50%; box-sizing:border-box;}
				.radio:checked + label:before{background:#fff url("https://www.itscard.co.kr/image/renewal2019/common/redio_purple.png") 50% 50% no-repeat; border-color:#591ea6;}
				.radio + label span{position:relative; top:-1px; color:#111; font-family:inherit;}
				.radio + label.first{margin-left:0;}
				
				.btn-pack{display:inline-block; vertical-align:top; min-width:70px; height:36px; padding:0 12px; background-color:#fff; border:1px solid #ddd; font-family:"Nanum Barun Gothic"; font-size:13px; font-weight:400; line-height:36px; color:#111; text-align:center; box-sizing:border-box;}
				.btn-pack.dark{background-color:#444; border-color:#444; color:#fff}
				.btn-pack.purple{background-color:#591ea6; border-color:#591ea6; color:#fff;}
				
				.total-price{font-family:"Noto Sans KR"; font-size:18px; font-weight:400; line-height:32px; color:#591ea6;}
				
			</style>
			
			<div class="order">
				<form action="#" name="frm" method="post">
					<div class="section_order_mticket">
						<h3>주문내역</h3>
						<div class="table-type-01">
                            <table class="table">
                                <colgroup>
                                    <col style="width:">
                                    <col style="width: 120px">
                                    <col style="width: 120px">
                                    <col style="width: 120px">
                                    <col style="width: 120px">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">상품정보</th>
                                        <th scope="col">상품금액</th>
                                        <th scope="col">수량</th>
                                        <th scope="col">주문금액</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${ orderList }" var="goodsList" varStatus="cnt">
                                    <tr style="border-bottom: 1px dotted #cdcdcd">
                                    	<input type="hidden" name="bookNum" value="${ goodsList.bookNum }" />
                                        <td class="product_photo">
                                            <div class="my-goods-summary">
                                                <div class="info">
                                                    <div class="tit">${ goodsList.bookName }</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="consumer_price">
											 <div class="my-price"><fmt:formatNumber value="${ goodsList.bookPrice }" type="number" />원</div>
                                        </td>
                                        <td class="my-qty">
                                            <span>${ goodsList.orderQty }권</span>
                                        </td>
                                        <td class="amount">
                                            <div class="my-order-price"><fmt:formatNumber value="${ goodsList.bookPrice * goodsList.orderQty }" type="number" />원</div>
                                        </td>
                                        <td>
                                        	<a href="#" class="btn-pack">취소</a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        
						<div class="buttons tc">
							<!-- <a href="/script/card/list_sp.asp" class="btn btn01 btn-over purple">쇼핑계속하기</a> -->
							<!-- <a href="javascript:void(0)" class="btn btn02 btn-over purple" onclick="submitFunc()">결제하기</a> -->
						</div>
					</div>
				</form>
			</div>
			
		</main>
		
<%@ include file = "/include/footer.jsp" %>