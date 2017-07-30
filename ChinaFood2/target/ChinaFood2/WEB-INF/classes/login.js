/**
 * Created by huyu on 2017/6/26.
 */
$(document).ready(function () {
    $("#name").focus(function () {
        $(this).next().css("display", "none");
        $(this).parent().css("border-color", "#2fb2f5");
    });
    $("#name").blur(function () {
        $(this).parent().css("border-color", "#DDDDDD");
        var name = $(this).val();
        if (!/^[A-Za-z\d]{5,16}$/.test(name)) {
            $(this).next().css("display", "block");

        }
    });

    $("#password").focus(function () {
        $(this).next().css("display", "none");
        $(this).parent().css("border-color", "#2fb2f5");
    });

    $("#password").blur(function () {
        $(this).parent().css("border-color", "#DDDDDD");
        var name = $(this).val();
        if (!/^[A-Za-z\d]{5,16}$/.test(name)) {
            $(this).next().css("display", "block");
        }
    });

    $(".login").click(function () {
        var name = $("#name").val();
        var password = $("#password").val();
        $.post("/user/login",{
            "name":name,
            "password":password
        },function (result) {
            if(result=="success") {
                window.location.href="/index";
            } else {
                alert("用户名或密码错误！");
            }
        });

    });

});
