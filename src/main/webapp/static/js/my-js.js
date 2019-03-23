function showMessage(message) {
    var messageBlock = $("#message");
    messageBlock.css("visibility", "visible");
    messageBlock.text(message);
}
function myAjax(obj, finalDo) {
	var ajaxArgs = {
		cache: false,
		dataType: "json",
		timeout: 5000,
		error: function(XMLHttpRequest, textStatus, errorThrown) {
            showMessage(XMLHttpRequest.responseJSON.message);
            if (typeof finalDo === 'function') {
                finalDo();
            }
        },
        complete: function(XMLHttpRequest, status) {
            if(status === "timeout") {
                ajaxTask.abort();
                showMessage("请求超时！请重试！");
                if (typeof finalDo === 'function') {
                    finalDo();
                }
            }
        }
	};
	$.ajax($.extend(ajaxArgs, obj));
}
function moralLoad(obj, url) {
	$(obj).load(url);
}
function checkLength(str, min, max) {
    if (str != null && str.length >= min && str.length <= max) {
        return true;
    }
    return false;
}
function updateCaptcha() {
    $("#captchaImg").attr("src", "captcha?" + Math.ceil(Math.random()*100000));
    $("input[name='captcha']").val('');
}
function getQueryString(name) {
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null)
        return r[2];
    return null;
}