<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="answerFormPro.ab" name="" method="post" id="answerForm" enctype="multipart/form-data">
	제목 : <input type="text" name="boardSubject"  /><br>
	비밀번호 : <input type="password" name="boardPass" /><br>
	이름 : <input type="text" name="boardName" /><br>
	내용 : <textarea name="boardContent" cols="30" rows="10"></textarea><br>
	이미지 : <input type="file" name= "fileUp" /><br>
	<button type="submit" class="btn-pack medium">전송</button>
</form>