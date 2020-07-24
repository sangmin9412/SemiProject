$(document).on("ready", function(){
	$("body").append("<div id=dim></div>");

	// ===== Tab =====
	jQuery(".tab-content").hide();
	jQuery("ul.tabs>li:first").addClass("active"); 	
	jQuery(".tab-content:first").show();
	$(window).load(function(){
		jQuery("ul.tabs>li>a").mouseover(function(e) {
			if(!jQuery(this).parent().hasClass("active")){
				jQuery(".tab-content").hide();
				jQuery("ul.tabs>li").removeClass("active");
				jQuery(this).parent().addClass("active");

				var activeTab = jQuery(this).attr("href");
				jQuery(activeTab).show();
				jQuery(activeTab).css("opacity", 0).stop().animate({opacity:1}, 500);
			}

			return false;
		});

		jQuery("ul.tabs>li>a").click(function(e){
			e.preventDefault();
		});


		// ===== Main JS =====
		if($("body").hasClass("main")){
			
			
		} else {

			// ===== Sub JS =====
			// 높이값 체크 quick 메뉴 하단 고정할 때 사용
			heightCheckFn();
		}
	});



	// ===== header JS ======
	$(".util .cs > a").click(function(){ // CS Center Open
		if($(this).hasClass("active")){
			$(this).removeClass("active");
			$(this).next(".csmenu").slideUp(200);
		} else{
			$(this).addClass("active");
			$(this).next(".csmenu").slideDown(200);
		}

		return false;
	});

	$(".util .cs").mouseleave(function(){ // CS Center Close
		$(this).find("a").removeClass("active");
		$(this).find(".csmenu").hide();
	});

	$(".search-open").click(function(){ // Search Open
		$(this).hide();
		$(".search-close").show();
		$(".head-search").fadeIn(300);
		$(".head-search").find("#searchKeyword").val("").focus();

		$(".menu-open").show();
		$(".menu-close").hide();
		$(".head-menu").hide();

		return false;
	});

	$(".search-close").click(function(){ // Search Close
		$(this).hide();
		$(".search-open").show();
		$(".head-search").fadeOut(100);

		return false;
	});

	$(".menu-open").click(function(){ // Header Menu Open
		$(this).hide();
		$(".menu-close").show();
		$(".head-menu").fadeIn(300);

		$(".search-open").show();
		$(".search-close").hide();
		$(".head-search").hide();

		return false;
	});

	$(".menu-close").click(function(){ // Header Menu Close
		$(this).hide();
		$(".menu-open").show();
		$(".head-menu").fadeOut(100);

		return false;
	});


	// ===== footer JS ======
	$("#topBtn").click(function(event){
		$("html, body").animate({
			scrollTop : 0
		}, 500,'easeInOutQuint');
		
		event.preventDefault();
	});
	
});



// ================================================ 
//	Common
// ================================================

// 높이값 체크 quick 메뉴 하단 고정할 때 사용
function heightCheckFn() {
	var a,
		w,
		h,
		s,
		t,
		f,
		u;

	function fn() { // 실행 function
		$(window).off('scroll', scrollFn);

		a = window,
		w = a.innerHeight,
		h = $(document).height(),
		s = $("#quick-area"),
		t = a.scrollY || a.pageYOffset,
		f = $("#footer2").offset().top,
		u = h - f + 20;

		(t+w-20 >= h-u) ? s.addClass("stop") : s.removeClass("stop");
		$(window).scroll(scrollFn);
	}

	function scrollFn() { // 스크롤 function
		var scrollTop = a.scrollY || a.pageYOffset;
		(scrollTop+w-20 >= h-u) ? s.addClass("stop") : s.removeClass("stop");
	}

	/*
	var timer;
	var onDocHeightChange = function() { // resize 끝나면 한번만 실행
		clearTimeout(timer);
		timer = setTimeout(fn, 150);
	}
	*/
	
	function heightChack() { // resize 높이값 변경 체크
		$('.height-change-listener').resize(fn).each(function() {
		  $(this.contentWindow).resize(fn);
		});

		// quick 메뉴 show
		$("#quick-area").addClass("on");
	}
	
	fn();
	heightChack();
}


