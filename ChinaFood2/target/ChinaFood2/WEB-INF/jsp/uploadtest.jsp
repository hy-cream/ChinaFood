<%--
  Created by IntelliJ IDEA.
  User: huyu
  Date: 2017/7/25
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>多张图片上传测试</title>
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/index.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/imgup.css"/>
    <script src="/static/js/jQuery1.7.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/js/imgUp.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/js/upload.js" type="text/javascript" charset="utf-8"></script>
   <%-- <script>

        function dataURLtoBlob(dataurl) {
            var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
                bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
            while(n--){
                u8arr[n] = bstr.charCodeAt(n);
            }
            return new Blob([u8arr], {type:mime});
        }
        //test:
       /* var blob = dataURLtoBlob('data:text/plain;base64,YWFhYWFhYQ==');*/
            $(function(){

                $(".formupload").on("submit",function () {
                /*    return true;*/
                    //获取section下面所有的需要上传的img标签
                      var images = $("section.up-section").find("img.up-img");
                      //循环遍历拿到的每个标签，获取标签中的src属性值，将值存放到一个数组中
                       var  imgSrc =new Array();
                       images.each(function (index,image) {
                           imgSrc[index] = $(image).attr("src");
                           console.log(imgSrc[index]);
                       });

                       for(var i=0;i<imgSrc.length;i++){
                           var reader=new FileReader();
                           console.log(reader.readAsDataURL(imgSrc[i]));
                       }
                            console.log(imgSrc.toString());

                       return true;
                       /*$.get("#提交路径",{"imgSrc":imgSrc.toString()},function () {
                           alert("成功");
                       });*/
                    $.ajax({
                        type: "POST",
                        url: "/uploadtest",
                        contextType: "application/json",
                        data: JSON.stringify(imgSrc),
                        success:function (data) {
                            alter("成功");
                        }
                    });
                        return false;
                });
            });

    </script>--%>
</head>
<body>
<form action="/uploadtest" method="post" class="formupload" enctype="multipart/form-data">
    <div class="container mt40">
        <div class="img-box full">
            <section class=" img-section">
                <p class="up-p">作品图片：<span class="up-span">最多可以上传5张图片，马上上传</span></p>
                <div class="z_photo upimg-div clear" >
                    <section class="z_file fl">
                        <img src="/static/img/a11.png" class="add-img">
                        <input type="file" name="files[]" id="file" class="file" accept="image/jpg,image/jpeg,image/png,image/bmp" multiple />
                    </section>
                </div>
            </section>
        </div>
        <aside class="mask works-mask">
            <div class="mask-content">
                <p class="del-p ">您确定要删除作品图片吗？</p>
                <p class="check-p"><span class="del-com wsdel-ok">确定</span><span class="wsdel-no">取消</span></p>
            </div>
        </aside>
    </div>
    <input type="submit" value="提交">


</form>
</body>
</html>
