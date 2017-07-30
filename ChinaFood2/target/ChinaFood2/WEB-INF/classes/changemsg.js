


    /*$("#old-pwd").focus(function () {
        $(this).next().css("display", "none");
        $(this).parent().css("border-color", "#2fb2f5");
    });
    $("#new-pwd").blur(function () {
        $(this).parent().css("border-color", "#DDDDDD");
        var name = $(this).val().trim();
        if (name.length!=0){
            $("#operror").text("✔");
        }else{
            $("#operror").text("不能为空");
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
    });*/



    function changmsg() {

        alert("test");
        var oldpwd = $("#old-pwd").val().trim();
        var newpwd = $("#new-pwd").val().trim();
        var chpwd = $("#ch-pwd").val().trim();

        /*都不为空则提交*/
        if(oldpwd.length!=0&&newpwd.length!=0&&chpwd.length!=0){
            if(newpwd==chpwd){
              $.ajax({
                  url:"/changepw",
                  type:"POST",
                  data:{"oldpassword":oldpwd,"newpassword":newpwd},
                  dataType:"text",
                  success:function (result) {
                      if(result=="success"){
                          window.location.href="/user/login";
                      }else{
                          alert("修改密码失败");
                      }
                  }
              });

            }else{
                alert("密码两次输入不符");
            }
        }else{
            alert("密码不能为空");
        }

        return false;
    }

   /* $("#save").click(function () {
        alert("test");
        var oldpwd = $("#old-pwd").val().trim();
        var newpwd = $("#new-pwd").val().trim();
        var chpwd = $("#ch-pwd").val().trim();

        console.log(oldpwd);
        console.log(newpwd);
        console.log(chpwd);
        /!*都不为空则提交*!/
        if(oldpwd.length!=0&&newpwd.length!=0&&chpwd.length!=0){
            if(newpwd==chpwd){
                $.post("/changepwd",{
                    "oldpassword":oldpwd,
                    "newpassword":newpwd,
                },function (result) {
                    if(result=="success") {
                        window.location.href="/user/login";
                    } else {
                        alert("密码错误");
                    }
                });

            }else{
                alert("密码两次输入不符");
            }
        }else{
            alert("密码不能为空");
        }
    });*/
