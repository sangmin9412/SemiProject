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
				<form action="orderWrite.od" name="frm" method="post">
					<div class="section_order_mticket">
						<h3>주문서작성</h3>
						<div class="order_step">
							<ol class="list">
								<li class="step1"><strong>01. 장바구니</strong></li>
								<li class="step2 active">02. 주문서작성</li>
								<li class="step3">03. 주문완료</li>
							</ol>
						</div>
						<div class="table-type-01">
                            <table class="table">
                                <colgroup>
                                    <col style="width:">
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
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${ goodsList }" var="gList" varStatus="cnt">
                                    <tr style="border-bottom: 1px dotted #cdcdcd">
                                    	<input type="hidden" name="bookName" value="${ gList.bookName }" />
                                    	<input type="hidden" name="bookNum" value="${ gList.bookNum }" />
                                    	<input type="hidden" name="bookCount" value="${ gList.bookCount }" />
                                    	<input type="hidden" name="partnerName" value="${ gList.partnerName }" />
                                    	<input type="hidden" name="bookPrice" value="${ gList.bookPrice }" />
                                    	<input type="hidden" name="orderQty" value="${ qty }" />
                                        <td class="product_photo">
                                            <div class="my-goods-summary">
                                                <div class="thumb sp-thumb">
                                                    <img src="${ imagePath }/partnerBo/page/goods/upload/${ gList.bookImage }" alt="" width="160">
                                                </div>
                                                <div class="info">
                                                    <div class="cate">[${ gList.bookCategory }]</div>
                                                    <div class="tit">${ gList.bookName }</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="consumer_price">
											 <div class="my-price"><fmt:formatNumber value="${ gList.bookPrice }" type="number" />원</div>
                                        </td>
                                        <td class="my-qty">
                                            <span>${ qty }권</span>
                                        </td>
                                        <td class="amount">
                                            <div class="my-order-price"><fmt:formatNumber value="${ gList.bookPrice * qty }" type="number" />원</div>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    <tr style="border-bottom: 1px dotted #cdcdcd">
                                    	<input type="hidden" name="bookName" value="유튜버들" />
                                    	<input type="hidden" name="bookNum" value="20" />
                                    	<input type="hidden" name="bookCount" value="20" />
                                    	<input type="hidden" name="partnerName" value="에스프레소Test" />
                                    	<input type="hidden" name="bookPrice" value="16000" />
                                    	<input type="hidden" name="orderQty" value="3" />
                                        <td class="product_photo">
                                            <div class="my-goods-summary">
                                                <div class="thumb sp-thumb">
                                                    <img src="${ imagePath }/partnerBo/page/goods/upload/youtube.jpg" alt="" width="160">
                                                </div>
                                                <div class="info">
                                                    <div class="cate">[경제/경영]</div>
                                                    <div class="tit">유튜버들</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="consumer_price">
											 <div class="my-price"><fmt:formatNumber value="16000" type="number" />원</div>
                                        </td>
                                        <td class="my-qty">
                                            <span>3권</span>
                                        </td>
                                        <td class="amount">
                                            <div class="my-order-price"><fmt:formatNumber value="${ 16000 * 3 }" type="number" />원</div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <span class="y70">&nbsp;</span>
                        <div>
                            <div class="sec-tit">주문자 정보</div>
                            <table class="ordernew_tbl2">
                                <colgroup>
                                    <col style="width: 150px;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">주문자명 </th>
                                        <td class="yorn">
                                            <input type="text" name="userName" class="inorder_txt" style="width: 125px;" maxlength="10" value="${ memberList.userName }">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">휴대전화 </th>
                                        <td>
                                            <div class="tel_space">
                                                <input type="text" maxlength="13" class="inorder_txt" value="${ memberList.userPh1 }" style="width: 270px;" readonly>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">이메일 </th>
                                        <td>
                                            <input type="text" name="userEmail" class="inorder_txt" style="width: 222px;" maxlength="30" value="${ memberList.userEmail }">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <span class="y70">&nbsp;</span>
                        <div>
                            <div class="sec-tit">배송정보</div>
                            <table class="ordernew_tbl2">
                                <colgroup>
                                    <col style="width: 150px;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">받는사람</th>
                                        <td class="yorn">
                                            <input type="text" class="inorder_txt" style="width: 125px;" maxlength="10" value="${ memberList.userName }">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">배송주소 </th>
                                        <td>
                                            <div class="tb-cont-20">
                                                <div class="tel-input">
                                                    <input type="text" name="zip" class="inorder_txt" maxlength="5" title="우편번호" value="" readonly="">
                                                    <a href="javascript:void(0);" class="btn-pack purple first" onclick="openZipSearch()">우편번호 검색</a>
                                                    
                                                    <div class="email-area" style="padding-top: 5px;">
                                                        <input type="text" name="addr1" class="inorder_txt" title="주소" value="" maxlength="50" style="text-align: left; width: 565px" readonly="">
                                                    </div>
                                                    <div class="email-area" style="padding-top: 5px;">
                                                        <input type="text" name="addr2" class="inorder_txt" title="주소" value="" maxlength="50" style="text-align: left; width: 565px">
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">휴대전화 </th>
                                        <td>
                                            <div class="tel_space">
                                            	<input type="text" name="userPh1" maxlength="13" class="inorder_txt" value="${ memberList.userPh1 }" style="width: 270px;">
                                            </div>
                                        </td>
                                    </tr>
                                    <!-- 
                                    <tr>
                                        <th scope="row">배송시 유의사항</th>
                                        <td class="pr20">
                                            <p class="agreement_privacy_pol">
                                                <input type="radio" name="mydelmemo" value="N" id="chk_delmemo1" class="inorder_txt radio" onclick="ini.EtcMemo.value = '부재시 경비실에 맡겨주세요';">
                                                <label for="chk_delmemo1" class="first">
                                                    <span>부재시 경비실에 맡겨주세요</span>
                                                </label>
                                                <input type="radio" name="mydelmemo" value="N" id="chk_delmemo2" class="inorder_txt radio" checked="" onclick="ini.EtcMemo.value = '';">
                                                <label for="chk_delmemo2">
                                                    <span>기타</span>
                                                </label>
                                                <br>
                                                </p><div class="email-area" style="padding-top: 5px;">
                                                    <input type="text" name="EtcMemo" class="inorder_txt" title="배송시유의사항" maxlength="50" style="text-align: left; width: 565px">
                                                </div>
                                            <p></p>
                                        </td>
                                    </tr>
                                     -->
                                </tbody>
                            </table>
                        </div>
                        
                        <span class="y70">&nbsp;</span>
                        <div>
                            <div class="sec-tit">결제방법</div>
                            <table class="ordernew_tbl2">
                                <colgroup>
                                    <col style="width: 150px;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">결제금액</th>
                                        <td>
                                            <strong class="total-price"><fmt:formatNumber value="${ gList.bookPrice * qty }" type="number" /> 원</strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">결제방법</th>
                                        <td>
                                            <div class="radio-form">
                                                <span class="use-chk">
                                                    <input name="myPayMethod" type="radio" class="input_rdo radio" value="C" onclick="" checked="" id="select_payment1">
                                                    <label for="select_payment1" class="first">
                                                        <span>신용카드</span>
                                                    </label>
                                                    <input name="myPayMethod" type="radio" class="input_rdo radio" value="D" onclick="" id="select_payment2">
                                                    <label for="select_payment2">
                                                        <span>계좌이체</span>
                                                    </label>
                                                    <input name="myPayMethod" type="radio" class="input_rdo radio" value="V" onclick="" id="select_payment3">
                                                    <label for="select_payment3">
                                                        <span>무통장입금(가상계좌)</span>
                                                    </label>
                                                    <input name="myPayMethod" type="radio" class="input_rdo radio" value="E" onclick="" id="select_payment4">
                                                    <label for="select_payment4">
                                                        <span>에스크로(가상계좌)</span>
                                                    </label>
                                                </span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
						<div class="buttons tc">
							<!-- <a href="/script/card/list_sp.asp" class="btn btn01 btn-over purple">쇼핑계속하기</a> -->
							<a href="javascript:void(0)" class="btn btn02 btn-over purple" onclick="submitFunc()">결제하기</a>
						</div>
					</div>
				</form>
			</div>
			
		</main>
		
		<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
		<script>
			function submitFunc () {
				var userName = document.querySelector("[name='userName']");
				var userPh1 = document.querySelector("[name='userPh1']");
				var userEmail = document.querySelector("[name='userEmail']");
				var zip = document.querySelector("[name='zip']");
				var addr1 = document.querySelector("[name='addr1']");
				var addr2 = document.querySelector("[name='addr2']");
				
				if (userName.value === "") {
					alert('주문자명을 입력해주세요');
					userName.focus();
					return false;
				}
				if (userPh1.value === "") {
					alert('휴대폰번호를 입력해주세요');
					userPh1.focus();
					return false;
				}
				if (userEmail.value === "") {
					alert('이메일을 입력해주세요');
					userEmail.focus();
					return false;
				}
				if (zip.value === "") {
					alert('배송주소를 입력해주세요');
					zip.focus();
					return false;
				}
				if (addr1.value === "") {
					alert('배송주소를 입력해주세요');
					addr1.focus();
					return false;
				}
				if (addr2.value === "") {
					alert('배송주소를 입력해주세요');
					addr2.focus();
					return false;
				}
				
				document.frm.submit();
			}
		
			function openZipSearch() {
				new daum.Postcode({
					oncomplete: function(data) {
						$('[name=zip]').val(data.zonecode); // 우편번호 (5자리)
						$('[name=addr1]').val(data.address);
						$('[name=addr2]').val(data.buildingName);
					}
				}).open();
			}
		</script>
		
<%@ include file = "/include/footer.jsp" %>