
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
                alert("XMLHTTP가 정상적으로 설치되어 있지 않습니다. 도구메뉴에서 Windows Update를 수행 후 진행하시기 바랍니다.");
            }
        }
    }
    return xmlhttp;
}

function getPageHtml(page, querystring, spanID, method, loadFlag, scFlag, loadImg) {
    /*
    getPageHtml("a.asp?" + getFormQueryString(frm), "", document.all.divList, "GET");	Request.QueryString
    getPageHtml("a.asp", getFormQueryString(frm), document.all.divList, "POST");		Request.Form
	
    page : ajax 페이지
    querystring : post일경우 쿼리스트링 => getFormQueryString(frm)
    spanID : 대상DIV
    method : request방법
    loadFlag : 로딩기다릴래? false:기다려 true:안기다려
    scFlag : scrollIntoView true:포커스따라가기
    loadImg : txt : 텍스트로.. img : 이미지로...
    */
    if (loadImg == "txt")
        spanID.innerHTML = "<div align=centr><b>로딩중입니다...</b></div>";
    else if (loadImg == "img")
        spanID.innerHTML = "<div align=center><br><img src='/image/common/loading.gif' valign=absmiddle></div>";


    var oXML = getXmlHttpRequest();

    if (method != "GET") method = "POST";
    if (loadFlag != false) loadFlag = true;

    oXML.open(method, page, loadFlag);
    oXML.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=euc-kr');
    oXML.onreadystatechange = function () {
        if (oXML.readyState != 4) return;
        if (oXML.status == 200) { //200 = 정상처리
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
                alert("page : " + page + "\n\n" + "code : " + oXML.status + "\n\n잠시 통신에러가 발생했습니다. \n\n잠시후 다시 사용해 주세요");
            }
        }
    }
    //oXML.send('');
    oXML.send(querystring);
}

// The var docForm should be a reference to a <form> 폼값전부..가져오기
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
function numberFormat(val) { // 3자리마다 , 찍기
    val = '' + val; // val을 string으로 강제형변환
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
		alert ( msg + "입력하세요" );
		obj.focus();
		obj.select();
		return true;
	}
	return false;
}

function illegalCheckLen(obj, msg, minlen, maxlen) {
    if (nullCheck(obj, msg + "를 ")) return true;
    if (obj.value.length < minlen || obj.value.length > maxlen) {
        alert(msg + " 길이는 최소 " + minlen + "자 이상, 최대 " + maxlen + "자 이하 이어야 합니다.");
        obj.select();
        obj.focus();
        return true;
    }
    return false;
}

function space_check(obj, msg) {
    for (var i = 0; i < obj.value.length; i++) {
        if (obj.value.charAt(i) == ' ') {
            alert(msg + " 에는 빈공간을 입력하실 수 없습니다.");
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
            alert(msg + " 영문/숫자만 입력하세요");
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
    var deny_pattern = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/;

    //var deny_pattern = /[^(0-9)]/;  //숫자만 허용 하고 싶을때
    if (deny_pattern.test(inText)) {
        alert(msg + "한글만 입력하세요");
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
            alert(msg + " 영문만 입력하세요");
            obj.select();
            obj.focus();
            return true;
        }
    }
    return false;
}


//	두 객체의 value값이 다른지 검사한다
function objectValueDifferent(obj1, obj2, msg) {
    if (obj1.value != obj2.value) {
        alert(msg);
        obj1.focus();
        obj1.select();
        return true;
    }
    return false;
}

//	mememail이 아니면 true를 return
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
        alert("잘못된 E-mail입니다.");
        obj.select();
        obj.focus();
        return true;
    }
    return false;
}

//	숫자만 넣게 한다.
function NotANumber(obj, msg) {
    if (nullCheck(obj, msg)) return true;

    for (var i = 0; i < obj.value.length; i++) {
        if (obj.value.charAt(i) < '0' || obj.value.charAt(i) > '9') {
            alert(msg + " 숫자만 입력하세요");
            obj.select();
            obj.focus();
            return true;
        }
    }
    return false;
}

// 체크박스 All 선택..
var chkvalue = false;
function allSelect(fName) {
    try {
        if (!chkvalue) { chkvalue = true; }
        else { chkvalue = false; }
        if (fName.length > 0) { for (i = 0; i < fName.length; i++) { fName[i].checked = chkvalue; } }
        else { fName.checked = chkvalue; }
    } catch (e) { return; }
}

// 체크박스 All 선택 Func - 2019.11.15 수정 allbox=전체선택, target=checkbox, cb=콜백
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

// 샘플카트 찜리스트 체크박스 All 선택 Func - 2019.11.18 수정 allbox=전체선택, target=checkbox, cb=콜백
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

// 샘플카트, 찜리스트 체크박스 선택여부
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

