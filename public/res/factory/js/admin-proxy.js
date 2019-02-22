$(document).ready(function() {
	$('#add').click(function() {
		if ($('#porxy').val() == "") {
			// alert("请选择分类！");
			// document.getElementById("message").innerHTML = "名称不能为空！";
			$('#porxy').focus();
			return false;
		}
		if ($('#port').val() == "") {
			// alert("请选择分类！");
			// document.getElementById("message").innerHTML = "名称不能为空！";
			$('#port').focus();
			return false;
		}
	});
});




