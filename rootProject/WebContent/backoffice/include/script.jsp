<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- Modal -->
	<div class="modal fade" id="ModalConfirm" role="dialog">
		<div class="modal-dialog modal-sm">
		
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<p>삭제하시겠습니까?</p>
			</div>
			<div class="modal-footer">
			<a href="#" class="btn btn-default btn-primary model-delete-btn">예</a>
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
	 
	<!-- JS Scripts-->
    <!-- Bootstrap Js -->
    <script src="/backoffice/assets/js/bootstrap.min.js"></script>
	 
    <!-- Metis Menu Js -->
    <script src="/backoffice/assets/js/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="/backoffice/assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="/backoffice/assets/js/morris/morris.js"></script>
	
	
	<script src="/backoffice/assets/js/easypiechart.js"></script>
	<script src="/backoffice/assets/js/easypiechart-data.js"></script>
	
	 <script src="/backoffice/assets/js/Lightweight-Chart/jquery.chart.js"></script>
	
    <!-- Custom Js -->
    <script src="/backoffice/assets/js/custom-scripts.js"></script>
	 
	 <script>
	 	function modelDelete() {
	 		const url = event.target.dataset.url;
	 		const target = document.querySelector(event.target.dataset.target);
	 		const childrenBtn = target.querySelector(".model-delete-btn");
	 		childrenBtn.setAttribute('href', url);
	 	}
	 </script>
</body>
</html>