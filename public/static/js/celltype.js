function check() {
    $("#celltypeform").submit();
    $("#celltypeform").submit(function () {
        alert("cccc");
        $.ajax({
            type: "POST",
            url: $("#celltypeform").attr('action'),
            data: $('#celltypeform').serialize(),
            error: function (request) {
                alert("failed");
            },
            success: function (data) {
                alert("suceess:" + data);
            }
        });
    });
}

