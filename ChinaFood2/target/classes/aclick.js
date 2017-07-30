function aOnClick(name,id) {

   /* alert("click--"+name);*/
    //ajax异步请求符合筛选的食物,page代表从哪个界面点击 get请求
    $.getJSON("/selectCaipu",{name:name,id:id},function(data) {
        /*console.log(data);*/
      /*  console.log(eval(data));*/

        var array = eval(data);//解析json数据
        //将显示的那个div变为空
        $("#replace").text("");
        //将数量显示
        $("#foodnum").text(array.length);
        //循环控制
        var str="";
        alert(array[0].images);
        for (var i = 0; i <= array.length/4; i++) {
           str= str+"<div class='row clearfix' style='height: 450px'>";
           if(array.length<4||array.length==4){
               for(var j=0;j<array.length;j++){
                   str=str+"<div class='col-md-3 column'><div class='img-radius h215'>"+
                    "<a href='/foodView?id="+array[j].id+"&userid="+array[j].user.id+"'><img class='blowup' src='"+array[j].images+"'/></a>"+
                    "</div><div class='img-name'>"+array[j].name+"</div></div>";
               }
           }else{
               for(var j=i*4;j<=i*4+3;j++){
                   str=str+"<div class='col-md-3 column'><div class='img-radius h215'>"+
                    "<a href='/foodView?id="+array[j].id+"&userid="+array[j].user.id+"'><img class='blowup' src='"+array[j].images+"'/></a>"+
                    "</div><div class='img-name'>"+array[j].name+"</div></div>";

                   if(j==(array.length-1)) break;
               }
           }
           str=str+"</div>";
        }
        $("#replace").html(str);
    });
}

function caipu(id,userid) {
    window.location.href="http://localhost:8090/foodView?id="+id+"&userid="+userid;
}

function zuofa(id) {
    alert(id);
    window.location.href="http://localhost:8090/foodMethod?id="+id;
}

//注册判断
function register() {

   var check=$(".result");
   console.log(check);
   var flag=0;
   for(var i=0;i<check.length;i++){
       if(check[i].innerHTML!="✔"){
           console.log(i+"-----"+check[i].innerHTML);
          flag=1;
           break;
        }
   }
   if(flag==1){
       return false;
   }else{
       return true;
   }


}

//注册名字的判断
$(document).ready(function() {
    $("#name").blur(function () {
        var name = $(this).val();
        /*alert(name);*/
        if (name.trim().length < 2 || name.trim().length > 15) {
            $("#spanN").text("用户名长度必须在2-15之间");
        } else {
            var data="name="+name;
            //ajax请求，用户名是否存在
            $.ajax({
                type:"POST",
                url:"/user/checkUserName",
                data:data,
                dataType:"text",
                success:function (result) {
                    if (result == "false") {
                        $("#spanN").text("用户名已存在");
                    } else {
                        $("#spanN").text("✔");
                    }
                }
            });
          /*  $.get("/servlet/RegisterServlet", {flag: "2", name: name}, function (data) {
                if (data == "false") {
                    $("#spanN").text("用户名已存在");
                } else {
                    $("#spanN").text("✔");
                }
            })*/
        }

    });
});
//注册密码的判断，密码必须包含数字和字母
$(document).ready(function() {
    $("#password").blur(function () {
        var password = $("#password").val();
         /*alert(password);*/
        if (password.trim().length < 3 || password.trim().length > 15) {
            $("#spanP").text("密码长度必须在3-15之间");
        } else {
            var reg = /\W/;//查找非数字，字母
            if(reg.test(password)){
                $("#spanP").text("密码只能包含数字或者字母");
            }else{
                $("#spanP").text("✔");
            }
            console.log(reg.test(password));
        }
    });
});

$(document).ready(function() {
    $("#password2").blur(function () {
        var password2 = $("#password2").val();
        var password = $("#password").val();
        if(password!=password2){
            $("#spanP2").text("两次输入的密码不一致");
        }else{
            $("#spanP2").text("✔");
        }
    });
});

