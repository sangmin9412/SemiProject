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
			
			<div class="contain">
				<form action="answerModifyPro.ab" name="" method="post" enctype="multipart/form-data">
					<input type="hidden" name="boardNum" value="${ answerList.boardNum }" />
					<input type="hidden" name="fileDel" />
					제목 : <input type="text" name="boardSubject" value="${ answerList.boardSubject }" readonly /><br>
					비밀번호 : <input type="password" name="boardPass" /><br>
					이름 : <input type="text" name="boardName" value="${ answerList.boardName }" /><br>
					내용 : <textarea name="boardContent" cols="30" rows="10">${ answerList.boardContent }</textarea><br>
					<div id="file-up-div" style="display:none;">
						이미지 : <input type="file" name= "fileUp" />
					</div>
					<button type="submit" class="btn-pack medium">전송</button>
					<button type="button" class="btn-pack medium file-btn">파일삭제</button>
				</form>
			</div>
			
		</main>
		
		<script>
		$(function(){
    		$(".file-btn").click(function(){
    			var txt = $(this).text();
    			if (txt === "파일삭제") {
    				$(this).text("취소");
    				$("#file-up-div").show();
    				$("[name='fileDel']").val("${answerList.storeFileName}");
    			} else if (txt === "취소") {
    				$(this).text("파일삭제");
    				$("#file-up-div").hide();
    				$("[name='fileDel']").val("");
    			}
    			
    			return false;
    		});
    		
    	});
		</script>
		
<%@ include file = "/include/footer.jsp" %>
