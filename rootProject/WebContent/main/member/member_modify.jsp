<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String pageCode = ""; %>
<%@ include file = "/include/head.jsp" %>
	<div id="wrap">
		<%@ include file = "/include/header.jsp" %>		
		<main id="container">
			<div class="sub-title">
				<div class="contain">
					<h2 style="text-align: center;">회원정보 수정</h2>
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
			</style>
			
			<div class="join-area">
				<form action="memberModifyPro.mem" method="post" name="frm" id="frm">
					<div class="inner">
						<div class="form-group id-form">
							<input type="text" class="input" name="userId" value="${ list.userId }" placeholder="아이디" readonly />
						</div>
						<div class="form-group">
							<input type="password" class="input" name="userPw" value="" placeholder="비밀번호" />
						</div>
						<div class="form-group">
							<input type="password" class="input" name="userPwChk" value="" placeholder="비밀번호 확인" />
						</div>
						<div class="form-group">
							<input type="text" class="input" name="userName" placeholder="이름" value="${ list.userName }" />
						</div>
						<div class="form-group">
							<input type="date" class="input" name="userBirth" placeholder="생년월일" value="<fmt:formatDate value="${ list.userBirth }" pattern="yyyy-MM-dd"/>" />
						</div>
						<div class="form-group">
							<c:if test="${ list.userGender eq 'M' }">
							<input type="text" class="input" name="" value="남자" readonly />	
							</c:if>
							<c:if test="${ list.userGender eq 'F' }">
							<input type="text" class="input" name="" value="여자" readonly />
							</c:if>
						</div>
						<div class="form-group">
							<input type="text" class="input" name="userAddr" placeholder="주소" value="${ list.userAddr }" />
						</div>
						<div class="form-group">
							<input type="text" class="input" name="userPh1" placeholder="Ex) 010-0000-0000" maxlength="13" value="${ list.userPh1 }" />
						</div>
						<div class="form-group">
							<input type="text" class="input" name="userPh2" placeholder="Ex) 010-0000-0000" maxlength="13" value="${ list.userPh2 }" />
						</div>
						<div class="form-group">
							<input type="text" class="input" name="userEmail" placeholder="이메일" value="${ list.userEmail }" />
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
					var pw = $("[name='userPw']");
					var pwChk = $("[name='userPwChk']");
					var name = $("[name='userName']");
					var birth = $("[name='userBirth']");
					var addr = $("[name='userAddr']");
					var ph1 = $("[name='userPh1']");
					var email = $("[name='userEmail']");
					
					btn.click(function(){
						
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
			</script>
			
		</main>
		
<%@ include file = "/include/footer.jsp" %>