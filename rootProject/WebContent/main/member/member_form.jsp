<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String pageCode = ""; %>
<%@ include file = "/include/head.jsp" %>
	<div id="wrap">
		<%@ include file = "/include/header.jsp" %>		
		<main id="container">
			<div class="sub-title">
				<div class="contain">
					<h2 style="text-align: center;">회원가입</h2>
				</div>
			</div>
			
			<style>
				.join-area {
					width: 500px;
					margin: 0 auto;
					padding: 30px 20px;
					border: 1px solid #ddd;
				}
				.join-area .input {
					width: 100%;
					height: 35px;
					padding: 10px 35px 7px 11px;
					border: 1px solid #ddd;
					background: #fff;
					box-sizing:border-box;
				}
				.join-area .form-group {
					margin-top: 8px;
				}
				.join-area .btn-group {
					font-size: 0;
					text-align: center;
				}
				.join-area .btn {
					display:inline-block;
					vertical-align: top;
					width: calc(50% - 5px);
					height: 40px;
					margin: 12px 0 14px;
					background: #fff;
					border: 1px solid #ddd;
					font-size: 16px;
					line-height: 40px;
					text-align: center;
					color:#2b2b2b;
					box-sizing:border-box;
				}
				.join-area .submit {
					background: #5b1eaa;
					border: 1px solid #5b1eaa;
					color:#fff;
				}
				.join-area .btn:nth-child(2) {
					margin-left: 10px;
				}
				.join-area .radio {
					vertical-align: middle;
				}
				
				.id-form {
								
				}
				.id-form .input {
					width: 70%;
				}
				.id-form .idChk-btn {
					float:right;
					width: calc(30% - 10px);
					height: 35px;
					border: 1px solid #ccc;
					margin-left: 10px;
					box-sizing:border-box;
				}
				#id-form-result {
					display:none;
				}
			</style>
			
			<div class="join-area">
				<form action="memberFormPro.mem" method="post" name="frm" id="frm">
					<input type="hidden" name="idChkValue" value="1" />
					<div class="inner">
						<div class="form-group id-form">
							<input type="text" class="input" name="userId" value="" placeholder="아이디" />
							<button type="button" class="idChk-btn" onclick="idCheckFunc()">아이디 중복 확인</button>
						</div>
						<div class="form-group" id="id-form-result">
							<p id="id-form-result-text"></p>
						</div>
						<div class="form-group">
							<input type="password" class="input" name="userPw" value="" placeholder="비밀번호" />
						</div>
						<div class="form-group">
							<input type="password" class="input" name="userPwChk" value="" placeholder="비밀번호 확인" />
						</div>
						<div class="form-group">
							<input type="text" class="input" name="userName" placeholder="이름" />
						</div>
						<div class="form-group">
							<input type="date" class="input" name="userBirth" placeholder="생년월일" />
						</div>
						<div class="form-group">
							<label for="g1">남자</label>
							<input type="radio" class="radio" name="userGender" id="g1" value="M" />
							<label for="g2">여자</label>
							<input type="radio" class="radio" name="userGender" id="g2" value="F" />
						</div>
						<div class="form-group">
							<input type="text" class="input" name="userAddr" placeholder="주소" />
						</div>
						<div class="form-group">
							<input type="text" class="input" name="userPh1" placeholder="Ex) 010-0000-0000" maxlength="13" />
						</div>
						<div class="form-group">
							<input type="text" class="input" name="userPh2" placeholder="Ex) 010-0000-0000" maxlength="13" />
						</div>
						<div class="form-group">
							<input type="text" class="input" name="userEmail" placeholder="이메일" />
						</div>
						<div class="btn-group col-2">
							<button type="button" class="btn submit">확인</button>
							<a href="/main.main" class="btn">취소</a>
						</div>
					</div>
				</form>
			</div>
			
			<script>
				$(function(){
					var form = $("#frm");
					var btn = $(".submit");
					var id = $("[name='userId']");
					var pw = $("[name='userPw']");
					var pwChk = $("[name='userPwChk']");
					var name = $("[name='userName']");
					var birth = $("[name='userBirth']");
					var gender = $("[name='userGender']");
					var addr = $("[name='userAddr']");
					var ph1 = $("[name='userPh1']");
					var email = $("[name='userEmail']");
					var idChk = $("[name='idChkValue']");
					
					btn.click(function(){
						if (id.val() === "") {
							alert('아이디를 입력하세요');
							id.focus();
							return false;
						}
						
						if (pw.val() === "") {
							alert('비밀번호를 입력하세요');
							pw.focus();
							return false;
						}
						
						if (pwChk.val() === "") {
							alert('비밀번호확인을 입력하세요');
							pwChk.focus();
							return false;
						}
						
						if (name.val() === "") {
							alert('이름을 입력하세요');
							name.focus();
							return false;
						}
						if (birth.val() === "") {
							alert('생년월일을 입력하세요');
							birth.focus();
							return false;
						}
						
						if (!gender.eq(0).prop('checked')) {
							if (!gender.eq(1).prop('checked')) {
								alert('성별을 선택해주세요');
								gender.eq(0).focus().prop('checked', true);
								return false;
							} 
						}
						
						if (addr.val() === "") {
							alert('주소를 입력하세요');
							addr.focus();
							return false;
						}
						if (ph1.val() === "") {
							alert('전화번호를 입력하세요');
							ph1.focus();
							return false;
						}
						if (email.val() === "") {
							alert('이메일을 입력하세요');
							email.focus();
							return false;
						}
						if (idChk.val() === "1") {
							alert('아이디 중복확인을 해주세요');
							id.focus();
							return false;
						}
						
						form.submit();
					});
					
					pwChk.change(function(){
						if ($(this).val() === "") return;
						
						if ($(this).val() !== pw.val()) {
							alert('비밀번호와 비밀번호 확인이 다릅니다');
							$(this).focus();
						}
					});
				});
				
				function idCheckFunc() {
					var idResult = $("#id-form-result");
					var idText = $("#id-form-result-text");
					var idChk = $("[name='idChkValue']");
					var Id = $("[name='userId']").val();
					
					$.ajax({
						type: 'post',
						url: 'memberIdchk.mem',
						data : {userId: Id},
						dataType: 'html',
						success: function(res) {
							console.log(res);
							if (res.indexOf("사용가능한") > -1) {
								idChk.val("2");
								idText.css("color", "blue");
							} else if (res.indexOf("중복된") > -1) {
								idChk.val("1");
								idText.css("color", "red");
							}
							
							idResult.show();
							idText.text(res);
						},
						error: function(e) {
							console.log("error", e);
						}
					})
				}
			</script>
			
		</main>
		
<%@ include file = "/include/footer.jsp" %>