// ================================================ 
//	SHOP JS 
// ================================================
// 제품 상세 탭메뉴
function viewTabMenuScroll() {
	var o = $(".view-tab-menu"),
		t = o.offset().top,
		l = o.find("li"),
		a = o.find("a");

	l.hover(function(){
		$(this).addClass('hover');
	}, function(){
		$(this).removeClass('hover');
	});

	a.click(function(e){
		var h = $(this).attr("href"),
			t = $(h),
			a = t.offset().top - 100 // Top 여백값;

		$("html, body").stop().animate({
			scrollTop : a
		}, 0);

		$(this).parent('li').addClass('active');

		e.preventDefault();
	});

	$(window).scroll(function(){
		scrNav();
	});

	function scrNav() {
		var x = 100; // Top 여백값
		var p = $(window).scrollTop();
		var v = p + x;

		$(".tabAnchor").each(function(){
			var i = $(this).attr('id'),
				z = $(this).offset().top-1,
				h = $(this).height();

				
			if(v >= z && v < z + h){
				l.filter('[data-tab-anchor='+i+']').siblings().removeClass();
				l.filter('[data-tab-anchor='+i+']').addClass('active active_bar');
			}
		});

		if(p > t + 200){
			o.addClass('fixed');
		} else {
			o.removeClass('fixed');
		}
	}

	scrNav();
}

// 제품리스트 3단보기, 4단보기
function gridBtn() {
	$(".grid-btn label").click(function(){
		if(!$(this).prev(".radio").is(":checked")){
			$(".grid-btn .radio").prop("checked", false);
			$(this).prev(".radio").prop("checked", true);

			if($(this).hasClass("grid-3")){
				$(".card-list").removeClass("col-4");

				$(".card-list").addClass("col-3");
			} else if($(this).hasClass("grid-4")){
				$(".card-list").removeClass("col-3");

				$(".card-list").addClass("col-4");
			}

			var num = $(this).attr("class");
				num	= num.split("grid-");
				num	= num[1];
			
			//현재 주소를 가져온다.
			var renewURL = location.href;

			if(renewURL.indexOf("&grid=") > -1 || renewURL.indexOf("?cardDv=") > -1 || renewURL.indexOf("?Sheet=") > -1){
				//현재 주소 중 grid 부분이 있다면 날려버린다.
				renewURL = renewURL.replace(/\&grid=([0-9]+)/ig,'');
				 
				//새로 부여될 페이지 번호를 할당한다.
				// page는 ajax에서 넘기는 grid 번호를 변수로 할당해주거나 할당된 변수로 변경
				renewURL += '&grid='+num;
				 
				//페이지 갱신 실행!
				history.pushState(null, null, renewURL);
			} else{
				renewURL = renewURL.replace(/\?grid=([0-9]+)/ig,'');
				 
				renewURL += '?grid='+num;
				 
				history.pushState(null, null, renewURL);
			}
		}

		if($("#searchGrid").length > 0){
			$("#searchGrid").val($(this).prev().val());
		}
	});
}

// ================================================ 
//	POPUP JS 
// ================================================
function popOpen(width, id) {
	//$.fancybox({
		//href		: "#popDetailSearch",
		//padding     : 0,
		//margin      : 50,
		//fitToView	: false,
		//maxWidth	: "90%",
		//maxHeight	: "90%",
		//autoSize	: true,
		//closeClick	: false,
		//closeBtn	: false,
		//openEffect	: 'none',
		//closeEffect	: 'none',
		//type		: 'inline',
		//helpers:  {
			//overlay: {
				//locked: false
			//}
		//},
		//afterLoad   : function(){
			//$(".fancybox-skin").addClass('fancybox-content-cust');
		//}
	//});
	$("#dim").attr("data-pop-id", id).fadeIn(300);
	$("#"+id+"").css({"width": width, "margin-left": -width/2}).addClass("pop-on").fadeIn(300);
}

function popClose(id) {
	//parent.$.fancybox.close();
	$("#dim[data-pop-id="+id+"]").removeAttr("data-pop-id").removeData().fadeOut(100);
	$("#"+id+"").removeClass("pop-on").fadeOut(100);
}

$(document).on("click", "#dim", function(){
	var id = $(this).data("pop-id");
	$(this).removeAttr("data-pop-id").removeData().fadeOut(100);
	$("#"+id+"").removeClass("pop-on").fadeOut(100);
}).keydown(function(e) {
     if (e.keyCode == 27) {
		var o = $("#dim");
        o.css("display") === "block" ? o.trigger("click") : null;
    }
});;