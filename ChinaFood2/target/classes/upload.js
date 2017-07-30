
$(document).ready(function () {
    /*准备时间框获得焦点*/
    $("#prepareTime").focus(function () {

        $(this).parent().css("border-color", "#2fb2f5");

    });
    /*输出框失去焦点时*/
    $("#prepareTime").blur(function () {
        $(this).parent().css("border-color", "#999999");
        var time=$(this).val().trim();
        if(time.length==0||!/^[0-9\d]{1,3}$/.test(time)){
            $("#prepareTimeError").text("时间格式错误");
        }else{
            $("#prepareTimeError").text("✔");

        }
    });
});

$(document).ready(function () {
    /*准备时间框获得焦点*/
    $("#cookingTime").focus(function () {

        $(this).parent().css("border-color", "#2fb2f5");
    });
    /*输出框失去焦点时,不为空，并且填的是数字*/
    $("#cookingTime").blur(function () {
        $(this).parent().css("border-color", "#999999");
        var time=$(this).val().trim();
        if(time.length==0||!/^[0-9\d]{1,3}$/.test(time)){
            $("#cookingTimeError").text("时间格式错误");
        }else{
            $("#cookingTimeError").text("✔");

        }
    });
});

$(document).ready(function () {
    /*主材料*/
    $("#main").focus(function () {

        $(this).css("border-color", "#2fb2f5");
    });
    /*输出框失去焦点时,不为空，并且填的是数字*/
    $("#main").blur(function () {
        $(this).css("border-color", "#999999");
        var text=$(this).val().trim();
        if(text.length==0){
            $("#mainError").text("内容不能为空");
        }else{
            $("#mainError").text("✔");
        }
    });
});

$(document).ready(function () {

    $("#other").focus(function () {

        $(this).css("border-color", "#2fb2f5");
    });
    /*辅助材料*/
    $("#other").blur(function () {
        $(this).css("border-color", "#999999");
        var text=$(this).val().trim();
        if(text.length==0){
            $("#otherError").text("内容不能为空");
        }else{
            $("#otherError").text("✔");

        }
    });
});

$(document).ready(function () {
   /*详细介绍*/
    $("#detail").focus(function () {

        $(this).css("border-color", "#2fb2f5");
    });
    $("#detail").blur(function () {
        $(this).css("border-color", "#999999");
        var text=$(this).val().trim();
        if(text.length==0){
            $("#detailError").text("内容不能为空");
        }else{
            $("#detailError").text("✔");
        }
    });
});
$(document).ready(function () {
    /*详细介绍*/
    $("#cookName").focus(function () {

        $(this).css("border-color", "#2fb2f5");
    });
    $("#cookName").blur(function () {
        $(this).css("border-color", "#999999");
        var text=$(this).val().trim();
        if(text.length==0){
            $("#nameError").text("名字不能为空");
        }else{
            $("#nameError").text("✔");
        }
    });
});

/*发布的提交按钮*/
function upload() {

    var check=$(".checkUpload");
    var flag=1;
    for(var i=0;i<check.length;i++){
        if(check[i].val()!="✔"){
            flag=0;
            break;
        }
    }
    if(flag) {
        return true;
    }
    else{
        alert("发布信息错误");
        return false;
    }
    if(flag){
        return true;
        /*var data={name:$("#cookName").val().trim(),};
        //发送ajax请求
        $.ajax({
            type:"POST",
            url:"/addFood",
            contextType:"application/json",
            data:JSON.stringify(data),
            success:function (su) {
                if(su=="success"){
                    alert("发布成功");
                    window.location.href="/index";
                }else{
                    alert("发布失败");
                }
            },
            error:function (fa) {
                alert("发布请求失败");
            }
        });*/
    }else {
        alert("信息填写错误");
    }

}


