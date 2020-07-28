
/////////////////////////////////////////////////////////////
function getXmlHttpRequest() {
    var xmlhttp = false;
    try {
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
        try {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (eE) {
            try {
                xmlhttp = new XMLHttpRequest();
            } catch (e) {
                xmlhttp = false;
                alert("XMLHTTP°¡ Á¤»óÀûÀ¸·Î ¼³Ä¡µÇ¾î ÀÖÁö ¾Ê½À´Ï´Ù. µµ±¸¸Þ´º¿¡¼­ Windows Update¸¦ ¼öÇà ÈÄ ÁøÇàÇÏ½Ã±â ¹Ù¶ø´Ï´Ù.");
            }
        }
    }
    return xmlhttp;
}

function getPageHtml(page, querystring, spanID, method, loadFlag, scFlag, loadImg) {
    /*
    getPageHtml("a.asp?" + getFormQueryString(frm), "", document.all.divList, "GET");	Request.QueryString
    getPageHtml("a.asp", getFormQueryString(frm), document.all.divList, "POST");		Request.Form
	
    page : ajax ÆäÀÌÁö
    querystring : postÀÏ°æ¿ì Äõ¸®½ºÆ®¸µ => getFormQueryString(frm)
    spanID : ´ë»óDIV
    method : request¹æ¹ý
    loadFlag : ·Îµù±â´Ù¸±·¡? false:±â´Ù·Á true:¾È±â´Ù·Á
    scFlag : scrollIntoView true:Æ÷Ä¿½ºµû¶ó°¡±â
    loadImg : txt : ÅØ½ºÆ®·Î.. img : ÀÌ¹ÌÁö·Î...
    */
    if (loadImg == "txt")
        spanID.innerHTML = "<div align=centr><b>·ÎµùÁßÀÔ´Ï´Ù...</b></div>";
    else if (loadImg == "img")
        spanID.innerHTML = "<div align=center><br><img src='/image/common/loading.gif' valign=absmiddle></div>";


    var oXML = getXmlHttpRequest();

    if (method != "GET") method = "POST";
    if (loadFlag != false) loadFlag = true;

    oXML.open(method, page, loadFlag);
    oXML.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=euc-kr');
    oXML.onreadystatechange = function () {
        if (oXML.readyState != 4) return;
        if (oXML.status == 200) { //200 = Á¤»óÃ³¸®
            try {
                var json = oXML.responseText;
                spanID.innerHTML = json;
                try {
                    document.recalc(true);
                } catch (e) { }
                if (scFlag == true) spanID.scrollIntoView(true);
            } catch (e) {
                alert(e.message);
            }
        } else {
            if (oXML.status == 404) {
                alert(page + " : URL doesn't exist!");
            } else {
                alert("page : " + page + "\n\n" + "code : " + oXML.status + "\n\nÀá½Ã Åë½Å¿¡·¯°¡ ¹ß»ýÇß½À´Ï´Ù. \n\nÀá½ÃÈÄ ´Ù½Ã »ç¿ëÇØ ÁÖ¼¼¿ä");
            }
        }
    }
    //oXML.send('');
    oXML.send(querystring);
}

// The var docForm should be a reference to a <form> Æû°ªÀüºÎ..°¡Á®¿À±â
function getFormQueryString(docForm) {
    var submitContent = '';
    var formElem;
    var lastElemName = '';

    for (i = 0; i < docForm.elements.length; i++) {
        formElem = docForm.elements[i];
        switch (formElem.type) {
            // Text fields, hidden form elements 
            case 'text':
            case 'hidden':
            case 'password':
            case 'textarea':
            case 'select-one':
                submitContent += formElem.name + '=' + escape(formElem.value).replace(/\+/ig, "%2B") + '&'
                break;
            // Radio buttons 
            case 'radio':
                if (formElem.checked) {
                    submitContent += formElem.name + '=' + escape(formElem.value).replace(/\+/ig, "%2B") + '&'
                }
                break;
            // Checkboxes 
            case 'checkbox':
                if (formElem.checked) {
                    // Continuing multiple, same-name checkboxes
                    if (formElem.name == lastElemName) {
                        // Strip of end ampersand if there is one
                        if (submitContent.lastIndexOf('&') == submitContent.length - 1) {
                            submitContent = submitContent.substr(0, submitContent.length - 1);
                        }
                        // Append value as comma-delimited string
                        submitContent += ',' + escape(formElem.value).replace(/\+/ig, "%2B");
                    } else {
                        submitContent += formElem.name + '=' + escape(formElem.value).replace(/\+/ig, "%2B");
                    }
                    submitContent += '&';
                    lastElemName = formElem.name;
                }
                break;
        }
    }
    // Remove trailing separator
    submitContent = submitContent.substr(0, submitContent.length - 1);
    return submitContent;
}

function getFormQueryStringNotSelect(docForm) {
    var submitContent = '';
    var formElem;
    var lastElemName = '';

    for (i = 0; i < docForm.elements.length; i++) {
        formElem = docForm.elements[i];
        switch (formElem.type) {
            // Text fields, hidden form elements 
            case 'text':
            case 'hidden':
            case 'password':
            case 'textarea':
                // Radio buttons
            case 'radio':
                if (formElem.checked) {
                    submitContent += formElem.name + '=' + escape(formElem.value).replace(/\+/ig, "%2B") + '&'
                }
                break;
            // Checkboxes 
            case 'checkbox':
                if (formElem.checked) {
                    // Continuing multiple, same-name checkboxes
                    if (formElem.name == lastElemName) {
                        // Strip of end ampersand if there is one
                        if (submitContent.lastIndexOf('&') == submitContent.length - 1) {
                            submitContent = submitContent.substr(0, submitContent.length - 1);
                        }
                        // Append value as comma-delimited string
                        submitContent += ',' + escape(formElem.value).replace(/\+/ig, "%2B");
                    } else {
                        submitContent += formElem.name + '=' + escape(formElem.value).replace(/\+/ig, "%2B");
                    }
                    submitContent += '&';
                    lastElemName = formElem.name;
                }
                break;
        }
    }
    // Remove trailing separator
    submitContent = submitContent.substr(0, submitContent.length - 1);
    return submitContent;
}

//////////////////////////////////////////////////////
function numberFormat(val) { // 3ÀÚ¸®¸¶´Ù , Âï±â
    val = '' + val; // valÀ» stringÀ¸·Î °­Á¦Çüº¯È¯
    if (val.length <= 3) return val;

    var os = val.length % 3;
    if (os == 0) os = 3;
    return val.substring(0, os) + ',' + numberFormat(val.substring(os));
}

function swf(src, w, h) {
    html = '';
    html += '<object type="application/x-shockwave-flash" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" id="param" width="' + w + '" height="' + h + '">';
    html += '<param name="movie" value="' + src + '">';
    html += '<param name="quality" value="high">';
    html += '<param name="bgcolor" value="#ffffff">';
    html += '<param name="menu" value="false">';
    html += '<param name="wmode" value="transparent">';
    html += '<param name="swliveconnect" value="true">';
    html += '<embed src="' + src + '" quality=high bgcolor="#ffffff" menu="false" width="' + w + '" height="' + h + '" swliveconnect="true" id="param" name="param" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"  wmode="transparent"><\/embed>';
    html += '<\/object>';
    document.write(html);
}

function showPOP(obj) {
    var $layerPopupObj = $('#' + obj);
    var left = ($(window).scrollLeft() + ($(window).width() - $layerPopupObj.width()) / 2); //(document.body.clientHeight / 2) - obj.height() / 2 + document.body.scrollTop;
    var top = ($(window).scrollTop() + ($(window).height() - $layerPopupObj.height()) / 2); //(document.body.clientWidth / 2) - obj.width() / 2 + document.body.scrollLeft;
    $layerPopupObj.css({ 'left': left, 'top': top, 'position': 'absolute' }); $('body').css('position', 'relative').append($layerPopupObj);
    $('#' + obj).show();
}

function closePOP(obj) {
    $('#' + obj).hide();
}

function nullCheck ( obj , msg )
{
	if ( obj.value == "" )
	{
		alert ( msg + "ÀÔ·ÂÇÏ¼¼¿ä" );
		obj.focus();
		obj.select();
		return true;
	}
	return false;
}

function illegalCheckLen(obj, msg, minlen, maxlen) {
    if (nullCheck(obj, msg + "¸¦ ")) return true;
    if (obj.value.length < minlen || obj.value.length > maxlen) {
        alert(msg + " ±æÀÌ´Â ÃÖ¼Ò " + minlen + "ÀÚ ÀÌ»ó, ÃÖ´ë " + maxlen + "ÀÚ ÀÌÇÏ ÀÌ¾î¾ß ÇÕ´Ï´Ù.");
        obj.select();
        obj.focus();
        return true;
    }
    return false;
}

function space_check(obj, msg) {
    for (var i = 0; i < obj.value.length; i++) {
        if (obj.value.charAt(i) == ' ') {
            alert(msg + " ¿¡´Â ºó°ø°£À» ÀÔ·ÂÇÏ½Ç ¼ö ¾ø½À´Ï´Ù.");
            obj.select();
            obj.focus();
            return true;
        }
    }
    return false;
}

function EngNumCheck(obj, msg) {
    var temp;

    if (nullCheck(obj, msg)) return true;

    for (var i = 0; i < obj.value.length; i++) {
        temp = obj.value.charAt(i).toUpperCase()
        if ("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".indexOf(temp) < 0) {
            alert(msg + " ¿µ¹®/¼ýÀÚ¸¸ ÀÔ·ÂÇÏ¼¼¿ä");
            obj.select();
            obj.focus();
            return true;
        }
    }
    return false;
}

function KorCheck(obj, msg) {
    if (nullCheck(obj, msg)) return true;
    var inText = obj.value;
    var deny_pattern = /([^°¡-ÆR¤¡-¤¾¤¿-¤Ó\x20])/;

    //var deny_pattern = /[^(0-9)]/;  //¼ýÀÚ¸¸ Çã¿ë ÇÏ°í ½ÍÀ»¶§
    if (deny_pattern.test(inText)) {
        alert(msg + "ÇÑ±Û¸¸ ÀÔ·ÂÇÏ¼¼¿ä");
        obj.select();
        obj.focus();
        return true;
    }
    return false;
}

function EngCheck(obj, msg) {
    var temp;

    if (nullCheck(obj, msg)) return true;

    for (var i = 0; i < obj.value.length; i++) {
        temp = obj.value.charAt(i).toUpperCase()
        if ("ABCDEFGHIJKLMNOPQRSTUVWXYZ".indexOf(temp) < 0) {
            alert(msg + " ¿µ¹®¸¸ ÀÔ·ÂÇÏ¼¼¿ä");
            obj.select();
            obj.focus();
            return true;
        }
    }
    return false;
}


//	µÎ °´Ã¼ÀÇ value°ªÀÌ ´Ù¸¥Áö °Ë»çÇÑ´Ù
function objectValueDifferent(obj1, obj2, msg) {
    if (obj1.value != obj2.value) {
        alert(msg);
        obj1.focus();
        obj1.select();
        return true;
    }
    return false;
}

//	mememailÀÌ ¾Æ´Ï¸é true¸¦ return
function notAmememail(obj) {
    var NAE = false;
    var etPos, comPos, cokrPos, netPos, orgPos, toPos, pePos, dotPos;
    var leftString, rightString;

    etPos = (obj.value).indexOf("@");
    comPos = (obj.value).indexOf(".com");
    cokrPos = (obj.value).indexOf(".co.kr");
    netPos = (obj.value).indexOf(".net");
    orgPos = (obj.value).indexOf(".org");
    toPos = (obj.value).indexOf(".to");
    pePos = (obj.value).indexOf(".pe");
    dotPos = (obj.value).indexOf(".");

    leftString = (obj.value).substring(0, etPos);
    rightString = (obj.value).substring(etPos + 1);
    //	alert (leftString + ":" + rightString );
    if (rightString == "" || leftString == "" || etPos <= 0) NAE = true;
    if (comPos <= 0 && cokrPos <= 0 && netPos <= 0 && orgPos <= 0
		 && toPos <= 0 && pePos <= 0 && dotPos <= 0) NAE = true;

    //	alert ( NAE );
    if (NAE) {
        alert("Àß¸øµÈ E-mailÀÔ´Ï´Ù.");
        obj.select();
        obj.focus();
        return true;
    }
    return false;
}

//	¼ýÀÚ¸¸ ³Ö°Ô ÇÑ´Ù.
function NotANumber(obj, msg) {
    if (nullCheck(obj, msg)) return true;

    for (var i = 0; i < obj.value.length; i++) {
        if (obj.value.charAt(i) < '0' || obj.value.charAt(i) > '9') {
            alert(msg + " ¼ýÀÚ¸¸ ÀÔ·ÂÇÏ¼¼¿ä");
            obj.select();
            obj.focus();
            return true;
        }
    }
    return false;
}

// Ã¼Å©¹Ú½º All ¼±ÅÃ..
var chkvalue = false;
function allSelect(fName) {
    try {
        if (!chkvalue) { chkvalue = true; }
        else { chkvalue = false; }
        if (fName.length > 0) { for (i = 0; i < fName.length; i++) { fName[i].checked = chkvalue; } }
        else { fName.checked = chkvalue; }
    } catch (e) { return; }
}

// Ã¼Å©¹Ú½º All ¼±ÅÃ Func - 2019.11.15 ¼öÁ¤ allbox=ÀüÃ¼¼±ÅÃ, target=checkbox, cb=ÄÝ¹é
function allSelectFn(allbox, target, cb) {
    var $el = $(allbox);
    var $target = $(target);
	var cbCheck = (cb) ? (cbCheck = true) : (cbCheck = false);

    // elFn
    $el.change(function(){
        var chkvalue = this.checked;

        if($target.length > 0){
            for (var i = 0; i < $target.length; i++) { 
                $target[i].checked = chkvalue; 
            }
        }
    });

    // targetFn
    $target.change(function(){
        var targetLength = $target.length,
            checkedLength = $target.filter(":checked").length,
            chkvalue = (targetLength === checkedLength);

		$el.prop("checked", chkvalue);

		(cbCheck) ? cb($target) : null;
    });
}

// »ùÇÃÄ«Æ® Âò¸®½ºÆ® Ã¼Å©¹Ú½º All ¼±ÅÃ Func - 2019.11.18 ¼öÁ¤ allbox=ÀüÃ¼¼±ÅÃ, target=checkbox, cb=ÄÝ¹é
function CartZzimSelcetAll (allbox, clearbox, target, cb) {
    var $all = $(allbox);
    var $clear = $(clearbox);
    var $target = $(target).not("[data-input-type=hidden]");
    var cbCheck = (cb) ? (cbCheck = true) : (cbCheck = false);

    // allboxFn
    $all.click(function(e){
        var chkvalue = true;

        if($target.length > 0){
            for (var i = 0; i < $target.length; i++) { 
                $target[i].checked = chkvalue; 
            }
            isCheckbox(target, cartListCheckFunc);
        }
        e.preventDefault();

        (cbCheck) ? cb($target) : null;
    });

    // clearFn
    $clear.click(function(e){
        var chkvalue = false;

        if($target.length > 0){
            for (var i = 0; i < $target.length; i++) { 
                $target[i].checked = chkvalue; 
            }
            isCheckbox(target, cartListCheckFunc);
        }
        e.preventDefault();

        (cbCheck) ? cb($target) : null;
    });

    // targetFn
    $target.change(function(){
        isCheckbox(target, cartListCheckFunc);
        (cbCheck) ? cb($target) : null;
    });
}

// »ùÇÃÄ«Æ®, Âò¸®½ºÆ® Ã¼Å©¹Ú½º ¼±ÅÃ¿©ºÎ
function isCheckbox(fName, cb) {
    var chk;
    var i;

    if (fName.length > 0) {
        for(i=0; i<fName.length; i++){
            if(!fName[i].attributes['data-input-type'] && fName[i].checked === true){
                chk = true;
            }
        }

        cb(chk);
    }
}

// »ùÇÃÄ«Æ®, Âò¸®½ºÆ® Ã¼Å©¹Ú½º Func
function cartListCheckFunc(val) {
	var obj = document.querySelectorAll('.goods-option-btn');
	var toggle;

	(val) ? toggle = 'off' : toggle = 'on';

	for (var i=0; i<obj.length; i++) {
		if(obj[i].attributes['data-disabled']){
			obj[i].setAttribute('data-disabled', toggle);
		}
	}
}

//Ã¼Å©¹Ú½º¿¡ ÇÏ³ªÀÌ»ó Ã¼Å©ÇÏµµ·Ï 
function CheckBox(InObj, InMsg) {
    var cnt = 0;
    for (i = 0; i < InObj.length; i++) {
        if (InObj[i].checked == true) {
            cnt = cnt + 1;
        }
    }
    if (InObj.length == undefined) {
        if (InObj.checked == true) cnt = cnt + 1;
    }
    if (cnt < 1) {
        alert(InMsg + ' ¼±ÅÃÇØ ÁÖ¼¼¿ä.');
        return true;
    }
}

function onlyNumber(key, obj) {
    // ¹é½ºÆÐÀÌ½º) = 8 TAB = 9 END = 35 HOME =36  ¡ç = 37 ¡æ  = 39 INSERT = 45 DELETE = 46 NUMLOCK = 144
    if (event.keyCode < 48 || (event.keyCode > 57 && event.keyCode < 96) || event.keyCode > 105) {
        if (!(key == 8 || key == 9 || key == 13 || key == 46 || key == 144 || (key >= 48 && key <= 57) || key == 110 || key == 190)) {
            //alert('¼ýÀÚ¸¸ ÀÔ·Â °¡´ÉÇÕ´Ï´Ù');
            event.returnValue = false;
        }
    }
}

function onlyEngKor(obj, msg) {
    var inText = obj.value;
    var deny_pattern = /[^(°¡-ÆRa-zA-Z)]/;
    //var deny_pattern = /[^(0-9)]/;  //¼ýÀÚ¸¸ Çã¿ë ÇÏ°í ½ÍÀ»¶§
    if (deny_pattern.test(inText)) {
        alert(msg + "¿µ¹®ÀÚ¿Í ÇÑ±Û¸¸À» ÀÔ·ÂÇÏ¼¼¿ä");
        obj.select();
        obj.focus();
        return true;
    }
    return false;
}

function nullCheck2(obj, msg) {
    if (obj.value == "") {
        alert(msg + "¼±ÅÃÇÏ¼¼¿ä");
        obj.focus();
        return true;
    }
    return false;
}

// ÅëÇÕ ¿ìÆí¹øÈ£Ã£±â
function popFindZipCode(schWhere) {
    window.open("/script/include/findZipCode.asp?schWhere=" + schWhere, "findZipCode", "width=450, height=400, scrollbars=yes, toolbars=no, left=100, top=100");
}

function popOrderDaumZipCode(e) {
    new daum.Postcode({
        oncomplete: function(data) {
	   // ÆË¾÷¿¡¼­ °Ë»ö°á°ú Ç×¸ñÀ» Å¬¸¯ÇßÀ»¶§ ½ÇÇàÇÒ ÄÚµå¸¦ ÀÛ¼ºÇÏ´Â ºÎºÐ.

			// °¢ ÁÖ¼ÒÀÇ ³ëÃâ ±ÔÄ¢¿¡ µû¶ó ÁÖ¼Ò¸¦ Á¶ÇÕÇÑ´Ù.
			// ³»·Á¿À´Â º¯¼ö°¡ °ªÀÌ ¾ø´Â °æ¿ì¿£ °ø¹é('')°ªÀ» °¡Áö¹Ç·Î, ÀÌ¸¦ Âü°íÇÏ¿© ºÐ±â ÇÑ´Ù.
			var fullAddr = ''; // ÃÖÁ¾ ÁÖ¼Ò º¯¼ö
			var extraAddr = ''; // Á¶ÇÕÇü ÁÖ¼Ò º¯¼ö

			// »ç¿ëÀÚ°¡ ¼±ÅÃÇÑ ÁÖ¼Ò Å¸ÀÔ¿¡ µû¶ó ÇØ´ç ÁÖ¼Ò °ªÀ» °¡Á®¿Â´Ù.
			if (data.userSelectedType === 'R') { // »ç¿ëÀÚ°¡ µµ·Î¸í ÁÖ¼Ò¸¦ ¼±ÅÃÇßÀ» °æ¿ì
				fullAddr = data.roadAddress;

			} else { // »ç¿ëÀÚ°¡ Áö¹ø ÁÖ¼Ò¸¦ ¼±ÅÃÇßÀ» °æ¿ì(J)
				fullAddr = data.jibunAddress;
			}

			// »ç¿ëÀÚ°¡ ¼±ÅÃÇÑ ÁÖ¼Ò°¡ µµ·Î¸í Å¸ÀÔÀÏ¶§ Á¶ÇÕÇÑ´Ù.
			if(data.userSelectedType === 'R'){
				//¹ýÁ¤µ¿¸íÀÌ ÀÖÀ» °æ¿ì Ãß°¡ÇÑ´Ù.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// °Ç¹°¸íÀÌ ÀÖÀ» °æ¿ì Ãß°¡ÇÑ´Ù.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// Á¶ÇÕÇüÁÖ¼ÒÀÇ À¯¹«¿¡ µû¶ó ¾çÂÊ¿¡ °ýÈ£¸¦ Ãß°¡ÇÏ¿© ÃÖÁ¾ ÁÖ¼Ò¸¦ ¸¸µç´Ù.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}

			// ¿ìÆí¹øÈ£¿Í ÁÖ¼Ò Á¤º¸¸¦ ÇØ´ç ÇÊµå¿¡ ³Ö´Â´Ù.
			/*document.getElementById("EnvZip1"+e+"").value = data.postcode1; //6ÀÚ¸® ¿ìÆí¹øÈ£ »ç¿ë
			document.getElementById("EnvZip2"+e+"").value = data.postcode1; //6ÀÚ¸® ¿ìÆí¹øÈ£ »ç¿ë
			document.getElementById("EnvZip3"+e+"").value = data.postcode1; //6ÀÚ¸® ¿ìÆí¹øÈ£ »ç¿ë
			document.getElementById("EnvZip4"+e+"").value = data.postcode1; //6ÀÚ¸® ¿ìÆí¹øÈ£ »ç¿ë
			document.getElementById("EnvZip5"+e+"").value = data.postcode1; //6ÀÚ¸® ¿ìÆí¹øÈ£ »ç¿ë
			document.getElementById("EnvZip6"+e+"").value = data.postcode1; //6ÀÚ¸® ¿ìÆí¹øÈ£ »ç¿ë
			document.getElementById("cusMemo").value = data.zonecode; //5ÀÚ¸® ±âÃÊ±¸¿ª¹øÈ£ »ç¿ë*/
			//document.getElementById("Zip2").value = data.postcode2; //6ÀÚ¸® ¿ìÆí¹øÈ£ »ç¿ë
			//document.getElementById("sample6_postcode").value = data.zonecode; //5ÀÚ¸® ±âÃÊ±¸¿ª¹øÈ£ »ç¿ë
			//document.getElementById("Address").value = fullAddr;

			// Ä¿¼­¸¦ »ó¼¼ÁÖ¼Ò ÇÊµå·Î ÀÌµ¿ÇÑ´Ù.
			//document.getElementById("Address").focus();
			setZipCode(data.postcode1, data.postcode2, fullAddr, data.zonecode, e);
	}
	}).open();
}

function popDeliveryDaumZipCode(e) {
    new daum.Postcode({
        oncomplete: function(data) {
	   // ÆË¾÷¿¡¼­ °Ë»ö°á°ú Ç×¸ñÀ» Å¬¸¯ÇßÀ»¶§ ½ÇÇàÇÒ ÄÚµå¸¦ ÀÛ¼ºÇÏ´Â ºÎºÐ.

			// °¢ ÁÖ¼ÒÀÇ ³ëÃâ ±ÔÄ¢¿¡ µû¶ó ÁÖ¼Ò¸¦ Á¶ÇÕÇÑ´Ù.
			// ³»·Á¿À´Â º¯¼ö°¡ °ªÀÌ ¾ø´Â °æ¿ì¿£ °ø¹é('')°ªÀ» °¡Áö¹Ç·Î, ÀÌ¸¦ Âü°íÇÏ¿© ºÐ±â ÇÑ´Ù.
			var fullAddr = ''; // ÃÖÁ¾ ÁÖ¼Ò º¯¼ö
			var extraAddr = ''; // Á¶ÇÕÇü ÁÖ¼Ò º¯¼ö

			// »ç¿ëÀÚ°¡ ¼±ÅÃÇÑ ÁÖ¼Ò Å¸ÀÔ¿¡ µû¶ó ÇØ´ç ÁÖ¼Ò °ªÀ» °¡Á®¿Â´Ù.
			if (data.userSelectedType === 'R') { // »ç¿ëÀÚ°¡ µµ·Î¸í ÁÖ¼Ò¸¦ ¼±ÅÃÇßÀ» °æ¿ì
				fullAddr = data.roadAddress;

			} else { // »ç¿ëÀÚ°¡ Áö¹ø ÁÖ¼Ò¸¦ ¼±ÅÃÇßÀ» °æ¿ì(J)
				fullAddr = data.jibunAddress;
			}

			// »ç¿ëÀÚ°¡ ¼±ÅÃÇÑ ÁÖ¼Ò°¡ µµ·Î¸í Å¸ÀÔÀÏ¶§ Á¶ÇÕÇÑ´Ù.
			if(data.userSelectedType === 'R'){
				//¹ýÁ¤µ¿¸íÀÌ ÀÖÀ» °æ¿ì Ãß°¡ÇÑ´Ù.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// °Ç¹°¸íÀÌ ÀÖÀ» °æ¿ì Ãß°¡ÇÑ´Ù.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// Á¶ÇÕÇüÁÖ¼ÒÀÇ À¯¹«¿¡ µû¶ó ¾çÂÊ¿¡ °ýÈ£¸¦ Ãß°¡ÇÏ¿© ÃÖÁ¾ ÁÖ¼Ò¸¦ ¸¸µç´Ù.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}

			// ¿ìÆí¹øÈ£¿Í ÁÖ¼Ò Á¤º¸¸¦ ÇØ´ç ÇÊµå¿¡ ³Ö´Â´Ù.
			/*document.getElementById("EnvZip1"+e+"").value = data.postcode1; //6ÀÚ¸® ¿ìÆí¹øÈ£ »ç¿ë
			document.getElementById("EnvZip2"+e+"").value = data.postcode1; //6ÀÚ¸® ¿ìÆí¹øÈ£ »ç¿ë
			document.getElementById("EnvZip3"+e+"").value = data.postcode1; //6ÀÚ¸® ¿ìÆí¹øÈ£ »ç¿ë
			document.getElementById("EnvZip4"+e+"").value = data.postcode1; //6ÀÚ¸® ¿ìÆí¹øÈ£ »ç¿ë
			document.getElementById("EnvZip5"+e+"").value = data.postcode1; //6ÀÚ¸® ¿ìÆí¹øÈ£ »ç¿ë
			document.getElementById("EnvZip6"+e+"").value = data.postcode1; //6ÀÚ¸® ¿ìÆí¹øÈ£ »ç¿ë
			document.getElementById("cusMemo").value = data.zonecode; //5ÀÚ¸® ±âÃÊ±¸¿ª¹øÈ£ »ç¿ë*/
			//document.getElementById("Zip2").value = data.postcode2; //6ÀÚ¸® ¿ìÆí¹øÈ£ »ç¿ë
			//document.getElementById("sample6_postcode").value = data.zonecode; //5ÀÚ¸® ±âÃÊ±¸¿ª¹øÈ£ »ç¿ë
			//document.getElementById("Address").value = fullAddr;

			// Ä¿¼­¸¦ »ó¼¼ÁÖ¼Ò ÇÊµå·Î ÀÌµ¿ÇÑ´Ù.
			//document.getElementById("Address").focus();
			//setZipCode(data.postcode1, data.postcode2, fullAddr, data.zonecode, e);
			setZipCodeNew(data.postcode1, data.postcode2, fullAddr, data.zonecode, data.sido, data.sigungu, data.bname ,e)
	}
	}).open();
}

// ÅëÇÕ ¿ìÆí¹øÈ£Ã£±â ¸ð¹ÙÀÏ
function popFindZipCodeM(schWhere) {
    window.open("/mobile/script/include/findZipCode.asp?schWhere=" + schWhere, "findZipCode"); //, "width=336, height=400, scrollbars=yes, toolbars=no, left=100, top=100"
}

// ´ÙÀ½API ¿ìÆí¹øÈ£Ã£±â
function popFindDaumZipCode() {
    new daum.Postcode({
        oncomplete: function(data) {
	   // ÆË¾÷¿¡¼­ °Ë»ö°á°ú Ç×¸ñÀ» Å¬¸¯ÇßÀ»¶§ ½ÇÇàÇÒ ÄÚµå¸¦ ÀÛ¼ºÇÏ´Â ºÎºÐ.

			// °¢ ÁÖ¼ÒÀÇ ³ëÃâ ±ÔÄ¢¿¡ µû¶ó ÁÖ¼Ò¸¦ Á¶ÇÕÇÑ´Ù.
			// ³»·Á¿À´Â º¯¼ö°¡ °ªÀÌ ¾ø´Â °æ¿ì¿£ °ø¹é('')°ªÀ» °¡Áö¹Ç·Î, ÀÌ¸¦ Âü°íÇÏ¿© ºÐ±â ÇÑ´Ù.
			var fullAddr = ''; // ÃÖÁ¾ ÁÖ¼Ò º¯¼ö
			var extraAddr = ''; // Á¶ÇÕÇü ÁÖ¼Ò º¯¼ö

			// »ç¿ëÀÚ°¡ ¼±ÅÃÇÑ ÁÖ¼Ò Å¸ÀÔ¿¡ µû¶ó ÇØ´ç ÁÖ¼Ò °ªÀ» °¡Á®¿Â´Ù.
			if (data.userSelectedType === 'R') { // »ç¿ëÀÚ°¡ µµ·Î¸í ÁÖ¼Ò¸¦ ¼±ÅÃÇßÀ» °æ¿ì
				fullAddr = data.roadAddress;

			} else { // »ç¿ëÀÚ°¡ Áö¹ø ÁÖ¼Ò¸¦ ¼±ÅÃÇßÀ» °æ¿ì(J)
				fullAddr = data.jibunAddress;
			}

			// »ç¿ëÀÚ°¡ ¼±ÅÃÇÑ ÁÖ¼Ò°¡ µµ·Î¸í Å¸ÀÔÀÏ¶§ Á¶ÇÕÇÑ´Ù.
			/*if(data.userSelectedType === 'R'){
				//¹ýÁ¤µ¿¸íÀÌ ÀÖÀ» °æ¿ì Ãß°¡ÇÑ´Ù.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// °Ç¹°¸íÀÌ ÀÖÀ» °æ¿ì Ãß°¡ÇÑ´Ù.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// Á¶ÇÕÇüÁÖ¼ÒÀÇ À¯¹«¿¡ µû¶ó ¾çÂÊ¿¡ °ýÈ£¸¦ Ãß°¡ÇÏ¿© ÃÖÁ¾ ÁÖ¼Ò¸¦ ¸¸µç´Ù.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}*/

			// ¿ìÆí¹øÈ£¿Í ÁÖ¼Ò Á¤º¸¸¦ ÇØ´ç ÇÊµå¿¡ ³Ö´Â´Ù.
			//document.getElementById("Zip1").value = data.postcode1; //6ÀÚ¸® ¿ìÆí¹øÈ£ »ç¿ë
			//document.getElementById("Zip2").value = data.postcode2; //6ÀÚ¸® ¿ìÆí¹øÈ£ »ç¿ë
			//document.getElementById("sample6_postcode").value = data.zonecode; //5ÀÚ¸® ±âÃÊ±¸¿ª¹øÈ£ »ç¿ë
			document.getElementById("Address").value = fullAddr;

			// Ä¿¼­¸¦ »ó¼¼ÁÖ¼Ò ÇÊµå·Î ÀÌµ¿ÇÑ´Ù.
			document.getElementById("Address").focus();
	}
	}).open();
}

// ´ÙÀ½API ¿ìÆí¹øÈ£Ã£±â ·¹ÀÌ¾î
function popFindDaumZipCode_layer() {
    // ÆË¾÷ Element
    var el_wrap = document.getElementById('popZipCode');

    new daum.Postcode({
        oncomplete: function(data) {
	   // ÆË¾÷¿¡¼­ °Ë»ö°á°ú Ç×¸ñÀ» Å¬¸¯ÇßÀ»¶§ ½ÇÇàÇÒ ÄÚµå¸¦ ÀÛ¼ºÇÏ´Â ºÎºÐ.

			// °¢ ÁÖ¼ÒÀÇ ³ëÃâ ±ÔÄ¢¿¡ µû¶ó ÁÖ¼Ò¸¦ Á¶ÇÕÇÑ´Ù.
			// ³»·Á¿À´Â º¯¼ö°¡ °ªÀÌ ¾ø´Â °æ¿ì¿£ °ø¹é('')°ªÀ» °¡Áö¹Ç·Î, ÀÌ¸¦ Âü°íÇÏ¿© ºÐ±â ÇÑ´Ù.
			var fullAddr = ''; // ÃÖÁ¾ ÁÖ¼Ò º¯¼ö
			var extraAddr = ''; // Á¶ÇÕÇü ÁÖ¼Ò º¯¼ö

			// »ç¿ëÀÚ°¡ ¼±ÅÃÇÑ ÁÖ¼Ò Å¸ÀÔ¿¡ µû¶ó ÇØ´ç ÁÖ¼Ò °ªÀ» °¡Á®¿Â´Ù.
			if (data.userSelectedType === 'R') { // »ç¿ëÀÚ°¡ µµ·Î¸í ÁÖ¼Ò¸¦ ¼±ÅÃÇßÀ» °æ¿ì
				fullAddr = data.roadAddress;

			} else { // »ç¿ëÀÚ°¡ Áö¹ø ÁÖ¼Ò¸¦ ¼±ÅÃÇßÀ» °æ¿ì(J)
				fullAddr = data.jibunAddress;
			}

			// »ç¿ëÀÚ°¡ ¼±ÅÃÇÑ ÁÖ¼Ò°¡ µµ·Î¸í Å¸ÀÔÀÏ¶§ Á¶ÇÕÇÑ´Ù.
			/*if(data.userSelectedType === 'R'){
				//¹ýÁ¤µ¿¸íÀÌ ÀÖÀ» °æ¿ì Ãß°¡ÇÑ´Ù.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// °Ç¹°¸íÀÌ ÀÖÀ» °æ¿ì Ãß°¡ÇÑ´Ù.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// Á¶ÇÕÇüÁÖ¼ÒÀÇ À¯¹«¿¡ µû¶ó ¾çÂÊ¿¡ °ýÈ£¸¦ Ãß°¡ÇÏ¿© ÃÖÁ¾ ÁÖ¼Ò¸¦ ¸¸µç´Ù.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}*/

			// ¿ìÆí¹øÈ£¿Í ÁÖ¼Ò Á¤º¸¸¦ ÇØ´ç ÇÊµå¿¡ ³Ö´Â´Ù.
			//document.getElementById("Zip1").value = data.postcode1; //6ÀÚ¸® ¿ìÆí¹øÈ£ »ç¿ë
			//document.getElementById("Zip2").value = data.postcode2; //6ÀÚ¸® ¿ìÆí¹øÈ£ »ç¿ë
			//document.getElementById("sample6_postcode").value = data.zonecode; //5ÀÚ¸® ±âÃÊ±¸¿ª¹øÈ£ »ç¿ë
			document.getElementById("Address").value = fullAddr;

			// Ä¿¼­¸¦ »ó¼¼ÁÖ¼Ò ÇÊµå·Î ÀÌµ¿ÇÑ´Ù.
            document.getElementById("Address").focus();
    },
    onclose:function(state){ // »ç¿ëÀÚ°¡ ÁÖ¼Ò¸¦ ¼±ÅÃÇØ¼­ ·¹ÀÌ¾î¸¦ ´ÝÀ» °æ¿ì ½ÇÇàµÊ.
        if(state === "COMPLETE_CLOSE"){
            $.fancybox.close();
        }
    }
    }).embed(el_wrap);

    $.fancybox({
        href		: "#popZipCode",
        padding     : 0,
        margin      : 0,
        fitToView	: false,
        autoSize	: true,
        closeClick	: false,
        openEffect	: 'none',
        closeEffect	: 'none',
        type		: 'inline',
        helpers:  {
            overlay: {
                locked: true,
                speedOut: 0
            }
        },
        afterShow: function () {
			$(".fancybox-item.fancybox-close").addClass("custom01");
		},
		beforeShow: function () {
			$(".fancybox-skin").addClass("custom01");
		}
    });
}

// ºê¶ó¿ìÀúº° Áñ°ÜÃ£±â Ãß°¡
function addFavorite(url, title) {
    if (!url) { url = window.location }
    if (!title) { title = document.title }
    var browser = navigator.userAgent.toLowerCase();
    if (window.sidebar) {
        // Mozilla, Firefox, Netscape
        window.sidebar.addPanel(title, url, "");
    } else if (window.external) {
        // IE or chrome
        if (browser.indexOf('chrome') == -1) { // ie
            window.external.AddFavorite(url, title);
        } else {
            // chrome
            alert('¾Æ¸§´Ù¿î Ã»Ã¸Àå ÀÕÃ÷Ä«µå À¥»çÀÌÆ®¸¦ Áñ°ÜÃ£±â¿¡\n´ãÀ¸½Ã·Á¸é, CTRL+B(¶Ç´Â Commend Mac¿ë+D)¸¦\nÀÌ¿ëÇÏ¿© Ãß°¡ ÇØÁÖ¼¼¿ä.');
        }
    }
    else if (window.opera && window.print) {
        // Opera - automatically adds to sidebar if rel=sidebar in the tag
        return true;
    }
    else if (browser.indexOf('konqueror') != -1) { // Konqueror
        alert('¾Æ¸§´Ù¿î Ã»Ã¸Àå ÀÕÃ÷Ä«µå À¥»çÀÌÆ®¸¦ Áñ°ÜÃ£±â¿¡\n´ãÀ¸½Ã·Á¸é, CTRL+B¸¦ ÀÌ¿ëÇÏ¿© Ãß°¡ ÇØÁÖ¼¼¿ä.');
    }
    else if (browser.indexOf('webkit') != -1) { // safari
        alert('¾Æ¸§´Ù¿î Ã»Ã¸Àå ÀÕÃ÷Ä«µå À¥»çÀÌÆ®¸¦ Áñ°ÜÃ£±â¿¡\n´ãÀ¸½Ã·Á¸é, CTRL+B(¶Ç´Â Commend Mac¿ë+D)¸¦\nÀÌ¿ëÇÏ¿© Ãß°¡ ÇØÁÖ¼¼¿ä.');
    } else {
        alert('»ç¿ëÇÏ°í °è½Å ºê¶ó¿ìÀú°¡ ºÏ¸¶Å©±â´ÉÀ» Áö¿øÇÏÁö\n¾Ê½À´Ï´Ù. ¼öµ¿À¸·Î À¥»çÀÌÆ®¸¦ Ãß°¡ ÇØÁÖ¼¼¿ä.')
    }
}

function viewCompanyISO() {
    window.open("/script/include/popViewImage.asp?imgSrc=/image/popup/img_accredit.gif", "popCompanyISO", "width=550, height=680, left=0, top=0");
}

function viewSpecialProduct(arrimg) { // »óÇ° Å©°Ôº¸±â
    window.open("/script/include/popViewImage.asp?imgSrc=" + arrimg, "viewSpecialProduct", "width=570, height=350");
}

function sendJS(src) {
    var head = document.getElementsByTagName('head')[0];
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = src;
    head.appendChild(script)
}

function popGreet() {
    window.open("/script/order/popGreet.asp?CardDv=1", "popGreet", "width=550, height=550, left=0, top=0");
}


/* ======================= 2020.02.06 ÀüÈ­¹øÈ£ Á¤±Ô½Ä Ãß°¡ ============================*/

function OnCheckPhone(oTa) { 
	var oForm = oTa.form ; 
	var sMsg = oTa.value ; 
	var onlynum = "" ; 
	var imsi=0; 
	onlynum = RemoveDash2(sMsg);  //ÇÏÀÌÇÂ ÀÔ·Â½Ã ÀÚµ¿À¸·Î »èÁ¦ÇÔ 
	onlynum =  checkDigit(onlynum);  // ¼ýÀÚ¸¸ ÀÔ·Â¹Þ°Ô ÇÔ 
	var retValue = ""; 

	if(event.keyCode != 12 ) { 
		if(onlynum.substring(0,2) == 02) {  // ¼­¿ïÀüÈ­¹øÈ£ÀÏ °æ¿ì  10ÀÚ¸®±îÁö¸¸ ³ªÅ¸³ª±³ ±× ÀÌ»óÀÇ ÀÚ¸®¼ö´Â ÀÚµ¿»èÁ¦ 
				if (GetMsgLen(onlynum) <= 1) oTa.value = onlynum ; 
				if (GetMsgLen(onlynum) == 2) oTa.value = onlynum + "-"; 
				if (GetMsgLen(onlynum) == 4) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,3) ; 
				if (GetMsgLen(onlynum) == 4) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,4) ; 
				if (GetMsgLen(onlynum) == 5) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,5) ; 
				if (GetMsgLen(onlynum) == 6) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,6) ; 
				if (GetMsgLen(onlynum) == 7) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,5) + "-" + onlynum.substring(5,7) ; ; 
				if (GetMsgLen(onlynum) == 8) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,6) + "-" + onlynum.substring(6,8) ; 
				if (GetMsgLen(onlynum) == 9) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,5) + "-" + onlynum.substring(5,9) ; 
				if (GetMsgLen(onlynum) == 10) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,6) + "-" + onlynum.substring(6,10) ; 
				if (GetMsgLen(onlynum) == 11) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,6) + "-" + onlynum.substring(6,10) ; 
				if (GetMsgLen(onlynum) == 12) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,6) + "-" + onlynum.substring(6,10) ; 
		} 
		if(onlynum.substring(0,2) == 05 ) {  // 05·Î ½ÃÀÛµÇ´Â ¹øÈ£ Ã¼Å© 
			if(onlynum.substring(2,3) == 0 ) {  // 050À¸·Î ½ÃÀÛµÇ´ÂÁö µûÁö±â À§ÇÑ Á¶°Ç¹® 
					if (GetMsgLen(onlynum) <= 3) oTa.value = onlynum ; 
					if (GetMsgLen(onlynum) == 4) oTa.value = onlynum + "-"; 
					if (GetMsgLen(onlynum) == 5) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,5) ; 
					if (GetMsgLen(onlynum) == 6) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,6) ; 
					if (GetMsgLen(onlynum) == 7) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,7) ; 
					if (GetMsgLen(onlynum) == 8) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,8) ; 
					if (GetMsgLen(onlynum) == 9) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,7) + "-" + onlynum.substring(7,9) ; ; 
					if (GetMsgLen(onlynum) == 10) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,8) + "-" + onlynum.substring(8,10) ; 
					if (GetMsgLen(onlynum) == 11) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,7) + "-" + onlynum.substring(7,11) ; 
					if (GetMsgLen(onlynum) == 12) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,8) + "-" + onlynum.substring(8,12) ; 
					if (GetMsgLen(onlynum) == 13) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,8) + "-" + onlynum.substring(8,12) ; 
		  } else { 
				if (GetMsgLen(onlynum) <= 2) oTa.value = onlynum ; 
				if (GetMsgLen(onlynum) == 3) oTa.value = onlynum + "-"; 
				if (GetMsgLen(onlynum) == 4) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,4) ; 
				if (GetMsgLen(onlynum) == 5) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,5) ; 
				if (GetMsgLen(onlynum) == 6) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) ; 
				if (GetMsgLen(onlynum) == 7) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) ; 
				if (GetMsgLen(onlynum) == 8) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) + "-" + onlynum.substring(6,8) ; ; 
				if (GetMsgLen(onlynum) == 9) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,9) ; 
				if (GetMsgLen(onlynum) == 10) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) + "-" + onlynum.substring(6,10) ; 
				if (GetMsgLen(onlynum) == 11) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,11) ; 
				if (GetMsgLen(onlynum) == 12) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,11) ; 
		  } 
		} 

		if(onlynum.substring(0,2) == 03 || onlynum.substring(0,2) == 04  || onlynum.substring(0,2) == 06  || onlynum.substring(0,2) == 07  || onlynum.substring(0,2) == 08 ) {  // ¼­¿ïÀüÈ­¹øÈ£°¡ ¾Æ´Ñ ¹øÈ£ÀÏ °æ¿ì(070,080Æ÷ÇÔ // 050¹øÈ£°¡ ¹®Á¦±º¿ä) 
				if (GetMsgLen(onlynum) <= 2) oTa.value = onlynum ; 
				if (GetMsgLen(onlynum) == 3) oTa.value = onlynum + "-"; 
				if (GetMsgLen(onlynum) == 4) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,4) ; 
				if (GetMsgLen(onlynum) == 5) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,5) ; 
				if (GetMsgLen(onlynum) == 6) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) ; 
				if (GetMsgLen(onlynum) == 7) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) ; 
				if (GetMsgLen(onlynum) == 8) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) + "-" + onlynum.substring(6,8) ; ; 
				if (GetMsgLen(onlynum) == 9) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,9) ; 
				if (GetMsgLen(onlynum) == 10) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) + "-" + onlynum.substring(6,10) ; 
				if (GetMsgLen(onlynum) == 11) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,11) ; 
				if (GetMsgLen(onlynum) == 12) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,11) ; 

		} 
		if(onlynum.substring(0,2) == 01) {  //ÈÞ´ëÆùÀÏ °æ¿ì 
			if (GetMsgLen(onlynum) <= 2) oTa.value = onlynum ; 
			if (GetMsgLen(onlynum) == 3) oTa.value = onlynum + "-"; 
			if (GetMsgLen(onlynum) == 4) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,4) ; 
			if (GetMsgLen(onlynum) == 5) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,5) ; 
			if (GetMsgLen(onlynum) == 6) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) ; 
			if (GetMsgLen(onlynum) == 7) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) ; 
			if (GetMsgLen(onlynum) == 8) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,8) ; 
			if (GetMsgLen(onlynum) == 9) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,9) ; 
			if (GetMsgLen(onlynum) == 10) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) + "-" + onlynum.substring(6,10) ; 
			if (GetMsgLen(onlynum) == 11) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,11) ; 
			if (GetMsgLen(onlynum) == 12) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,11) ; 
		} 

		if(onlynum.substring(0,1) == 1) {  // 1588, 1688µîÀÇ ¹øÈ£ÀÏ °æ¿ì 
			if (GetMsgLen(onlynum) <= 3) oTa.value = onlynum ; 
			if (GetMsgLen(onlynum) == 4) oTa.value = onlynum + "-"; 
			if (GetMsgLen(onlynum) == 5) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,5) ; 
			if (GetMsgLen(onlynum) == 6) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,6) ; 
			if (GetMsgLen(onlynum) == 7) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,7) ; 
			if (GetMsgLen(onlynum) == 8) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,8) ; 
			if (GetMsgLen(onlynum) == 9) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,8) ; 
			if (GetMsgLen(onlynum) == 10) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,8) ; 
			if (GetMsgLen(onlynum) == 11) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,8) ; 
			if (GetMsgLen(onlynum) == 12) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,8) ; 
		} 
	} 
} 