// 샘플카트, 찜리스트 체크박스 Func
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

//체크박스에 하나이상 체크하도록 
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
        alert(InMsg + ' 선택해 주세요.');
        return true;
    }
}

function onlyNumber(key, obj) {
    // 백스패이스) = 8 TAB = 9 END = 35 HOME =36  ← = 37 →  = 39 INSERT = 45 DELETE = 46 NUMLOCK = 144
    if (event.keyCode < 48 || (event.keyCode > 57 && event.keyCode < 96) || event.keyCode > 105) {
        if (!(key == 8 || key == 9 || key == 13 || key == 46 || key == 144 || (key >= 48 && key <= 57) || key == 110 || key == 190)) {
            //alert('숫자만 입력 가능합니다');
            event.returnValue = false;
        }
    }
}

function onlyEngKor(obj, msg) {
    var inText = obj.value;
    var deny_pattern = /[^(가-힣a-zA-Z)]/;
    //var deny_pattern = /[^(0-9)]/;  //숫자만 허용 하고 싶을때
    if (deny_pattern.test(inText)) {
        alert(msg + "영문자와 한글만을 입력하세요");
        obj.select();
        obj.focus();
        return true;
    }
    return false;
}

function nullCheck2(obj, msg) {
    if (obj.value == "") {
        alert(msg + "선택하세요");
        obj.focus();
        return true;
    }
    return false;
}

// 통합 우편번호찾기
function popFindZipCode(schWhere) {
    window.open("/script/include/findZipCode.asp?schWhere=" + schWhere, "findZipCode", "width=450, height=400, scrollbars=yes, toolbars=no, left=100, top=100");
}

function popOrderDaumZipCode(e) {
    new daum.Postcode({
        oncomplete: function(data) {
	   // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if(data.userSelectedType === 'R'){
				//법정동명이 있을 경우 추가한다.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			/*document.getElementById("EnvZip1"+e+"").value = data.postcode1; //6자리 우편번호 사용
			document.getElementById("EnvZip2"+e+"").value = data.postcode1; //6자리 우편번호 사용
			document.getElementById("EnvZip3"+e+"").value = data.postcode1; //6자리 우편번호 사용
			document.getElementById("EnvZip4"+e+"").value = data.postcode1; //6자리 우편번호 사용
			document.getElementById("EnvZip5"+e+"").value = data.postcode1; //6자리 우편번호 사용
			document.getElementById("EnvZip6"+e+"").value = data.postcode1; //6자리 우편번호 사용
			document.getElementById("cusMemo").value = data.zonecode; //5자리 기초구역번호 사용*/
			//document.getElementById("Zip2").value = data.postcode2; //6자리 우편번호 사용
			//document.getElementById("sample6_postcode").value = data.zonecode; //5자리 기초구역번호 사용
			//document.getElementById("Address").value = fullAddr;

			// 커서를 상세주소 필드로 이동한다.
			//document.getElementById("Address").focus();
			setZipCode(data.postcode1, data.postcode2, fullAddr, data.zonecode, e);
	}
	}).open();
}

function popDeliveryDaumZipCode(e) {
    new daum.Postcode({
        oncomplete: function(data) {
	   // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if(data.userSelectedType === 'R'){
				//법정동명이 있을 경우 추가한다.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			/*document.getElementById("EnvZip1"+e+"").value = data.postcode1; //6자리 우편번호 사용
			document.getElementById("EnvZip2"+e+"").value = data.postcode1; //6자리 우편번호 사용
			document.getElementById("EnvZip3"+e+"").value = data.postcode1; //6자리 우편번호 사용
			document.getElementById("EnvZip4"+e+"").value = data.postcode1; //6자리 우편번호 사용
			document.getElementById("EnvZip5"+e+"").value = data.postcode1; //6자리 우편번호 사용
			document.getElementById("EnvZip6"+e+"").value = data.postcode1; //6자리 우편번호 사용
			document.getElementById("cusMemo").value = data.zonecode; //5자리 기초구역번호 사용*/
			//document.getElementById("Zip2").value = data.postcode2; //6자리 우편번호 사용
			//document.getElementById("sample6_postcode").value = data.zonecode; //5자리 기초구역번호 사용
			//document.getElementById("Address").value = fullAddr;

			// 커서를 상세주소 필드로 이동한다.
			//document.getElementById("Address").focus();
			//setZipCode(data.postcode1, data.postcode2, fullAddr, data.zonecode, e);
			setZipCodeNew(data.postcode1, data.postcode2, fullAddr, data.zonecode, data.sido, data.sigungu, data.bname ,e)
	}
	}).open();
}

