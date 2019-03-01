$(document).ready(function() {
	$('#add').click(function() {
		if ($('#url').val() == "") {
			// alert("请选择分类！");
			// document.getElementById("message").innerHTML = "名称不能为空！";
			$('#url').focus();
			return false;
		}
	});
	
	$('#add1').click(function() {
		if ($('#url1').val() == "") {
			// alert("请选择分类！");
			// document.getElementById("message").innerHTML = "名称不能为空！";
			$('#url1').focus();
			return false;
		}
	});
});




