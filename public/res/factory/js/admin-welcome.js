$(document).ready(function() {
	$('#add').click(function() {
		if ($('#proimg1').val() == "") {
			// alert("请选择分类！");
			// document.getElementById("message").innerHTML = "名称不能为空！";
			$('#proimg1').focus();
			return false;
		}
		$('#addFrom').submit();
	});
});

function delDlg(s1) {
	$('.dlg-content1').fadeIn(100);
//	$('.dlg-mask').fadeIn(100);
	// 设置初始值
	document.getElementById("imageID").value = s1;
}

function closeDlg() {
	$('.dlg-content1').fadeOut(100);
}
