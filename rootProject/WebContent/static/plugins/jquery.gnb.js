jQuery(function(jQuery){
	jQuery.fn.gnb = function(options) {
		var opts = jQuery.extend(options);
		var gnb = jQuery(this);
		var gnbList = gnb.find('>ul>li');
		var submenu = gnb.find('.submenu');
		var submenuList = submenu.find('>ul>li');
		var submenuBg = jQuery('.submenu_bg');

		function showMenu() {
			t = jQuery(this).parent('li');
			if (!t.hasClass('hover')) {
				gnbList.removeClass('hover');
				gnbList.removeClass('active');
				gnbList.bind("focus mouseover mouseenter",function(){
					jQuery(this).addClass("hover");
					jQuery(this).siblings().find(submenu).stop(false, true).hide();
				});
				gnbList.bind("mouseleave",function(){
					jQuery(this).removeClass("hover");
				});
				
			}
			
			t.find(submenu).fadeIn(300);
		}

		function showMenu2() {
			t = jQuery(this).parent('li');
			t.siblings().removeClass('hover');
			t.toggleClass("hover");

			t.siblings().find(submenu).hide();
			t.find(submenu).fadeToggle(300);
			
			if(t.find(".submenu").length > 0) return false;
		}

		function hideMenu() {
			gnbList.removeClass('hover');
			gnbList.removeClass('active');
			submenu.hide();
			activeMenu();
		}

		function activeMenu() {
			if(opts.d1) {
				t = gnbList.eq(opts.d1-1); 
				t.addClass('active');
			}
		}

		return this.each(function() {
			activeMenu();
			var isTablet = navigator.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry|Windows Phone)/);
			if( !isTablet ){
				gnbList.find('>a').mouseover(showMenu).focus(showMenu);
			}else{
				gnbList.find('>a').click(showMenu2);
			}
			jQuery("#gnb2").mouseleave(hideMenu);
			jQuery("#header2.fixed").mouseleave(hideMenu);
		});
	}
});
