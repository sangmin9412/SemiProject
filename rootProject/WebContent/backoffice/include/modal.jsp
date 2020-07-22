<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="ModalConfirm" role="dialog">
	<div class="modal-dialog modal-sm">
	
	<!-- Modal content-->
	<div class="modal-content">
		<div class="modal-body">
			<p>삭제하시겠습니까?</p>
		</div>
		<div class="modal-footer">
		<button type="button" class="btn btn-default btn-primary modal-delete-btn" onclick="modalDeleteSubmit();">예</button>
			<button type="button" class="btn btn-default" data-dismiss="modal">아니요</button>
		</div>
	</div>
	  
	</div>
</div>

<div class="modal fade" id="ModalPassConfirm" role="dialog">
	<div class="modal-dialog modal-sm">
	
	<!-- Modal content-->
	<div class="modal-content">
		<div class="modal-body">
			<p>비밀번호를 입력하세요</p>
			<div class="form-group">
				<input type="password" class="form-control" id="modal-pass-input" />
			</div>
		</div>
		<div class="modal-footer">
		<button type="button" class="btn btn-default btn-primary modal-delete-btn" onclick="modalDeleteSubmit();">예</button>
			<button type="button" class="btn btn-default" data-dismiss="modal">아니요</button>
		</div>
	</div>
	  
	</div>
</div>


<!-- 
<div class="modal fade" id="ModalConfirm" role="dialog">
	<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="modal-title"></h4>
		</div>
		<div class="modal-body">
			<p>Some text in the modal.</p>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
	</div>
	  
	</div>
</div>
 -->
 
 <script>
 	function modalDelete(inputName) {
 		const name = inputName ? inputName : null;
 		// const url = event.target.dataset.url;
 		// const target = document.querySelector(event.target.dataset.target);
 		// const childrenBtn = target.querySelector(".modal-delete-btn");
 		// childrenBtn.setAttribute('href', url);
 		
 		if(name === null) {
 			return;
 		}
 		
 		$("#modal-pass-input").on("change keyup paste", function(){
 			var currentVal = $(this).val();
 			$("[name='"+name+"']").val(currentVal);
 		});
 	}
 	
 	function modalDeleteSubmit() {
 		document.frm.submit();
 	}
 </script>