function RemoveDash2(sNo) { 
	var reNo = "" 
	for(var i=0; i<sNo.length; i++) { 
		if ( sNo.charAt(i) != "-" ) { 
		reNo += sNo.charAt(i) 
		} 
	} 
	return reNo 
} 

function GetMsgLen(sMsg) { // 0-127 1byte, 128~ 2byte 
	var count = 0 
		for(var i=0; i<sMsg.length; i++) { 
			if ( sMsg.charCodeAt(i) > 127 ) { 
				count += 2 
			} 
			else { 
				count++ 
			} 
		} 
	return count 
} 

function checkDigit(num) { 
	var Digit = "1234567890"; 
	var string = num; 
	var len = string.length 
	var retVal = ""; 

	for (i = 0; i < len; i++) 
	{ 
		if (Digit.indexOf(string.substring(i, i+1)) >= 0) 
		{ 
			retVal = retVal + string.substring(i, i+1); 
		} 
	} 
	return retVal; 
} 

/* ======================= 2020.02.06 ÀüÈ­¹øÈ£ Á¤±Ô½Ä Ãß°¡ ============================*/



/* ================================ 2019.12.10 Ãß°¡ ================================  */
// Ä«µå ¹Ì¸®º¸±â ÇÔ¼ö
function getGalleryPop(ccode, sheet){
    var sheet = sheet ? sheet : 300;
    
	$.ajax({
		type:"GET",
		url:"/script/card/popCardImg.asp?CardCode="+escape(ccode)+"&Sheet="+sheet,
		dataType: "text",
		async: true,
		error:function(req, s, e) {
			console.log(req.responseText);
			//console.log(s);
			//console.log(e);
		},
		success:function(data){
			$("#PreviewPop").prepend(data);
			layerPop();
		},
		beforeSend:function(){
			$("#PreviewPop").empty();
		},
		complete:function(){
			boxShare();
		}
	});

	function layerPop() {
		// layer popup Ã³¸®
		$.fancybox({
			href		: "#PreviewPop",
			padding     : 0,
			margin      : 50,
			fitToView	: false,
			width		: 1140,
			height		: 'auto',
			autoSize	: false,
			closeClick	: false,
			openEffect	: 'none',
			closeEffect	: 'none',
			type		: 'inline',
			helpers:  {
				overlay: {
					locked: true,
					speedOut: 0,
					css: {
						background:'rgba(255, 255, 255, .4)',
					}
				}
			},
			afterShow: function () {
				$(".fancybox-item.fancybox-close").addClass("custom01");
			},
			beforeShow: function () {
				$(".fancybox-skin").addClass("custom01");
			}
		});	
	}
}

function showCardImgs(k) {
	var el = $('.thumb-img-list').find('li'),
		bg = el.eq(k).find('.thumb').css('background-image');
		el.removeClass('active');
		el.eq(k).addClass('active');

	try {			
		$("#divDetBig").css('background-image', bg);
	} catch (e) { }
}

function ftcOpen(url) {
    window.open(url, "PopupWin", "scrollbars=yes,resizable=yes,top=0,left=0,width=750,height=750");
}