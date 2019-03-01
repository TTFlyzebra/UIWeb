$(document).ready(function() {
	$('#add').click(function() {
		if ($('#file1').val() == "") {
			// alert("请选择分类！");
			// document.getElementById("message").innerHTML = "名称不能为空！";
			$('#file1').focus();
			return false;
		}
		if ($('#file2').val() == "") {
			// alert("请选择分类！");
			// document.getElementById("message").innerHTML = "名称不能为空！";
			$('#file2').focus();
			return false;
		}
		$('#addfrom').submit();
	});
});

function postdel(s1) {
	$.ajax({
		url: ajaxurl,
		type: 'post',
		data: "id="+s1,
		success: function(){
			parent.location.reload();
			window.location.reload();
		},
		dataType: 'html'
	});
} 




