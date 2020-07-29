<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String pageCode = ""; %>
<%@ include file = "/include/head.jsp" %>
	<div id="wrap">
		<%@ include file = "/include/header.jsp" %>		
		<main id="container">
			
			<style>
				.mypagearea { width:1140px; margin:0 auto; overflow:hidden; }
				#lnb { width:1140px; margin:0 auto; position:relative; padding:0 0 60px; overflow:hidden;}
				#lnb h2 { float:left; border:6px solid #5b1eaa; width:216px; height:135px; text-align:center; line-height:135px; font-weight:600;font-size:12px;}
				#lnb .cs_menu { width:800px; float:right}
				#lnb .cs_menu ul { display:inline-block; }
				#lnb .cs_menu ul li { float:left; width:196px; height:45px; text-align:center; line-height:45px; padding:0 0 5px 3px}
				#lnb .cs_menu ul li a { display:block; font-size:11px; color:#666; border:1px solid #ddd; background:#fff}
				#lnb .cs_menu ul li a:hover { color:#fff; border:1px solid #5b1eaa; background:#5b1eaa; font-weight:bold }
				#lnb .cs_menu ul li a.on { color:#fff; border:1px solid #5b1eaa; background:#5b1eaa; font-weight:bold }
				
				.mypagearea h4 {padding-bottom:20px; margin-bottom:0; font-family:"Noto Sans KR"; font-size:30px; font-weight:400; line-height:1.1; color:#111; letter-spacing:-0.025em;}
				
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
									
				
			</style>
			
			<div class="mypagearea">
				<div id="lnb">
					<h2>${ logId },  님</h2>
					<div class="cs_menu">
						<ul>
							<li><a href="memberMyPage.mem">장바구니</a></li>
							<li><a href="/cscenter/answerList.ab" class="">1:1 문의</a></li>
							<li><a href="memberModify.mem" class="">정보수정</a></li>
							<li><a href="/order/orderList.od" class="">주문내역</a></li>
						</ul>
					</div>
				</div>
				<form action="#" name="frm" method="post">
					<div class="section_order_mticket">
						<h4>장바구니</h4>
						<div class="order_step">
							<ol class="list">
								<li class="step1 active"><strong>01. 장바구니</strong></li>
								<li class="step2">02. 주문서작성</li>
								<li class="step3">03. 주문완료</li>
							</ol>
						</div>
						<div class="goods_option">
							<div class="left-area">
								<a href="javascript:void(0);" class="mypage-btn goods-option-btn" id="allbox">전체선택</a>
								<a href="javascript:void(0);" class="mypage-btn goods-option-btn" id="clearbox" data-disabled="">선택해제</a>
								<a href="javascript:void(0);" class="mypage-btn goods-option-btn" onclick="submitFunc('MemberCartRemove.mem')" data-disabled="">삭제</a>
							</div>
						</div>
						<div class="order_info_entered">
							<div class="table-type-01">
								<table class="table">
									<colgroup>
										<col style="width: 50px">
										<col style="width: ">
										<col style="width: 140px">
										<col style="width: 120px">
										<col style="width: 140px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" class="first-child">
												
											</th>
											<th scope="col">상품이미지/상품번호</th>
											<th scope="col">판매가격</th>
											<th scope="col">수량</th>
											<th scope="col" class="last-child">주문금액</th>
										</tr>
									</thead>
									
									<c:forEach items="${ cartList }" var="dto">
									<tbody>
									<input type="hidden" name="bookCount" value="${dto.bookCount }">
										<tr>
											<td class="vtc-t">
												<span>
													<input name="IsChoice" class="checkbox" id="IsChoice${ dto.cartNum }" type="checkbox" value="${ dto.cartNum }" checked="">
													
													<label for="IsChoice${ dto.cartNum }" class="fz0">선택</label>
												</span>
											</td>
											<td class="product_photo">
												<div class="my-goods-summary">
													<div class="thumb sp-thumb">
														<img src="${imagePath }/partnerBo/page/goods/upload/${ dto.bookImage }" name="bookImage" alt="" width="160">
													</div>
													<div class="info">
														<div class="cate">[카테고리명]</div>
														<div class="tit" name="bookName">${ dto.bookName }</div>
													</div>
												</div>
											</td>
											<td><div class="my-price" name="bookPrice">${ dto.bookPrice }원</div></td>
											<td style="font-size: 11px;">
												<div class="btn-block">
													<div class="qty-wrap">
														<a href="javascript:void(0);" class="btn minus" onclick="qtyMinus(${dto.bookNum}, ${dto.bookQty})">-</a>
														<input type="text" name="Qty" id="StyleQty1" class="inorder_txt cmp" style="width:52px;" value="${ dto.bookQty }" readonly="">
														<a href="javascript:void(0);" class="btn plus" onclick="qtyPlus(${dto.bookNum}, ${dto.bookQty})">+</a>
													</div>
												</div>
											</td>
											<td>
												<div class="my-order-price" name="totalPrice">${dto.totalPrice}원</div>
											</td>
										</tr>
									</tbody>
									</c:forEach>
								</table>
							</div>
							
							<div class="buttons tc">
								<a href="javascript:void(0)" class="btn btn02 btn-over purple" onclick="">상품주문하기</a>
							</div>
						</div>
					</div>
				</form>
			</div>
			
		</main>
		
		<script>
		function submitFunc(url) {
			$("[name='frm']").attr('action', url);
			$("[name='frm']").submit();
		}
		
		function qtyPlus(bookNum, qty) {
			location.href = '/mem/memberCartAdd.mem?bookNum='+bookNum+'&Qty='+qty+'';
		}
		
		function qtyMinus(bookNum, qty) {
			if (qty <= 1) {
				qty = 1;
			}
			location.href = '/mem/MemberCartQtyDown.mem?bookNum='+bookNum+'&Qty='+qty+'';
		}
		
		function CartZzimSelcetAll (allbox, clearbox, target, cb) {
		    var $all = $(allbox);
		    var $clear = $(clearbox);
		    var $target = $("[name='"+target+"']");
		    var cbCheck = (cb) ? (cbCheck = true) : (cbCheck = false);

		    // allboxFn
		    $all.click(function(e){
		        var chkvalue = true;

		        if($target.length > 0){
		            for (var i = 0; i < $target.length; i++) { 
		                $target[i].checked = chkvalue; 
		            }
		            isCheckbox(target, cartListCheckFunc);
		        }
		        e.preventDefault();

		        (cbCheck) ? cb($target) : null;
		    });

		    // clearFn
		    $clear.click(function(e){
		        var chkvalue = false;

		        if($target.length > 0){
		            for (var i = 0; i < $target.length; i++) { 
		                $target[i].checked = chkvalue; 
		            }
		            isCheckbox(target, cartListCheckFunc);
		        }
		        e.preventDefault();

		        (cbCheck) ? cb($target) : null;
		    });

		    // targetFn
		    $target.change(function(){
		        isCheckbox(target, cartListCheckFunc);
		        (cbCheck) ? cb($target) : null;
		    });
		}

		// 샘플카트, 찜리스트 체크박스 선택여부
		function isCheckbox(fName, cb) {
			var chkBox = document.querySelectorAll("[name='"+fName+"']");
		    var chk;
		    var i;

		    if (chkBox.length > 0) {
		        for(i=0; i<chkBox.length; i++){
		            if(chkBox[i].checked === true){
		                chk = true;
		            }
		        }

		        cb(chk);
		    }
		}

		// 샘플카트, 찜리스트 체크박스 Func
		function cartListCheckFunc(val) {
			var obj = document.querySelectorAll('.goods-option-btn');
			var toggle;

			(val) ? toggle = 'off' : toggle = 'on';

			for (var i=0; i<obj.length; i++) {
				if(obj[i].attributes['data-disabled']){
					obj[i].setAttribute('data-disabled', toggle);
				}
			}
		}
		
		$(document).ready(function(){
			CartZzimSelcetAll("#allbox", "#clearbox", "IsChoice");
		});
		
		function onchangeQtyClick(id,num){
			var y = Number($("#"+id+"").val()) + num;		
			if(y < 1) y = 1;
			$("#"+id+"").val(y);
		}
		</script>
		
<%@ include file = "/include/footer.jsp" %>