// 통합 우편번호찾기 모바일
function popFindZipCodeM(schWhere) {
    window.open("/mobile/script/include/findZipCode.asp?schWhere=" + schWhere, "findZipCode"); //, "width=336, height=400, scrollbars=yes, toolbars=no, left=100, top=100"
}

// 다음API 우편번호찾기
function popFindDaumZipCode() {
    new daum.Postcode({
        oncomplete: function(data) {
	   // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			/*if(data.userSelectedType === 'R'){
				//법정동명이 있을 경우 추가한다.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}*/

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			//document.getElementById("Zip1").value = data.postcode1; //6자리 우편번호 사용
			//document.getElementById("Zip2").value = data.postcode2; //6자리 우편번호 사용
			//document.getElementById("sample6_postcode").value = data.zonecode; //5자리 기초구역번호 사용
			document.getElementById("Address").value = fullAddr;

			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("Address").focus();
	}
	}).open();
}

// 다음API 우편번호찾기 레이어
function popFindDaumZipCode_layer() {
    // 팝업 Element
    var el_wrap = document.getElementById('popZipCode');

    new daum.Postcode({
        oncomplete: function(data) {
	   // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			/*if(data.userSelectedType === 'R'){
				//법정동명이 있을 경우 추가한다.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}*/

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			//document.getElementById("Zip1").value = data.postcode1; //6자리 우편번호 사용
			//document.getElementById("Zip2").value = data.postcode2; //6자리 우편번호 사용
			//document.getElementById("sample6_postcode").value = data.zonecode; //5자리 기초구역번호 사용
			document.getElementById("Address").value = fullAddr;

			// 커서를 상세주소 필드로 이동한다.
            document.getElementById("Address").focus();
    },
    onclose:function(state){ // 사용자가 주소를 선택해서 레이어를 닫을 경우 실행됨.
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

// 브라우저별 즐겨찾기 추가
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
            alert('아름다운 청첩장 잇츠카드 웹사이트를 즐겨찾기에\n담으시려면, CTRL+B(또는 Commend Mac용+D)를\n이용하여 추가 해주세요.');
        }
    }
    else if (window.opera && window.print) {
        // Opera - automatically adds to sidebar if rel=sidebar in the tag
        return true;
    }
    else if (browser.indexOf('konqueror') != -1) { // Konqueror
        alert('아름다운 청첩장 잇츠카드 웹사이트를 즐겨찾기에\n담으시려면, CTRL+B를 이용하여 추가 해주세요.');
    }
    else if (browser.indexOf('webkit') != -1) { // safari
        alert('아름다운 청첩장 잇츠카드 웹사이트를 즐겨찾기에\n담으시려면, CTRL+B(또는 Commend Mac용+D)를\n이용하여 추가 해주세요.');
    } else {
        alert('사용하고 계신 브라우저가 북마크기능을 지원하지\n않습니다. 수동으로 웹사이트를 추가 해주세요.')
    }
}

function viewCompanyISO() {
    window.open("/script/include/popViewImage.asp?imgSrc=/image/popup/img_accredit.gif", "popCompanyISO", "width=550, height=680, left=0, top=0");
}

function viewSpecialProduct(arrimg) { // 상품 크게보기
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


/* ======================= 2020.02.06 전화번호 정규식 추가 ============================*/

function OnCheckPhone(oTa) { 
	var oForm = oTa.form ; 
	var sMsg = oTa.value ; 
	var onlynum = "" ; 
	var imsi=0; 
	onlynum = RemoveDash2(sMsg);  //하이픈 입력시 자동으로 삭제함 
	onlynum =  checkDigit(onlynum);  // 숫자만 입력받게 함 
	var retValue = ""; 

	if(event.keyCode != 12 ) { 
		if(onlynum.substring(0,2) == 02) {  // 서울전화번호일 경우  10자리까지만 나타나교 그 이상의 자리수는 자동삭제 
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
		if(onlynum.substring(0,2) == 05 ) {  // 05로 시작되는 번호 체크 
			if(onlynum.substring(2,3) == 0 ) {  // 050으로 시작되는지 따지기 위한 조건문 
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

		if(onlynum.substring(0,2) == 03 || onlynum.substring(0,2) == 04  || onlynum.substring(0,2) == 06  || onlynum.substring(0,2) == 07  || onlynum.substring(0,2) == 08 ) {  // 서울전화번호가 아닌 번호일 경우(070,080포함 // 050번호가 문제군요) 
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
		if(onlynum.substring(0,2) == 01) {  //휴대폰일 경우 
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

		if(onlynum.substring(0,1) == 1) {  // 1588, 1688등의 번호일 경우 
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

/* ======================= 2020.02.06 전화번호 정규식 추가 ============================*/



/* ================================ 2019.12.10 추가 ================================  */
// 카드 미리보기 함수
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
		// layer popup 처리
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