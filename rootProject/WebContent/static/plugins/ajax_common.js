
function AjaxRequest(url, pars, success, error, async, type){
	$.ajax({
		type:"POST",
		url:url,
		data:pars,
		dataType: type != null ? type : "text",
		async: (async == null || async == true) ? true : false,
		error: error!=null?error:function(req, s, e) {
			alert(req.responseText);
			//alert(s);
			//alert(e);
		},
		success: success,
		beforeSend:function(){

		},
		complete:function(){
			
		}
	});
}

$.fn.pager = function(attribute) {
    var attr = {
        totalCount: 0,
        pageSize: 5,
        blockSize: 5,
        curPage: 1,
        curNumCls: 'on',
        hoverNumCls: 'on',
        //$First: $('<img src="http://www.sempio.com/sempio/web_event/130109_2/images/btn_first.png" width="10" height="7" hspace="5" vspace="0" border="0" style="vertical-align:middle;" alt="처음 페이지" class="btn" />'),
        $Prev: $('<a href="javascript:;" class="prev" >&lt;</a>'),
        $Number: $('<a>1</a>'),
        $Next: $('<a href="javascript:;" class="next" >&gt;</a>'),
        //$End: $('<img src="http://www.sempio.com/sempio/web_event/130109_2/images/btn_last.png" width="10" height="7" hspace="5" vspace="0" border="0" style="vertical-align:middle;" alt="끝 페이지" class="btn" />'),
        $Container: $("<div id='pageDiv'></div>"),
        pageClick: function() { }
    }

    $.extend(attr, attribute);
    var pageCount = Math.floor((attr.totalCount - 1) / attr.pageSize + 1);
    pageCount = (pageCount == 0 ? 1 : pageCount);
    var blockCount = Math.floor((pageCount - 1) / attr.blockSize + 1);
    var curBlock = Math.floor((attr.curPage - 1) / attr.blockSize + 1);
    var pageStart;
    var pageEnd;
    var $self = $(this);
    $self.empty().find("a").unbind()


    function init() {
        if (curBlock < 1) {
            curBlock = 1;
        }

        if (curBlock > blockCount) {
            curBlock = blockCount;
        }

        var pageStart = Math.floor((curBlock - 1) * attr.blockSize + 1);
        var pageEnd = curBlock * attr.blockSize;

        if (blockCount <= curBlock) {
            pageEnd = pageCount;
        }
        if (curBlock > 1) //첫 블럭이 아닌경우
        {
            //attr.$First.css("cursor", "pointer").bind("mousedown", { page: 1 }, attr.pageClick).appendTo(attr.$Container);
            attr.$Prev.css("cursor", "pointer").bind("mousedown", { page: (curBlock - 1) * attr.blockSize }, attr.pageClick).appendTo(attr.$Container);
        }
        else {
            //attr.$First.css("cursor", 'default').appendTo(attr.$Container);
            attr.$Prev.css("cursor", 'default').appendTo(attr.$Container);
        }
        
        for (var i = pageStart; i <= pageEnd; i++) {
            var $number = attr.$Number.clone();
			var inTxt = i+ " ";
			//$number.css("margin", "0 2px");
            if (i == attr.curPage) {
                $number.attr("title", i + "Page").html(inTxt)
                .bind("mousedown", { page: i }, attr.pageClick)
				.css({"cursor":"pointer"})
				.addClass("on")
				.appendTo(attr.$Container);
            }
            else {
                $number.attr("title", i + "Page").html(inTxt)
				.css({"cursor":"pointer"})
                .bind("mousedown", { page: i }, attr.pageClick)
				.removeClass("on")
                .mouseenter(function(evt) {
                    $(this).toggleClass(attr.hoverNumCls);
                })
                .mouseleave(function(evt) {
                    $(this).toggleClass(attr.hoverNumCls);
                })
                .appendTo(attr.$Container)
            }
        }
        
        if ((curBlock) * attr.blockSize < pageCount) //마지막페이지가 아닌경우
        {
            attr.$Next.css("cursor", "pointer").bind("mousedown", { page: (curBlock) * attr.blockSize + 1 }, attr.pageClick).appendTo(attr.$Container);
            //attr.$End.css("cursor", "pointer").bind("mousedown", { page: pageCount }, attr.pageClick).appendTo(attr.$Container);
        }
        else {
            attr.$Next.css("cursor", 'default').appendTo(attr.$Container);
            //attr.$End.css("cursor", 'default').appendTo(attr.$Container);
        }
        $self.append(attr.$Container);
    }
    init();
}


