<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<footer class="footer">
			<div class="footer-menu">
				<div class="contain">
					<ul class="list clearfix">
						<li class="list-item"><a href="#">회사소개</a></li>
						<li class="list-item"><a href="#">이용약관</a></li>
						<li class="list-item"><a href="#">고객세터</a></li>
						<li class="list-item"><a href="#">협력사여러분</a></li>
						<li class="list-item"><a href="#">광고문의</a></li>
						<li class="list-item"><a href="#">채용정보</a></li>
					</ul>
				</div>
			</div>
			<div class="footer-con">
				<div class="contain">
					<address>
						footer Content
					</address>
				</div>
			</div>
		</footer>
	</div>
	
	<div class="quick-menu">
		<div class="button-box">
			<button class="btn-top">TOP</button>
			<button class="btn-down">DOWN</button>
		</div>
	</div>
	
	<script>
		$(function(){
			
			(function(){
				var $win = $(window);
				var $header = $(".header");
				var $stickyMenu = $('.sticky-menu');
				var $quickMenu = $('.quick-menu');
				var $btnTop = $('.btn-top');
				var $btnDown = $('.btn-down');
				var _offset = $header.height();
				var _bottom = $(document).height();
				
				$win.scroll(function(){
					var scrollPos = $win.scrollTop();
					if (scrollPos > _offset) {
						$stickyMenu.addClass('active');
						$quickMenu.addClass('active');
					} else {
						$stickyMenu.removeClass('active');
						$quickMenu.removeClass('active');
					}
				});
				
				$btnTop.click(function() {
					$('body, html').animate({
						scrollTop: 0,
					}, 350);
					
					return false;
				});
				
				$btnDown.click(function() {
					$('body, html').animate({
						scrollTop: _bottom,
					}, 350);
					
					return false;
				});
				
				
				
			})();
			
			
		});
	</script>
</body>
</html>